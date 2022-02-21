<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    protected $fillable
    =[
     'NoiDung','NgayDang','Luotlike','DisLike','luot_xem','iduser','statust','image','idDiadanh'
    ];
    protected $primaryKey='id';
    protected $table='Posts';
}
