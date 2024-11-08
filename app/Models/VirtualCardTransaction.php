<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Constants\PaymentGatewayConst;

class VirtualCardTransaction extends Model
{
    use HasFactory;

    protected $fillable = [
        'card_id', 
        'user_id',
        'trx_id',
        'amount', 
        'currency', 
        'status', 
        'product', 
        'reference', 
        'gateway_reference', 
        'response_message',
        'type',
    ];

    // 添加关联关系
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function card()
    {
        return $this->belongsTo(VirtualCard::class, 'card_id', 'card_id');
    }

    /**
     * 获取交易类型的友好显示名称
     */
    public function getTypeLabelAttribute()
    {
        $types = [
            PaymentGatewayConst::CARDFUND => __('充值'),
            PaymentGatewayConst::TYPEVIRTUALCARDWITHDRAW => __('转出'),
            // 添加其他交易类型的映射
        ];

        return $types[$this->type] ?? $this->type;
    }
}
