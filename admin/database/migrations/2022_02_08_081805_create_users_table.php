<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->Increments('id')->unsigned();
            $table->string('name')->nullable();
            $table->string('email');
            $table->text('password');
            $table->integer('status')->nullable();
            $table->string('avatar')->nullable();
            $table->string('old')->nullable();
            $table->string('phone')->nullable();
            $table->string('Quyen');
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
        Schema::dropIfExists('users');
    }
}
