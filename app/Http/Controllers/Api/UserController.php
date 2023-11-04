<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Str;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        
    }

    /**
     * Show the form for creating a new resource.
     */
    public function registerUser(Request $request){
        try {
            $this->validate($request, [
                'username' => 'required|unique:users',
            ]);
            $newUser = new User();
            $newUser->username = $request->username;
            $newUser->password = $request->password;
            $newUser->role = 1;
            $cookie = Str::random(40);
            $newUser->cookie = $cookie;
            $newUser->verified = true;
            $newUser->save();
            $success = true;
        } catch (ValidationException $e) {
            $success = false;
            $cookie = '';
        }
        return response()->json([
            'success'=> $success,
            'cookie'=>$cookie,
        ]);
    }

    public function changeRole(Request $request, $id_user){
        $user = User::find($id_user);
        $admin = User::where('cookie',$request->cookie)->first();
        if ($admin) {
            if ($admin->role == 3) {
                $user->role = $request->role;
                $user->save();
                $success = true;
            }else {
                $success = false;
            }
        }else{
            $success = false;
        }
        return response()->json([
            'success'=> $success,
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function searchUser(Request $request){
        $username = $request->input('search');
        $usersFound = User::select('id','username','role')
        ->where('username','like',"%$username%")
        ->get()
        ->toArray();
        return response()->json($usersFound);
    }

    public function deleteUser(Request $request, $id_user){
        $user = User::find($id_user);
        $admin = User::where('cookie',$request->cookie)->first();
        if ($admin) {
            if ($admin->role == 3) {
                $user->delete();
                $success = true;
            }else{
                $success = false;
            }
        }else{
            $success = false;
        }
        return response()->json([
            'success'=> $success
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(User $user)
    {
        
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(User $user)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, User $user)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(User $user)
    {
        //
    }
}
