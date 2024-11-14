<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Bank extends Model
{
    use HasFactory;
    protected $fillable = ['user_id','account_name','ifsc_code','bank_name','account_no','bank_status','beneficiaryId'];

    public function user(){
        return $this->belongsTo(User::class,'user_id');
    }
}
