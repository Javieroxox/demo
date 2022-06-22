<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class RangosRequest extends FormRequest
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
            'nombre'=>'required|alpha',
            'rut_niño'=>'unique:rango,rut_niño',
            'rut_educadora'=>'unique:rango,rut_educadora',
        ];
    }

    public function messages()
    {   return [
        'nombre.required'=>'Ingrese el nombre del rango',
        'nombre.alpha'=>'Ingreso un número en el nombre del rango',
        'rut_niño.unique'=>'El rut del niño ya existe en la base de datos',
        'rut_educadora.unique'=>'El rut de la tia ya existe en la base de datos',
    ];
    }
}