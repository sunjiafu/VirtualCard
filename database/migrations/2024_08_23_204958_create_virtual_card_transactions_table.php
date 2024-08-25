
<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateVirtualCardTransactionsTable extends Migration
{
    public function up()
    {
        Schema::create('virtual_card_transactions', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id');
            $table->unsignedBigInteger('card_id');
            $table->decimal('amount', 15, 2);
            $table->string('currency', 10);
            $table->string('status')->default('Pending'); // 状态字段，默认为 'Pending'
            $table->text('details')->nullable();
            $table->string('reference')->nullable();
            $table->string('gateway_reference')->nullable();
            $table->text('response_message')->nullable();
            $table->timestamps();

            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('card_id')->references('id')->on('virtual_cards')->onDelete('cascade');
        });
    }

    public function down()
    {
        Schema::dropIfExists('virtual_card_transactions');
    }
}
