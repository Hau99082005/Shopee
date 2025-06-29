<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
class ProductDetail extends Model
{
    use HasFactory;
    protected $fillable = [
        'product_id', 'name', 'image', 'price', 'price_old', 'color', 'size', 'material', 'origin', 'warranty', 'description'
    ];
    public function product() {
        return $this->belongsTo(Product::class);
    }
} 