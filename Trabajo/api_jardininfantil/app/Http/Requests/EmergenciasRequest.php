<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class EmergenciasRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */

    public function rules()
    {
        return [
            'descripcion'=>'required|alpha',
        ];
    }

    public function messages()
    {   return [
        'descripcion.required'=>'Ingrese el nombre del rango',
        'descripcion.alpha'=>'Ingreso un número en el nombre del rango',
    ];
    }
}
