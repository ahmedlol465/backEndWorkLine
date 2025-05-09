<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class project extends Model
{
    use HasFactory;


    protected $fillable = [
        'project_name',
        'project_description',
        'project_image',
        'required_skills',
        'section',
        'sub_section',
        'project_link',
        'project_question',
        'user_id',
        'status',
        'duration',
        'budget',
        'budgetTo'
    ];


    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function favourites()
{
    return $this->morphMany(favourite::class, 'favouritable');
}

public function offers()
    {
        return $this->hasMany(offer::class);
    }

}
