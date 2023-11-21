<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\File;
use Illuminate\Http\Request;
use Carbon\Carbon;
use App\Models\User;
use App\Models\DatabaseLog;
use Illuminate\Support\Facades\Storage;

class FileController extends Controller
{
    public function download(Request $request, $filename)
    {
        // Define la ruta al archivo dentro de la carpeta de almacenamiento (por ejemplo, en la carpeta "public")
        $rutaArchivo = public_path('documents/'.$filename);

        // Obtén el archivo como una respuesta
        return response()->file($rutaArchivo, ['Content-Disposition' => 'attachment; filename="' . $filename . '"']);
    }

    public function backupDownload(Request $request, $cookie){
        $admin = User::where('cookie', $cookie)->where('role', 3)->first();
        if ($admin) {
            $outputFile = storage_path('app/backupUniversidadMonteAlban.sql');
            $command = 'C:\xampp\mysql\bin\mysqldump -u root universidadmontealban_bd > '. $outputFile;
            exec($command, $output, $exitCode);
            $nameFile = $this->moveToPublic();
            $publicRoute = public_path('database/'.$nameFile);
            $databaseLog = new DatabaseLog();
            $databaseLog->idUser = $admin->id;
            $databaseLog->operation = 'Respaldo';
            $databaseLog->date = Carbon::now();
            $databaseLog->save();
            return response()->file($publicRoute, ['Content-Disposition' => 'attachment; filename="' . $nameFile . '"']);
        } else {
            return response('Acceso prohibido.', 403);
        }
        
    }

    public function moveToPublic(){
        $storageRoute = storage_path('app/backupUniversidadMonteAlban.sql');
        $publicRoute = public_path('database/backupUniversidadMonteAlban.sql');
        File::copy($storageRoute,$publicRoute);
        return 'backupUniversidadMonteAlban.sql';
    }
}
