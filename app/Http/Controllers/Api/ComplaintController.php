<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Mail\ComplaintMailable;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Complaint;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Mail;

class ComplaintController extends Controller
{
    public function createComplaint(Request $request){
        $newComplaint = new Complaint();
        $newComplaint->name = $request->name;
        $newComplaint->email = $request->email;
        $newComplaint->content = $request->content;
        $url = Str::random(40);
        $newComplaint->url = $url;
        $url = "http://127.0.0.1:8000/api/complaint/$url";
        Mail::to($request->email)->send(new ComplaintMailable("¡Gracias por tu sugerencia", $url));
        if ($newComplaint->save()) {
            $success = true;
        } else {
            $success = false;
        }
        
        return response()->json([
            'success' => $success
        ]);
    }

    public function getComplaints(Request $request){
        $admin = User::where('cookie', $request->cookie)->first();
        if ($admin) {
            if (($admin->role) >=  2){
                $complaints = Complaint::all();
                return response()->json($complaints->toArray());
            } else {
                $success = false;
            }
        } else {
            $success = false;
        }
        return response()->json([
            'success' => $success
        ]);
    }

    public function getComplaintByUrl(Request $request, $url){
        $complaint = Complaint::where('url', $url)->first();
        return response()->json($complaint->toArray());
    }

    

    public function searchComplaint(Request $request, $name){
        $admin = User::where('cookie', $request->cookie)->first();
        if ($admin) {
            if ($admin->role >= 2) {
                $complaints = Complaint::where('name', 'LIKE', "%$name%")->get();
                return response()->json($complaints->toArray());
            } else {
                $success = false;
            }
            
        } else {
            $success = false;
        }
        return response()->json([
            'success' => $success
        ]);
    }

    public function deleteComplaint(Request $request, $url){
        $complaint = Complaint::where('url', $url)->first();
        if ($complaint) {
            if ($complaint->delete()) {
                $success = true;
            } else {
                $success = false;
            }
        } else {
            $success = false;
        }
        return response()->json([
            'success' => $success
        ]);
    }

    public function editComplaint(Request $request, $url){
        $complaint = Complaint::where('url', $url)->first();
        if ($complaint) {
            $complaint->name = $request->name;
            $complaint->email = $request->email;
            $complaint->content = $request->content;
            if ($complaint->save()) {
                $success = true;
            } else {
                $success = false;
            }
        } else {
            $success = false;
        }
        return response()->json([
            'success' => $success
        ]);
    }
    public function checkComplaint(Request $request, $id){
        $admin = User::where('cookie', $request->cookie)->first();
        if ($admin) {
            if ($admin->role >= 2) {
                $complaint = Complaint::where('id', $id)->first();
                if ($complaint) {
                    $complaint->checked = true;
                    if ($complaint->save()) {
                        $success = true;
                    } else {
                        $success = false;
                    }
                } else {
                    $success = false;
                }
            }else{
                $success = false;
            }
        }else{
            $success = false;
        }
        return response()->json([
            'success' => $success
        ]);
    }

    /*public function sendEmail(Request $request, $url){
        $request->validate([
            'email' => 'required|email'
        ]);

        Mail::to($$request->email)->send(new \App\Mail\ComplaintMailable($url));
    }*/
}
