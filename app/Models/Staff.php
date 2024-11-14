<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Staff extends Model
{
    use HasFactory;
    protected $table = 'staffs';
    protected $fillable = [
        'name',
        'image',
        'staff_type',
        'email',
        'ph_no',
        'password',
        'address',
        'area',
        'pincode',
        
      
    ];
}
