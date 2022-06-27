<?php

namespace App\Http\Controllers;

use App\Models\{Emergencia,Nino};
use Illuminate\Http\Request;
use App\Http\Requests\EmergenciasRequest;

class EmergenciasController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Emergencia::all();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(EmergenciasRequest $request)
    {
        $emergencia = new Emergencia();
        $emergencia->fecha = $request->fecha;
        $emergencia->descripcion = $request->descripcion;
        $emergencia->rut_nino = $request->rut_nino;
        $emergencia->save();
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Emergencia  $emergencia
     * @return \Illuminate\Http\Response
     */
    public function show(Emergencia $emergencia)
    {
        return $emergencia;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Emergencia  $emergencia
     * @return \Illuminate\Http\Response
     */
    public function update(EmergenciasRequest $request, Emergencia $emergencia)
    {
        $emergencia->fecha = $request->fecha;
        $emergencia->descripcion = $request->descripcion;
        $emergencia->rut_nino = $request->rut_nino;
        $emergencia->save();
        return $emergencia;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Emergencia  $emergencia
     * @return \Illuminate\Http\Response
     */
    public function destroy(Emergencia $emergencia)
    {
        $emergencia->delete();
    }
}
