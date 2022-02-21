<?php

namespace App\Http\Controllers;
use App\Models\user;

use App\Models\SessionUser;
use Illuminate\Foundation\Auth\User as AuthUser;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class Usercontroller extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(){
        return User::all();
    }
 

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create() {
      
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request){
        $request->validate([
            'name'=>'required|string',
            'email'=>'required|string|unique:users',
            'password'=>'required|string|min:6'
        ]);
        $user = new user([
            'name'=>$request->name,
            'email'=>$request->email,
            'Quyen'=>'user',
            'status'=>1,
            'password'=>Hash::make($request->password)
        ]);
        $user->save();
       //$token =$user->createToken('')->plainTextToken();
        return response()->json([
            'code'=>200,
           'data'=> $user,
        ],200);
    }
    public function login(Request $request){
       $checklogin=['email' => $request->email, 'password' => $request->password, 'status' => 1];
       
        if (Auth::attempt($checklogin)) {
            $checktoken =SessionUser::where('user_id','=',Auth::id())->first();
           $user =Auth::id();
           if(empty( $checktoken)){
            $usersession= SessionUser::create([
            'token'=>Str::random(40),
            'refresh_token'=>Str::random(40),
            'token_expried'=>date('Y-m-d H:i:s', strtotime('+1 day')),
            'refresh_token_expried'=>date('Y-m-d H:i:s', strtotime('+7 day')),
            'user_id'=>Auth::id(),
           ]);
        } else {
            $usersession = $checktoken;
        }
        return response()->json([
           'id'=> $user
           
         ],200
        );
        } 
        else{
            return response()->json([
            'code'=>401,
        'message'=>'khong the dang nhap',
        ],401
        );
        }
     
    }
    public function refreshtoken(Request $request){
            $token =$request->header('token');
            $checktokenvalid= SessionUser::where('token','=',$token)->first();
            if(!empty($checktokenvalid)){
                if($checktokenvalid->token_expried<time()){
                    $checktokenvalid->update([
                        'token'=>Str::random(40),
                        'refresh_token'=>Str::random(40),
                        'token_expried'=>date('Y-m-d H:i:s', strtotime('+1 day')),
                        'refresh_token_expried'=>date('Y-m-d H:i:s', strtotime('+7 day')),
                        'user_id'=>Auth::id(),
                    ]);
                }
            }
            $dataSession =SessionUser::find($checktokenvalid->id);
            return response()->json([
                'code'=>200,
                'data'=>$dataSession,
                'Message'=>'Refresh token sucess'
            ],200);

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return User::findOrFail($id);
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
    public function update_user(Request $request, $id)
    {
        $request->validate([
            'phone'=>'required|string',
            'old'=>'required|string',
            'name'=>'required|string'
        ]);
        
        $user= User::findOrFail($id);
        if(!empty($user)){
        $user->name=$request->name;
        $user->old=$request->old;
        $user->phone=$request->phone;
        $image =$request->file('avatar');
        if($request ->hasFile('avatar')){
            $new =rand().'.'.$image->getClientOriginalExtension();
            $image->move(public_path('uploads/images'),$new);
        $user->avatar='http://192.168.1.8:8000/uploads/images/'.$new;
       
        }
        $user->save();
        return response()->json([
            'code'=>200,
           'data'=> $user,
        ],200);
        }
        return response()->json([
            
           'mess'=>"lỗi ",
        ],400);
    }
    public function update_image(Request $request)
    {
       
        return  response()->json('image null');
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
