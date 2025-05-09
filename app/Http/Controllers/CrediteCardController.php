<?php

namespace App\Http\Controllers;

use App\Models\crediteCard;
use App\Http\Requests\StorecrediteCardRequest;
use App\Http\Requests\UpdatecrediteCardRequest;


use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;


class CrediteCardController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $userId = Auth::id(); // Get the authenticated user ID
        $creditCards = crediteCard::where('userId', $userId)->get(); // Filter by user_id
        return response()->json($creditCards);
    }

    /**
     * Store a newly created credit card in storage.
     */
    public function store(Request $request)
    {
        $userId = Auth::id(); // Get the authenticated user ID

        $validator = Validator::make($request->all(), [
            'cardHolder' => 'required|string|max:255',
            'cardNumber' => 'required|string|max:255',
            // 'expiryDate' => 'nullable|string|max:10', // Nullable expiry date
            'saveForNextOrder' => 'nullable|boolean',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $creditCard = crediteCard::create([
            'userId' => $userId, // Associate the credit card with the logged-in user
            'card_holder' => $request->cardHolder,
            'card_number' => $request->cardNumber,
            'expiry_date' => $request->expiryDate,
            'save_for_next_order' => $request->saveForNextOrder ?? false,
        ]);

        return response()->json([
            'message' => 'Credit card added successfully',
            'creditCard' => $creditCard
        ], 201);
    }

}
