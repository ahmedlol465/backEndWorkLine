<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class notification extends Model
{
    /** @use HasFactory<\Database\Factories\NotificationFactory> */
    use HasFactory;

    protected $fillable = [
        'title',
        'description',
        'type',
        'user_id_receiver',
        'user_id_sender',
    ];


    public function receiver(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id_receiver');
    }

    /**
     * Get the sender user that owns the notification.
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function sender(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id_sender');
    }
}
