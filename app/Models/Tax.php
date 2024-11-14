<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tax extends Model
{
    use HasFactory;
    protected $fillable = ['tax_type'];
    public function taxcharges(){
        return $this->hasMany(Taxcharge::class,'tax_id');
    }

}
