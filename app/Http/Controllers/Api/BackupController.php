<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Storage;
use Carbon\Carbon;
use App\Models\User;
use App\Models\DatabaseLog;



class BackupController extends Controller
{
    public function uploadBackup(Request $request){
        $admin = User::where('cookie', $request->cookie)->where('role', 3)->first();
        if ($admin) {
            if ($request->hasFile('sql')) {
                if ($request->file('sql')->getClientOriginalExtension() == 'sql') {
                    $request->file('sql')->storeAs('backupUniversidadMonteAlban.sql');
                    $databaseName = env('DB_DATABASE');
                    $username = env('DB_USERNAME');
                    $outputFile = storage_path('app/backupUniversidadMonteAlban.sql');
                    $command = 'C:\xampp\mysql\bin\mysqldump -u '.$username.' '.$databaseName.' < '. $outputFile;
                    exec($command, $output, $exitCode);
                    if ($exitCode === 0) {
                        $databaseLog = new DatabaseLog();
                        $databaseLog->idUser = $admin->id;
                        $databaseLog->operation = 'Restauración';
                        $databaseLog->date = Carbon::now();
                        $databaseLog->save();
                        $success = true;
                    } else {
                        $success = false;
                    }
                } else {
                    $success = false;
                }
            }
        } else {
            $success = false;
        }
        return response()->json([
            'success' => $success,
        ]);
    }

    public function searchByName(Request $request, $username){
        $admin = User::where('cookie', $request->cookie)->where('role','>=', 2)->first();
        if ($admin) {
            $search = User::join('database_logs', 'users.id', '=', 'database_logs.idUser')
            ->select('database_logs.idUser AS id_usuario', 'users.username', 'database_logs.date','database_logs.operation AS modification')
            ->where('users.username', 'LIKE', "%$username%")->get();
            return response()->json($search->toArray());
        } else {
            $success = false;
            return response()->json([
                'success' => $success,
            ]);
        }
        
    }

    public function searchByDate(Request $request, $date){
        $admin = User::where('cookie', $request->cookie)->where('role','>=', 2)->first();
        if ($admin) {
            $search = User::join('database_logs', 'users.id', '=', 'database_logs.idUser')
            ->select('database_logs.idUser AS id_usuario', 'users.username', 'database_logs.date','database_logs.operation AS modification')
            ->where('database_logs.date', $date)->get();
            return response()->json($search->toArray());
        } else {
            $success = false;
            return response()->json([
                'success' => $success,
            ]);
        }
        
    }

    public function searchGeneral(Request $request){
        $admin = User::where('cookie', $request->cookie)->where('role','>=', 2)->first();
        if ($admin) {
            $search = User::join('database_logs', 'users.id', '=', 'database_logs.idUser')
            ->select('database_logs.idUser AS id_usuario', 'users.username', 'database_logs.date','database_logs.operation AS modification')
            ->get();
            return response()->json($search->toArray());
        } else {
            $success = false;
            return response()->json([
                'success' => $success,
            ]);
        }
        
    }

}
