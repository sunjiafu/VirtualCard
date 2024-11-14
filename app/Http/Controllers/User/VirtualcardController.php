<?php

namespace App\Http\Controllers\User;

use App\Constants\NotificationConst;
use App\Constants\PaymentGatewayConst;
use App\Http\Controllers\Controller;
use App\Http\Helpers\Response;
use App\Models\Admin\Currency;
use App\Models\Admin\TransactionSetting;
use App\Models\Transaction;
use App\Models\UserNotification;
use App\Models\UserWallet;
use App\Models\VirtualCard;
use App\Models\VirtualCardApi;
use App\Models\VirtualCardBin;
use App\Models\VirtualCardTransaction;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Notification;
use App\Notifications\CardApplied;

class VirtualcardController extends Controller
{
    protected $api;
    protected $card_limit;

    public function __construct()
    {
        $cardApi = VirtualCardApi::first();
        $this->api = $cardApi;
        $this->card_limit = $cardApi->card_limit;
    }

    public function index()
    {
        $page_title = __("Virtual Card");
        $myCards = VirtualCard::where('user_id', auth()->user()->id)->get();
        $totalCards = VirtualCard::where('user_id', auth()->user()->id)->count();
        $cardCharge = TransactionSetting::where('slug', 'virtual_card')->where('status', 1)->first();
        $cardReloadCharge = TransactionSetting::where('slug', 'reload_card')->where('status', 1)->first();
        $transactions = Transaction::auth()->virtualCard()->latest()->take(10)->get();
        $card_bin = VirtualCardBin::all();
        $cardApi = $this->api;
        return view('user.sections.virtual-card.index', compact('page_title', 'myCards', 'transactions', 'cardCharge', 'cardApi', 'totalCards', 'cardReloadCharge', 'card_bin'));
    }

    public function cardDetails($card_id)
    {
        $page_title = __("Card Details");
        $myCard = VirtualCard::where('card_id', $card_id)->first();
        $cardApi = $this->api;

        // 获取该卡片的交易记录
        $transactions = VirtualCardTransaction::where('card_id', $myCard->card_id)
            ->orderBy('created_at', 'desc')
            ->paginate(10);

        // 获取该卡片的总充值金额
        $totalreloaded = VirtualCardTransaction::where('card_id', $myCard->card_id)
            ->where('type', PaymentGatewayConst::CARDFUND)
            ->where('status', PaymentGatewayConst::STATUSSUCCESS)
            ->sum('amount');

        // 获取该卡片的总转出金额
        $totalwithdrawn = VirtualCardTransaction::where('card_id', $myCard->card_id)
            ->where('type', PaymentGatewayConst::TYPEVIRTUALCARDWITHDRAW)
            ->where('status', PaymentGatewayConst::STATUSSUCCESS)
            ->sum('amount');

        return view('user.sections.virtual-card.details', compact('page_title', 'myCard', 'cardApi', 'transactions', 'totalreloaded', 'totalwithdrawn'));
    }

    public function cardAdd()
    {
        $page_title = __("Add Card");
        $virtualCardBins = VirtualCardBin::paginate(10);
        return view('user.sections.virtual-card.addcard', compact('page_title', 'virtualCardBins'));
    }

