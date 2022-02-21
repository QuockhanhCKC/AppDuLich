<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DiaDanh extends Model
{
   protected $fillable
   =[
    'name','mota','imageDiadanh','status','khuvuc','diachi','loai','toaDo','Luotlike','DisLike','luot_xem'
   ];
   protected $primaryKey='id';
   protected $table='dia_danhs';
}
