<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\Category;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        $productList = Product::all();
        return view('welcome', compact('productList'));
       
    }

    /**
     * Display products page with search and filtering
     */
    public function products(Request $request)
    {
        $query = Product::with(['category']);

        // Search functionality
        if ($request->has('search') && $request->search) {
            $query->where('name', 'like', '%' . $request->search . '%')
                  ->orWhere('description', 'like', '%' . $request->search . '%');
        }

        // Category filter (now accepts multiple categories)
        if ($request->has('categories') && is_array($request->categories)) {
            $query->whereIn('category_id', $request->categories);
        }
        
        // Rating filter (example, needs a 'rating' column in products table)
        if ($request->has('rating') && $request->rating) {
            // This is a placeholder. You would need a 'rating' column on your products table.
            // $query->where('rating', '>=', $request->rating);
        }

        // Price filter
        if ($request->has('min_price') && $request->min_price) {
            $query->where('price', '>=', $request->min_price);
        }
        if ($request->has('max_price') && $request->max_price) {
            $query->where('price', '<=', $request->max_price);
        }

        // Sort by
        $sortBy = $request->get('sort', 'created_at');
        $sortOrder = $request->get('order', 'desc');
        
        // Handle 'sales' sort
        if ($sortBy == 'sales') {
            // This is a placeholder. You would need a 'sales_count' column.
            // For now, we sort randomly to simulate it.
            $query->inRandomOrder();
        } else {
            $query->orderBy($sortBy, $sortOrder);
        }

        $products = $query->paginate(20)->withQueryString();
        $categories = Category::all();

        return view('products', compact('products', 'categories'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }

    // API Methods
    public function apiIndex()
    {
        $products = Product::with(['category', 'detail'])->paginate(10);
        return response()->json([
            'success' => true,
            'data' => $products
        ]);
    }

    public function apiShow($id)
    {
        $product = Product::with(['category', 'detail'])->find($id);
        if (!$product) {
            return response()->json([
                'success' => false,
                'message' => 'Sản phẩm không tồn tại'
            ], 404);
        }
        return response()->json([
            'success' => true,
            'data' => $product
        ]);
    }

    public function apiStore(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'image' => 'required|string',
            'description' => 'nullable|string',
            'price' => 'required|numeric|min:0',
            'price_old' => 'nullable|numeric|min:0',
            'stock' => 'required|integer|min:0',
            'seller_id' => 'required|exists:users,id',
            'category_id' => 'required|exists:categories,id',
        ]);

        $product = Product::create($request->all());
        return response()->json([
            'success' => true,
            'message' => 'Sản phẩm đã được tạo thành công',
            'data' => $product
        ], 201);
    }

    public function apiUpdate(Request $request, $id)
    {
        $product = Product::find($id);
        if (!$product) {
            return response()->json([
                'success' => false,
                'message' => 'Sản phẩm không tồn tại'
            ], 404);
        }

        $request->validate([
            'name' => 'sometimes|required|string|max:255',
            'image' => 'sometimes|required|string',
            'description' => 'nullable|string',
            'price' => 'sometimes|required|numeric|min:0',
            'price_old' => 'nullable|numeric|min:0',
            'stock' => 'sometimes|required|integer|min:0',
            'category_id' => 'sometimes|required|exists:categories,id',
        ]);

        $product->update($request->all());
        return response()->json([
            'success' => true,
            'message' => 'Sản phẩm đã được cập nhật thành công',
            'data' => $product
        ]);
    }

    public function apiDestroy($id)
    {
        $product = Product::find($id);
        if (!$product) {
            return response()->json([
                'success' => false,
                'message' => 'Sản phẩm không tồn tại'
            ], 404);
        }

        $product->delete();
        return response()->json([
            'success' => true,
            'message' => 'Sản phẩm đã được xóa thành công'
        ]);
    }

    public function apiSearch($keyword)
    {
        $products = Product::with(['category', 'detail'])
            ->where('name', 'like', "%{$keyword}%")
            ->orWhere('description', 'like', "%{$keyword}%")
            ->paginate(10);

        return response()->json([
            'success' => true,
            'data' => $products
        ]);
    }

    public function apiGetByCategory($categoryId)
    {
        $products = Product::with(['category', 'detail'])
            ->where('category_id', $categoryId)
            ->paginate(10);

        return response()->json([
            'success' => true,
            'data' => $products
        ]);
    }
}