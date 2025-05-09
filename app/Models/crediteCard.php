<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class crediteCard extends Model
{
    /** @use HasFactory<\Database\Factories\CrediteCardFactory> */
    use HasFactory;

    protected $fillable = [
        'card_holder',
        'card_number',
        'expiry_date',
        'save_for_next_order',
        'userId'

    ];

    protected $casts = [
        'save_for_next_order' => 'boolean', // Cast to boolean for type safety
    ];
}
