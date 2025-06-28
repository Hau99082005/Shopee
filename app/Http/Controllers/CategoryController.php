<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\Product;

class CategoryController extends Controller
{
    /**
     * Hiển thị trang chủ với danh mục và sản phẩm.
     */
    public function index()
    {
        $categoryList = Category::orderBy('id')->get();
        $productList = Product::orderBy('id')->get();

        return view('welcome', compact('categoryList', 'productList'));
    }
}
