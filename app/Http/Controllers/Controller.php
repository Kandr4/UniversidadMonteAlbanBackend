<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;
use Intervention\Image\ImageManagerStatic as Image;

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
        $imagenWebp->encode('webp',90);
        $imagenWebp->save($publicRoute);
        return ($nameFile.'.webp');
    }
}

