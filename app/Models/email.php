<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class email extends Model
{
    /** @use HasFactory<\Database\Factories\EmailFactory> */
    use HasFactory;


    protected $fillable = [
        'address',
        'userId'

    ];
}
