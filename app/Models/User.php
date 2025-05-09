<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
// use Illuminate\Database\Eloquent\Factories\HasFactory;
// use Illuminate\Foundation\Auth\User as Authenticatable;
// use Illuminate\Notifications\Notifiable;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\Hash;
use Tymon\JWTAuth\Contracts\JWTSubject;

use Illuminate\Database\Eloquent\Relations\HasMany; // ✅ Correct import


use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable implements JWTSubject
{
    use HasFactory, Notifiable;

    protected $table = 'users';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'firstName',
        'lastName',
        'email',
        'password',
        'role',
        "userName",
        "accountType",

        'isEmailVerified',
        'profilePhoto',
        'Region',
        'Phone_number',
        'Gender',

        'rate'

    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
    ];

    public function getJWTIdentifier()
    {
        // This method returns the primary key of the user, typically the 'id' field
        return $this->getKey();
    }


    public function getJWTCustomClaims()
    {
        // Here you can return any custom claims for the JWT, such as roles or permissions
        return [];
    }

    public function userWorks(){
        return $this->hasOne(userWork::class, 'userId');
    }


    public function userData(){
        return $this->hasOne(userData::class, "userId");
    }
    public function userStatistics(){
        return $this->hasOne(user_statistic::class, "user_id");
    }

    public function userProjects(){
        return $this->hasOne(project::class, "user_id");
    }
    public function userServices(){
        return $this->hasOne(service::class, "user_id");
    }


    public function favourites()
    {
        return $this->morphMany(favourite::class, 'favouritable');
    }

}
