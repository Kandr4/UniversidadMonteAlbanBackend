<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Post;
use App\Models\User;
use Intervention\Image\ImageManagerStatic as Image;

class PostController extends Controller
{
    public function createPost(Request $request){
        $request->validate([
            'image'=>'required|image'
        ]);
        $newPost = new Post();
        $user = User::where('cookie',$request->cookie)->first();
        $newPost->title = $request->title;
        $newPost->legend = $request->legend;
        $newPost->description = $request->description;
        $newPost->route = 'En proceso';
        $newPost->idUser = $user->id;
        $image = $request->file('image');
        $nameFile = uniqid();
        $extension = '.'.$image->getClientOriginalExtension();
        $image->storeAs('public/',$nameFile.$extension);
        $storageRoute = storage_path('app/public/'.$nameFile.$extension);
        $publicRoute = public_path("images/post/$nameFile.webp");
        $imagenWebp = Image::make($storageRoute);
        $imagenWebp->encode('webp',90);
        $imagenWebp->save($publicRoute);
        //$newTestimonial->img = pathinfo($publicRoute, PATHINFO_FILENAME) . '.webp';
        $newPost->img = $nameFile.'.webp';
        if($newPost->save()){
            $success = true;
        }
        else{
            $success = false;
        }
        return response()->json([
            'success' => $success,
        ]);
    }
}
