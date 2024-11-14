<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Banneradd extends Model
{
    use HasFactory;
    protected $fillable = ['name','com_name','business_type','banner','url','amount','active_date','expire_date','status','view_count'];
}
