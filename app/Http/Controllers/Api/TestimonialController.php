<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Testimonial;
use App\Models\User;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\File;


class TestimonialController extends Controller
{
    public function getTestimonials(Request $request){
        $allTestimonials = Testimonial::select('id', 'img', 'name', 'content', 'status AS relation')
        ->latest('updated_at')
        ->limit(5)
        ->get();        
        $testimonialsArray = $allTestimonials->toArray();
        return response()->json($testimonialsArray);
    }

    public function createTestimonial(Request $request){
        $request->validate([
            'image'=>'required|image'
        ]);
        $image = $request->file('image');
        $newTestimonial = new Testimonial();
        $user = User::where('cookie',$request->cookie)->first();
        $newTestimonial->name = $request->name;
        $newTestimonial->gender = 'M';
        $newTestimonial->date = Carbon::now()->toDateString();
        $newTestimonial->content = $request->testimonial;
        $newTestimonial->status = $request->relation;
        $newTestimonial->idUser = $user->id;
        //$newTestimonial->img = pathinfo($publicRoute, PATHINFO_FILENAME) . '.webp';
        $newTestimonial->img = Controller::convertToWebp($image,'testimonial');
        if($newTestimonial->save()){
            $success = true;
        }
        else{
            $success = false;
        }
        return response()->json([
            'success' => $success,
        ]);
    }

    public function search(Request $request){
        $nameToSearch = $request->input('search');
        $testimoniesFound = Testimonial::select('id', 'img', 'name', 'content', 'status AS relation')
        ->where('name','like',"%$nameToSearch%")
        ->get();
        $testimoniesArray = $testimoniesFound->toArray();
        return response()->json($testimoniesArray);
    }

    public function editTestimony(Request $request, $id_testimony){
        $testimony = Testimonial::find($id_testimony);
        $user = User::where('cookie',$request->cookie)->first();
        if($user->role >= 2){
            $testimony->name = $request->name;
            $testimony->gender = 'M';
            $testimony->date = Carbon::now()->toDateString();
            $testimony->content = $request->testimonial;
            $testimony->status = $request->relation;
            $testimony->idUser = $user->id;
            if ($request->hasFile('image')) {
                $request->validate([
                    'image'=>'required|image'
                ]);
                File::delete(public_path("images/testimonial/$testimony->img"));
                $image = $request->file('image');
                $testimony->img = Controller::convertToWebp($image,'testimonial');
            }
            $testimony->save();
            $success = true;
        }else{
            $success = false;
        }
        
        return response()->json([
            'success' => $success
        ]);
    }

    public function deleteTestimony(Request $request, $id_testimony){
        $testimony = Testimonial::find($id_testimony);
        $user = User::where('cookie',$request->cookie)->first();
        if($user->role >= 2){
            File::delete(public_path("images/testimonial/$testimony->img"));
            $testimony->delete();
            $success = true;
        }else{
            $success = false;
        }
        return response()->json([
            'success'=>$success
        ]);
    }
}
