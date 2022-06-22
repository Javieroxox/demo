<?php

namespace App\Http\Controllers;

use App\Models\Rango;
use Illuminate\Http\Request;
use App\Http\Requests\RangosRequest;

class RangosController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Rango::all();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $rango = new Rango();
        $rango->nombre=$request->nombre;
        $rango->rut_nino=$request->rut_nino;
        $rango->rut_educadora=$request->rut_educadora;
        $rango->save();
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Rango  $rango
     * @return \Illuminate\Http\Response
     */
    public function show(Rango $rango)
    {
        return $rango;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Rango  $rango
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Rango $rango)
    {
        $rango->nombre=$request->nombre;
        $rango->rut_nino=$request->rut_nino;
        $rango->rut_educadora=$request->rut_educadora;
        $rango->save();
        return $rango;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Rango  $rango
     * @return \Illuminate\Http\Response
     */
    public function destroy(Rango $rango)
    {
        $rango->delete();
    }
}
