<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Commentreport extends Model
{
    use HasFactory;
    protected $fillable = ['user_id','comment_id','reply_id','type','message'];
}
