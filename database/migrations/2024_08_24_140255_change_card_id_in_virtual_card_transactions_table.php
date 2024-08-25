<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ChangeCardIdInVirtualCardTransactionsTable extends Migration
{
    public function up()
    {
        Schema::table('virtual_card_transactions', function (Blueprint $table) {
            $table->dropForeign(['card_id']); // 删除外键约束
        });

        Schema::table('virtual_card_transactions', function (Blueprint $table) {
            $table->string('card_id', 255)->change(); // 修改 card_id 列为字符串类型
        });

        Schema::table('virtual_card_transactions', function (Blueprint $table) {
            $table->foreign('card_id')->references('id')->on('virtual_cards')->onDelete('cascade'); // 重新添加外键约束
        });
    }

    public function down()
    {
        Schema::table('virtual_card_transactions', function (Blueprint $table) {
            $table->dropForeign(['card_id']); // 在回滚时删除外键约束
        });

        Schema::table('virtual_card_transactions', function (Blueprint $table) {
            $table->unsignedBigInteger('card_id')->change(); // 回滚 card_id 列为整数类型
        });

        Schema::table('virtual_card_transactions', function (Blueprint $table) {
            $table->foreign('card_id')->references('id')->on('virtual_cards')->onDelete('cascade'); // 重新添加外键约束
        });
    }
}

