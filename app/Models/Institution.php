<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User_institution;
use App\Models\User;

class Institution extends Model
{
    use HasFactory;

    public $timestamps = false;


    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function coordinators_users() {
        return $this->hasMany(User_institution::class);
    }

}
