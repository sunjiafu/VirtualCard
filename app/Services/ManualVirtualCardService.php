<?php

namespace App\Services;

use App\Models\VirtualCard;
use App\Models\VirtualCardTransaction;
use App\Models\VirtualCardBin;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Models\User;
use App\Models\Transaction;
use App\Constants\PaymentGatewayConst;
use App\Models\UserWallet;
use App\Models\admin\Currency;
use Illuminate\Support\Facades\Notification;
use Exception;
use App\Models\Admin\TransactionSetting;
use App\Models\TransactionCharge;

class ManualVirtualCardService implements VirtualCardServiceInterface
{
    public function applyCard($data)
    {
        // Implementation for applying a new card
        return $this->cardBuy($data['user'], $data['amount'], $data['card_bin']);
    }

    public function rechargeCard($cardId, $amount)
    {
        // Implementation for recharging a card
        $user = Auth::user();
        return $this->cardFundConfirm($user, $cardId, $amount);
    }

    public function transferOut($cardId, $amount)
    {
        // Implementation for transferring out funds
        $user = Auth::user();
        return $this->cardWithdraw($user, $cardId, $amount);
    }

    public function getCards($userId)
    {
        return VirtualCard::where('user_id', $userId)->get();
    }

    public function getCardDetails($cardId)
    {
        $card = VirtualCard::where('card_id', $cardId)->first();

        // 获取交易记录
        $transactions = VirtualCardTransaction::where('card_id', $card->card_id)
            ->orderBy('created_at', 'desc')
            ->paginate(10);

        // 获取总充值金额
        $totalReloaded = VirtualCardTransaction::where('card_id', $card->card_id)
            ->where('type', PaymentGatewayConst::CARDFUND)
            ->where('status', PaymentGatewayConst::STATUSSUCCESS)
            ->sum('amount');

        // 获取总转出金额
        $totalWithdrawn = VirtualCardTransaction::where('card_id', $card->card_id)
            ->where('type', PaymentGatewayConst::TYPEVIRTUALCARDWITHDRAW)
            ->where('status', PaymentGatewayConst::STATUSSUCCESS)
            ->sum('amount');

        return [
            'card' => $card,
            'transactions' => $transactions,
            'totalReloaded' => $totalReloaded,
            'totalWithdrawn' => $totalWithdrawn,
        ];
    }

    /**
     * 处理虚拟卡购买逻辑
     * 
     * @param User $user 用户对象
     * @param float $amount 购买金额
     * @param int $card_bin 卡 BIN ID
     * @return array
     * @throws Exception
     */
    public function cardBuy(User $user, float $amount, int $card_bin)
    {
        return DB::transaction(function () use ($user, $amount, $card_bin) {
            // 获取用户钱包
            $wallet = UserWallet::where('user_id', $user->id)->first();
            if (!$wallet) {
                throw new Exception(__('用户钱包未找到'));
            }

            // 获取交易设置
            $cardCharge = TransactionSetting::where('slug', 'virtual_card')->where('status', 1)->first();
            if (!$cardCharge) {
                throw new Exception(__('虚拟卡交易设置未找到'));
            }

            // 获取默认货币
            $baseCurrency = Currency::default();
            if (!$baseCurrency) {
                throw new Exception(__('默认货币未设置'));
            }
            $rate = $baseCurrency->rate;

            // 检查交易限额
            $minLimit = $cardCharge->min_limit * $rate;
            $maxLimit = $cardCharge->max_limit * $rate;
            if ($amount < $minLimit || $amount > $maxLimit) {
                throw new Exception(__('请遵守交易限额'));
            }

            // 计算费用
            $fixedCharge = $cardCharge->fixed_charge * $rate;
            $percentCharge = ($amount / 100) * $cardCharge->percent_charge;
            $totalCharge = $fixedCharge + $percentCharge;
            $payable = $totalCharge + $amount;

            // 检查余额是否足够
            if ($payable > $wallet->balance) {
                throw new Exception(__('抱歉，余额不足'));
            }

            // 减少钱包余额
            $wallet->balance -= $payable;
            $wallet->save();

            // 生成交易号
            $trx = 'VC' . $this->getTrxNum();

            // 创建虚拟卡记录
            $virtualCard = VirtualCard::create([
                'user_id' => $user->id,
                'card_id' => $trx,
                'ref_id' => $trx,
                'secret' => $trx,
                'bg' => "DeepBlue",
                'amount' => $amount,
                'card_bin' => $card_bin,
                'currency' => $baseCurrency->code,
                'charge' => $totalCharge,
                'is_active' => 0,  // 卡片默认未激活
                'funding' => 1,
                'terminate' => 0
            ]);

            // 创建交易记录
            $transaction = $this->createTransaction($user, $wallet, $amount, $totalCharge, PaymentGatewayConst::CARDBUY, '虚拟卡购买', $virtualCard);
            $this->createCardCharge($fixedCharge,$totalCharge,$percentCharge,$transaction);

            // 实例化一个类
            $admin = new \StdClass();

            // 返回结果
            return [
                'user' => $user,
                'virtual_card' => $virtualCard,
                'transaction' => $transaction,
                'admin' => $admin
            ];
        });
    }

