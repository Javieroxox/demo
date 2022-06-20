<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class RequestProdcutos extends FormRequest
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
            'cod_producto' => 'required|min:2|unique:productos,cod_producto|excludeIf:cod_producto,cod_producto_nuevo',
            'nombre' => 'required',
            'stock' => 'required|numeric|gte:0',
            'precio' => 'required|numeric|gte:0',
        ];
    }

    public function messages(){
        return [
            'cod_producto.required' => 'Indique código de producto',
            'cod_producto.min' => 'El código debe tener al menos 2 chars',
            'cod_producto.unique' => 'El código :input ya existe en el sistema',
            'nombre.required' => 'Indique nombre del producto',
            'stock.required' => 'Indique stock del producto',
            'stock.numeric' => 'Stock debe ser número',
            'stock.gte' => 'El valor mínimo de stock es cero',
            'precio.required' => 'Indique precio del producto',
            'precio.numeric' => 'Precio debe ser número',
            'precio.gte' => 'El valor mínimoprecio es cero',
        ];
    }
}
