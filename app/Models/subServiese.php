<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class subServiese extends Model
{
    /** @use HasFactory<\Database\Factories\SubServieseFactory> */
    use HasFactory;

    protected $fillable = [
        'service_name',
        'price',
        'delivery_duration',
        'service_id',
    ];
}
