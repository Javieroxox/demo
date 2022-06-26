<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\{Schema,DB};


class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {

        // Borrar tablas
        $tablas = ['rangos','ninos','educadoras'];
        Schema::disableForeignKeyConstraints();
        foreach($tablas as $tabla){
            DB::table($tabla)->truncate();
        }
        Schema::enableForeignKeyConstraints();

        //rangos
        $rangos = [
            ['nombre'=>'Sala Cuna Menor'],
            ['nombre'=>'Sala Cuna Mayor'],
            ['nombre'=>'Nivel Medio Menor'],
            ['nombre'=>'Nivel Medio Mayor'],
            ['nombre'=>'Primer  Nivel de Transición'],
            ['nombre'=>'Segundo Nivel de Transición'],
        ];

        foreach($rangos as $rango){
            DB::table('rangos')->insert([
                'nombre' => $rango['nombre'],
            ]);
        }

        //ninos
        $ninos = [
            ['rut'=>'19612159-5','nombre'=>'Pedro','apellido'=>'Reyes','id_rango'=>'4'],
            ['rut'=>'6528305-0','nombre'=>'Claudio','apellido'=>'Rojas','id_rango'=>'1'],
            ['rut'=>'22906905-5','nombre'=>'Felipe','apellido'=>'Carmen','id_rango'=>'3'],
            ['rut'=>'24997935-k','nombre'=>'Carlos','apellido'=>'Pulgar','id_rango'=>'6'],
        ];

        foreach($ninos as $nino){
            DB::table('ninos')->insert([
                'rut' => $nino['rut'],
                'nombre' => $nino['nombre'],
                'apellido' => $nino['apellido'],
                'id_rango' => $nino['id_rango'],
            ]);
        }

        //educadoras
        $educadoras = [
            ['rut'=>'7980740-0','nombre'=>'Victoria','apellido'=>'Torres','id_rango'=>'2'],
            ['rut'=>'14786476-0','nombre'=>'Rosa','apellido'=>'Maturana','id_rango'=>'5'],
            ['rut'=>'19517163-7','nombre'=>'Roberta','apellido'=>'Anaty','id_rango'=>'1'],
            ['rut'=>'17103132-k','nombre'=>'Ely','apellido'=>'Martines','id_rango'=>'2'],
        ];

        foreach($educadoras as $educadora){
            DB::table('educadoras')->insert([
                'rut' => $educadora['rut'],
                'nombre' => $educadora['nombre'],
                'apellido' => $educadora['apellido'],
                'id_rango' => $educadora['id_rango'],
            ]);
        }

        //emergencias

    }
}
