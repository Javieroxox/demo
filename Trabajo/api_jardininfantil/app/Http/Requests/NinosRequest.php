<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

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
            'rut' => 'required|unique:ninos,rut', //ignore($this->niño->rut,'rut'' "esto no funca"
            'nombre'=>'required|alpha',
            'apellido'=>'required|alpha',
            //'id_rango'=>'required|numeric'
            ];
    }

    public function messages()
    {   return [
        'rut.required' => 'El rut del infante debe ser ingresado',
        'rut.unique'=>'El rut esta duplicado',
        'nombre.required'=>'El nombre del infante debe ser ingresado',
        'nombre.alpha'=>'Ingreso números en el nombre del infante',
        'apellido.required'=>'El apellido del infante debe ser ingresado',
        'apellido.alpha'=>'Ingreso números en el apellido del infante',
        //'id_rango.required'=>'El rango escolar del infante debe ser ingresado',
        //'id_rango.numeric'=>'Ingreso una letra por error'
        ];
    }
}
