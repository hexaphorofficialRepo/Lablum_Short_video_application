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
        Schema::create('addvideos', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('adevrtiser_id');
            $table->unsignedBigInteger('addplan_id');
            $table->text('fb_link')->nullable();
            $table->text('insta_link')->nullable();
            $table->text('web_link')->nullable();
            $table->tinyInteger('status')->default(0);
            $table->string('video');
        



            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('addvideos');
    }
};
