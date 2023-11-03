<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Post;

class sliderController extends Controller
{
    public function showSlider(Request $request){
        $allPosts = Post::select('id','title','description','legend','img')
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
        });
        $postsArray = $allPosts->toArray();
        //var_dump($allPosts);
        return response()->json($postsArray);
    }
}
