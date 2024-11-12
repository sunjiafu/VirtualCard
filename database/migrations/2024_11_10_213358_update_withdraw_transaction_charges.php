<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;
use App\Constants\PaymentGatewayConst;

class UpdateWithdrawTransactionCharges extends Migration
{
    public function up()
    {
        Schema::table('transaction_charges', function (Blueprint $table) {
            // 如果 'total_charge' 字段不存在，则添加
            if (!Schema::hasColumn('transaction_charges', 'total_charge')) {
                $table->decimal('total_charge', 10, 2)->nullable()->after('fixed_charge');
            }
        });

        // 仅更新转出类型的 transaction_charges 记录，将 'total_charge' 设置为 0
        DB::table('transaction_charges')
            ->whereIn('transaction_id', function($query) {
                $query->select('id')
                      ->from('transactions')
                      ->where('type', PaymentGatewayConst::TYPEVIRTUALCARDWITHDRAW);
            })
            ->whereNull('total_charge')
            ->update(['total_charge' => 0]);
    }

    public function down()
    {
        Schema::table('transaction_charges', function (Blueprint $table) {
            // 回滚迁移时，根据需要操作
            // 例如，如果之前添加了字段，可以选择删除
            // 这里只是示例，实际操作请根据需求调整
            // $table->dropColumn('total_charge');
        });
    }
}
