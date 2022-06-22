<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\{NinosController,EducadorasController,RangosController,EmergenciasRequest};
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::apiResource('/ninos',NinosController::class);
Route::apiResource('/educadoras',EducadorasController::class);
Route::apiResource('/rangos',RangosController::class);
Route::apiResource('/emergencias',EmergenciasRequest::class);