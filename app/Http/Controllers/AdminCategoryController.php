<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category;

class AdminCategoryController extends Controller
{
    public function index() {
        $categories = Category::orderByDesc('created_at')->get();
        return view('admin.categories.index', compact('categories'));
    }
    public function create() {
        $parents = Category::all();
        return view('admin.categories.create', compact('parents'));
    }
    public function store(Request $request) {
        $request->validate([
            'name' => 'required',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,webp',
            'desc' => 'nullable|string',
            'parent_id' => 'nullable|integer|exists:categories,id',
        ]);
        $data = $request->only('name', 'desc', 'parent_id');
        if ($request->hasFile('image')) {
            $file = $request->file('image');
            $filename = time().'_'.$file->getClientOriginalName();
            $file->move(public_path('assets/images'), $filename);
            $data['image'] = $filename;
        }
        Category::create($data);
        return redirect()->route('admin-categories.index')->with('success', 'Thêm danh mục thành công!');
    }
    public function edit($id) {
        $category = Category::findOrFail($id);
        $parents = Category::where('id', '!=', $id)->get();
        return view('admin.categories.edit', compact('category', 'parents'));
    }
    public function update(Request $request, $id) {
        $request->validate([
            'name' => 'required',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,webp',
            'desc' => 'nullable|string',
            'parent_id' => 'nullable|integer|exists:categories,id',
        ]);
        $category = Category::findOrFail($id);
        $data = $request->only('name', 'desc', 'parent_id');
        if ($request->hasFile('image')) {
            $file = $request->file('image');
            $filename = time().'_'.$file->getClientOriginalName();
            $file->move(public_path('assets/images'), $filename);
            $data['image'] = $filename;
        }
        $category->update($data);
        return redirect()->route('admin-categories.index')->with('success', 'Cập nhật danh mục thành công!');
    }
    public function destroy($id) {
        $category = Category::findOrFail($id);
        $category->delete();
        return redirect()->route('admin-categories.index')->with('success', 'Xoá danh mục thành công!');
    }
} 