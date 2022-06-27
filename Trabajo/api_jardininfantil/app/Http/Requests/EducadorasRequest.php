<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class EducadorasRequest extends FormRequest
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
            'rut'=>'required|unique:educadoras,rut', //ignore($this->educadoras->rut,'rut'', "aca tambien no funca"
            'nombre'=>'required|alpha',
            'apellido'=>'required|alpha',
            'id_rango'=>'required|numeric'
        ];
    }

    public function messages()
    {
        return [
        'rut.required'=>'El rut de la educadora debe ser ingresado',
        'rut.unique'=>'El rut esta duplicado',
        'nombre.required'=>'El nombre de la educadora debe ser ingresado',
        'nombre.alpha'=>'Ingreso números en el nombre de la educadora',
        'apellido.required'=>'El apellido de la educadora debe ser ingresado',
        'apellido.alpha'=>'Ingreso números en el apellido de la educadora',
        'id_rango.required'=>'El rango al que pertenece la educadora debe ser ingresado',
        'id_rango.numeric'=>'Ingreso una letra por error'
        ];
    }
}
