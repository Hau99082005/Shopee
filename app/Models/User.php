<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    use HasFactory;
    protected $table = 'users';
    protected $fillable = ['name', 'email', 'password', 'phone', 'address', 'role'];

    public function orders() {
        return $this->hasMany(Order::class);
    }
    public function carts() {
        return $this->hasMany(carts::class);
    }
    public function reviews() {
        return $this->hasMany(Reviews::class);
    }
}