<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDiaDanhsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('dia_danhs', function (Blueprint $table) {
            $table->Increments('id')->unsigned();
            $table->string('name')->nullable();
            $table->longText('mota')->nullable();
            $table->string('imageDiadanh')->nullable();
            $table->integer('status');
            $table->string('khuvuc')->nullable();
            $table->string('diachi')->nullable();
            $table->string('loai')->nullable();
            $table->integer('toaDo')->nullable();;
            $table->integer('LuotLike');
            $table->integer('DisLike');
            $table->integer('luot_xem');
            $table->foreign('imageDiadanh')->references('idImage')->on('imagediadanhs');
            $table->foreign('toaDo')->references('id')->on('addresses');
            $table->foreign('khuvuc')->references('id')->on('khuvucs');
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
        Schema::dropIfExists('dia_danhs');
    }
}
