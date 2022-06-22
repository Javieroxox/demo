<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class EmergenciasFechasRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return false;
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
            'rut_niño'=>'unique:rango,rut_niño',
        ];
    }

    public function messages()
    {   return [
        'descripcion.required'=>'Ingrese el nombre del rango',
        'descripcion.alpha'=>'Ingreso un número en el nombre del rango',
        'rut_niño.unique'=>'El rut del niño ya existe en la base de datos',
        'rut_educadora.unique'=>'El rut de la tia ya existe en la base de datos',
    ];
    }
}
