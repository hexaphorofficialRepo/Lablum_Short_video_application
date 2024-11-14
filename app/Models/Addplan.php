<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Addplan extends Model
{
    use HasFactory;
    protected $fillable = [
        'advertiser_id',
        'add_count',
        'days_count',
        'target_audiance',
        'target_age_min',
        'target_age_max',
        'location',
        'city',
        'state',
        'zipcode',
        'payment_amount',
        'add_status',
        'avtivation_date',
        'expire_date',



    ];

    public function advertiser(){
        return $this->belongsTo(Advertiser::class,'advertiser_id');
    }

    public function payments(){
        return $this->hasMany(Payment::class,'addplan_id');
    }
}
