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
        $newPost = new Post();
        $user = User::where('cookie',$request->cookie)->first();
        $newPost->title = $request->title;
        $newPost->legend = $request->legend;
        $newPost->description = $request->description;
        $newPost->idUser = $user->id;
        $image = $request->file('image');
        $newPost->img = Controller::convertToWebp($image,'post');
        if ($request->hasFile('file')) {
            $request->validate([
                'file' => 'required|file|mimes:jpg,png,gif,pdf,docx,xlsx,pptx,txt,csv,jpeg,bmp,webp'
            ]);
            $newPost->route = $this->filemanage($request->file('file'));
        }
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

    public function filemanage($file){
        $nameFile = uniqid();
        $extensionFile = '.' . $file->getClientOriginalExtension();
        $file->storeAs('public/',$nameFile.$extensionFile);
        $storageRoute = storage_path('app/public/'.$nameFile.$extensionFile);
        $publicRoute = public_path('documents/'.$nameFile.$extensionFile);
        File::move($storageRoute,$publicRoute);
        Storage::delete($storageRoute);
        return $nameFile.$extensionFile;
    }
}
