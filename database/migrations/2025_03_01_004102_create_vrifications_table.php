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
        Schema::create('vrifications', function (Blueprint $table) {
            $table->id();
            $table->string('front_id_image_path')->nullable(); // Path to front ID image
            $table->string('back_id_image_path')->nullable();  // Path to back ID image
            $table->string('selfie_with_id_image_path')->nullable(); // Path to selfie image
            $table->enum('verification_status', ['pending', 'processing', 'verified', 'rejected'])->default('pending'); // Verification status
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
        Schema::dropIfExists('vrifications');
    }
};
