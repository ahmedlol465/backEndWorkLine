<?php

namespace App\Http\Controllers;

use App\Models\favourite;
use App\Http\Requests\StorefavouriteRequest;
use App\Http\Requests\UpdatefavouriteRequest;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;


class FavouriteController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $favourites = favourite::with('user')->latest()->paginate(10); // Example: Paginate and eager load user
        return response()->json(['favourites' => $favourites], 200);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $user_id = auth()->user()->id;

        // $validator = Validator::make($request->all(), [
        //     'favourite_id' => 'required|exists:favourites,id',
        //     'type' => 'required|string|max:255',
        // ]);

        $validator = Validator::make($request->all(), [
            'favourite_id' => [
                'required',
                // 'exists:favourites,id',
                // Rule::unique('favourites')->where(function ($query) use ($user_id, $request) {
                //     return $query->where('favourite_id', $request->favourite_id)
                //                  ->where('type', $request->type); // Ensure the same type isn't added twice
                // }),
            ],
            'type' => 'required|string|max:255',
        ]);

        $isFavouriteFound = favourite::where('favourite_id', $request->favourite_id)
        ->where('type', $request->type)
        ->where('user_id', $user_id)
        ->exists();

        if ($isFavouriteFound) {
            return response()->json(['message' => 'Favourite already exists'], 409); // 409 Conflict
        }

        
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422); // 422 Unprocessable Entity
        }

        $validatedData = $validator->validated();
        $validatedData['user_id'] = $user_id;


        $favourite = favourite::create($validatedData);

        return response()->json(['favourite' => $favourite, 'message' => 'Favourite created successfully'], 201); // 201 Created
    }


    /**
     * Display the specified resource.
     */
    public function show(Favourite $favourite)
    {
        $favourite->load('user'); // Eager load user for single favourite
        return response()->json(['favourite' => $favourite], 200);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Favourite $favourite)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'sometimes|required|exists:users,id', // 'sometimes' allows it to be optional during update
            'favourite_id' => 'sometimes|required|numeric', // Added validation for favourite_id - adjust rules as needed
            'type' => 'sometimes|required|string|max:255',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $favourite->update($request->all());

        return response()->json(['favourite' => $favourite, 'message' => 'Favourite updated successfully'], 200);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Favourite $favourite)
    {
        $favourite->delete();
        return response()->json(['message' => 'Favourite deleted successfully'], 200);
    }
}