    /**
     * 处理虚拟卡充值确认逻辑
     * 
     * @param User $user 用户对象
     * @param string $card_id 卡片ID
     * @param float $amount 充值金额
     * @return array
     * @throws Exception
     */
    public function cardFundConfirm(User $user, string $card_id, float $amount)
    {
        return DB::transaction(function () use ($user, $card_id, $amount) {
            // 获取用户钱包
            $wallet = UserWallet::where('user_id', $user->id)->first();
            if (!$wallet) {
                throw new Exception(__('用户钱包未找到'));
            }

            // 获取虚拟卡
            $virtualCard = VirtualCard::where('user_id', $user->id)->where('id', $card_id)->first();

            // 获取交易设置
            $cardCharge = TransactionSetting::where('slug', 'reload_card')->where('status', 1)->first();
            if (!$cardCharge) {
                throw new Exception(__('充值交易设置未找到'));
            }

            // 获取默认货币
            $baseCurrency = Currency::default();
            if (!$baseCurrency) {
                throw new Exception(__('默认货币未设置'));
            }
            $rate = $baseCurrency->rate;

            // 检查交易限额
            $minLimit = $cardCharge->min_limit * $rate;
            $maxLimit = $cardCharge->max_limit * $rate;
            if ($amount < $minLimit || $amount > $maxLimit) {
                return back()->with(['error' => [__('金额不符合交易限额')]]);
            }

            // 计算费用
            $fixedCharge = $cardCharge->fixed_charge * $rate;
            $percentCharge = ($amount / 100) * $cardCharge->percent_charge;
            $totalCharge = $fixedCharge + $percentCharge;
            $payable = $totalCharge + $amount;

            // 检查余额是否足够
            if ($payable > $wallet->balance) {
                return back()->with(['error' => [__('你的余额不足，请充值')]]);
            }

            // 减少钱包余额
            $wallet->balance -= $payable;
            $wallet->save();

            // 增加虚拟卡余额
            $virtualCard->amount += $amount;
            $virtualCard->save();

            // 创建交易记录
            $transaction = $this->createTransaction($user, $wallet, $amount, $totalCharge, PaymentGatewayConst::CARDFUND, '虚拟卡充值', $virtualCard);

            //创建虚拟卡交易记录

            $this->createVirtualCardTransaction($transaction,$wallet,$user,$virtualCard, $amount, PaymentGatewayConst::CARDFUND);

            // 实例化一个类
            $admin = new \StdClass();

            // 返回结果
            return [
                'transaction' => $transaction,
                'admin' => $admin,
                'user' => $user,
                'virtual_card' => $virtualCard,

            ];
        });
    }

