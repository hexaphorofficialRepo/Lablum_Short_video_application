<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Addvideo extends Model
{
    use HasFactory;
    protected $fillable = ['adevrtiser_id','addplan_id','fb_link','insta_link','web_link','status','video','video_type','length'];
    public function addplan(){
        return $this->belongsTo(Addplan::class,'addplan_id');
    }
    public function advertiser(){
        return $this->belongsTo(Advertiser::class,'adevrtiser_id');
    }


    public function likes()
    {
        return $this->hasMany(Like::class, 'add_id');
    }
    
    public function views()
    {
        return $this->hasMany(View::class, 'add_id');
    }
}
