<?php

namespace App\Http\Controllers;

use App\Models\subServiese;
use App\Http\Requests\StoresubServieseRequest;
use App\Http\Requests\UpdatesubServieseRequest;

class SubServieseController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $subServices = subServiese::with('service')->get();

        if ($subServices->isEmpty()) {
            return response()->json(['message' => 'No sub-services found.'], 404);
        }

        return response()->json(['message' => 'Sub-services retrieved successfully.', 'data' => $subServices], 200);
    }

    /**
     * Display the specified sub_service.
     */
    public function show(subServiese $subService)
    {
        $subService->load('service.user');
        if (!$subService) {
            return response()->json(['message' => 'Sub-service not found.'], 404);
        }

        return response()->json(['message' => 'Sub-service retrieved successfully.', 'data' => $subService], 200);
    }

    /**
     * Store a newly created sub_service in storage.
     */
    public function store(StoresubServieseRequest $request)
    {
        $validatedData = $request->validated();

        $subService = subServiese::create($validatedData);

        return response()->json(['message' => 'Sub-service created successfully.', 'data' => $subService], 201);
    }

    /**
     * Update the specified sub_service in storage.
     */
    public function update(UpdateSubServiceRequest $request, SubService $subService): JsonResponse
    {
        $validatedData = $request->validated();

        $subService->update($validatedData);

        return response()->json(['message' => 'Sub-service updated successfully.', 'data' => $subService], 200);
    }

    /**
     * Remove the specified sub_service from storage.
     */
    public function destroy(SubService $subService): JsonResponse
    {
        $subService->delete();

        return response()->json(['message' => 'Sub-service deleted successfully.'], 200);
    }

     /**
     * Get sub-services for a specific service.
     */
    public function getSubServicesByServiceId(Request $request, $serviceId): JsonResponse
    {
        $subServices = subServiese::where('service_id', $serviceId)->get();

        if ($subServices->isEmpty()) {
            return response()->json(['message' => 'No sub-services found for this service.'], 404);
        }

        return response()->json(['message' => 'Sub-services retrieved successfully for service.', 'data' => $subServices], 200);
    }
}
