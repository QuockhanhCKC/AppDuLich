<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCommentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('comments', function (Blueprint $table) {
            $table->Increments('id')->unsigned();
            $table->string('Noidung')->nullable();;
            $table->date('Ngaydang')->nullable();;
            $table->integer('iduser');
            $table->integer('idpost');
            $table->foreign('idpost')->references('id')->on('Posts');
            $table->foreign('iduser')->references('id')->on('Users');
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
        Schema::dropIfExists('comments');
    }
}
