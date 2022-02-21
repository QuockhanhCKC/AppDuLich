<?php

namespace App\Http\Controllers;
use App\Models\DiaDanh;
use App\Http\Resources\DiaDanhResoucre;
use App\Models\danhgia;
use App\Http\Resources\DanhgiaResource;
use Illuminate\Http\Request;

class DiaDanhController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
      return DiaDanh::all();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
      
        return   Diadanh::findOrFail($id);
    }
    public function showloai($name)
    {
        return DiaDanh::where('loai', 'like',$name )->get();
    }
    public function showDanhgia($id)
    {
       
        
        
       return danhgia::Where('idDiadanh', '=',$id )->get();
       
    } 
    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
       
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
