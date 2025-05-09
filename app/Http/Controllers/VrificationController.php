<?php

namespace App\Http\Controllers;

use App\Models\vrification;
use App\Http\Requests\StorevrificationRequest;
use App\Http\Requests\UpdatevrificationRequest;


use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;


class VrificationController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function store(Request $request)
    {
        $userId = Auth::id(); // Get the authenticated user ID

        $validator = Validator::make($request->all(), [
            'step1_image' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048', // Validate image uploads
            'step2_image' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
            'step3_image' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        // Store images in the public storage folder
        $frontIdImagePath = $request->file('step1_image')->store('identity_verification_images', 'public');
        $backIdImagePath = $request->file('step2_image')->store('identity_verification_images', 'public');
        $selfieImagePath = $request->file('step3_image')->store('identity_verification_images', 'public');

        $verification = Vrification::create([
            'userId' => $userId, // Associate with the authenticated user
            'front_id_image_path' => $frontIdImagePath,
            'back_id_image_path' => $backIdImagePath,
            'selfie_with_id_image_path' => $selfieImagePath,
            'verification_status' => 'processing', // Set status to processing upon submission
        ]);

        return response()->json([
            'message' => 'Identity verification request submitted successfully',
            'verification' => $verification
        ], 201);
    }
}
