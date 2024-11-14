<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Blog extends Model
{
    use HasFactory;
    protected $fillable = ['title','slug','thumbnail','category_id','tag','meta_description','description','image1','image2'];
public function category(){
    return $this->belongsTo(Blogcategory::class,'category_id');
}

}
