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
        Schema::create('favourites', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id');
            $table->unsignedBigInteger('favourite_id');
            $table->string("type");
            $table->morphs('favouritable'); // morphs ينشئ automatically `favouritable_id` و `favouritable_type`

            $table->timestamps();

            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            // $table->foreign('favourite_id')->references('id')->on('project')->onDelete('cascade');
            // $table->foreign('favourite_id')->references('id')->on('users')->onDelete('cascade');
            // $table->foreign('favourite_id')->references('id')->on('services')->onDelete('cascade');
            // $table->foreign('favourite_id')->references('id')->on('userwork')->onDelete('cascade');

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('favourites');
    }
};
