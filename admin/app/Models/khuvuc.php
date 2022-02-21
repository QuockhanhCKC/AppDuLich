<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class khuvuc extends Model
{
    protected $fillable
    =[
    'Ten','MakhuVuc'
    ];
    protected $primaryKey='id';
    protected $table='khuvucs';
}
