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
    Schema::table('virtual_cards', function (Blueprint $table) {
        $table->string('status')->default('pending'); // 默认状态为 pending
    });
}

public function down()
{
    Schema::table('virtual_cards', function (Blueprint $table) {
        $table->dropColumn('status');
    });
}

};
