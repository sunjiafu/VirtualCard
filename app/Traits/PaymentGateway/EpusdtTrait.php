<?php

namespace App\Traits\PaymentGateway;

use Exception;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;
use App\Models\TemporaryData;
use App\Constants\PaymentGatewayConst;
use Illuminate\Support\Carbon;
use App\Models\UserNotification;
use App\Models\Admin\BasicSettings;
use Jenssegers\Agent\Agent;
use GuzzleHttp\Client;

trait EpusdtTrait
{
    public function epusdtInit($output = null)
    {
        if (!$output) $output = $this->output;

        $credentials = $this->getEpusdtCredentials($output);

        $trx_id = 'AM' . getTrxNum();

        $parameter = [
            "amount" => (float)$output['amount']->total_amount,
            "order_id" =>  $trx_id,
            'redirect_url' => route('user.add.money.epusdt.callback', ['gateway' => 'epusdt']),
            'notify_url' => route('user.add.money.epusdt.notify', ['gateway' => 'epusdt']),
        ];
      


        $parameter['signature'] = $this->epusdtSign($parameter, $credentials->merchant_key);

    

        try {
            $client = new Client(['headers' => ['Content-Type' => 'application/json']]);
            $response = $client->post($credentials->payment_url, ['body' => json_encode($parameter)]);
            $body = json_decode($response->getBody()->getContents(), true);

            if (!isset($body['status_code']) || $body['status_code'] != 200) {
                throw new Exception(__('Payment channel error: ') . $body['message']);
            }

            $this->epusdtJunkInsert($parameter);

            return redirect()->away($body['data']['payment_url']);
        } catch (GuzzleException $e) {
            throw new Exception($e->getMessage());
        }
    }

    private function epusdtSign(array $parameter, string $signKey)
    {
        ksort($parameter);
        reset($parameter); //内部指针指向数组中的第一个元素
        $sign = '';
        $urls = '';
        foreach ($parameter as $key => $val) {
            if ($val == '') continue;
            if ($key != 'signature') {
                if ($sign != '') {
                    $sign .= "&";
                    $urls .= "&";
                }
                $sign .= "$key=$val"; //拼接为url参数形式
                $urls .= "$key=" . urlencode($val); //拼接为url参数形式
            }
        }
        echo "Sign String: " . $sign . "<br>";


        $sign = md5($sign . $signKey);//密码追加进入开始MD5签名

        echo "Generated Sign: " . $sign . "<br>";


        return $sign;
    }

    public function getSign ($output){


        $sign = $this->getEpusdtCredentials($output);
        return $sign;
    }

    private function getEpusdtCredentials($output)
    {
        $gateway = $output['gateway'] ?? null;
        if(!$gateway) throw new Exception(__("Payment gateway not available"));
        $client_id_sample = ['payment_url','payment url','payment-url'];
        $client_secret_sample = ['merchant key','merchant-key','merchant_key'];

        $client_id = '';
        $outer_break = false;
        foreach($client_id_sample as $item) {
            if($outer_break == true) {
                break;
            }
            $modify_item = $this->stripePlainText($item);
            foreach($gateway->credentials ?? [] as $gatewayInput) {
                $label = $gatewayInput->label ?? "";
                $label = $this->stripePlainText($label);

                if($label == $modify_item) {
                    $client_id = $gatewayInput->value ?? "";
                    $outer_break = true;
                    break;
                }
            }
        }


        $secret_id = '';
        $outer_break = false;
        foreach($client_secret_sample as $item) {
            if($outer_break == true) {
                break;
            }
            $modify_item = $this->stripePlainText($item);
            foreach($gateway->credentials ?? [] as $gatewayInput) {
                $label = $gatewayInput->label ?? "";
                $label = $this->stripePlainText($label);

                if($label == $modify_item) {
                    $secret_id = $gatewayInput->value ?? "";
                    $outer_break = true;
                    break;
                }
            }
        }

        return (object) [
            'payment_url'     => $client_id,
            'merchant_key' => $secret_id,

        ];

    }

