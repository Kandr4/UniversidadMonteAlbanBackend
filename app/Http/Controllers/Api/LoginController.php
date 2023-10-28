<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\User;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function login(Request $request){
        $this->validateLogin($request);

        //Login true
        if (Auth::attempt($request->only('username','password'))) {
            return response()->json([
                'cookie'=> $request->user()->createToken($request->username)->plainTextToken,
                'role'=>'2' 
            ]);
        }
        //Login false
        return response()->json([
            'message'=>'Unauthorized'
        ], 401);
    }

    public function validateLogin(Request $request){
        return $request->validate([
            'username'=>'required',
            'password'=>'required',
        ]);
    }
}
