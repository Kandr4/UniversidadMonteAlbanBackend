<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Career extends Model
{
    use HasFactory;
    public function subjects(){
        return $this->hasMany(Subject::class);
    }
    public function admissions(){
        return $this->hasMany(Admission::class);
    }
}
