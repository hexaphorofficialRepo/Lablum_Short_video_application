<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Follow extends Model
{
    use HasFactory;
    protected $fillable = ['user_id','follower_id','status'];

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function followers()
    {
        return $this->hasMany(User::class, 'user_id', 'follower_id');
    }

    // Relationship to get users followed by a user
    public function following()
    {
        return $this->hasMany(User::class, 'user_id', 'user_id');
    }
}
