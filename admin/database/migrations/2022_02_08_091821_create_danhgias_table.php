<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDanhgiasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('danhgias', function (Blueprint $table) {
            $table->Increments('id')->unsigned();
            $table->string('Noidung')->nullable();;
            $table->date('Ngaydang')->nullable();;
            $table->integer('iduser');
            $table->integer('idDiadanh');
            $table->foreign('idDiadanh')->references('id')->on('dia_danhs');
            $table->foreign('iduser')->references('id')->on('users');
            $table->timestamps();
           
            
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('danhgias');
    }
}
