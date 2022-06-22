<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Emergencia extends Model
{
    use HasFactory,SoftDeletes;

    protected $table = 'rangos';
    public $timestamps = false;

}
