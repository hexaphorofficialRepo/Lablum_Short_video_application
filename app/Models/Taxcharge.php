<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Taxcharge extends Model
{
    use HasFactory;
    protected $fillable = ['tax_id','payment_type','payment_for','tax_percentage'];
    public function tax(){
        return $this->belongsTo(Tax::class,'tax_id');
    }
}
