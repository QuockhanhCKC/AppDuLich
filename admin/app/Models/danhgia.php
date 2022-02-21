<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class danhgia extends Model
{
    protected $fillable
    =[
    'Noidung','NgayDang','iduser','idDiadanh',
    ];
    protected $primaryKey='id';
    protected $table='danhgias';
}
