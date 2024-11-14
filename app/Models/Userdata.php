<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Userdata extends Model
{
    use HasFactory;
    protected $fillable = ['user_id','document_id1','document_id2','father_name','name','address','dob','gender'];
    public function user(){
        return $this->belongsTo(User::class,'user_id');
    }
}
