<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
 

     protected $fillable = [
        'name',
        'email',
        'password',
        'active',
        'kyc_status',
        'kyc_date',
        'document_id1',
        'document_id2',
        'fcm_token',
        'uuid',
    ];
    protected $primaryKey = 'user_id';
    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'password' => 'hashed',
        'last_active' => 'datetime',
        'kyc_date' => 'date', 
    ];

   
    public function posts(){
        return $this->hasMany(Post::class,'user_id');
    }
    public function notifications()
    {
        return $this->hasMany(Notification::class, 'fcm_token');
    }
    

    public function likes()
    {
        return $this->hasMany(Like::class, 'user_id');
    }
    public function withdrawl()
    {
        return $this->hasMany(Withdrawl::class, 'user_id');
    }
    public function chats()
    {
        return $this->hasMany(Chat::class, 'uuid');
    }
    public function comments()
    {
        return $this->hasMany(Comment::class, 'user_id');
    }
    public function replycomments()
    {
        return $this->hasMany(Replycomment::class, 'user_id');
    }
    public function shares()
    {
        return $this->hasMany(Share::class, 'user_id');
    }
    public function views()
    {
        return $this->hasMany(View::class, 'user_id');
    }
    public function wallet()
    {
        return $this->hasOne(Wallet::class, 'user_id');
    }

    public function followers()
    {
        return $this->hasMany(Follow::class, 'follower_id', 'user_id');
    }

    public function following()
    {
        return $this->hasMany(Follow::class, 'user_id', 'user_id');
    }
    public function savedPosts()
    {
        return $this->hasMany(Savepost::class, 'user_id');
    }

    public function bank(){
        return $this->hasOne(Bank::class,'user_id');
    }
    public function userdata(){
        return $this->hasOne(Userdata::class,'user_id');
    }
    public function verify(){
        return $this->hasOne(Verify::class,'user_id');
    }

    public function livestreams()
    {
        return $this->hasMany(Livestream::class, 'user_id'); // Specify the foreign key column name here
    }

    public function blockmessage(){
        return $this->hasMany(Blockmessage::class,'user_id');
    }

    public function report(){
        return $this->hasMany(Postreport::class,'user_id');
    }

    public function posttag(){
        return $this->hasMany(Posttag::class,'post_id');
    }
}
