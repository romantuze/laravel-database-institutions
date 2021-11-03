<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\File;
use App\Models\User;
use App\Models\Remark;
use App\Models\Institution;
use App\Models\Kosgu_contract;
use App\Models\User_contract;
use App\FIlters\QueryFilter;


class Contract extends Model
{
    use HasFactory;
    

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function institution()
    {
        return $this->belongsTo(Institution::class);
    }

    public function files()
    {
        return $this->hasMany(File::class);
    }

    public function remarks()
    {
        return $this->hasMany(Remark::class);
    }

    public function kosgus() {
        return $this->hasMany(Kosgu_contract::class);
    }

    public function user_contracts() {
        return $this->hasMany(User_contract::class);
    }

    public function scopeFilter(Builder $builder, QueryFilter $filter) {
        return $filter->apply($builder);
    }

}
