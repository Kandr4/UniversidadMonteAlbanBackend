<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Testimonial;

class TestimonialController extends Controller
{
    public function obtenerTestimonios(Request $request){
        $allTestimonials = Testimonial::select('id', 'img', 'name', 'content', 'status AS relation')
        ->latest('updated_at')
        ->limit(5)
        ->get();        
        $testimonialsArray = $allTestimonials->toArray();
        return response()->json($testimonialsArray);
    }
}
