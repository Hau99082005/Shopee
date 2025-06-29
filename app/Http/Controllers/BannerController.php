<?php
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Banner;
use Illuminate\Support\Facades\Storage;

class BannerController extends Controller
{
    // Lấy danh sách banner
    public function index()
    {
        $bannerList = Banner::all();
        return view('welcome', compact('bannerList'));

    }
    // Thêm banner mới (có upload ảnh)
    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required|string',
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,webp',
            'link' => 'nullable|string',
        ]);
        $imagePath = $request->file('image')->store('public/banners');
        $imageName = basename($imagePath);
        $banner = Banner::create([
            'title' => $request->title,
            'image' => $imageName,
            'link' => $request->link,
        ]);
        return response()->json($banner, 201);
    }

    // Xem chi tiết banner
    public function show($id)
    {
        $banner = Banner::findOrFail($id);
        return response()->json($banner);
    }

    // Sửa banner (có thể sửa ảnh)
    public function update(Request $request, $id)
    {
        $banner = Banner::findOrFail($id);
        $request->validate([
            'title' => 'sometimes|required|string',
            'image' => 'sometimes|image|mimes:jpeg,png,jpg,gif,webp',
            'link' => 'nullable|string',
        ]);
        if ($request->hasFile('image')) {
            // Xoá ảnh cũ
            Storage::delete('public/banners/' . $banner->image);
            $imagePath = $request->file('image')->store('public/banners');
            $banner->image = basename($imagePath);
        }
        if ($request->has('title')) $banner->title = $request->title;
        if ($request->has('link')) $banner->link = $request->link;
        $banner->save();
        return response()->json($banner);
    }

    // Xoá banner
    public function destroy($id)
    {
        $banner = Banner::findOrFail($id);
        Storage::delete('public/banners/' . $banner->image);
        $banner->delete();
        return response()->json(['message' => 'Deleted']);
    }
} 