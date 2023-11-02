<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Post;
use App\Models\User;
use Intervention\Image\ImageManagerStatic as Image;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;

class PostController extends Controller
{
    public function createPost(Request $request){
        $request->validate([
            'image'=>'required|image'
        ]);
        if ($request->hasFile('file')) {
            $request->validate([
                'file' => 'required|file|mimes|jpg,png,gif,pdf,docx,xlsx,pptx,txt,csv,jpeg,bmp,webp'
            ]);
            $SecureFile = true;
            $newFile = $request->file('file');
            $nameFile = uniqid();
            $extensionFile = '.' . $newFile->getClientOriginalExtension();
            $newFile->storeAs('public/',$nameFile.$extensionFile);
            $storageRoute = storage_path('app/public/'.$nameFile.$extensionFile);
            $publicRoute = public_path('documents/post/'.$nameFile.$extensionFile);
            File::move($storageRoute,$publicRoute);
            Storage::delete($storageRoute);
        }else {
            $SecureFile = true;
        }
        if ($SecureFile == true) {
            $newPost = new Post();
            $user = User::where('cookie',$request->cookie)->first();
            $newPost->title = $request->title;
            $newPost->legend = $request->legend;
            $newPost->description = $request->description;
            $newPost->route = 'En proceso';
            $newPost->idUser = $user->id;
            $image = $request->file('image');
            $nameImage = uniqid();
            $extensionImage = '.'.$image->getClientOriginalExtension();
            $image->storeAs('public/',$nameImage.$extensionImage);
            $storageRoute = storage_path('app/public/'.$nameImage.$extensionImage);
            $publicRoute = public_path("images/post/$nameImage.webp");
            $imagenWebp = Image::make($storageRoute);
            $imagenWebp->encode('webp',90);
            $imagenWebp->save($publicRoute);
            $newPost->img = $nameImage.'.webp';

            //Eliminando el archivo de la carpeta storage
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
}
