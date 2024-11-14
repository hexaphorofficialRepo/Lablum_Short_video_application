<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Officialpayment extends Model
{
    use HasFactory;
    protected $fillable = ['user_id','name','email','phone','amount','currency','method','razorpay_payment_id'];
}
