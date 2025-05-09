<?php

namespace App\Http\Controllers;

use App\Models\email;
use App\Http\Requests\StoreemailRequest;
use App\Http\Requests\UpdateemailRequest;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;



class EmailController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $userId = Auth::id(); // Get the authenticated user ID
        $emails = email::where('userId', $userId)->get(); // Fetch only user-related emails
        return response()->json($emails);
    }

    /**
     * Store a newly created email in storage.
     */
    public function store(Request $request)
    {
        $userId = Auth::id(); // Get the authenticated user ID

        $validator = Validator::make($request->all(), [
            'address' => 'required|email|unique:emails,address,NULL' . $userId,
            // Validate email format and uniqueness per user
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $email = email::create([
            'userId' => $userId, // Associate the email with the logged-in user
            'address' => $request->address,
        ]);

        return response()->json([
            'message' => 'Email added successfully',
            'email' => $email
        ], 201);
    }

    /**
     * Remove the specified email from storage.
     */
    public function destroy($id)
    {
        $userId = Auth::id(); // Get the authenticated user ID
        $email = email::where('id', $id)->where('userId', $userId)->first();

        if (!$email) {
            return response()->json(['message' => 'Email not found or unauthorized'], 404);
        }

        $email->delete();
        return response()->json(['message' => 'Email deleted successfully']);
    }
}
