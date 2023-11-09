<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Career;
use Illuminate\Http\Request;
use App\Models\User;

class CareerController extends Controller
{
    public function createCareer(Request $request){
        $admin = User::where('cookie',$request->cookie);
        if ($admin) {
            if ($admin->role >= 2) {
                $newCareer = new Career();
                $newCareer->name = $request->name;
                $newCareer->graduationProfile = $request->graduationProfile;
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
}
