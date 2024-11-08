<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class VirtualCardBin extends Model
{
    use HasFactory;

    protected $fillable = [
        'bin',
        'region',
        'card_type',
        'currency',
        'description',
    ];
}
