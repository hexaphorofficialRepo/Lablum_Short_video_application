<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Withdrawl extends Model
{
    use HasFactory;
    protected $fillable = ['order_id','user_id','wallet_id','transfer_amount','previous_wallet_amount','new_wallet_amount','type','tax_details','previous_net_amount','new_net_amount'];
    public function user(){
        return $this->belongsTo(User::class,'user_id');
    }
    public function wallet(){
        return $this->belongsTo(Wallet::class,'wallet_id');
    }
}
