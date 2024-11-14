<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Gst extends Model
{
    use HasFactory;
    protected $fillable = ['payment_type','payment_for','tax_percentage'];
    
}