    /**
     * 处理虚拟卡转出逻辑
     * 
     * @param User $user 用户对象
     * @param string $card_id 卡片ID
     * @param float $amount 转出金额
     * @return array
     * @throws Exception
     */
    public function cardWithdraw(User $user, string $card_id, float $amount)
    {
        return DB::transaction(function () use ($user, $card_id, $amount) {
            // 获取用户钱包
            $wallet = UserWallet::where('user_id', $user->id)->first();
            if (!$wallet) {
                throw new Exception(__('用户钱包未找到'));
            }


            // 获取虚拟卡
            $virtualCard = VirtualCard::where('user_id', $user->id)->where('id', $card_id)->first();

            if ($virtualCard->amount < $amount) {
                throw new Exception(__('虚拟卡余额不足'));
            }

            // 获取交易设置
            $cardCharge = TransactionSetting::where('slug', 'card_withdraw')->where('status', 1)->first();
            if (!$cardCharge) {
                throw new Exception(__('充值交易设置未找到'));
            }

            // 获取默认货币
            $baseCurrency = Currency::default();
            if (!$baseCurrency) {
                throw new Exception(__('默认货币未设置'));
            }
            $rate = $baseCurrency->rate;

            // 检查交易限额
            $minLimit = $cardCharge->min_limit * $rate;
            $maxLimit = $cardCharge->max_limit * $rate;
            if($amount < $minLimit){
                return back()->with(['error' => [__('最低转出金额为10'.$baseCurrency->code)]]);
            }
          

            // 计算费用
            $fixedCharge = $cardCharge->fixed_charge * $rate;
            $percentCharge = ($amount / 100) * $cardCharge->percent_charge;
            $totalCharge = $fixedCharge + $percentCharge;
            $payable = $totalCharge + $amount;

            // 减少虚拟卡余额
            $virtualCard->amount -= $amount;
            $virtualCard->save();

            // 增加钱包余额
            $wallet->balance += $amount;
            $wallet->save();

            // 创建交易记录
            $transaction = $this->createTransaction($user, $wallet, $amount, 0, PaymentGatewayConst::TYPEVIRTUALCARDWITHDRAW, '虚拟卡转出', $virtualCard);

            
            //创建虚拟卡交易记录

            $this->createVirtualCardTransaction($transaction,$wallet,$user,$virtualCard, $amount, PaymentGatewayConst::TYPEVIRTUALCARDWITHDRAW);

            // 返回结果
            return [
                'transaction' => $transaction
            ];
        });
    }



    public function freezeCard($cardId)
    {
        // 手动处理冻结虚拟卡的逻辑
    }

    public function deleteCard($cardId)
    {
        // 手动处理删除虚拟卡的逻辑
    }

