<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class MailController extends Controller
{
    public function enviarCorreo(Request $request)
    {
        // Valida los datos de la petición (ajústalo según tus necesidades)
        $request->validate([
            'email' => 'required|email',
            'name' => 'required',
            'content' => 'required',
        ]);

        // Datos de la petición
        $destinatario = $request->input('destinatario');
        $asunto = $request->input('asunto');
        $mensaje = $request->input('mensaje');

        // Envia el correo
        Mail::to($destinatario)->send(new \App\Mail\CorreoEjemplo($asunto, $mensaje));

        return response()->json(['mensaje' => 'Correo enviado correctamente']);
    }
}
