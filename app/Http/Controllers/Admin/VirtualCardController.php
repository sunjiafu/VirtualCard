<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Transaction;
use App\Models\UserWallet;
use App\Models\VirtualCardApi;
use App\Models\VirtualCard;
use App\Models\VirtualCardTransaction;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;
use App\Constants\PaymentGatewayConst;
use Illuminate\Support\Facades\Log;


class VirtualCardController extends Controller
{
    public function cardApi()
    {
        $page_title = __("Setup Virtual Card Api");
        $api = VirtualCardApi::first();
        return view('admin.sections.virtual-card.api',compact(
            'page_title',
            'api',
        ));
    }
    public function cardApiUpdate(Request $request){
        $validator = Validator::make($request->all(), [
            'api_method'                => 'required|in:flutterwave,sudo,stripe,strowallet,Sqpay',
            'flutterwave_secret_key'    => 'required_if:api_method,flutterwave',
            'flutterwave_secret_hash'   => 'required_if:api_method,flutterwave',
            'flutterwave_url'           => 'required_if:api_method,flutterwave',
            'sudo_api_key'              => 'required_if:api_method,sudo',
            'sudo_vault_id'             => 'required_if:api_method,sudo',
            'sudo_url'                  => 'required_if:api_method,sudo',
            'sudo_mode'                 => 'required_if:api_method,sudo',
            'card_details'              => 'required|string',
            'stripe_public_key'         => 'required_if:api_method,stripe',
            'stripe_secret_key'             => 'required_if:api_method,stripe',
            'stripe_url'                => 'required_if:api_method,stripe',
            'strowallet_public_key'     => 'required_if:api_method,strowallet',
            'strowallet_secret_key'     => 'required_if:api_method,strowallet',
            'strowallet_url'            => 'required_if:api_method,strowallet',
            'image'                     => "nullable|mimes:png,jpg,jpeg,webp,svg",
            'card_limit' => [
                'required',
                'numeric',
                Rule::in([1, 2, 3,10]),
            ],
        ]);
        if($validator->fails()) {
            return back()->withErrors($validator)->withInput();
        }
        $request->merge(['name'=>$request->api_method]);
        $data = array_filter($request->except('_token','api_method','_method','card_details','image','card_limit'));
        $api = VirtualCardApi::first();
        $api->card_details = $request->card_details;
        $api->card_limit = $request->card_limit;
        $api->config = $data;

        if ($request->hasFile("image")) {
            try {
                $image = get_files_from_fileholder($request, "image");
                $upload_file = upload_files_from_path_dynamic($image, "card-api");
                $api->image = $upload_file;
            } catch (Exception $e) {
                return back()->with(['error' => [__('Ops! Failed To Upload Image.')]]);
            }
        }
        $api->save();

        return back()->with(['success' => [__('Card API Has Been Updated.')]]);
    }

    public function transactionLogs()
    {
        $page_title = __("Virtual Card Logs");
        $transactions = Transaction::with(
          'user:id,firstname,lastname,email,username,full_mobile',
            'currency:id,name',
        )->where('type', 'VIRTUAL-CARD')->latest()->paginate(20);

        return view('admin.sections.virtual-card.logs', compact(
            'page_title',
            'transactions'
        ));
    }

    public function show()
    {
        $cards = VirtualCard::with('user')->orderBy('created_at', 'desc')->paginate(15);
        $search = '';
        $start_date = '';
        $end_date = '';
        return view('admin.sections.virtual-card.show', compact('cards', 'search', 'start_date', 'end_date'));
    }

    public function search(Request $request)
    {
        $search = $request->input('search', '');
        $start_date = $request->input('start_date');
        $end_date = $request->input('end_date');

        $query = VirtualCard::with('user')->orderBy('created_at', 'desc');

        if ($search) {
            $query->where(function ($q) use ($search) {
                $q->whereHas('user', function ($userQuery) use ($search) {
                    $userQuery->where('username', 'like', "%{$search}%");
                })->orWhere('card_pan', 'like', "%{$search}%");
            });
        }

        if ($start_date) {
            $query->whereDate('created_at', '>=', $start_date);
        }

        if ($end_date) {
            $query->whereDate('created_at', '<=', $end_date);
        }

        $cards = $query->paginate(15);

        return view('admin.sections.virtual-card.show', compact('cards', 'search', 'start_date', 'end_date'));
    }

    public function editcard($id){

        $card = VirtualCard::findOrFail($id);

        return view('admin.sections.virtual-card.editcard',compact('card'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'card_pan' => 'required|string',
            'cvv' => 'required|string',
            'is_active' => 'required|boolean',
        ]);

        

        $card = VirtualCard::findOrFail($id);
        $card->city = $request->city;
        $card->state = $request->state;
        $card->address = $request->address;
        $card->zip_code =$request->zip_code;
        $card->card_pan = $request->card_pan;
        $card->expiration =$request->expiration;
        $card->cvv = $request->cvv;
        $card->name_on_card = $request->name_on_card;
        $card->card_type = $request->card_type;
        $card->is_active = $request->is_active;
        $card->save();

        return redirect()->route('admin.virtual.card.show');
    }

