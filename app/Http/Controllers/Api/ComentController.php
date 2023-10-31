<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Coment;

class ComentController extends Controller
{
    public function obtenerComentarios(Request $request, $id_post){
        $comentarios = Coment::select('coments.id', 'coments.content', 'users.username', 'users.cookie')
        ->join('users', 'coments.idUser', '=', 'users.id')  
        ->where('coments.idPost', $id_post)
        ->get();
        return response()->json($comentarios);
    }
}
