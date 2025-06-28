<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    //
    use HasFactory;
    
    protected $fillable = [
        'name',
        'image',
        'description',
        'price',
        'stock',
        'seller_id',
        'category_id'
    ];
    
    protected $casts = [
        'price' => 'decimal:2',
        'stock' => 'integer',
        'seller_id' => 'integer',
        'category_id' => 'integer'
    ];
    
    public function category() {
        return $this->belongsTo(Category::class);
    }
    public function orderItems() {
        return $this->hasMany(OrderItems::class);
    }
    
    public function carts() {
        return $this->hasMany(carts::class);
    }
    
    // Kiểm tra xem sản phẩm còn hàng không
    public function isInStock($quantity = 1) {
        return $this->stock >= $quantity;
    }
    
    // Lấy giá đã format
    public function getFormattedPriceAttribute() {
        return number_format($this->price, 0, ',', '.') . ' VNĐ';
    }
    
    // Tính tổng tiền cho số lượng
    public function getTotalPrice($quantity) {
        return round($this->price * $quantity, 2);
    }
}