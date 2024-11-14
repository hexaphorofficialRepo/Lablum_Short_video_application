<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Blogcategory extends Model
{
    use HasFactory;
    protected $fillable = ['title','slug'];
    public function Blogs(){
       return $this->hasMany(Blog::class,'category_id'); 
    } 
}
