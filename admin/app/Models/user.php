<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class user extends Authenticatable
{
    use HasFactory, Notifiable;
    protected $fillable
   =[
    'name','email','password','status','avatar','Quyen','old','phone'
   ];
   protected $primaryKey='id';
   protected $table='users';
}
