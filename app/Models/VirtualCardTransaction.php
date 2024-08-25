<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

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
    ];
}
