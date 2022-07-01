<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use App\Rules\DigitoVerificadorRut;

class NinosRequest extends FormRequest
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
        return[
            'rut' => ['bail','required','regex:/^(\d{7,8}-[\dkK])$/',new DigitoVerificadorRut],
            'nombre'=>'required|alpha',
            'apellido'=>'required|alpha',
            ];
    }

    public function messages()
    {   return [
        'rut.required' => 'El rut del infante debe ser ingresado',
        'rut.regex' => 'Indique RUT sin puntos, con guión y con dígito verificador',
        'nombre.required'=>'El nombre del infante debe ser ingresado',
        'nombre.alpha'=>'Ingreso números en el nombre del infante',
        'apellido.required'=>'El apellido del infante debe ser ingresado',
        'apellido.alpha'=>'Ingreso números en el apellido del infante',
        ];
    }
}
