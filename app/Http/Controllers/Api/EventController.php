<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Event;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Post;


class EventController extends Controller
{
    public function createEvent(Request $request){
        $admin = User::where('cookie',$request->cookie)->first();
        if ($admin) {
            if ($admin->role >= 2) {
                $newEvent = new Event();
                $newEvent->eventName = $request->event;
                $newEvent->description = $request->description;
                $newEvent->date = $request->date;
                $newEvent->type = $request->type;
                $newEvent->idUser = $admin->id;
                if ($request->has('post')){
                    $newEvent->idPost = $request->post;
                }
                $newEvent->save();
                $success = true;
                $message = "Evento creado con éxito";
            } else {
                $success = false;
                $message = "no tienes permisos para realizar esta acción";
            }
        } else {
            $success = false;
            $message = "tu sesión es inválida";
        }
        return response()->json([
            'success'=>$success,
            'message'=>$message,
        ]);
    }

    public function searchEvent(){
        $events = Event::all();
        return response()->json($events->toArray());
    }

    public function editEvent(Request $request, $id_event){
        $admin = User::where('cookie',$request->cookie)->first();
        if ($admin) {
            if ($admin->role >= 2) {
                $editedEvent = Event::find($id_event);
                $editedEvent->eventName = $request->event;
                $editedEvent->description = $request->description;
                $editedEvent->date = $request->date;
                $editedEvent->type = $request->type;
                if ($request->has('post')) {
                    $editedEvent->idPost = $request->post;
                }
                if ($request->has('eliminarPost')) {
                    $editedEvent->idPost = null;
                }
                $editedEvent->save();
                $success = true;
            } else {
                $success = false;
            }
        } else {
            $success = false;
        }
        return response()->json([
            'success' => $success,
        ]);
    }

    public function deleteEvent(Request $request, $id_event){
        $admin = User::where('cookie',$request->cookie)->first();
        if ($admin) {
            if ($admin->role >= 2) {
                $event = Event::find($id_event);
                $event->delete();
                $success = true;
            } else {
                $success = false;
            }
        } else {
            $success = false;
        }
        return response()->json([
            'success'=>$success,
        ]);
    }
}
