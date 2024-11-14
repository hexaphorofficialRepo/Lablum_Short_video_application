<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Wallet extends Model
{
    use HasFactory;
    protected $fillable = ['user_id','points','withdrawal_count','last_withdrawal_date','next_withdrawal_date','withdraw_status','tax_status','	net_amount','gst_amount','	additional_tax_amount','additional_tax_details'];
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
    public function withdrawl(){
        return $this->hasMany(Withdrawl::class,'wallet_id');
    }
}
