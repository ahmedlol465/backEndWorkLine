<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdatesubServieseRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'service_name' => 'sometimes|string|max:255', // 'sometimes' means required only if present in request
            'price' => 'sometimes|numeric|min:0',
            'delivery_duration' => 'sometimes|string|max:255',
            'service_id' => 'sometimes|exists:services,id',
        ];
    }
}
