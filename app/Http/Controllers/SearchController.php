<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;

class SearchController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
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

    /**
     * Search products by keyword (name or description).
     */
    public function search(Request $request)
    {
        $keyword = $request->input('q');
        if (!$keyword) {
            return response()->json(['error' => 'Missing search keyword'], 400);
        }
        $products = Product::where('name', 'like', "%$keyword%")
            ->orWhere('description', 'like', "%$keyword%")
            ->get();
        return response()->json($products);
    }
}
