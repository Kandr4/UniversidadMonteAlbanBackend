<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;
use Intervention\Image\ImageManagerStatic as Image;
use Illuminate\Support\Facades\File;

class Controller extends BaseController
{
    use AuthorizesRequests, ValidatesRequests;

    public function convertToWebp($image, $type){
        $nameFile = uniqid();
        $extension = '.'.$image->getClientOriginalExtension();
        $image->storeAs('public/',$nameFile.$extension);
        $storageRoute = storage_path('app/public/'.$nameFile.$extension);
        $publicRoute = public_path("images/$type/$nameFile.webp");
        $imagenWebp = Image::make($storageRoute);
        $imagenWebp->orientate();
        if ($type == 'testimonial') {
            $quality = 50;
        }else {
            $quality = 80;
        }
        $imagenWebp->encode('webp',$quality);
        $imagenWebp->save($publicRoute);
        File::delete($storageRoute);
        return ($nameFile.'.webp');
    }
}

