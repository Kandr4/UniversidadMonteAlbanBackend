<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Hash;

class LoginController extends Controller
{
    public function login(Request $request){
        $this->validateLogin($request);

        //Login true
        if (Auth::attempt($request->only('username','password')) || $this->validateEmail($request)) {
            //Obtiene el usuario para obtener su rol
            $usuario = User::where('username',$request->username)->first();
            if (!$usuario) {
                $usuario = User::where('email',$request->username)->first();
            }
            //Crea la sessionCookie
            $token = Str::random(40);
            //$sessionCookie = cookie('cookieSesion',$token,60);
            //Guardando la cookie en la BD
            $usuario->cookie = $token;
            $usuario->save();
            return response()
            ->json([
                'cookie'=> $token,
                'role'=> $usuario->role, 
                'username' => $usuario->username
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

    public function validateEmail(Request $request){
        $user = User::where('email', $request->username)->first();
        if ($user) {
            return Hash::check(request('password'), $user->password);
        }
        return false;
    }
}
