<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Coment;
use App\Models\User;

class ComentController extends Controller
{
    public function obtenerComentarios(Request $request, $id_post){
        $comentarios = Coment::select('coments.id', 'coments.content', 'users.username', 'users.cookie')
        ->join('users', 'coments.idUser', '=', 'users.id')  
        ->where('coments.idPost', $id_post)
        ->get();
        return response()->json($comentarios);
    }

    public function addComent(Request $request){
        $newComent = new Coment();
        $user = User::where('cookie',$request->cookie)->first();
        $newComent->idUser = $user->id;
        $newComent->idPost = $request->id_post;
        $newComent->content = $request->coment;
        $newComent->status = 1;
        if($newComent->save()){
            $success = true;
            $contentSaved = Coment::select('coments.content')->where('coments.id',$newComent->id)->first();
        }else{
            $success = false;
        }
        return response()->json([
            'success' => $success,
            'content' => $contentSaved->content
        ]);
    }

    public function editComent(Request $request){
        $coment = Coment::find($request->id_coment);
        $user = User::where('cookie',$request->cookie)->first();
        //La cookie que me está mandando, corresponde con la cookie del creador del comentario?
        if($coment->idUser == $user->id){
            $coment->content = $request->coment;
            if($coment->save()){
                $success = true;
                $contentSaved = $coment->content;
            }
            else {
                $success = false;
                $contentSaved = 'Fallo en la base de datos';
            }
        }else {
            $success = false;
            $contentSaved = 'Denegación por cookie';
        }
        return response()->json([
            'success' => $success,
            'coment' => $contentSaved
        ]);
        
    }
}