    private function epusdtJunkInsert($parameter)
    {
        $data = [
            'gateway' => $this->output['gateway']->id,
            'currency' => $this->output['currency']->id,
            'amount' => $this->output['amount'],
            'response' => $parameter,
        ];

        Session::put('identifier', $parameter['order_id']);
        TemporaryData::create([
            'type' => PaymentGatewayConst::EPUSDT,
            'identifier' => $parameter['order_id'],
            'data' => $data,
        ]);
    }

    public function epusdtSuccess($callbackData)
    {
        $basic_setting = BasicSettings::first();
        $user = auth()->user();

        // 从回调数据中获取 order_id 并将其作为 trx_id 使用
        $trx_id = $callbackData['order_id'];  // 使用回调返回的 order_id 作为 trx_id

        DB::beginTransaction();

        try {
            $id = DB::table("transactions")->insertGetId([
                'user_id' => $user->id,
                'user_wallet_id' => $user->wallet->id,
                'payment_gateway_currency_id' => $this->output['currency']->id,
                'type' => PaymentGatewayConst::TYPEADDMONEY,
                'trx_id' => $trx_id, // 使用回调返回的 order_id 作为 trx_id
                'request_amount' => $callbackData['amount'],
                'payable' => $callbackData['actual_amount'],
                'available_balance' => $user->wallet->balance + $callbackData['amount'],
                'remark' => "Add Money With Epusdt",
                'details' => 'Epusdt Payment Successful',
                'status' => PaymentGatewayConst::STATUSSUCCESS,
                'created_at' => now(),
            ]);

            $this->updateWalletBalanceEpusdt($callbackData);
            $this->insertChargesEpusdt($callbackData, $id);
            $this->insertDeviceEpusdt($callbackData, $id);
            $this->removeTempDataEpusdt($callbackData);

            if ($basic_setting->email_notification) {
                $user->notify(new ApprovedMail($user, $callbackData, $trx_id));
            }

            DB::commit();
        } catch (Exception $e) {
            DB::rollBack();
            throw new Exception(__('Something went wrong! Please try again'));
        }

        return redirect()->route("user.add.money.index")->with(['success' => [__('Successfully Added Money')]]);
    }


    
    public function updateWalletBalanceEpusdt($output) {
        $output['wallet']->increment('balance', $output['amount']->requested_amount);
    }

    public function insertChargesEpusdt($output, $id) {
        DB::table('transaction_charges')->insert([
            'transaction_id'    => $id,
            'percent_charge'    => $output['amount']->percent_charge,
            'fixed_charge'      => $output['amount']->fixed_charge,
            'total_charge'      => $output['amount']->total_charge,
            'created_at'        => now(),
        ]);

        $notification_content = [
            'title'         => "Add Money",
            'message'       => "Your Wallet" . " (" . $output['wallet']->currency->code . ")  " . "balance  has been added" . " " . $output['amount']->requested_amount . ' ' . $output['wallet']->currency->code,
            'time'          => Carbon::now()->diffForHumans(),
            'image'         => get_image(auth()->user()->image, 'user-profile'),
        ];

        UserNotification::create([
            'type'      => NotificationConst::BALANCE_ADDED,
            'user_id'   => auth()->user()->id,
            'message'   => $notification_content,
        ]);
    }

    public function insertDeviceEpusdt($output, $id) {
        $client_ip = request()->ip() ?? false;
        $location = geoip()->getLocation($client_ip);
        $agent = new Agent();

        $mac = "";

        DB::table("transaction_devices")->insert([
            'transaction_id'=> $id,
            'ip'            => $client_ip,
            'mac'           => $mac,
            'city'          => $location['city'] ?? "",
            'country'       => $location['country'] ?? "",
            'longitude'     => $location['lon'] ?? "",
            'latitude'      => $location['lat'] ?? "",
            'timezone'      => $location['timezone'] ?? "",
            'browser'       => $agent->browser(),
            'os'            => $agent->platform(),
        ]);
    }

    public function removeTempDataEpusdt($output) {
        TemporaryData::where("identifier", $output['tempData']['identifier'])->delete();
    }
}
