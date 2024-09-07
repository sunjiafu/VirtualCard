<?php

namespace App\Traits\PaymentGateway;

use Exception;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Models\TemporaryData;
use App\Constants\PaymentGatewayConst;
use Illuminate\Support\Carbon;
use App\Models\UserNotification;
use App\Models\Admin\BasicSettings;
use Jenssegers\Agent\Agent;
use GuzzleHttp\Client;
use App\Constants\NotificationConst;
use App\Models\User;
use App\Models\UserWallet;

trait EpusdtTrait
{
    // 初始化支付流程，生成支付请求并重定向到支付网关
    public function epusdtInit($output = null)
    {
        if (!$output) $output = $this->output;

        // 获取支付凭证
        $credentials = $this->getEpusdtCredentials($output);

        // 生成交易ID
        $trx_id = 'AM' . getTrxNum();

        // 构建请求参数
        $parameter = [
            "amount" => (float)$output['amount']->total_amount,
            "order_id" =>  $trx_id,
            'redirect_url' => route('user.add.money.wait.page', ['trx_id' => $trx_id]),
            'notify_url' => route('user.add.money.epusdt.notify'),  // 异步回调URL
        ];

        // 生成签名
        $parameter['signature'] = $this->epusdtSign($parameter, $credentials->merchant_key);

        try {
            // 发送支付请求
            $client = new Client(['headers' => ['Content-Type' => 'application/json']]);
            $response = $client->post($credentials->payment_url, ['body' => json_encode($parameter)]);
            $body = json_decode($response->getBody()->getContents(), true);

            if (!isset($body['status_code']) || $body['status_code'] != 200) {
                throw new Exception(__('Payment channel error: ') . $body['message']);
            }

            // 存储临时支付数据
            $this->epusdtJunkInsert($parameter);

            // 跳转到支付链接
            return redirect()->away($body['data']['payment_url']);
        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    // 生成签名的方法，确保请求数据的安全性
    private function epusdtSign(array $parameter, string $signKey)
    {
        ksort($parameter);
        $sign = '';
        foreach ($parameter as $key => $val) {
            if ($val != '' && $key != 'signature') {
                $sign .= "$key=$val&";
            }
        }
        return md5(rtrim($sign, '&') . $signKey);
    }

    // 获取支付网关凭证的方法
    private function getEpusdtCredentials($output)
    {
        $gateway = $output['gateway'] ?? null;
        if(!$gateway) throw new Exception(__("Payment gateway not available"));

        // 获取支付网关的支付URL和商户密钥
        $payment_url = $this->getGatewayCredentialValue($gateway, ['payment_url', 'payment-url']);
        $merchant_key = $this->getGatewayCredentialValue($gateway, ['merchant_key', 'merchant-key', 'merchant key']);

        return (object) [
            'payment_url'     => $payment_url,
            'merchant_key'    => $merchant_key,
        ];
    }

    // 辅助函数，用于从网关凭证中获取值
    private function getGatewayCredentialValue($gateway, $keys)
    {
        foreach ($keys as $key) {
            foreach ($gateway->credentials ?? [] as $credential) {
                if (strtolower(str_replace(' ', '_', $credential->label)) == strtolower($key)) {
                    return $credential->value;
                }
            }
        }
        return null;
    }

    // 存储支付数据到临时表中
    public function epusdtJunkInsert($response) {
        $output = $this->output;
        $user = auth()->guard(get_auth_guard())->user();
        $creator_table = auth()->guard(get_auth_guard())->user()->getTable();
        $data = [
            'gateway'      => $output['gateway']->id,  // 支付网关ID
            'currency'     => $output['currency']->id, // 货币ID
            'amount'       => json_decode(json_encode($output['amount']), true),  // 金额信息
            'response'     => $response,  // 支付响应数据
            'wallet_table' => $output['wallet']->getTable(), // 钱包表名
            'wallet_id'    => $output['wallet']->id,  // 钱包ID
            'creator_table'=> $user->getTable(),  // 用户表名
            'creator_id'   => $user->id,  // 用户ID
            'creator_guard'=> get_auth_guard(),  // 用户认证守卫
        ];

        Session::put('identifier', $response['order_id']);
        Session::put('output', $output);

        // 插入数据到 TemporaryData 表中
        return TemporaryData::create([
            'type'          => PaymentGatewayConst::EPUSDT,  // 标记为EPUSDT支付类型
            'identifier'    => $response['order_id'],  // 使用订单号作为唯一标识符
            'data'          => $data,  // 存储的数据
        ]);
    }

    // 支付成功后的处理逻辑
    public function epusdtSuccess($output)
    
    {

       
        $basic_setting = BasicSettings::first();

        $trx_id = $output['identifier'];  // 使用回调返回的 order_id 作为 trx_id
        $creator_id = $output['data']->creator_id ?? null;
        $user_wallet_id =$output['data']->wallet_id ?? null;
        $currency_id = $output['data']->currency ?? null;
        $request_amount = $output['data']->amount->requested_amount ?? null;
        $user_wallet =UserWallet::where('id',$user_wallet_id)->first();//获取用户钱包
        $available_balance =$user_wallet->balance + $request_amount;
        $payable  = $output['data']->amount->total_amount;
        $remark   = ucwords(remove_speacial_char($output['type']," "));

        DB::beginTransaction();

        try {

            if(Auth::guard(get_auth_guard())->check()){
                $user_id = auth()->guard(get_auth_guard())->user()->id;
            }

            
            // 插入交易记录
            $id = DB::table("transactions")->insertGetId([
                'user_id'                       => $creator_id,
                'user_wallet_id'                => $user_wallet_id,
                'payment_gateway_currency_id'   => $currency_id,
                'type'                          => "ADD-MONEY",
                'trx_id'                        => $trx_id,
                'request_amount'                => $request_amount,
                'payable'                       => $payable,
                'available_balance'             => $available_balance,
                'remark'                        => $remark,
                'details'                       => 'Flutter Wave Payment Successfull',
                'status'                        => true,
                'created_at'                    => now(),
            ]);

            $this->updateWalletBalanceEpusdt($output);  // 更新用户钱包余额
            $this->insertChargesEpusdt($output, $id);  // 插入交易手续费记录
            $this->insertDeviceEpusdt($output, $id);  // 记录交易设备信息
            $this->removeTempDataEpusdt($output);  // 删除临时数据

            // 发送邮件通知
            // if ($basic_setting->email_notification) {
            //     $user->notify(new ApprovedMail($user, $output, $trx_id));
            // }

            DB::commit();
        } catch (Exception $e) {
            DB::rollBack();
            throw new Exception(__('Something went wrong! Please try again'));
        }

        return redirect()->route("user.add.money.index")->with(['success' => [__('Successfully Added Money')]]);
    }

    // 更新钱包余额
    public function updateWalletBalanceEpusdt($output) {

        $user_wallet =UserWallet::where('id',$output['data']->wallet_id)->first();//获取用户钱包

        
        $user_wallet->increment('balance', $output['data']->amount->requested_amount);

    }

    // 插入手续费记录
    public function insertChargesEpusdt($output, $id) {

        DB::table('transaction_charges')->insert([
            'transaction_id'    => $id,
            'percent_charge'    => $output['data']->amount->percent_charge,
            'fixed_charge'      => $output['data']->amount->fixed_charge,
            'total_charge'      => $output['data']->amount->total_charge,
            'created_at'        => now(),
        ]);

        $notification_content = [
            'title'         => "Add Money",
            'message'       => "Your Wallet balance  has been added"  . "/n".  $output['data']->amount->requested_amount . "$",
            'time'          => Carbon::now()->diffForHumans(),
        ];

        UserNotification::create([
            'type'      => NotificationConst::BALANCE_ADDED,
            'user_id'   => $output['data']->creator_id,
            'message'   => $notification_content,
        ]);

     
    }

    // 插入设备信息
    public function insertDeviceEpusdt($output, $id) {
        $client_ip = request()->ip() ?? false;
        $location = geoip()->getLocation($client_ip);
        $agent = new Agent();

        DB::table("transaction_devices")->insert([
            'transaction_id'=> $id,
            'ip'            => $client_ip,
            'city'          => $location['city'] ?? "",
            'country'       => $location['country'] ?? "",
            'longitude'     => $location['lon'] ?? "",
            'latitude'      => $location['lat'] ?? "",
            'timezone'      => $location['timezone'] ?? "",
            'browser'       => $agent->browser(),
            'os'            => $agent->platform(),
        ]);
    }

    // 删除临时数据
    public function removeTempDataEpusdt($output) {
        TemporaryData::where("identifier", $output['identifier'])->delete();
    }
}
