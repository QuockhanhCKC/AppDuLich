<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class imagedichvu extends Model
{
    protected $fillable
    =[
    'url',
    ];
    protected $primaryKey='idimage';
    protected $table='imagedichvus';
}
