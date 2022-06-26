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
        return false;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */

    public function rules()
    {
        return[
            //'rut' => ['bail','required',Rule::unique('ninos')->ignore($this->nino->rut,'rut'),'regex:/^(\d{7,8}-[\dkK])$/',new DigitoVerificadorRut],
            'nombre'=>'required|alpha|min:3|max:30',
            'apellido'=>'required|alpha|min:3|max:30',
            'id_rango'=>'required|numeric'
            ];
    }

    public function messages()
    {   return [
        //'rut.required' => 'El rut del infante debe ser ingresado',
        //'rut.unique'=>'El rut esta duplicado',
        //'rut.regex' => 'Indique RUT sin puntos, con guión y con dígito verificador',
        'nombre.required'=>'El nombre del infante debe ser ingresado',
        'nombre.alpha'=>'Ingreso números en el nombre del infante',
        'nombre.min' => 'El nombre debe tener como mínimo 3 letras',
        'nombre.max' => 'El nombre debe tener como máximo 30 letras',
        'apellido.required'=>'El apellido del infante debe ser ingresado',
        'apellido.alpha'=>'Ingreso números en el apellido del infante',
        'apellido.min' => 'El apellido debe tener como mínimo 3 letras',
        'apellido.max' => 'El apellido debe tener como máximo 30 letras',
        'id_rango.required'=>'El rango escolar del infante debe ser ingresado',
        'id_rango.numeric'=>'Ingreso una letra por error'
        ];
    }
}
