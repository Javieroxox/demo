<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Nino extends Model
{
    use HasFactory,SoftDeletes;

    protected $table = 'ninos';
    protected $primaryKey = 'rut';
    public $incrementing = false;
    protected $keyType = 'string';
    public $timestamps = false;

    public function rango(){
        return $this->belongsto(Rango::class);
    }

    //public function emergencias(){
    //    return $this->hasMany(Emergencia::class);
    //}
}
