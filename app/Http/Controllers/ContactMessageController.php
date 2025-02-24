<?php

namespace App\Http\Controllers;
use App\Models\User;
use App\Models\contact_message;
use App\Http\Requests\Storecontact_messageRequest;
use App\Http\Requests\Updatecontact_messageRequest;
use App\Models\notification;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;


class ContactMessageController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function store(Request $request)
    {
        // Get the authenticated user's ID
        $client_id = Auth::id();

        // Get the freelancer ID from the request *before* validation
        $freelancer_id = $request->freelancer_id;

        // Fetch the freelancer *BEFORE* validation to use the data for validation rules and to get the freelancer data

        $freelancer = User::where('id', $freelancer_id)->first();


        if (!$freelancer) {
            return response()->json(['message' => 'Freelancer not found'], 404);
        }


        $validator = Validator::make($request->all(), [
            'freelancer_id' => 'required|exists:users,id',
            'client_name' => 'required|string',
            'client_email' => 'required|email',
            // Remove 'freelancer_name' from validation.  We are getting it from the DB.
            'private_message' => 'required|string',
            'project_title' => 'required|string',
            'description' => 'required|string',
            'photos' => 'nullable|array',
            'photos.*' => 'image|mimes:jpeg,png,jpg,gif,svg|max:2048', // Validate each photo
            'required_skills' => 'nullable|string',
            'section' => 'nullable|string',
            'subsection' => 'nullable|string',
            'expected_budget' => 'nullable|string',
            'expected_duration' => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        // Now that we know the data is valid, get the validated data.
        $validatedData = $validator->validated();

        // Override the client_id with the authenticated user's ID
        $validatedData['client_id'] = $client_id;

        // Store the freelancer's name *AFTER* validation
        $validatedData['freelancer_name'] = $freelancer->userName;



        $photoPaths = [];
        if ($request->hasFile('photos')) {
            foreach ($request->file('photos') as $photo) {
                $path = $photo->store('contact_message_photos', 'public'); // Store in storage/app/public/contact_message_photos
                $photoPaths[] = $path;
            }
        }

        $validatedData['photo_paths'] = $photoPaths;

        $contactMessage = contact_message::create($validatedData); // Use the correct model name.

        $notification = new Notification();

    $notification->title = $request->input('project_title'); // Or $request->title; if sent as JSON/form data
    $notification->description = $request->input('description'); // Or $request->description;
    $notification->type = 'notification'; // Or $request->type;
    $notification->user_id_receiver = $request->input('freelancer_id'); // Or $request->user_id_receiver;
    $notification->user_id_sender = $client_id; // Or $request->user_id_sender;

    $notification->save();
    
        return response()->json(['message' => 'Contact form submitted successfully!', 'data' => $contactMessage], 201);
    }




    /**
     * Display the specified resource.
     */
    public function show(ContactMessage $contactMessage)
    {
        return response()->json(['data' => $contactMessage], 200);
    }



    public function index()
    {
        $contactMessages = contact_message::all();

        return response()->json(['data' => $contactMessages], 200);
    }
}
