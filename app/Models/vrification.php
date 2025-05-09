<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class vrification extends Model
{
    /** @use HasFactory<\Database\Factories\VrificationFactory> */
    use HasFactory;



    protected $fillable = [
        'front_id_image_path',
        'back_id_image_path',
        'selfie_with_id_image_path',
        'verification_status',
        'userId'

    ];
}
