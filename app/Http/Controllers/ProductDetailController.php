<?php

namespace App\Http\Controllers;

use App\Models\ProductDetail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ProductDetailController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $details = ProductDetail::all();
        return response()->json($details);
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
        $validated = $request->validate([
            'product_id' => 'required|exists:products,id',
            'name' => 'required|string',
            'image' => 'nullable|string',
            'price' => 'required|numeric',
            'price_old' => 'nullable|numeric',
            'color' => 'nullable|string',
            'size' => 'nullable|string',
            'material' => 'nullable|string',
            'origin' => 'nullable|string',
            'warranty' => 'nullable|string',
            'description' => 'nullable|string',
        ]);
        $detail = ProductDetail::create($validated);
        return response()->json($detail, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $product = \App\Models\Product::with(['detail', 'category'])->findOrFail($id);
        $product_images = \App\Models\product_images::where('product_id', $id)->get();
        $categories = DB::table('categories')->get();
        return view('product_detail', compact('product', 'product_images', 'categories'));
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
        $detail = ProductDetail::findOrFail($id);
        $validated = $request->validate([
            'name' => 'sometimes|string',
            'image' => 'sometimes|string',
            'price' => 'sometimes|numeric',
            'price_old' => 'sometimes|numeric',
            'color' => 'sometimes|string',
            'size' => 'sometimes|string',
            'material' => 'sometimes|string',
            'origin' => 'sometimes|string',
            'warranty' => 'sometimes|string',
            'description' => 'sometimes|string',
        ]);
        $detail->update($validated);
        return response()->json($detail);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $detail = ProductDetail::findOrFail($id);
        $detail->delete();
        return response()->json(['message' => 'Deleted'], 204);
    }
}