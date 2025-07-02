<?php

namespace App\Http\Controllers;

use App\Models\carts;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class CartsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $categories = DB::table('categories')->get();
        $productList = DB::table('products')->get();
        $userId = auth()->check() ? auth()->id() : 1;
        $cartList = \App\Models\carts::with('product')->where('user_id', $userId)->get();
        return view('cart', compact('categories', 'productList', 'cartList'));
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
     * Add product to cart via AJAX
     */
    public function addToCart(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'product_id' => 'required|exists:products,id',
                'quantity' => 'required|integer|min:1'
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Dữ liệu không hợp lệ',
                    'errors' => $validator->errors()
                ], 422);
            }

            $userId = $request->user()->id ?? 1;
            $productId = $request->product_id;
            $quantity = $request->quantity;

            // Kiểm tra stock
            $product = Product::find($productId);
            if ($product->stock < $quantity) {
                return response()->json([
                    'success' => false,
                    'message' => 'Số lượng sản phẩm không đủ trong kho'
                ], 400);
            }

            // Kiểm tra sản phẩm đã có trong giỏ hàng chưa
            $existingCart = carts::where('user_id', $userId)
                ->where('product_id', $productId)
                ->first();

            if ($existingCart) {
                $newQuantity = $existingCart->quantity + $quantity;
                if ($product->stock < $newQuantity) {
                    return response()->json([
                        'success' => false,
                        'message' => 'Tổng số lượng vượt quá stock hiện có'
                    ], 400);
                }
                $existingCart->quantity = $newQuantity;
                $existingCart->save();
            } else {
                carts::create([
                    'user_id' => $userId,
                    'product_id' => $productId,
                    'quantity' => $quantity,
                ]);
            }

            return response()->json([
                'success' => true,
                'message' => 'Sản phẩm đã được thêm vào giỏ hàng'
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Có lỗi xảy ra khi thêm vào giỏ hàng',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // API: Lấy giỏ hàng của user với thông tin chi tiết
    public function apiIndex(Request $request) {
        try {
            $userId = $request->user()->id ?? 1;
            
            // Lấy cart items với thông tin sản phẩm
            $cartItems = carts::where('user_id', $userId)
                ->with('product')
                ->get()
                ->groupBy('product_id')
                ->map(function ($items) {
                    $totalQuantity = $items->sum('quantity');
                    $firstItem = $items->first();
                    $product = $firstItem->product;
                    
                    if (!$product) {
                        return null; // Bỏ qua nếu sản phẩm không tồn tại
                    }
                    
                    $totalPrice = $product->getTotalPrice($totalQuantity);
                    
                    return [
                        'id' => $firstItem->id,
                        'user_id' => $firstItem->user_id,
                        'product_id' => $firstItem->product_id,
                        'quantity' => $totalQuantity,
                        'product' => [
                            'id' => $product->id,
                            'name' => $product->name,
                            'image' => $product->image,
                            'description' => $product->description,
                            'price' => (float) $product->price,
                            'formatted_price' => $product->formatted_price,
                            'stock' => $product->stock,
                            'seller_id' => $product->seller_id,
                            'category_id' => $product->category_id,
                            'created_at' => $product->created_at,
                            'updated_at' => $product->updated_at
                        ],
                        'total_price' => $totalPrice,
                        'formatted_total_price' => $totalPrice . ' VNĐ',
                        'is_available' => $product->isInStock($totalQuantity),
                        'created_at' => $firstItem->created_at,
                        'updated_at' => $firstItem->updated_at
                    ];
                })
                ->filter() // Loại bỏ null values
                ->values();
            
            // Tính tổng tiền giỏ hàng
            $totalAmount = $cartItems->sum('total_price');
            $totalItems = $cartItems->count();
            $totalQuantity = $cartItems->sum('quantity');
            
            return response()->json([
                'success' => true,
                'data' => [
                    'items' => $cartItems,
                    'summary' => [
                        'total_items' => $totalItems,
                        'total_amount' => $totalAmount,
                        'formatted_total_amount' => $totalAmount. ' VNĐ',
                        'total_quantity' => $totalQuantity,
                        'has_unavailable_items' => $cartItems->where('is_available', false)->count() > 0
                    ]
                ]
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Có lỗi xảy ra khi lấy giỏ hàng',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // API: Thêm hoặc thay thế sản phẩm trong giỏ hàng (tự động)
    public function apiAddOrReplace(Request $request) {
        try {
            $validator = Validator::make($request->all(), [
                'product_id' => 'required|exists:products,id',
                'quantity' => 'required|integer|min:1',
                'action' => 'sometimes|in:add,replace,smart' // add: thêm vào, replace: thay thế, smart: tự động quyết định
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Dữ liệu không hợp lệ',
                    'errors' => $validator->errors()
                ], 422);
            }

            $userId = $request->user()->id ?? 1;
            $productId = $request->product_id;
            $quantity = $request->quantity;
            $action = $request->input('action', 'smart'); // Mặc định là smart

            // Kiểm tra sản phẩm
            $product = Product::find($productId);
            if (!$product) {
                return response()->json([
                    'success' => false,
                    'message' => 'Sản phẩm không tồn tại'
                ], 404);
            }

            // Kiểm tra stock
            if (!$product->isInStock($quantity)) {
                return response()->json([
                    'success' => false,
                    'message' => 'Số lượng sản phẩm không đủ trong kho (Còn lại: ' . $product->stock . ')'
                ], 400);
            }

            // Kiểm tra sản phẩm đã có trong giỏ hàng chưa
            $existingCart = carts::where('user_id', $userId)
                ->where('product_id', $productId)
                ->first();

            $operation = '';
            $newQuantity = $quantity;

            if ($existingCart) {
                $currentQuantity = $existingCart->quantity;
                
                switch ($action) {
                    case 'add':
                        // Thêm vào số lượng hiện có
                        $newQuantity = $currentQuantity + $quantity;
                        $operation = 'added';
                        break;
                        
                    case 'replace':
                        // Thay thế hoàn toàn
                        $newQuantity = $quantity;
                        $operation = 'replaced';
                        break;
                        
                    case 'smart':
                    default:
                        // Logic thông minh: 
                        // - Nếu số lượng mới > số lượng hiện tại: thay thế
                        // - Nếu số lượng mới <= số lượng hiện tại: thêm vào
                        if ($quantity > $currentQuantity) {
                            $newQuantity = $quantity;
                            $operation = 'replaced';
                        } else {
                            $newQuantity = $currentQuantity + $quantity;
                            $operation = 'added';
                        }
                        break;
                }

                // Kiểm tra stock sau khi tính toán
                if (!$product->isInStock($newQuantity)) {
                    return response()->json([
                        'success' => false,
                        'message' => 'Số lượng vượt quá stock hiện có (Còn lại: ' . $product->stock . ')',
                        'current_quantity' => $currentQuantity,
                        'requested_quantity' => $quantity,
                        'calculated_quantity' => $newQuantity
                    ], 400);
                }

                // Cập nhật cart
                $existingCart->quantity = $newQuantity;
                $existingCart->save();
                $cart = $existingCart;
                
            } else {
                // Sản phẩm chưa có trong giỏ hàng, tạo mới
                $cart = carts::create([
                    'user_id' => $userId,
                    'product_id' => $productId,
                    'quantity' => $quantity,
                ]);
                $operation = 'created';
            }

            // Load thông tin sản phẩm
            $cart->load('product');
            
            // Tính toán thông tin bổ sung
            $totalPrice = $cart->product->getTotalPrice($cart->quantity);
            $isAvailable = $cart->product->isInStock($cart->quantity);
            
            return response()->json([
                'success' => true,
                'message' => 'Sản phẩm đã được ' . $operation . ' trong giỏ hàng',
                'data' => [
                    'id' => $cart->id,
                    'user_id' => $cart->user_id,
                    'product_id' => $cart->product_id,
                    'quantity' => $cart->quantity,
                    'operation' => $operation,
                    'action_used' => $action,
                    'product' => [
                        'id' => $cart->product->id,
                        'name' => $cart->product->name,
                        'image' => $cart->product->image,
                        'description' => $cart->product->description,
                        'price' => (float) $cart->product->price,
                        'formatted_price' => $cart->product->formatted_price,
                        'stock' => $cart->product->stock,
                        'seller_id' => $cart->product->seller_id,
                        'category_id' => $cart->product->category_id
                    ],
                    'total_price' => $totalPrice,
                    'formatted_total_price' => $totalPrice . ' VNĐ',
                    'is_available' => $isAvailable,
                    'created_at' => $cart->created_at,
                    'updated_at' => $cart->updated_at
                ],
                'meta' => [
                    'previous_quantity' => $existingCart ? $existingCart->getOriginal('quantity') : 0,
                    'quantity_change' => $existingCart ? ($cart->quantity - $existingCart->getOriginal('quantity')) : $quantity,
                    'stock_remaining' => $product->stock - $cart->quantity
                ]
            ], 200);

        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Có lỗi xảy ra khi xử lý giỏ hàng',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // API: Thêm nhiều sản phẩm cùng lúc với logic thông minh
    public function apiAddMultiple(Request $request) {
        try {
            $validator = Validator::make($request->all(), [
                'items' => 'required|array|min:1',
                'items.*.product_id' => 'required|exists:products,id',
                'items.*.quantity' => 'required|integer|min:1',
                'items.*.action' => 'sometimes|in:add,replace,smart',
                'strategy' => 'sometimes|in:individual,batch' // individual: xử lý từng item, batch: xử lý tất cả cùng lúc
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Dữ liệu không hợp lệ',
                    'errors' => $validator->errors()
                ], 422);
            }

            $userId = $request->user()->id ?? 1;
            $items = $request->items;
            $strategy = $request->input('strategy', 'individual');
            
            $results = [];
            $errors = [];
            
            if ($strategy === 'batch') {
                // Xử lý tất cả cùng lúc trong transaction
                DB::beginTransaction();
                try {
                    foreach ($items as $index => $item) {
                        $result = $this->processCartItem($userId, $item, $index);
                        if ($result['success']) {
                            $results[] = $result['data'];
                        } else {
                            $errors[] = $result['error'];
                        }
                    }
                    
                    if (empty($errors)) {
                        DB::commit();
                        return response()->json([
                            'success' => true,
                            'message' => 'Tất cả sản phẩm đã được xử lý thành công',
                            'data' => $results,
                            'processed_count' => count($results)
                        ]);
                    } else {
                        DB::rollback();
                        return response()->json([
                            'success' => false,
                            'message' => 'Có lỗi xảy ra khi xử lý một số sản phẩm',
                            'errors' => $errors,
                            'processed_count' => 0
                        ], 400);
                    }
                } catch (\Exception $e) {
                    DB::rollback();
                    throw $e;
                }
            } else {
                // Xử lý từng item riêng biệt
                foreach ($items as $index => $item) {
                    $result = $this->processCartItem($userId, $item, $index);
                    if ($result['success']) {
                        $results[] = $result['data'];
                    } else {
                        $errors[] = $result['error'];
                    }
                }
                
                return response()->json([
                    'success' => count($errors) === 0,
                    'message' => count($errors) === 0 ? 'Tất cả sản phẩm đã được xử lý thành công' : 'Một số sản phẩm xử lý thành công',
                    'data' => $results,
                    'errors' => $errors,
                    'processed_count' => count($results),
                    'error_count' => count($errors)
                ], count($errors) === 0 ? 200 : 207); // 207 Multi-Status
            }

        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Có lỗi xảy ra khi xử lý nhiều sản phẩm',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // Helper method để xử lý từng cart item
    private function processCartItem($userId, $item, $index) {
        try {
            $productId = $item['product_id'];
            $quantity = $item['quantity'];
            $action = $item['action'] ?? 'smart';

            $product = Product::find($productId);
            if (!$product) {
                return [
                    'success' => false,
                    'error' => [
                        'index' => $index,
                        'product_id' => $productId,
                        'message' => 'Sản phẩm không tồn tại'
                    ]
                ];
            }

            if (!$product->isInStock($quantity)) {
                return [
                    'success' => false,
                    'error' => [
                        'index' => $index,
                        'product_id' => $productId,
                        'message' => 'Số lượng sản phẩm không đủ trong kho (Còn lại: ' . $product->stock . ')'
                    ]
                ];
            }

            $existingCart = carts::where('user_id', $userId)
                ->where('product_id', $productId)
                ->first();

            $operation = '';
            $newQuantity = $quantity;

            if ($existingCart) {
                $currentQuantity = $existingCart->quantity;
                
                switch ($action) {
                    case 'add':
                        $newQuantity = $currentQuantity + $quantity;
                        $operation = 'added';
                        break;
                    case 'replace':
                        $newQuantity = $quantity;
                        $operation = 'replaced';
                        break;
                    case 'smart':
                    default:
                        if ($quantity > $currentQuantity) {
                            $newQuantity = $quantity;
                            $operation = 'replaced';
                        } else {
                            $newQuantity = $currentQuantity + $quantity;
                            $operation = 'added';
                        }
                        break;
                }

                if (!$product->isInStock($newQuantity)) {
                    return [
                        'success' => false,
                        'error' => [
                            'index' => $index,
                            'product_id' => $productId,
                            'message' => 'Số lượng vượt quá stock hiện có (Còn lại: ' . $product->stock . ')'
                        ]
                    ];
                }

                $existingCart->quantity = $newQuantity;
                $existingCart->save();
                $cart = $existingCart;
            } else {
                $cart = carts::create([
                    'user_id' => $userId,
                    'product_id' => $productId,
                    'quantity' => $quantity,
                ]);
                $operation = 'created';
            }

            $cart->load('product');
            $totalPrice = $cart->product->getTotalPrice($cart->quantity);

            return [
                'success' => true,
                'data' => [
                    'index' => $index,
                    'id' => $cart->id,
                    'product_id' => $cart->product_id,
                    'quantity' => $cart->quantity,
                    'operation' => $operation,
                    'action_used' => $action,
                    'product_name' => $cart->product->name,
                    'total_price' => $totalPrice,
                    'formatted_total_price' => $totalPrice . ' VNĐ'
                ]
            ];

        } catch (\Exception $e) {
            return [
                'success' => false,
                'error' => [
                    'index' => $index,
                    'product_id' => $item['product_id'] ?? 'unknown',
                    'message' => 'Lỗi xử lý: ' . $e->getMessage()
                ]
            ];
        }
    }

    // API: Cập nhật số lượng sản phẩm trong giỏ hàng
    public function apiUpdate(Request $request, $id) {
        try {
            $validator = Validator::make($request->all(), [
                'quantity' => 'required|integer|min:1',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Dữ liệu không hợp lệ',
                    'errors' => $validator->errors()
                ], 422);
            }

            $cart = carts::findOrFail($id);
            $quantity = $request->quantity;

            // Kiểm tra stock
            $product = $cart->product;
            if (!$product->isInStock($quantity)) {
                return response()->json([
                    'success' => false,
                    'message' => 'Số lượng sản phẩm không đủ trong kho (Còn lại: ' . $product->stock . ')'
                ], 400);
            }

            $cart->quantity = $quantity;
            $cart->save();
            
            $cart->load('product');
            return response()->json([
                'success' => true,
                'message' => 'Cập nhật số lượng thành công',
                'data' => [
                    'id' => $cart->id,
                    'user_id' => $cart->user_id,
                    'product_id' => $cart->product_id,
                    'quantity' => $cart->quantity,
                    'product' => [
                        'id' => $cart->product->id,
                        'name' => $cart->product->name,
                        'price' => (float) $cart->product->price,
                        'formatted_price' => $cart->product->formatted_price,
                        'stock' => $cart->product->stock
                    ],
                    'total_price' => $cart->product->getTotalPrice($cart->quantity),
                    'created_at' => $cart->created_at,
                    'updated_at' => $cart->updated_at
                ]
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Có lỗi xảy ra khi cập nhật giỏ hàng',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // API: Xóa sản phẩm khỏi giỏ hàng
    public function apiDestroy($id) {
        try {
            $cart = carts::findOrFail($id);
            $cart->delete();
            
            return response()->json([
                'success' => true,
                'message' => 'Đã xóa sản phẩm khỏi giỏ hàng'
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Có lỗi xảy ra khi xóa sản phẩm',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // API: Dọn dẹp giỏ hàng - gộp các sản phẩm trùng lặp
    public function apiCleanup(Request $request) {
        try {
            $userId = $request->user()->id ?? 1;
            
            DB::beginTransaction();
            
            // Lấy tất cả cart items của user
            $cartItems = carts::where('user_id', $userId)->get();
            
            // Nhóm theo product_id
            $groupedItems = $cartItems->groupBy('product_id');
            $cleanedCount = 0;
            
            foreach ($groupedItems as $productId => $items) {
                if ($items->count() > 1) {
                    // Tính tổng quantity
                    $totalQuantity = $items->sum('quantity');
                    
                    // Kiểm tra stock
                    $product = Product::find($productId);
                    if ($product && $product->stock < $totalQuantity) {
                        $totalQuantity = $product->stock;
                    }
                    
                    // Giữ lại item đầu tiên và cập nhật quantity
                    $firstItem = $items->first();
                    $firstItem->quantity = $totalQuantity;
                    $firstItem->save();
                    
                    // Xóa các item còn lại
                    $items->skip(1)->each(function ($item) {
                        $item->delete();
                    });
                    
                    $cleanedCount += $items->count() - 1;
                }
            }
            
            DB::commit();
            
            return response()->json([
                'success' => true,
                'message' => "Đã dọn dẹp giỏ hàng thành công. Xóa {$cleanedCount} mục trùng lặp.",
                'data' => $this->apiIndex($request)->getData()
            ]);
        } catch (\Exception $e) {
            DB::rollback();
            return response()->json([
                'success' => false,
                'message' => 'Có lỗi xảy ra khi dọn dẹp giỏ hàng',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // API: Xóa toàn bộ giỏ hàng
    public function apiClear(Request $request) {
        try {
            $userId = $request->user()->id ?? 1;
            
            $deletedCount = carts::where('user_id', $userId)->delete();
            
            return response()->json([
                'success' => true,
                'message' => "Đã xóa toàn bộ giỏ hàng ({$deletedCount} mục)"
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Có lỗi xảy ra khi xóa giỏ hàng',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    // API: Thêm sản phẩm vào giỏ hàng (API cũ - giữ lại để tương thích)
    public function apiStore(Request $request) {
        try {
            $validator = Validator::make($request->all(), [
                'product_id' => 'required|exists:products,id',
                'quantity' => 'required|integer|min:1',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Dữ liệu không hợp lệ',
                    'errors' => $validator->errors()
                ], 422);
            }

            $userId = $request->user()->id ?? 1;
            $productId = $request->product_id;
            $quantity = $request->quantity;

            // Kiểm tra stock
            $product = Product::find($productId);
            if (!$product) {
                return response()->json([
                    'success' => false,
                    'message' => 'Sản phẩm không tồn tại'
                ], 404);
            }

            if (!$product->isInStock($quantity)) {
                return response()->json([
                    'success' => false,
                    'message' => 'Số lượng sản phẩm không đủ trong kho (Còn lại: ' . $product->stock . ')'
                ], 400);
            }
            
            // Kiểm tra xem sản phẩm đã có trong giỏ hàng chưa
            $existingCart = carts::where('user_id', $userId)
                ->where('product_id', $productId)
                ->first();
                
            if ($existingCart) {
                $newQuantity = $existingCart->quantity + $quantity;
                if (!$product->isInStock($newQuantity)) {
                    return response()->json([
                        'success' => false,
                        'message' => 'Tổng số lượng vượt quá stock hiện có (Còn lại: ' . $product->stock . ')'
                    ], 400);
                }
                // Nếu đã có, cập nhật quantity
                $existingCart->quantity = $newQuantity;
                $existingCart->save();
                $cart = $existingCart;
            } else {
                // Nếu chưa có, tạo mới
                $cart = carts::create([
                    'user_id' => $userId,
                    'product_id' => $productId,
                    'quantity' => $quantity,
                ]);
            }
            
            // Trả về cart item với thông tin sản phẩm
            $cart->load('product');
            return response()->json([
                'success' => true,
                'message' => 'Sản phẩm đã được thêm vào giỏ hàng',
                'data' => [
                    'id' => $cart->id,
                    'user_id' => $cart->user_id,
                    'product_id' => $cart->product_id,
                    'quantity' => $cart->quantity,
                    'product' => [
                        'id' => $cart->product->id,
                        'name' => $cart->product->name,
                        'price' => (float) $cart->product->price,
                        'formatted_price' => $cart->product->formatted_price,
                        'stock' => $cart->product->stock
                    ],
                    'total_price' => $cart->product->getTotalPrice($cart->quantity),
                    'created_at' => $cart->created_at,
                    'updated_at' => $cart->updated_at
                ]
            ], 201);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Có lỗi xảy ra khi thêm vào giỏ hàng',
                'error' => $e->getMessage()
            ], 500);
        }
    }
}