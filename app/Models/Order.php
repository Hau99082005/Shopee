<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    //
    use HasFactory;
    public function orderItems() {
        return $this->hasMany(OrderItems::class);
    }
    public function user() {
        return $this->belongsTo(User::class);
    }
}