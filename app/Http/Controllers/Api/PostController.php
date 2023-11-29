<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Post;
use App\Models\User;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;

class PostController extends Controller
{
    public function createPost(Request $request){
        $newPost = new Post();
        $user = User::where('cookie',$request->cookie)->first();
        if ($user->role >=2) {
            $request->validate([
                'image'=>'required|image'
            ]);
            if ($request->hasFile('file')) {
                $request->validate([
                    'file' => 'required|file|mimes:jpg,png,gif,pdf,docx,xlsx,pptx,txt,csv,jpeg,bmp,webp'
                ]);
                $newPost->route = $this->filemanage($request->file('file'));
            }
            $newPost->title = $request->title;
            $newPost->legend = $request->legend;
            $newPost->description = $request->description;
            $newPost->idUser = $user->id;
            $image = $request->file('image');
            $newPost->img = Controller::convertToWebp($image,'post');
            if($newPost->save()){
                $success = true;
            }
            else{
                $success = false;
            }
        }else{
            $success = false;
        }
        return response()->json([
            'success' => $success,
        ]);
    }

    public function deletePost(Request $request, $id_post){
        $post = Post::find($id_post);
        $user = User::where('cookie',$request->cookie)->first();
        if($user->role >= 2){
            File::delete(public_path("images/post/$post->img"));
            if (!($post->route === null)) {
                File::delete(public_path("documents/$post->route"));
            }
            $post->delete();
            $success = true;
        }else{
            $success = false;
        }
        return response()->json([
            'success'=>$success
        ]);
    }

    public function editPost(Request $request, $id_post){
        $editedPost = Post::find($id_post);
        $user = User::where('cookie',$request->cookie)->first();
        if($user->role >= 2){
            if ($request->hasFile('image')) {
                $request->validate([
                    'image'=>'required||image'
                ]);
                File::delete(public_path("images/post/$editedPost->img"));
                $image = $request->file('image');
                $editedPost->img = Controller::convertToWebp($image,'post');
            }
            if ($request->hasFile('file')) {
                $request->validate([
                    'file' => 'required|file|mimes:jpg,png,gif,pdf,docx,xlsx,pptx,txt,csv,jpeg,bmp,webp'
                ]);
                if (!($editedPost->route === null)) {
                    File::delete(public_path("documents/$editedPost->route"));
                }
                $editedPost->route = $this->filemanage($request->file('file'));
            }
            if ($request->has('eliminarArchivo')) {
                File::delete(public_path("documents/$editedPost->route"));
                $editedPost->route = null;
            }
            $editedPost->title = $request->title;
            $editedPost->legend = $request->legend;
            $editedPost->description = $request->description;
            $editedPost->idUser = $user->id;
            if($editedPost->save()){
                $success = true;
            }
            else{
                $success = false;
            }
        }else{
            $success = false;
        }
        return response()->json([
            'success'=>$success
        ]);
    }

    public function searchPost(Request $request){
        $titleToSearch = $request->input('search');
        $testimoniesFound = Post::select('id','title','description','legend','img','route')
        ->where('title','like',"%$titleToSearch%")
        ->get()
        ->map(function ($item) {
            return array_filter([
                'id' => $item->id,
                'title' => $item->title,
                'description' => $item->description,
                'legend' => $item->legend,
                'img' => $item->img,
                'route' => $item->route, // Añadir solo si no es nulo
            ]);
        })
        ->toArray();
        return response()->json($testimoniesFound);
    }

    public function getPost(Request $request){
        $post = Post::find($request->input('id_post'));
        if($post){
            return response()->json($post->toArray());
        }else{
            return response()->json(null);
        }
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
