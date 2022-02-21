<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDichvusTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('dichvus', function (Blueprint $table) {
            $table->Increments('id')->unsigned();
            $table->string('name')->nullable();;
            $table->longText('mota')->nullable();;
            $table->string('imagedichvu')->nullable();;
            $table->integer('status')->nullable();;
            $table->string('khuvuc')->nullable();;
            $table->string('diachi')->nullable();;
            $table->string('loai')->nullable();;
            $table->integer('toaDo')->nullable();;
            $table->integer('LuotLike');
            $table->integer('DisLike');
            $table->integer('luot_xem');
            $table->timestamps();
            $table->foreign('imagedichvu')->references('idImage')->on('imagedichvus');
            $table->foreign('toaDo')->references('id')->on('addresses');
            $table->foreign('khuvuc')->references('id')->on('khuvucs');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('dichvus');
    }
}
