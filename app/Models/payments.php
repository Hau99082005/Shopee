<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Payments extends Model
{
    use HasFactory;
    protected $table = 'payments';
    protected $fillable = ['order_id', 'amount', 'method', 'status'];

    public function order() {
        return $this->belongsTo(Order::class);
    }
}