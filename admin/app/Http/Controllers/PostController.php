<?php

namespace App\Http\Controllers;
use App\Models\Post;
use App\Http\Resources\PostResource;
use App\Models\comment;
use App\Http\Resources\CommentResource;
use Illuminate\Http\Request;

class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Post::Where('statust','=',1)->orderBy('id', 'desc')->get();
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
        $image =$request->file('image');
        if($request ->hasFile('image')){
            $new =rand().'.'.$image->getClientOriginalExtension();
            $image->move(public_path('uploads/images'),$new);
         $post=new Post([ 
            'NoiDung'=>$request->noidung,
          
            'Luotlike'=>0,
            'DisLike'=>0,
            'luot_xem'=>0,
            'iduser'=>$request->iduser,
            'statust'=>1,
            
            'idDiadanh'=>$request->idDiadanh,
            'image'=>'http://10.0.2.2:8000/uploads/images/'.$new,
            ]
         );
         $post->save();
         return response()->json([
            
            'data'=>$post,
         ],200);
        }
        
       
       
        
     
        return response()->json([
            
           'mess'=>"lỗi ",
        ],400);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
       return Post::findOrFail($id);
        
    }
    public function showcomment($id)
    {
       
        
        
        return comment::Where('idpost', '=',$id )->get();
       
    } 
    public function show_Post($id)
    {
        return Post::Where('iduser','=',$id)->get();
    }
    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
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
