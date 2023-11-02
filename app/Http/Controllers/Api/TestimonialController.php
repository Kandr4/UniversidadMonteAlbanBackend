<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Testimonial;
use App\Models\User;
use Illuminate\Support\Carbon;
use Intervention\Image\ImageManagerStatic as Image;

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
        
        $nameFile = uniqid();
        $extension = '.'.$image->getClientOriginalExtension();
        $image->storeAs('public/',$nameFile.$extension);
        $storageRoute = storage_path('app/public/'.$nameFile.$extension);
        $publicRoute = public_path("images/testimonial/$nameFile.webp");
        $imagenWebp = Image::make($storageRoute);
        $imagenWebp->encode('webp',90);
        $imagenWebp->save($publicRoute);
        //$newTestimonial->img = pathinfo($publicRoute, PATHINFO_FILENAME) . '.webp';
        $newTestimonial->img = $nameFile.'.webp';
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
}
