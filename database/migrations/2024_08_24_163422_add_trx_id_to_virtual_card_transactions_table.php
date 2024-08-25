<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('virtual_card_transactions', function (Blueprint $table) {
            $table->string('trx_id')->unique()->after('id'); // 添加一个唯一的 trx_id 字段        

        });
    }
    
    public function down()
    {
        Schema::table('virtual_card_transactions', function (Blueprint $table) {
            $table->dropColumn('trx_id');
        });
    }
    
    
};
