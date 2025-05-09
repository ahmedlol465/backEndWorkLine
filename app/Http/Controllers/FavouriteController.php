<?php

namespace App\Http\Controllers;

use App\Models\favourite;
use App\Models\User;
use App\Models\service;
use App\Models\userWork;

use App\Models\project;
use App\Http\Requests\StorefavouriteRequest;
use App\Http\Requests\UpdatefavouriteRequest;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Auth;



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
    // public function store(Request $request)
    // {
    //     $user_id = auth()->user()->id;

    //     // $validator = Validator::make($request->all(), [
    //     //     'favourite_id' => 'required|exists:favourites,id',
    //     //     'type' => 'required|string|max:255',
    //     // ]);

    //     $validator = Validator::make($request->all(), [
    //         'favourite_id' => [
    //             'required',
    //             // 'exists:favourites,id',
    //             // Rule::unique('favourites')->where(function ($query) use ($user_id, $request) {
    //             //     return $query->where('favourite_id', $request->favourite_id)
    //             //                  ->where('type', $request->type); // Ensure the same type isn't added twice
    //             // }),
    //         ],
    //         'type' => 'required|string|max:255',
    //         'favouritable_id'=> 'required|numeric',
    //         'favouritable_type'=> 'required|string|max:255',
    //     ]);

    //     $isFavouriteFound = favourite::where('favourite_id', $request->favourite_id)
    //     ->where('type', $request->type)
    //     ->where('user_id', $user_id)
    //     ->exists();

    //     if ($isFavouriteFound) {
    //         return response()->json(['message' => 'Favourite already exists'], 409); // 409 Conflict
    //     }


    //     if ($validator->fails()) {
    //         return response()->json(['errors' => $validator->errors()], 422); // 422 Unprocessable Entity
    //     }

    //     $validatedData = $validator->validated();
    //     $validatedData['user_id'] = $user_id;


    //     $favourite = favourite::create($validatedData);

    //     return response()->json(['favourite' => $favourite, 'message' => 'Favourite created successfully'], 201); // 201 Created
    // }

    public function store(Request $request)
{
    $user_id = auth()->user()->id;

    $validator = Validator::make($request->all(), [
        'favourite_id' => 'required|numeric',
        'type' => 'required|string|max:255',
        'favouritable_id' => 'required|numeric',
        'favouritable_type' => 'required|string|max:255',
    ]);

    if ($validator->fails()) {
        return response()->json(['errors' => $validator->errors()], 422);
    }

    // Allow different users to add the same favourite
    $isFavouriteFound = favourite::where('user_id', $user_id)
        ->where('favourite_id', $request->favourite_id)
        ->where('type', $request->type)
        ->where('favouritable_id', $request->favouritable_id)
        ->where('favouritable_type', $request->favouritable_type)
        ->exists();

    if ($isFavouriteFound) {
        return response()->json(['message' => 'You have already added this favourite'], 409);
    }

    $validatedData = $validator->validated();
    $validatedData['user_id'] = $user_id;

    $favourite = favourite::create($validatedData);

    return response()->json([
        'favourite' => $favourite,
        'message' => 'Favourite added successfully'
    ], 201);
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
    public function destroy($id)
    {
        $favourite = favourite::find($id);

        if (!$favourite) {
            return response()->json(['message' => 'Favourite not found'], 404);
        }

        $favourite->delete();
        return response()->json(['message' => 'Favourite deleted successfully'], 200);
    }



    // public function getFavouritesByType(Request $request)
    // {
    //     // $type = $request->query('type'); // Get type from request

    //     // // Validate that type is provided
    //     // if (!$type) {
    //     //     return response()->json(['error' => 'Type is required'], 400);
    //     // }

    //     // // Fetch favorites based on type
    //     // $favourites = Favourite::where('type', $type)->with(['item']) // Load the actual item
    //     // ->paginate(10);

    //     // return response()->json(['favourites' => $favourites]);

    //     // $projects = favourite::where('favouritable_type', project::class)->get();
    //     // $Users = favourite::where('favouritable_type', User::class)->get();
    //     $Users = favourite::where('favouritable_type', User::class)
    // ->with('favouritable')
    // ->get();
    //     $Project = favourite::where('favouritable_type', project::class)
    // ->with('favouritable')
    // ->get();
    //     $Service = favourite::where('favouritable_type', service::class)
    // ->with('favouritable')
    // ->get();
    //     $BusinessGallery  = favourite::where('favouritable_type', userWork::class)
    // ->with('favouritable')
    // ->get();

    //     return response()->json([
    //         'projects' => $Project,
    //         'service' => $Service,
    //         'businessGallery' => $BusinessGallery,
    //         'freelancers' => $Users
    // ]);
    // }


    public function getFavouritesByType(Request $request)
{
    $user = auth()->user(); // Get the authenticated user

    if (!$user) {
        return response()->json(['error' => 'Unauthorized'], 401);
    }


    // Fetch only the favourites of the authenticated user
    $Users = favourite::where('user_id', $user->id)
        ->where('favouritable_type', User::class)
        ->with('favouritable')
        ->get();

    $Projects = favourite::where('user_id', $user->id)
        ->where('favouritable_type', Project::class)
        ->with('favouritable.user')
        ->get();

    $Services = favourite::where('user_id', $user->id)
        ->where('favouritable_type', Service::class)
        ->with('favouritable')
        ->get();

    $BusinessGallery = favourite::where('user_id', $user->id)
        ->where('favouritable_type', UserWork::class)
        ->with('favouritable')
        ->get();

    return response()->json([
        'projects' => $Projects,
        'services' => $Services,
        'businessGallery' => $BusinessGallery,
        'freelancers' => $Users,
        'user' => $user
    ]);
}


}