    /**
     * 创建交易记录
     * 
     * @param User $user 用户对象
     * @param UserWallet $wallet 用户钱包对象
     * @param float $amount 交易金额
     * @param float $charge 交易费用
     * @param string $type 交易类型
     * @param string $remark 备注
     * @param virtualCard $virtualCard 虚拟卡ID
     * @return Transaction
     */
    private function createTransaction(User $user, UserWallet $wallet, float $amount, float $charge, string $type, string $remark, $virtualCard)
    {
        // 生成交易号
        $trx_id = strtoupper($this->generateTrxId($type));
        $availabe_balance = $wallet->balance;

        $details = [
            'card_info' => [
                'user_id' => $virtualCard->user_id,
                'card_id' => $virtualCard->card_id,
                'ref_id' => $virtualCard->ref_id,
                'secret' => $virtualCard->secret,
                'bg' => $virtualCard->bg,
                'amount' => $virtualCard->amount,
                'card_bin' => $virtualCard->card_bin,
                'currency' => $virtualCard->currency,
                'charge' => $virtualCard->charge,
                'is_active' => $virtualCard->is_active,
                'funding' => $virtualCard->funding,
                'terminate' => $virtualCard->terminate,
                'updated_at' => $virtualCard->updated_at,
                'created_at' => $virtualCard->created_at,
                'id' => $virtualCard->id,
                // 原有的加密字段
                'card_pan' => $virtualCard->card_pan, // 加密后的 card_pan
                'cvv' => $virtualCard->cvv, // 加密后的 cvv
                'expiration' => $virtualCard->expiration, // 加密后的 expiration
                // 新增掩码后的字段
                'masked_card_pan' => $virtualCard->masked_card,
                'masked_cvv' => $virtualCard->masked_cvv,
                'masked_expiration' => $virtualCard->masked_expiration,
            ],
        ];

        // 创建交易记录
        DB::beginTransaction();
        try {
            $id = DB::table(table: "transactions")->insertGetId([
                'user_id' => $user->id,
                'user_wallet_id' => $wallet->id,
                'payment_gateway_currency_id' => null,
                'type' => $type,
                'trx_id' => $trx_id,
                'request_amount' => $amount,
                // 'payable' => $payable,
                'available_balance' => $availabe_balance,
                'remark' => ucwords(remove_speacial_char(PaymentGatewayConst::CARDBUY, " ")),
                'details' =>json_encode($details),
                'attribute' => PaymentGatewayConst::RECEIVED,
                'status' => true,
                'created_at' => now(),

            ]);

            DB::commit();
        } catch (Exception $e) {
            DB::rollBack();
            throw new Exception(__("Something Went Wrong! Please Try Again"));
        }

        return [
            'transaction_id' => $id,
            'trx_id' => $trx_id  // 在返回值中包含 trx_id
        ];

    }

    /**
     * 创建虚拟卡交易记录
     * 
     * @param string $trx_id 交易号
     * @param UserWallet $wallet 用户钱包对象
     * @param User $user 用户对象
     * @param VirtualCard $virtualCard 虚拟卡对象
     * @param float $amount 交易金额
     * @param string $type 交易类型
     * @return VirtualCardTransaction
     */

    public function createVirtualCardTransaction($trx_id,$wallet,$user,$virtualCard, $amount, $type)
    {
        return VirtualCardTransaction::create([
            'card_id' => $virtualCard->card_id,
            'user_id' => $user->id,
            'trx_id' => $trx_id['trx_id'],
            'amount' => $amount,
            'currency' => $wallet->currency->code,
            'status' => PaymentGatewayConst::STATUSSUCCESS,
            'product' => '资金转入',
            'type' => $type, // 设置交易类型
            'reference' => $trx_id['trx_id'],
            'gateway_reference' => null, // 如果有网关参考ID，可填写

    
        ]);
    }

    /**
     * 记录卡片费用
     * 
     * @param User $user 用户对象
     * 
     * @param UserWallet $wallet 用户钱包对象
     * 
     * @param float $fixedChare 固定费用
     * 
     * @param float $percentCharge 百分比费用
     * 
     * @param float $transaction_id 交易id
     * 
     */

     public function createCardCharge(float $fixedCharge,float $totalCharge, float $percentCharge,$id)
     {

        return DB::table("transaction_charges")->insert([
            'transaction_id' => $id['transaction_id'],
            'percent_charge' => $percentCharge,
            'fixed_charge' => $fixedCharge,
            'total_charge' => $totalCharge,
        ]);


        
  

     }

    /**
     * 生成交易号
     * 
     * @param string $prefix 交易前缀
     * @return string
     */
    private function generateTrxId($prefix)
    {
        return $prefix . uniqid();
    }

    /**
     * 生成唯一交易编号
     * 
     * @return string
     */
    private function getTrxNum()
    {
        return strtoupper(substr(md5(uniqid(mt_rand(), true)), 0, 10));
    }
}