<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Verify extends Model
{
    use HasFactory;
    protected $fillable = ['user_id','name','category','country','known','audiance','link_type1','link_url1','link_type2','link_url2','link_type3','link_url3','document_type','document_pdf','status'];

    public function user(){
        return $this->belongsTo(User::class,'user_id');
    }
}
