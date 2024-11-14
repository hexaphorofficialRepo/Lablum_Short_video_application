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
        Schema::create('addplans', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('advertiser_id');
            $table->string('add_count');
            $table->string('days_count');
            $table->string('target_audiance')->nullable();
            $table->string('target_age_group')->nullable();
            $table->string('location')->nullable();
            $table->string('payment_amount');
            $table->tinyInteger('add_status')->default(0);
            $table->date('avtivation_date')->nullable();
            $table->date('expire_date')->nullable();




            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('addplans');
    }
};
