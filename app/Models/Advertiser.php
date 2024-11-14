<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Advertiser extends  Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;
    protected $fillable = [
        'name',
        'email',
        'mobile',
        'business_type',
        'business_name',
        'url',
        'area',
        'city',
        'zipcode',
        'state',
        'business_document',
        'personel_documents',
        'password',
        'is_approve',
    ];
    public function addplans()
    {
        return $this->hasMany(Addplan::class, 'advertiser_id');
    }
     public function addcategory(){
        return $this->belongsTo(Addcategory::class,'business_type');
    }
}
