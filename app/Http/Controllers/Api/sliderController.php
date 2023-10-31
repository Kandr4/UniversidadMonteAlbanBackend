<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Post;

class sliderController extends Controller
{
    public function showSlider(Request $request){
        $allPosts = Post::all($columns = ['id','title','description','legend','img']);
        $postsArray = $allPosts->toArray();
        //var_dump($allPosts);
        return response()->json($postsArray);
    }
}
