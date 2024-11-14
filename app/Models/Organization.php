<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Organization extends Model
{
    use HasFactory;
    protected $table = 'organizations';
    protected $fillable = [
        'name',
        'organization_type',
        'email',
        'url',
        'ph_no',
        'contact',
        'password',
        'address',
        'area',
        'pincode',
        'state',
        'approve',
        'image',
        
      
    ];
}
