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

    // API Methods
    public function apiIndex()
    {
        $categories = Category::with('Products')->get();
        return response()->json([
            'success' => true,
            'data' => $categories
        ]);
    }

    public function apiShow($id)
    {
        $category = Category::with('Products')->find($id);
        if (!$category) {
            return response()->json([
                'success' => false,
                'message' => 'Danh mục không tồn tại'
            ], 404);
        }
        return response()->json([
            'success' => true,
            'data' => $category
        ]);
    }

    public function apiStore(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'desc' => 'nullable|string',
            'image' => 'required|string',
            'parent_id' => 'nullable|exists:categories,id',
        ]);

        $category = Category::create($request->all());
        return response()->json([
            'success' => true,
            'message' => 'Danh mục đã được tạo thành công',
            'data' => $category
        ], 201);
    }

    public function apiUpdate(Request $request, $id)
    {
        $category = Category::find($id);
        if (!$category) {
            return response()->json([
                'success' => false,
                'message' => 'Danh mục không tồn tại'
            ], 404);
        }

        $request->validate([
            'name' => 'sometimes|required|string|max:255',
            'desc' => 'nullable|string',
            'image' => 'sometimes|required|string',
            'parent_id' => 'nullable|exists:categories,id',
        ]);

        $category->update($request->all());
        return response()->json([
            'success' => true,
            'message' => 'Danh mục đã được cập nhật thành công',
            'data' => $category
        ]);
    }

    public function apiDestroy($id)
    {
        $category = Category::find($id);
        if (!$category) {
            return response()->json([
                'success' => false,
                'message' => 'Danh mục không tồn tại'
            ], 404);
        }

        $category->delete();
        return response()->json([
            'success' => true,
            'message' => 'Danh mục đã được xóa thành công'
        ]);
    }

    public function apiGetProducts($id)
    {
        $category = Category::with('Products.detail')->find($id);
        if (!$category) {
            return response()->json([
                'success' => false,
                'message' => 'Danh mục không tồn tại'
            ], 404);
        }

        return response()->json([
            'success' => true,
            'data' => $category->Products
        ]);
    }
}
