<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ninos', function (Blueprint $table) {
            $table->string('rut')->primary();
            $table->string('nombre');
			$table->string('apellido');
			$table->unsignedBigInteger('id_rango');
            $table->string('imagen');
			$table->foreign('id_rango')->references('id')->on('rangos');
			$table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('ninos');
    }
};
