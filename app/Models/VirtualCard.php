<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Plan;
use Illuminate\Support\Facades\Crypt;

class VirtualCard extends Model
{
    use HasFactory;
    protected $guarded = ['id'];
    protected $table = "virtual_cards";
    protected $casts = [
        'user_id' => 'integer',
        'card_id' => 'string',
        'name' => 'string',
        'account_id' => 'string',
        'card_hash' => 'string',
        'card_pan' => 'string',
        'masked_card' => 'string',
        'cvv' => 'string',
        'expiration' => 'string',
        'card_type' => 'string',
        'name_on_card' => 'string',
        'callback' => 'string',
        'ref_id' => 'string',
        'secret' => 'string',
        'city' => 'string',
        'state' => 'string',
        'zip_code' => 'string',
        'address' => 'string',
        'amount' => 'double',
        'currency' => 'string',
        'bg' => 'string',
        'charge' => 'double',
        'is_active' => 'integer',
        'funding' => 'integer',
        'terminate' => 'integer',

    ];

    // 需要加密的字段
    protected $encryptable = [
        'card_pan',
        'cvv',
        'expiration',
    ];

    // 设置器：在保存时加密
    public function setAttribute($key, $value)
    {
        if (in_array($key, $this->encryptable) && !is_null($value)) {
            $value = Crypt::encryptString($value);
        }

        parent::setAttribute($key, $value);
    }

    // 获取器：在读取时解密
    public function getAttribute($key)
    {
        $value = parent::getAttribute($key);

        if (in_array($key, $this->encryptable) && !is_null($value)) {
            try {
                $value = Crypt::decryptString($value);
            } catch (\Exception $e) {
                $value = null;
            }
        }

        return $value;
    }

    // 获取解密后的卡号
    public function getCardPanDecryptedAttribute()
    {
        return $this->card_pan;
    }

    // 获取解密后的CVV
    public function getCvvDecryptedAttribute()
    {
        return $this->cvv;
    }

    // 获取解密后的有效期
    public function getExpirationDecryptedAttribute()
    {
        return $this->expiration;
    }

    // 获取掩码后的卡号
    public function getMaskedCardAttribute()
    {
        if ($this->card_pan) {
            $firstSix = substr($this->card_pan, 0, 6);
            $lastFour = substr($this->card_pan, -4);
            $masked = $firstSix . str_repeat('*', strlen($this->card_pan) - 10) . $lastFour;
            return $masked;
        }
        return null;
    }

    // 获取掩码后的有效期
    public function getMaskedExpirationAttribute()
    {
        return '**/**';
    }

    // 获取掩码后的CVV
    public function getMaskedCvvAttribute()
    {
        return '***';
    }

    public function user() {
        return $this->belongsTo(User::class);
    }

    public function transactions()
{
    return $this->hasMany(VirtualCardTransaction::class, 'card_id');
}


}