    public function cardBuy(Request $request)
    {
        $request->validate([
            'card_amount' => 'required|numeric|gt:0',
            'card_bin' => 'required',
        ]);

        $user = auth()->user();
        $amount = $request->card_amount;
        $card_bin = $request->card_bin;
        $wallet = UserWallet::where('user_id', $user->id)->first();
        if (!$wallet) {
            return back()->with(['error' => [__('User wallet not found')]]);
        }
        $cardCharge = TransactionSetting::where('slug', 'virtual_card')->where('status', 1)->first();
        $baseCurrency = Currency::default();
        $rate = $baseCurrency->rate;
        if (!$baseCurrency) {
            return back()->with(['error' => [__('Default Currency Not Setup Yet')]]);
        }
        $minLimit = $cardCharge->min_limit * $rate;
        $maxLimit = $cardCharge->max_limit * $rate;
        if ($amount < $minLimit || $amount > $maxLimit) {
            return back()->with(['error' => [__('Please follow the transaction limit')]]);
        }
        // 费用计算
        $fixedCharge = $cardCharge->fixed_charge * $rate;
        $percent_charge = ($amount / 100) * $cardCharge->percent_charge;
        $total_charge = $fixedCharge + $percent_charge;
        $payable = $total_charge + $amount;
        if ($payable > $wallet->balance) {
            return back()->with(['error' => [__('Sorry, insufficient balance')]]);
        }
        $currency = $baseCurrency->code;
        $trx = 'VC-' . time() . rand(6, 100);

        // 生成虚拟卡信息
        $card_pan = "0000 0000 0000 0000";  // 生成虚拟卡号
        $cvv = rand(100, 999);  // 随机生成CVV
        $expiration = date("Y-m", strtotime("+3 years"));  // 有效期为3年后

        // 保存虚拟卡信息到数据库
        $v_card = new VirtualCard();
        $v_card->user_id = $user->id;
        $v_card->card_id = $trx;
        $v_card->ref_id = $trx;
        $v_card->secret = $trx;
        $v_card->bg = "DeepBlue";
        $v_card->amount = $amount;
        $v_card->card_bin = $card_bin;
        $v_card->currency = $currency;
        $v_card->charge = $total_charge;
        $v_card->is_active = 0;  // 卡片默认未激活
        $v_card->funding = 1;
        $v_card->terminate = 0;
        $v_card->save();

        // 记录交易
        $trx_id = 'CB' . getTrxNum();
        $sender = $this->insertCardBuy($trx_id, $user, $wallet, $amount, $v_card, $payable);
        $this->insertBuyCardCharge($fixedCharge, $percent_charge, $total_charge, $user, $sender, $v_card->masked_card);

        // 通知
        $admin = new \stdClass(); // 因为通知需要一个 notifiable 实例
        Notification::send($admin, new CardApplied($user, $v_card));

        return redirect()->route("user.virtual.card.index")->with(['success' => [__("卡片申请成功，请等待审核")]]);
    }

    public function cardFundConfirm(Request $request)
    {
        $request->validate([
            'id' => 'required|integer',
            'fund_amount' => 'required|numeric|gt:0',
        ]);

        $user = auth()->user();
        $myCard = VirtualCard::where('user_id', $user->id)->where('id', $request->id)->first();

        if (!$myCard) {
            return back()->with(['error' => [__('Something Is Wrong In Your Card')]]);
        }

        $amount = $request->fund_amount;
        $wallet = UserWallet::where('user_id', $user->id)->first();
        if (!$wallet) {
            return back()->with(['error' => [__('User wallet not found')]]);
        }
        $cardCharge = TransactionSetting::where('slug', 'reload_card')->where('status', 1)->first();
        $baseCurrency = Currency::default();
        $rate = $baseCurrency->rate;
        if (!$baseCurrency) {
            return back()->with(['error' => [__('Default Currency Not Setup Yet')]]);
        }
        $minLimit = $cardCharge->min_limit * $rate;
        $maxLimit = $cardCharge->max_limit * $rate;
        if ($amount < $minLimit || $amount > $maxLimit) {
            return back()->with(['error' => [__('请输入正确的金额')]]);
        }

        $fixedCharge = $cardCharge->fixed_charge * $rate;
        $percent_charge = ($amount / 100) * $cardCharge->percent_charge;
        $total_charge = $fixedCharge + $percent_charge;
        $payable = $total_charge + $amount;

        if ($payable > $wallet->balance) {
            return back()->with(['error' => [__('对不起，余额不足')]]);
        }

        // 手动更新卡片金额
        $myCard->amount += $amount;
        $myCard->save();

        // 这里不要再次扣除钱包余额

        // 生成交易记录
        $trx_id = 'CF' . getTrxNum();
        $sender = $this->insertCardFund($trx_id, $user, $wallet, $amount, $myCard, $payable);
        $this->insertFundCardCharge($fixedCharge, $percent_charge, $total_charge, $user, $sender, $myCard->masked_card, $amount);

        return redirect()->back()->with(['success' => [__('卡片充值成功')]]);
    }

