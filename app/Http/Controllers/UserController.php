<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(): JsonResponse
    {
        try {
            $users = User::select(['id', 'name', 'email', 'role', 'status', 'created_at'])
                         ->paginate(15);
            
            return response()->json($users);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to fetch users'], 500);
        }
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(): JsonResponse
    {
        return response()->json(['message' => 'Not implemented'], 501);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): JsonResponse
    {
        try {
            $validatedData = $request->validate([
                'name' => 'required|string|max:255',
                'email' => 'required|email|unique:users,email',
                'password' => 'required|string|min:8|confirmed',
                'phone' => 'nullable|string|max:15|unique:users,phone',
                'role' => 'sometimes|in:admin,customer,seller',
            ]);

            $validatedData['password'] = Hash::make($validatedData['password']);
            $validatedData['role'] = $validatedData['role'] ?? 'customer';

            $user = User::create($validatedData);
            
            return response()->json([
                'message' => 'User created successfully',
                'user' => $user->only(['id', 'name', 'email', 'role', 'status'])
            ], 201);

        } catch (ValidationException $e) {
            return response()->json(['errors' => $e->errors()], 422);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to create user'], 500);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id): JsonResponse
    {
        try {
            $user = User::select(['id', 'name', 'email', 'phone', 'address', 'role', 'status', 'created_at'])
                        ->findOrFail($id);
            
            return response()->json($user);
        } catch (\Exception $e) {
            return response()->json(['error' => 'User not found'], 404);
        }
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id): JsonResponse
    {
        return response()->json(['message' => 'Not implemented'], 501);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id): JsonResponse
    {
        try {
            $user = User::findOrFail($id);

            $validatedData = $request->validate([
                'name' => 'sometimes|required|string|max:255',
                'email' => 'sometimes|required|email|unique:users,email,' . $id,
                'password' => 'sometimes|required|string|min:8|confirmed',
                'phone' => 'sometimes|nullable|string|max:15|unique:users,phone,' . $id,
                'address' => 'sometimes|nullable|string|max:500',
                'role' => 'sometimes|in:admin,customer,seller',
                'status' => 'sometimes|in:active,inactive,suspended',
            ]);

            if (isset($validatedData['password'])) {
                $validatedData['password'] = Hash::make($validatedData['password']);
            }

            $user->update($validatedData);

            return response()->json([
                'message' => 'User updated successfully',
                'user' => $user->only(['id', 'name', 'email', 'role', 'status'])
            ]);

        } catch (ValidationException $e) {
            return response()->json(['errors' => $e->errors()], 422);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to update user'], 500);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id): JsonResponse
    {
        try {
            $user = User::findOrFail($id);
            
            // Soft delete thay vì hard delete
            $user->update(['status' => 'inactive']);
            
            return response()->json(['message' => 'User deactivated successfully']);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to delete user'], 404);
        }
    }
}