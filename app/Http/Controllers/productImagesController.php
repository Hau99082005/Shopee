<?php

namespace App\Http\Controllers;

use App\Models\product_images;
use Illuminate\Http\Request;

class productImagesController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $product_images = product_images::all();
        return response()->json($product_images);
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
            'image_url' => 'required|string',
        ]);
        $image = product_images::create($validated);
        return response()->json($image, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $image = product_images::findOrFail($id);
        return response()->json($image);
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
        $image = product_images::findOrFail($id);
        $validated = $request->validate([
            'image_url' => 'sometimes|string',
        ]);
        $image->update($validated);
        return response()->json($image);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $image = product_images::findOrFail($id);
        $image->delete();
        return response()->json(['message' => 'Deleted'], 204);
    }
}