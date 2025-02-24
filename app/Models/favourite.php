<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class favourite extends Model
{
    /** @use HasFactory<\Database\Factories\FavouriteFactory> */
    use HasFactory;


    protected $fillable = [
        'user_id',
        'favourite_id', // Added favourite_id to fillable attributes
        'type', // Assuming 'type' is a fillable attribute
    ];


    public function user()
    {
        return $this->belongsTo(User::class, "user_id");
    }

}
