<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Admission;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class AdmissionController extends Controller
{
    public function createAdmission(Request $request){
        $newAdmisssion = new Admission();
        $newAdmisssion->name = $request->name;
        $newAdmisssion->email = $request->email;
        $newAdmisssion->content = $request->content;
        $newAdmisssion->idCareer = $request->idCareer;
        $url = Str::random(40);
        $newAdmisssion->url = $url;
        if ($newAdmisssion->save()) {
            $success = true;
        } else {
            $success = false;
        }
        
        return response()->json([
            'success' => $success
        ]);
    }

    public function getAdmissions(Request $request){
        $admin = User::where('cookie', $request->cookie)->first();
        if ($admin) {
            if (($admin->role) >=  2){
                $admissions = Admission::all();
                return response()->json($admissions->toArray());
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

    public function getAdmissionByUrl(Request $request, $url){
        $admission = Admission::select('id', 'name', 'email', 'content', 'idCareer', 'response')
        ->where('url', $url)  // Agrega esta línea para filtrar solo si response no es nulo
        ->first();
        return response()->json($admission->toArray());
    }

    public function deleteAdmission(Request $request, $url){
        $admission = Admission::where('url', $url)->first();
        if ($admission) {
            if ($admission->delete()) {
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

    public function editAdmission(Request $request, $url){
        $admission = Admission::where('url', $url)->first();
        if ($admission) {
            $admission->name = $request->name;
            $admission->email = $request->email;
            $admission->content = $request->content;
            $admission->idCareer = $request->idCareer;
            if ($admission->save()) {
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

    public function checkAdmission(Request $request, $id){
        $admin = User::where('cookie', $request->cookie)->first();
        if ($admin) {
            if ($admin->role >= 2) {
                $admission = Admission::where('id', $id)->first();
                if ($admission) {
                    $admission->checked = true;
                    if ($admission->save()) {
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

    public function respondAdmission(Request $request){
        $admin = User::where('cookie',$request->cookie)->first();
        if ($admin) {
            if (($admin->role) >= 2) {
                $admission = Admission::find($request->id);
                if ($admission) {
                    $admission->response = $request->response;
                    if($admission->save()){
                        $success = true;
                    }else{
                        $success = false;
                    }
                } else {
                    $success = false;
                }
                
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
}
