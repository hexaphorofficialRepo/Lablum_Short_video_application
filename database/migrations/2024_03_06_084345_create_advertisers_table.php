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
        Schema::create('advertisers', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('email');
            $table->string('mobile');
            $table->string('business_type');
            $table->string('business_name');
            $table->text('url')->nullable();
            $table->text('area')->nullable();
            $table->string('city');
            $table->string('sate');
            $table->string('zipcode')->nullable();
            $table->string('business_document')->nullable();
            $table->string('personel_documents')->nullable();
            $table->string('password')->nullable();
         
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('advertisers');
    }
};
