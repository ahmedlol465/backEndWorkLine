<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class bank_account extends Model
{
    /** @use HasFactory<\Database\Factories\BankAccountFactory> */
    use HasFactory;


    protected $fillable = [
        'beneficiary_name',
        'iban',
        'bic_swift',
        'address_line1',
        'address_line2',
        'city',
        'governorate',
        'zip_code',
        'country',
        'terms',
        'userId'
    ];


    protected $casts = [
        'terms' => 'array', // Cast 'terms' column to an array when retrieved
    ];

}
