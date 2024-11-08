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
        Schema::table('virtual_card_bins', function (Blueprint $table) {

            $table->string('region')->nullable()->comment('所属地区');
            $table->string('card_type')->nullable()->comment('卡片类型');
            $table->string('currency')->nullable()->comment('币种');
            $table->text('description')->nullable()->comment('卡片说明');
            //
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('virtual_card_bins', function (Blueprint $table) {
            $table->dropColumn(['region', 'card_type', 'currency', 'description']);
        });
    }
};
