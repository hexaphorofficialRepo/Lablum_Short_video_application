<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Notification extends Model
{
    use HasFactory;
    protected $fillable = ['user_id','fcm_token','user_dp','notification','title','thumbnail','path_url'];
     
    public function user(){
        return $this->belongsTo(User::class,'fcm_token');
    }
}
