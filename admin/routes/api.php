<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DiaDanhController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\DichvuController;
use App\Http\Controllers\CommentController;
use App\Http\Controllers\KhuvucController;
use App\Http\Controllers\DanhgiaController;
use App\Http\Controllers\imagediadanhController;
use App\Http\Controllers\ImageDichvuController;
use App\Http\Controllers\AddressController;
use Illuminate\Auth\Events\Login;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::resource('/Diadanh',DiaDanhController::class);
Route::resource('/Dichvu',DichvuController::class);
Route::get('/Dichvu/loai/{name}',[DichvuController::class,'showloai']);
Route::get('/Diadanh/loai/{name}',[DiaDanhController::class,'showloai']);
Route::resource('/User',Usercontroller::class);
Route::resource('/Post',PostController::class);
Route::get('/Post/{id}/Comment',[PostController::class,'showcomment']);
Route::get('/User/{id}/Post',[PostController::class,'show_Post']);
Route::post('/User/login',[Usercontroller::class,'login']);
Route::post('/User/register',[Usercontroller::class,'store']);
Route::post('/User/refresh_token',[Usercontroller::class,'refreshtoken']);
Route::post('/User/update',[Usercontroller::class,'update_image']);

Route::put('/User/update_user/{id}',[Usercontroller::class,'update_user']);
Route::resource('/Khuvuc',KhuvucController::class);
Route::get('/Diadanh/{id}/Danhgia',[DiaDanhController::class,'showDanhgia']);
Route::resource('/Address',AddressController::class);