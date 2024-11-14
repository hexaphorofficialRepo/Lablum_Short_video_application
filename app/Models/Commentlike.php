<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Commentlike extends Model
{
    use HasFactory;
    protected $fillable = ['comment_id','like_status','user_id'];
    public function comment(){
        return $this->belongsTo(Comment::class,'comment_id');
    }
}
