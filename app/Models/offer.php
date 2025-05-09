<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class offer extends Model
{
    /** @use HasFactory<\Database\Factories\OfferFactory> */
    use HasFactory;


    protected $fillable = [
        'project_id',
        'freelancer_id',
        'offer_text',
        'num_replies',
        'is_flagged',
        'status',
    ];

    protected $casts = [
        'is_flagged' => 'boolean',
    ];

    public function project(): BelongsTo
    {
        return $this->belongsTo(Project::class);
    }

    public function freelancer(): BelongsTo // The user who made the offer
    {
        return $this->belongsTo(User::class, 'id');
    }

}
