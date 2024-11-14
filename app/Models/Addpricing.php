<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Addpricing extends Model
{
    use HasFactory;
    protected $fillable = ['video_count','days_count','category','price'];

    public function addcategory(){
        return $this->belongsTo(Addcategory::class,'category');
    }

}
