<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Category;
use App\Models\User;

class AdminProductController extends Controller
{
    // Hiển thị danh sách sản phẩm
    public function index()
    {
        $products = Product::all();
        return view('admin.products', compact('products'));
    }

    // Thêm sản phẩm mới
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,webp',
            'description' => 'nullable|string',
            'price' => 'required|numeric',
            'price_old' => 'nullable|numeric',
            'stock' => 'required|integer',
            'seller_id' => 'nullable|integer',
            'category_id' => 'nullable|integer',
        ]);
        $data = $request->only('name', 'description', 'price', 'price_old', 'stock', 'seller_id', 'category_id');
        $data['price_old'] = isset($data['price_old']) && is_numeric(str_replace([',','.'], '', $data['price_old'])) ? floatval(str_replace([','], '', $data['price_old'])) : 0;
        $data['price'] = isset($data['price']) ? floatval(str_replace([','], '', $data['price'])) : 0;
        $data['stock'] = isset($data['stock']) ? intval($data['stock']) : 0.0;
        if ($request->hasFile('image')) {
            $file = $request->file('image');
            $filename = time().'_'.$file->getClientOriginalName();
            $file->move(public_path('assets/images'), $filename);
            $data['image'] = $filename;
        }
        Product::create($data);
        return redirect()->route('admin.products')->with('success', 'Thêm sản phẩm thành công!');
    }

    // Sửa sản phẩm
    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,webp',
            'description' => 'nullable|string',
            'price' => 'required|numeric',
            'price_old' => 'nullable|numeric',
            'stock' => 'required|integer',
            'seller_id' => 'nullable|integer',
            'category_id' => 'nullable|integer',
        ]);
        $product = Product::findOrFail($id);
        $data = $request->only('name', 'description', 'price', 'price_old', 'stock', 'seller_id', 'category_id');
        $data['price_old'] = isset($data['price_old']) && is_numeric(str_replace([',','.'], '', $data['price_old'])) ? floatval(str_replace([','], '', $data['price_old'])) : 0;
        $data['price'] = isset($data['price']) ? floatval(str_replace([','], '', $data['price'])) : 0;
        $data['stock'] = isset($data['stock']) ? intval($data['stock']) : 0;
        if ($request->hasFile('image')) {
            $file = $request->file('image');
            $filename = time().'_'.$file->getClientOriginalName();
            $file->move(public_path('assets/images'), $filename);
            $data['image'] = $filename;
        }
        $product->update($data);
        return redirect()->route('admin.products')->with('success', 'Cập nhật sản phẩm thành công!');
    }

    // Xóa sản phẩm
    public function destroy($id)
    {
        $product = Product::findOrFail($id);
        $product->delete();
        return redirect()->route('admin.products')->with('success', 'Xóa sản phẩm thành công!');
    }

    // Hiển thị form thêm sản phẩm
    public function create()
    {
        $categories = Category::all();
        $sellers = User::where('role', 'seller')->get();
        return view('admin.products_create', compact('categories', 'sellers'));
    }

    // Hiển thị form sửa sản phẩm
    public function edit($id)
    {
        $product = Product::findOrFail($id);
        $categories = Category::all();
        $sellers = User::where('role', 'seller')->get();
        return view('admin.products_edit', compact('product', 'categories', 'sellers'));
    }
} 