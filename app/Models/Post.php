<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    use HasFactory;
    protected $fillable = ['user_id','like_count','comment_count','share_count','title','description','video','length','thumbnail','active'];


    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
    public function likes()
    {
        return $this->hasMany(Like::class, 'post_id');
    }
    public function comments()
    {
        return $this->hasMany(Comment::class, 'post_id');
    }
    public function shares()
    {
        return $this->hasMany(Share::class, 'post_id');
    }
    public function views()
    {
        return $this->hasMany(View::class, 'post_id');
    }
    public function saveposts(){
        return $this->hasMany(Savepost::class,'post_id');
    }
    public function postReports()
    {
        return $this->hasMany(Postreport::class);
    }
    public function blockmessage(){
        return $this->hasMany(Blockmessage::class,'post_id');
    }

    public function tags(){
        return $this->hasMany(Posttag::class,'post_id');
    }
}
