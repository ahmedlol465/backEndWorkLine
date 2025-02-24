<?php

namespace App\Http\Controllers;

use App\Models\service;
use App\Http\Requests\StoreserviceRequest;
use App\Http\Requests\UpdateserviceRequest;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ServiceController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $query = service::with('user')->latest();

        // Check if a search query parameter is present in the request
        if ($request->has('search')) {
            $searchTerm = $request->input('search');

            // Apply the search filter to the query
            $query->where(function ($q) use ($searchTerm) {
                $q->where('title', 'like', '%' . $searchTerm . '%')
                  ->orWhere('description', 'like', '%' . $searchTerm . '%');
            });
        }

        // Check if a section query parameter is present in the request
        if ($request->has('section')) {
            $sectionFilter = $request->input('section');

            // Apply the section filter to the query
            $query->where('section', '=', $sectionFilter);
        }


        $getAllServiece = $query->paginate(10);

        return response()->json([
            'message' => 'services retrieved successfully.',
            'data' => $getAllServiece,
        ], 200);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreserviceRequest $request)
    {

        $user = auth()->user()->id;

        $validatedData = $request->validate([
            'title' => 'required|string|max:255',
            'section' => 'required|string|max:255',
            'subsection' => 'nullable|string|max:255',
            'description' => 'nullable|string',
            'thumbnail_photo' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'main_photo' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'required_skills' => 'nullable|string',
            'price' => 'required|numeric',
            'delivery_duration' => 'required|string|max:255',
            'from_date' => 'nullable|date',
            'to_date' => 'nullable|date',
            'link' => 'nullable|string|max:255',
            // 'user_id' => 'required|exists:users,id',
            'status' => 'required|in:sent,opened,completed,canceled',
        ]);

        $validatedData['user_id'] = $user; // Add user_id to validated data


        // Handle file uploads
        if ($request->hasFile('thumbnail_photo')) {
            $validatedData['thumbnail_photo'] = $request->file('thumbnail_photo')->store('services');
        }
        if ($request->hasFile('main_photo')) {
            $validatedData['main_photo'] = $request->file('main_photo')->store('services');
        }

        // Create the service
        $service = Service::create($validatedData);

        return response()->json(['message' => 'Service created successfully', 'service' => $service], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(service $service)
    {
        // Eager load the user relationship to avoid N+1 query issues
        $service->load('user');

        // Return the service details as a JSON response
        return response()->json([
            'message' => 'Service retrieved successfully.',
            'data' => $service,
        ], 200);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateserviceRequest $request, service $service)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(service $service)
    {
        //
    }



    public function getStatusCounts()
    {
        $user = auth()->user();
        $serviceCounts = Service::where('user_id', $user->id)
            ->select('status', \DB::raw('count(*) as count'))
            ->groupBy('status')
            ->get()
            ->keyBy('status');

        $totalServices = Service::where('user_id', $user->id)->count();

        $statuses = [
            'sent', 'opened', 'completed', 'canceled' // Service statuses based on image order
        ];

        $statusData = [];
        foreach ($statuses as $status) {
            $count = $serviceCounts->get($status)?->count ?? 0;
            $percentage = $totalServices > 0 ? round(($count / $totalServices) * 100) : 0;
            $statusData[$status] = [
                'count' => $count,
                'percentage' => $percentage,
            ];
        }


        return response()->json(['data' => $statusData]);
    }



}
