<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Bankcode extends Model
{
    use HasFactory;
    protected $fillable = ['bankName','bankCode'];
}
