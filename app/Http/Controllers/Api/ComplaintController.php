<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Complaint;

class ComplaintController extends Controller
{
    public function createComplaint(Request $request){
        $newComplaint = new Complaint();
        $newComplaint->name = $request->name;
        $newComplaint->email = $request->email;
        $newComplaint->content = $request->content;
        if ($newComplaint->save()) {
            $success = true;
        } else {
            $success = false;
        }
        
        return response()->json([
            'success' => $success
        ]);
    }

    public function getComplaints(Request $request){
        $admin = User::where('cookie', $request->cookie)->first();
        if ($admin) {
            if (($admin->role) >=  2){
                $complaints = Complaint::all();
                return response()->json($complaints->toArray());
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

    /*public function getSubjectById($idSubject){
        $subject = Subject::find($idSubject);
        if ($subject) {
            return response()->json($subject->toArray());
        } else {
            $success = false;
            return response()->json(['success' => $success]);
        }
    }

    public function searchComplaint(Request $request, $name){

        $complaint = Complaint::where('name', 'LIKE', "%$name%")->get();
        return response()->json($complaint->toArray());
    }

    public function deleteSubject(Request $request, $id){
        $admin = User::where('cookie', $request->cookie)->first();
        if ($admin) {
            if (($admin->role) >=  2){
                $subject = Subject::find($id);
                if ($subject) {
                    $subject->delete();
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

    public function editSubject(Request $request, $id){
        $admin = User::where('cookie', $request->cookie)->first();
        if ($admin) {
            if (($admin->role) >=  2){
                $subject = Subject::find($id);
                if ($subject) {
                    $subject->name = $request->name;
                    $subject->semester = $request->semester;
                    $subject->idCareer = $request->idCareer;
                    $subject->save();
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
    }*/
}
