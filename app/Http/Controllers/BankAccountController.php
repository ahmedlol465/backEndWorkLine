<?php

namespace App\Http\Controllers;

use App\Models\bank_account;
use App\Http\Requests\Storebank_accountRequest;
use App\Http\Requests\Updatebank_accountRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;




class BankAccountController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $bankAccounts = bank_account::all();
        return response()->json($bankAccounts);
    }

    /**
     * Store a newly created bank account in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {

        $user = Auth::id();

        $validator = Validator::make($request->all(), [
            'beneficiaryName' => 'required|string|max:255',
            'iban' => 'required|string|max:255',
            'bicSwift' => 'required|string|max:255',
            'addressLine1' => 'required|string|max:255',
            'addressLine2' => 'nullable|string|max:255',
            'city' => 'required|string|max:255',
            'governorate' => 'required|string|max:255',
            'zipCode' => 'required|string|max:255',
            'country' => 'required|string|max:255',
            'terms' => 'required|array', // Validate terms as an array
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422); // Return validation errors
        }

        $bankAccount = bank_account::create([
            'userId' => $user,
            'beneficiary_name' => $request->beneficiaryName,
            'iban' => $request->iban,
            'bic_swift' => $request->bicSwift,
            'address_line1' => $request->addressLine1,
            'address_line2' => $request->addressLine2,
            'city' => $request->city,
            'governorate' => $request->governorate,
            'zip_code' => $request->zipCode,
            'country' => $request->country,
            'terms' => $request->terms, // Terms will be automatically converted to JSON
        ]);

        return response()->json(['message' => 'Bank account created successfully', 'bankAccount' => $bankAccount], 201); // Return success message and created bank account
    }

    /**
     * Remove the specified bank account from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy($id)
    {
        $bankAccount = bank_account::find($id);

        if (!$bankAccount) {
            return response()->json(['message' => 'Bank account not found'], 404); // Return 404 if not found
        }

        $bankAccount->delete();
        return response()->json(['message' => 'Bank account deleted successfully']); // Return success message
    }
}
