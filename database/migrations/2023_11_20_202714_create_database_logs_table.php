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
        Schema::create('Database_Logs', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('idUser');
            $table->string('operation');
            $table->date('date');
            $table->timestamps();
            $table->foreign('idUser')->references('id')->on('users')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('Database_Logs');
    }
};
