<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Chat extends Model
{
    use HasFactory;
    protected $fillable = ['uuid','chat_id'];
    public function user()
    {
        return $this->belongsTo(User::class, 'uuid', 'user_id');
    }


     // Remove timestamps from serialization
   
    
     // Define fields to be hidden from serialization
     protected $hidden = ['created_at', 'updated_at', 'id'];
}