    public function cardBlockUnBlock(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'status' => 'required|boolean',
            'data_target' => 'required|string',
        ]);
        if ($validator->stopOnFirstFailure()->fails()) {
            $error = ['error' => $validator->errors()];
            return Response::error($error, null, 400);
        }
        $validated = $validator->safe()->all();
        if ($request->status == 1) {
            $card = VirtualCard::where('id', $request->data_target)->where('is_active', 1)->first();
            $status = 'block';
            if (!$card) {
                $error = ['error' => [__('Something Is Wrong In Your Card')]];
                return Response::error($error, null, 404);
            }
            // ... 您的业务逻辑
        } else {
            $card = VirtualCard::where('id', $request->data_target)->where('is_active', 0)->first();
            $status = 'unblock';
            if (!$card) {
                $error = ['error' => [__('Something Is Wrong In Your Card')]];
                return Response::error($error, null, 404);
            }
            // ... 您的业务逻辑
        }
    }

    public function cardTransaction($card_id)
    {
        $user = auth()->user();
        $card = VirtualCard::where('user_id', $user->id)->where('card_id', $card_id)->first();

        if (!$card) {
            return back()->with('error', 'Card not found.');
        }

        $page_title = __("Virtual Card Transaction");
        $transactions = VirtualCardTransaction::where('card_id', $card->card_id)
            ->orderBy('created_at', 'desc')
            ->get();

        return view('user.sections.virtual-card.trx', compact('page_title', 'card', 'transactions'));
    }

    public function makeDefaultOrRemove(Request $request)
    {
        $validated = Validator::make($request->all(), [
            'target' => "required|numeric",
        ])->validate();
        $user = auth()->user();
        $targetCard = VirtualCard::where('id', $validated['target'])->where('user_id', $user->id)->first();
        $withOutTargetCards = VirtualCard::where('id', '!=', $validated['target'])->where('user_id', $user->id)->get();
        try {
            $targetCard->update([
                'is_default' => $targetCard->is_default ? 0 : 1,
            ]);
            if (isset($withOutTargetCards)) {
                foreach ($withOutTargetCards as $card) {
                    $card->is_default = false;
                    $card->save();
                }
            }
        } catch (Exception $e) {
            return back()->with(['error' => [__("Something went wrong! Please try again.")]]);
        }
        return back()->with(['success' => [__('Status Updated Successfully')]]);
    }

    // 卡片购买辅助方法
    public function insertCardBuy($trx_id, $user, $wallet, $amount, $v_card, $payable)
    {
        $trx_id = $trx_id;
        $authWallet = $wallet;
        $afterCharge = ($authWallet->balance - $payable);
        $details = [
            'card_info' => [
                'user_id' => $v_card->user_id,
                'card_id' => $v_card->card_id,
                'ref_id' => $v_card->ref_id,
                'secret' => $v_card->secret,
                'bg' => $v_card->bg,
                'amount' => $v_card->amount,
                'card_bin' => $v_card->card_bin,
                'currency' => $v_card->currency,
                'charge' => $v_card->charge,
                'is_active' => $v_card->is_active,
                'funding' => $v_card->funding,
                'terminate' => $v_card->terminate,
                'updated_at' => $v_card->updated_at,
                'created_at' => $v_card->created_at,
                'id' => $v_card->id,
                // 原有的加密字段
                'card_pan' => $v_card->card_pan, // 加密后的 card_pan
                'cvv' => $v_card->cvv, // 加密后的 cvv
                'expiration' => $v_card->expiration, // 加密后的 expiration
                // 新增掩码后的字段
                'masked_card_pan' => $v_card->masked_card,
                'masked_cvv' => $v_card->masked_cvv,
                'masked_expiration' => $v_card->masked_expiration,
            ],
        ];
        DB::beginTransaction();
        try {
            $id = DB::table("transactions")->insertGetId([
                'user_id' => $user->id,
                'user_wallet_id' => $authWallet->id,
                'payment_gateway_currency_id' => null,
                'type' => PaymentGatewayConst::CARDBUY,
                'trx_id' => $trx_id,
                'request_amount' => $amount,
                'payable' => $payable,
                'available_balance' => $afterCharge,
                'remark' => ucwords(remove_speacial_char(PaymentGatewayConst::CARDBUY, " ")),
                'details' => json_encode($details),
                'attribute' => PaymentGatewayConst::RECEIVED,
                'status' => true,
                'created_at' => now(),
            ]);
            $this->updateSenderWalletBalance($authWallet, $afterCharge);

            DB::commit();
        } catch (Exception $e) {
            DB::rollBack();
            throw new Exception(__("Something Went Wrong! Please Try Again"));
        }
        return $id;
    }

    public function insertBuyCardCharge($fixedCharge, $percent_charge, $total_charge, $user, $id, $masked_card)
    {
        DB::beginTransaction();
        try {
            DB::table('transaction_charges')->insert([
                'transaction_id' => $id,
                'percent_charge' => $percent_charge,
                'fixed_charge' => $fixedCharge,
                'total_charge' => $total_charge,
                'created_at' => now(),
            ]);
            DB::commit();

            // 通知
            $notification_content = [
                'title' => "Buy Card",
                'message' => __("Buy card successful") . $masked_card,
                'image' => files_asset_path('profile-default'),
            ];

            UserNotification::create([
                'type' => NotificationConst::CARD_BUY,
                'user_id' => $user->id,
                'message' => $notification_content,
            ]);
            DB::commit();
        } catch (Exception $e) {
            DB::rollBack();
            throw new Exception(__("Something Went Wrong! Please Try Again"));
        }
    }

    // 卡片充值辅助方法
    public function insertCardFund($trx_id, $user, $wallet, $amount, $myCard, $payable)
    {
        $trx_id = $trx_id;
        $authWallet = $wallet;
        $afterCharge = ($authWallet->balance - $payable);
      
        $details = [
            'card_info' => [
                'user_id' => $myCard->user_id,
                'card_id' => $myCard->card_id,
                'ref_id' => $myCard->ref_id,
                'secret' => $myCard->secret,
                'bg' => $myCard->bg,
                'amount' => $myCard->amount,
                'card_bin' => $myCard->card_bin,
                'currency' => $myCard->currency,
                'charge' => $myCard->charge,
                'is_active' => $myCard->is_active,
                'funding' => $myCard->funding,
                'terminate' => $myCard->terminate,
                'updated_at' => $myCard->updated_at,
                'created_at' => $myCard->created_at,
                'id' => $myCard->id,
                // 原有的加密字段
                'card_pan' => $myCard->card_pan, // 加密后的 card_pan
                'cvv' => $myCard->cvv, // 加密后的 cvv
                'expiration' => $myCard->expiration, // 加密后的 expiration
                // 新增掩码后的字段
                'masked_card_pan' => $myCard->masked_card,
                'masked_cvv' => $myCard->masked_cvv,
                'masked_expiration' => $myCard->masked_expiration,
            ],
        ];
        DB::beginTransaction();
        try {
            $id = DB::table("transactions")->insertGetId([
                'user_id' => $user->id,
                'user_wallet_id' => $authWallet->id,
                'payment_gateway_currency_id' => null,
                'type' => PaymentGatewayConst::CARDFUND,
                'trx_id' => $trx_id,
                'request_amount' => $amount,
                'payable' => $payable,
                'available_balance' => $afterCharge,
                'remark' => ucwords(remove_speacial_char(PaymentGatewayConst::CARDFUND, " ")),
                'details' => json_encode($details),
                'attribute' => PaymentGatewayConst::RECEIVED,
                'status' => true,
                'created_at' => now(),
            ]);
            $this->updateSenderWalletBalance($authWallet, $afterCharge);

            // 新增代码：插入到 VirtualCardTransaction 表
            $cardTransaction = new VirtualCardTransaction();
            $cardTransaction->card_id = $myCard->card_id;
            $cardTransaction->user_id = $user->id;
            $cardTransaction->trx_id = $trx_id;
            $cardTransaction->amount = $amount;
            $cardTransaction->currency = $wallet->currency->code;
            $cardTransaction->status = PaymentGatewayConst::STATUSSUCCESS;
            $cardTransaction->product = '资金转入';
            $cardTransaction->type = PaymentGatewayConst::CARDFUND; // 设置交易类型为充值
            $cardTransaction->reference = $trx_id;
            $cardTransaction->gateway_reference = null; // 如果有网关参考ID，可填写
            $cardTransaction->response_message = '从钱包转入资金到卡片';
            $cardTransaction->save();

            DB::commit();
        } catch (Exception $e) {
            DB::rollBack();
            throw new Exception(__("Something Went Wrong! Please Try Again"));
        }
        return $id;
    }

    public function insertFundCardCharge($fixedCharge, $percent_charge, $total_charge, $user, $id, $masked_card, $amount)
    {
        DB::beginTransaction();
        try {
            DB::table('transaction_charges')->insert([
                'transaction_id' => $id,
                'percent_charge' => $percent_charge,
                'fixed_charge' => $fixedCharge,
                'total_charge' => $total_charge,
                'created_at' => now(),
            ]);
            DB::commit();

            // 通知
            $notification_content = [
                'title' => "Card Fund",
                'message' => __("Card fund successful card:") . " " . $masked_card . ' ' . getAmount($amount, 2) . ' ' . get_default_currency_code(),
                'image' => files_asset_path('profile-default'),
            ];

            UserNotification::create([
                'type' => NotificationConst::CARD_FUND,
                'user_id' => $user->id,
                'message' => $notification_content,
            ]);
            DB::commit();
        } catch (Exception $e) {
            DB::rollBack();
            throw new Exception(__("Something Went Wrong! Please Try Again"));
        }
    }

    // 更新用户钱包余额
    public function updateSenderWalletBalance($authWallet, $afterCharge)
    {
        $authWallet->update([
            'balance' => $afterCharge,
        ]);
    }

    // 卡片余额转出
    public function cardWithdraw(Request $request)
    {
        $request->validate([
            'id' => 'required|integer',
            'withdraw_amount' => 'required|numeric|gt:0',
        ]);

        $user = auth()->user();
        $myCard = VirtualCard::where('user_id', $user->id)
            ->where('id', $request->id)
            ->first();

        if (!$myCard) {
            return back()->with(['error' => [__('卡片未找到')]]);
        }

        $amount = $request->withdraw_amount;

        // 检查卡片余额是否足够
        if ($amount > $myCard->amount) {
            return back()->with(['error' => [__('卡片余额不足')]]);
        }

        // 获取转出费用设置
        $cardWithdrawCharge = TransactionSetting::where('slug', 'card_withdraw')->where('status', 1)->first();
        $baseCurrency = Currency::default();
        $rate = $baseCurrency->rate;

        if (!$baseCurrency) {
            return back()->with(['error' => [__('Default Currency Not Setup Yet')]]);
        }

        $minLimit = $cardWithdrawCharge->min_limit * $rate;
        $maxLimit = $cardWithdrawCharge->max_limit * $rate;

        if ($amount < $minLimit || $amount > $maxLimit) {
            return back()->with(['error' => [__('请输入正确的金额')]]);
        }

        // 费用计算
        $fixedCharge = $cardWithdrawCharge->fixed_charge * $rate;
        $percent_charge = ($amount / 100) * $cardWithdrawCharge->percent_charge;
        $total_charge = $fixedCharge + $percent_charge;
        $payable = $amount + $total_charge;

        // 检查卡片余额是否足够覆盖转出金额和费用
        if ($payable > $myCard->amount) {
            return back()->with(['error' => [__('对不起，卡片余额不足以覆盖转出金额及费用')]]);
        }

        // 开始数据库事务
        DB::beginTransaction();

        try {
            // 从卡片余额中扣除转出金额及费用
            $myCard->amount -= $payable;
            $myCard->save();

            // 给用户钱包增加转出金额
            $wallet = UserWallet::where('user_id', $user->id)->first();
            $wallet->balance += $amount;
            $wallet->save();

            // 生成唯一的交易ID
            $trx_id = 'CW' . time() . rand(1000, 9999);

            // 调用辅助方法，生成交易记录
            $this->createWithdrawTransactionRecords($fixedCharge, $trx_id, $user, $wallet, $amount, $myCard, $total_charge);

            // 提交事务
            DB::commit();

            return back()->with(['success' => [__('转出成功')]]);

        } catch (\Exception $e) {
            // 回滚事务
            DB::rollBack();
            return back()->with(['error' => [__('操作失败，请重试。')]]);
        }
    }

    private function createWithdrawTransactionRecords($fixedCharge, $trx_id, $user, $wallet, $amount, $myCard, $total_charge)
    {

        $details = [
            'card_info' => [
                'user_id' => $myCard->user_id,
                'card_id' => $myCard->card_id,
                'ref_id' => $myCard->ref_id,
                'secret' => $myCard->secret,
                'bg' => $myCard->bg,
                'amount' => $myCard->amount,
                'card_bin' => $myCard->card_bin,
                'currency' => $myCard->currency,
                'charge' => $myCard->charge,
                'is_active' => $myCard->is_active,
                'funding' => $myCard->funding,
                'terminate' => $myCard->terminate,
                'updated_at' => $myCard->updated_at,
                'created_at' => $myCard->created_at,
                'id' => $myCard->id,
                // 原有的加密字段
                'card_pan' => $myCard->card_pan, // 加密后的 card_pan
                'cvv' => $myCard->cvv, // 加密后的 cvv
                'expiration' => $myCard->expiration, // 加密后的 expiration
                // 新增掩码后的字段
                'masked_card_pan' => $myCard->masked_card,
                'masked_cvv' => $myCard->masked_cvv,
                'masked_expiration' => $myCard->masked_expiration,
            ],
        ];
      


        // 创建卡片交易记录
        $cardTransaction = new VirtualCardTransaction();
        $cardTransaction->card_id = $myCard->card_id;
        $cardTransaction->user_id = $user->id;
        $cardTransaction->trx_id = $trx_id;
        $cardTransaction->amount = $amount;
        $cardTransaction->currency = $wallet->currency->code;
        $cardTransaction->status = PaymentGatewayConst::STATUSSUCCESS;
        $cardTransaction->product = '资金转出';
        $cardTransaction->type = PaymentGatewayConst::TYPEVIRTUALCARDWITHDRAW;
        $cardTransaction->reference = $trx_id;
        $cardTransaction->gateway_reference = null;
        $cardTransaction->response_message = '从卡片转出资金到钱包';
        $cardTransaction->save();

        // 创建总交易记录
        $transaction = new Transaction();
        $transaction->admin_id = null;
        $transaction->user_id = $user->id;
        $transaction->user_wallet_id = $wallet->id;
        $transaction->payment_gateway_currency_id = null;
        $transaction->trx_id = $trx_id;
        $transaction->type = PaymentGatewayConst::TYPEVIRTUALCARDWITHDRAW;
        $transaction->request_amount = $amount;
        $transaction->payable = $payable = $amount + $total_charge;
        $transaction->available_balance = $wallet->balance;
        $transaction->remark = '从卡片转出资金';
        $transaction->status = PaymentGatewayConst::STATUSSUCCESS;
        $transaction->details = $details;
        $transaction->reject_reason = null;
        $transaction->save();

        // 记录费用
        DB::table('transaction_charges')->insert([
            'transaction_id' => $transaction->id,
            'percent_charge' => ($total_charge / $amount) * 100, // 假设存储百分比
            'fixed_charge' => $fixedCharge,
            'total_charge' => $total_charge,
            'created_at' => now(),
        ]);

        // 发送通知
        $notification_content = [
            'title' => "Card Withdraw",
            'message' => __("Card withdraw successful card:") . " " . $myCard->masked_card . ' ' . getAmount($amount, 2) . ' ' . get_default_currency_code(),
            'image' => files_asset_path('profile-default'),
        ];

        UserNotification::create([
            'type' => NotificationConst::CARD_WITHDRAW,
            'user_id' => $user->id,
            'message' => $notification_content,
        ]);
    }

    // 所有卡片交易记录
    public function allTransactions(Request $request)
    {
        $user = auth()->user();

        $query = VirtualCardTransaction::where('user_id', $user->id)
            ->with('card'); // 关联卡片信息

        // 处理搜索功能
        if ($request->filled('card_number')) {
            $cardNumber = $request->input('card_number');
            $query->whereHas('card', function ($q) use ($cardNumber) {
                $q->where('card_pan', 'like', '%' . $cardNumber);
            });
        }

        if ($request->filled('transaction_type')) {
            $query->where('type', $request->input('transaction_type'));
        }

        if ($request->filled('date_from') && $request->filled('date_to')) {
            $startDate = $request->input('date_from') . ' 00:00:00';
            $endDate = $request->input('date_to') . ' 23:59:59';
            $query->whereBetween('created_at', [$startDate, $endDate]);
        } else {
            if ($request->filled('date_from')) {
                $startDate = $request->input('date_from') . ' 00:00:00';
                $query->where('created_at', '>=', $startDate);
            }

            if ($request->filled('date_to')) {
                $endDate = $request->input('date_to') . ' 23:59:59';
                $query->where('created_at', '<=', $endDate);
            }
        }

        $transactions = $query->orderBy('created_at', 'desc')->paginate(10);

        $page_title = '交易记录';

        // 定义交易类型数组（键为类型代码，值为中文名称）
        $transactionTypes = [
            PaymentGatewayConst::CARDFUND => __('充值'),
            PaymentGatewayConst::TYPEVIRTUALCARDWITHDRAW => __('转出'),
            PaymentGatewayConst::TYPECONSUMPTION => __('消费支出'),
            PaymentGatewayConst::TYPEREFUND => __('退款'),
            // 添加其他交易类型
        ];

        return view('user.sections.virtual-card.transactions', compact('page_title', 'transactions', 'transactionTypes'));
    }

    public function getFullInfo(Request $request, $card_id)
    {
        $myCard = VirtualCard::where('card_id', $card_id)->firstOrFail();

        // 验证当前用户是否有权查看该卡片信息
        if ($myCard->user_id != auth()->id()) {
            abort(403, '无权访问');
        }

        // 返回解密后的数据
        return response()->json([
            'card_pan'    => $myCard->card_pan_decrypted,
            'cvv'         => $myCard->cvv_decrypted,
            'expiration'  => $myCard->expiration_decrypted,
        ]);
    }
}
