<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Blockuser extends Model
{
    use HasFactory;
    protected $fillable = ['user_id','block_uuid','block_id','blocked_at'];
}
