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
            ['rut'=>'19612159-5','nombre'=>'Pedro','apellido'=>'Reyes','id_rango'=>'4'], //'imagen' => asset('img/default_usuario.png')
            ['rut'=>'6528305-0','nombre'=>'Claudio','apellido'=>'Rojas','id_rango'=>'1'],
            ['rut'=>'22906905-5','nombre'=>'Felipe','apellido'=>'Carmen','id_rango'=>'3'],
            ['rut'=>'24997935-k','nombre'=>'Carlos','apellido'=>'Pulgar','id_rango'=>'6'],
            ['rut'=>'20224019-4','nombre'=>'Maria','apellido'=>'Antunez','id_rango'=>'4'],
            ['rut'=>'18100835-0','nombre'=>'Berta','apellido'=>'Alarcon','id_rango'=>'4'],
            ['rut'=>'23367071-5','nombre'=>'Marina','apellido'=>'Cerda','id_rango'=>'1'],
            ['rut'=>'15575864-3','nombre'=>'Ainara','apellido'=>'Caceres','id_rango'=>'2'],
            ['rut'=>'20708564-2','nombre'=>'Aurora','apellido'=>'Plasencia','id_rango'=>'5'],
            ['rut'=>'5834884-8','nombre'=>'Micaela','apellido'=>'Antunez','id_rango'=>'5'],
            ['rut'=>'17752873-0','nombre'=>'Carmelo','apellido'=>'Egea','id_rango'=>'3'],
            ['rut'=>'21125288-k','nombre'=>'Rayan','apellido'=>'Blanco','id_rango'=>'2'],
            ['rut'=>'20156732-7','nombre'=>'Ander','apellido'=>'Morilla','id_rango'=>'1'],
            ['rut'=>'12406129-6','nombre'=>'Noel','apellido'=>'Machado','id_rango'=>'1'],
            ['rut'=>'7331724-k','nombre'=>'Bruno','apellido'=>'Rico','id_rango'=>'6'],
            ['rut'=>'9211801-0','nombre'=>'Luis','apellido'=>'Adan','id_rango'=>'6'],
            ['rut'=>'19534761-1','nombre'=>'Chloe','apellido'=>'Castillo','id_rango'=>'5'],
            ['rut'=>'23131011-8','nombre'=>'Teresa','apellido'=>'Campo','id_rango'=>'4'],
            ['rut'=>'17663608-4','nombre'=>'Alejandra','apellido'=>'Hernandez','id_rango'=>'3'],
            ['rut'=>'5747615-k','nombre'=>'Samira','apellido'=>'Marrero','id_rango'=>'5'],
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
            ['rut'=>'17103132-k','nombre'=>'Ely','apellido'=>'Martines','id_rango'=>'3'],
            ['rut'=>'20267494-1','nombre'=>'Paulina','apellido'=>'Bravo','id_rango'=>'4'],
            ['rut'=>'9137944-9','nombre'=>'Marisol','apellido'=>'Avila','id_rango'=>'6'],
            ['rut'=>'17561954-2','nombre'=>'Carol','apellido'=>'Salinas','id_rango'=>'3'],
            ['rut'=>'8358721-0','nombre'=>'Noemi','apellido'=>'Juares','id_rango'=>'4'],
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
        $emergencias = [
        ];

        foreach($emergencias as $emergencia){
            DB::table('emergencias')->insert([
                'descripcion' => $rango['descripcion'],
            ]);
        }
    }
}
