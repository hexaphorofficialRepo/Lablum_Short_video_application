<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Addcategory extends Model
{
    use HasFactory;
    protected $fillable = ['title','slug'];
    
    public function addpricing(){
        return $this->hasMany(Addpricing::class,'category');
    }
     public function advertiser(){
        return $this->hasMany(Advertiser::class,'business_type');
    }
}
