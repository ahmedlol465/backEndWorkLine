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
        Schema::create('bank_accounts', function (Blueprint $table) {
            $table->id();
            $table->string('beneficiary_name');
            $table->string('iban');
            $table->string('bic_swift');
            $table->string('address_line1');
            $table->string('address_line2')->nullable(); // Address Line 2 is optional
            $table->string('city');
            $table->string('governorate');
            $table->string('zip_code');
            $table->string('country');
            $table->json('terms'); // Store terms as a JSON array
            $table->unsignedBigInteger('userId');
            $table->timestamps();

            $table->foreign('userId')->references('id')->on('users')->onDelete('cascade');

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('bank_accounts');
    }
};
