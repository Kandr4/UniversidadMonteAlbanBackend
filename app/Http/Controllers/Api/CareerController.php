<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Career;
use App\Models\Subject;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Database\Eloquent\Casts\Json;

class CareerController extends Controller
{
    public function createCareer(Request $request){
        $admin = User::where('cookie',$request->cookie)->first();
        if ($admin) {
            if ($admin->role >= 2) {
                $newCareer = new Career();
                $newCareer->name = $request->name;
                $newCareer->graduationProfile = $request->graduationProfile;
                $newCareer->admissionProfile = $request->admissionProfile;
                $newCareer->save();
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

    public function getCareers(){
        $allCareers = Career::all();
        return response()->json($allCareers->toArray());
    }

    public function getCarrerById($idCarrer){
        $career = Career::find($idCarrer);
        if ($career) {
            $subjects = Subject::select('semester AS cycle', 'name')->where('idCareer', $idCarrer)->get();
            return response()->json([
                'name' => $career->name,
                'graduationProfile' =>$career->graduationProfile,
                'admissionProfile' => $career->admissionProfile,
                'subjects' => $subjects->toArray(),
            ]);
        } else {
            $success = false;
            return response()->json(['success' => $success]);
        }
    }

    public function searchCareer(Request $request, $name){
        $career = Career::where('name', 'LIKE', "%$name%")->get();
        return response()->json($career->toArray());
    }

    public function deleteCareer(Request $request, $id){
        $admin = User::where('cookie', $request->cookie)->first();
        if ($admin) {
            if (($admin->role) >=  2){
                $career = Career::find($id);
                if ($career) {
                    $career->delete();
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
        return response()->json([
            'success' => $success
        ]);
    }

    public function editCareer(Request $request, $id){
        $admin = User::where('cookie', $request->cookie)->first();
        if ($admin) {
            if (($admin->role) >=  2){
                $career = Career::find($id);
                if ($career) {
                    $career->name = $request->name;
                    $career->graduationProfile = $request->graduationProfile;
                    $career->admissionProfile = $request->admissionProfile;
                    $career->save();
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
        return response()->json([
            'success' => $success
        ]);
    }
}