    public function cardTransaction( Request $request){

        $card = null;
        $transactions = null;

        if ($request->has('card_pan')) {
            $card = VirtualCard::where('card_pan', $request->input('card_pan'))->first();
            if ($card) {
                $transactions = VirtualCardTransaction::where('card_id', $card->card_id)->get();
            } else {
                return back()->with('error', 'Card not found.');
            }
        }

        return view('admin.sections.virtual-card.trc', compact('card', 'transactions'));
    }

       // 存储新交易记录
       public function storeCardTransaction(Request $request)
       {
           // 验证请求数据
           $request->validate([
               'card_id' => 'required|integer|exists:virtual_cards,id', // 使用 card_id 验证
               'amount' => 'required|numeric',
               'currency' => 'required|string',
               'status' => 'required|string',
               'product'=>'required|string',
               'reference' => 'nullable|string',
               'gateway_reference' => 'nullable|string',
               'response_message' => 'nullable|string',
           ]);
       
           // 查找对应的卡片
           $card = VirtualCard::find($request->card_id);
       
           // 创建交易记录
           $trxId = date('Ymd') . mt_rand(1000000000, 9999999999);

           VirtualCardTransaction::create([
               'card_id' => $card->card_id,
               'user_id' => $card->user_id,
               'amount' => $request->amount,
               'currency' => $request->currency,
               'status' => $request->status,
               'product' => $request->product,
               'reference' => $request->reference,
               'gateway_reference' => $request->gateway_reference,
               'response_message' => $request->response_message,
               'trx_id' => $trxId,
           ]);

           // 只有当交易金额小于卡片余额时，才扣除余额
           if ($request->amount <= $card->amount) {
               $card->amount -= $request->amount;
               $card->save();
           }

           return redirect()->back()->with('success', '交易记录添加成功');
       }
    // 删除卡片
    public function destroy($id)
    {
        // 查找卡片
        $card = VirtualCard::findOrFail($id);

        // 获取卡片所属用户
        $user = $card->user;

        // 获取用户的钱包
        $wallet = UserWallet::where('user_id', $user->id)->first();

        if (!$wallet) {
            // 如果钱包不存在，可以创建一个新的钱包，或返回错误
            return redirect()->back()->with('error', '用户钱包不存在，无法退回余额。');
        }

        // 获取卡片余额
        $amount = $card->amount;

        // 开始数据库事务
        DB::beginTransaction();

        try {
            if ($amount > 0) {
                // 从卡片余额中扣除余额（实际上设置为0）
                $card->amount = 0;
                $card->save();

                // 更新钱包余额前
                Log::info("更新前钱包余额：{$wallet->balance}");

                $wallet->balance += $amount;
                $wallet->save();

                // 更新钱包余额后
                Log::info("更新后钱包余额：{$wallet->balance}");

                // 创建交易记录
                $trx_id = 'CD' . time() . rand(1000, 9999);
                $this->createTransactionRecords($trx_id, $user, $wallet, $amount, $card);

                // 您可以在此添加通知用户的代码
            }

            // 删除卡片
            $card->delete();

            // 提交事务
            DB::commit();

            return redirect()->route('admin.virtual.card.show')->with('success', '卡片已成功删除，余额已退回用户钱包。');
        } catch (\Exception $e) {
            // 回滚事务
            DB::rollBack();
            return redirect()->back()->with('error', '删除卡片时发生错误，请重试。');
        }
    }

    // 创建交易记录的方法，可以参考 `cardWithdraw` 方法中的 `createTransactionRecords`
    private function createTransactionRecords($trx_id, $user, $wallet, $amount, $card)
    {
        // 创建卡片交易记录
        $cardTransaction = new VirtualCardTransaction();
        $cardTransaction->card_id = $card->card_id;
        $cardTransaction->user_id = $user->id;
        $cardTransaction->trx_id = $trx_id;
        $cardTransaction->amount = $amount;
        $cardTransaction->currency = $wallet->currency->code;
        $cardTransaction->status = 'success';
        $cardTransaction->product = '删除卡片退款';
        $cardTransaction->reference = $trx_id;
        $cardTransaction->gateway_reference = null; // 如果有网关参考ID，可填写
        $cardTransaction->response_message = '卡片删除，余额退回到钱包';
        $cardTransaction->save();

        // 创建总交易记录
        $transaction = new Transaction();
        $transaction->admin_id = auth()->id(); // 记录管理员ID
        $transaction->user_id = $user->id;
        $transaction->user_wallet_id = $wallet->id;
        $transaction->payment_gateway_currency_id = null; // 如果涉及支付网关，可填写ID
        $transaction->trx_id = $trx_id;
        $transaction->type = 'virtual_card_delete_refund';
        $transaction->request_amount = $amount;
        $transaction->payable = $amount;
        $transaction->available_balance = $wallet->balance;
        $transaction->remark = '删除卡片退回余额';
        $transaction->status = PaymentGatewayConst::STATUSSUCCESS;
        $transaction->details = (object)[
            'card_id' => $card->card_id,
            'card_number' => $card->card_number,
        ];
        $transaction->reject_reason = null;
        $transaction->save();
    }

}

