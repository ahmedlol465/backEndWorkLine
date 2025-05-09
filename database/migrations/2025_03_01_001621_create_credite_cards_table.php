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
        Schema::create('credite_cards', function (Blueprint $table) {
            $table->id();
            $table->string('card_holder');
            $table->string('card_number'); // Consider encrypting or hashing card numbers in production
            $table->string('expiry_date');
            $table->boolean('save_for_next_order')->default(false);
            $table->unsignedBigInteger('userId'); // Store email address, make it unique

            $table->timestamps();

            $table->foreign('userId')->references('id')->on('users')->onDelete('cascade');

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('credite_cards');
    }
};
