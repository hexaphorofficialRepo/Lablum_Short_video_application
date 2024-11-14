<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Payment extends Model
{
    use HasFactory;
    protected $fillable = ['r_payment_id','invoice_number','method','currency','user_email','advertisment_coast','amount','gst_amount','additional_tax_amounts','json_response','prefill_name','prefill_email','prefill_mobile','advertiser_id','addplan_id','user_id','invoice_sent'];

    public function addplan(){
        return $this->belongsTo(Addplan::class,'addplan_id');
    }

    public function advertiser(){
        return $this->belongsTo(Advertiser::class,'advertiser_id');
    }
}
