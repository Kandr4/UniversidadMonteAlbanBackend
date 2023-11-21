<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\Hash;

use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasFactory, Notifiable, HasApiTokens;

    /**
     * The attributes that are mass assignable..
     *
     * @var array
     */
    protected $fillable = [
        'username',
        'password',
        'role',   
        'verified',
        'cookie',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */

    public function setPasswordAttribute($password)
    {
        $this->attributes['password'] = Hash::make($password);
    }


    public function coments()
    {
        return $this->hasMany(Coment::class);
    }
    public function posts()
    {
        return $this->hasMany(Post::class);
    }
    public function testimonials()
    {
        return $this->hasMany(Testimonial::class);
    }
    public function database_logs()
    {
        return $this->hasMany(DatabaseLog::class);
    }
}