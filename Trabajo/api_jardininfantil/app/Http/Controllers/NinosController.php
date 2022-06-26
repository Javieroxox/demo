<?php

namespace App\Http\Controllers;

use App\Models\Nino;
use Illuminate\Http\Request;
use App\Http\Requests\NinosRequest;


class NinosController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Nino::all();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\NinosRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(NinosRequest $request)
    {
        $nino = new Nino();
        $nino->rut = $request->rut;
        $nino->nombre = $request->nombre;
        $nino->apellido=$request->apellido;
        $nino->id_rango=$request->id_rango;
        $nino->save();
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Nino  $nino
     * @return \Illuminate\Http\Response
     */
    public function show(Nino $nino)
    {
        return $nino;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\NinosRequest  $request
     * @param  \App\Models\Nino  $nino
     * @return \Illuminate\Http\Response
     */
    public function update(NinosRequest $request, Nino $nino)
    {
        $nino->rut = $request->rut;
        $nino->nombre=$request->nombre;
        $nino->apellido=$request->apellido;
        $nino->id_rango=$request->id_rango;
        $nino->save();
        return $nino;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Nino  $nino
     * @return \Illuminate\Http\Response
     */
    public function destroy(Nino $nino)
    {
        $nino->delete();
    }
}
