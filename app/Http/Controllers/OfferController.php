<?php

namespace App\Http\Controllers;

use App\Models\offer;
use App\Http\Requests\StoreofferRequest;
use App\Http\Requests\UpdateofferRequest;
use Illuminate\Http\Request;


class OfferController extends Controller
{
    public function index()
    {
        $offers = Offer::with('project', 'freelancer')->latest()->get();

        return response()->json([
            'message' => 'Offers retrieved successfully.',
            'data' => $offers
        ], 200);
    }

    /**
     * Store a newly created offer.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'project_id' => 'required|exists:projects,id',
            'offer_text' => 'required|string',
        ]);

        $validated['freelancer_id'] = auth()->id(); // Use authenticated user
        $validated['num_replies'] = 0;
        $validated['is_flagged'] = false;
        $validated['status'] = 'pending';

        $offer = Offer::create($validated);

        return response()->json([
            'message' => 'Offer created successfully.',
            'data' => $offer
        ], 201);
    }

    /**
     * Display the specified offer.
     */
    public function show($id)
    {
        $offer = Offer::with('project', 'freelancer')->find($id);

        if (!$offer) {
            return response()->json(['message' => 'Offer not found.'], 404);
        }

        return response()->json([
            'message' => 'Offer retrieved successfully.',
            'data' => $offer
        ], 200);
    }

    /**
     * Update the specified offer.
     */
    public function update(Request $request, $id)
    {
        $offer = Offer::find($id);

        if (!$offer) {
            return response()->json(['message' => 'Offer not found.'], 404);
        }

        // Optional: Check if the user is allowed to update the offer

        $validated = $request->validate([
            'offer_text' => 'sometimes|string',
            'status' => 'sometimes|in:pending,accepted,rejected',
            'is_flagged' => 'sometimes|boolean',
        ]);

        $offer->update($validated);

        return response()->json([
            'message' => 'Offer updated successfully.',
            'data' => $offer
        ], 200);
    }

    /**
     * Remove the specified offer from storage.
     */
    public function destroy($id)
    {
        $offer = Offer::find($id);

        if (!$offer) {
            return response()->json(['message' => 'Offer not found.'], 404);
        }

        $offer->delete();

        return response()->json([
            'message' => 'Offer deleted successfully.'
        ], 200);
    }
}
