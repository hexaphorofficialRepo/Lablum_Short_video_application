<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('withdrawls', function (Blueprint $table) {
            $table->id();
            $table->text('order_id');
            $table->string('user_id');
            $table->string('wallet_id');
            $table->string('transfer_amount');
            $table->string('previous_wallet_amount');
            $table->string('new_wallet_amount');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('withdrawls');
    }
};
