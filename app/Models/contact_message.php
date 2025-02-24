<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class contact_message extends Model
{
    /** @use HasFactory<\Database\Factories\ContactMessageFactory> */
    use HasFactory;

    protected $fillable = [
        'freelancer_id',
        'client_id',
        'client_name',
        'client_email',
        'freelancer_name',
        'private_message',
        'project_title',
        'description',
        'photo_paths',
        'required_skills',
        'section',
        'subsection',
        'expected_budget',
        'expected_duration',
    ];

    protected $casts = [
        'photo_paths' => 'array', // Automatically casts to array when retrieved and JSON when stored
    ];

    public function freelancer()
    {
        return $this->belongsTo(User::class, 'id');
    }

    public function client()
    {
        return $this->belongsTo(User::class, 'id');
    }
}
