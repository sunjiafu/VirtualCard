<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

class ModifyAmountColumnInVirtualCardsTable extends Migration
{
    public function up()
    {
        // 首先备份现有数据
        DB::statement('ALTER TABLE virtual_cards ADD COLUMN amount_new DECIMAL(10, 2) NULL');
        DB::statement('UPDATE virtual_cards SET amount_new = CAST(amount AS DECIMAL(10,2))');
        
        // 删除旧列并重命名新列
        Schema::table('virtual_cards', function (Blueprint $table) {
            $table->dropColumn('amount');
        });
        
        Schema::table('virtual_cards', function (Blueprint $table) {
            $table->renameColumn('amount_new', 'amount');
        });
    }

    public function down()
    {
        Schema::table('virtual_cards', function (Blueprint $table) {
            $table->string('amount')->change();
        });
    }
}