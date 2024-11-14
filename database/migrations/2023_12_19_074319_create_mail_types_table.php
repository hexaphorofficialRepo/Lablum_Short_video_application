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
        if (!Schema::hasTable('mail_types')){
            Schema::create('mail_types', function (Blueprint $table) {
                $table->integer('mail_type_id', true);
                $table->string('name', 100)->default('');
                $table->char('mail_type', 3)->default('');
                $table->tinyInteger('active')->default(0)->comment('1: yes, 0: no');
            });
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('mail_types');
    }
};
