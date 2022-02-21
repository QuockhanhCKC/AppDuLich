<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePostsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('posts', function (Blueprint $table) {
            $table->Increments('id')->unsigned();
            $table->string('Noidung')->nullable();;
            $table->date('Ngaydang')->nullable();;
            $table->integer('LuotLike')->nullable();;
            $table->integer('DisLike')->nullable();
            $table->integer('luot_xem')->nullable();;
            $table->integer('iduser');
            $table->string('statust');
            $table->string('image')->nullable();;
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
        Schema::dropIfExists('posts');
    }
}
