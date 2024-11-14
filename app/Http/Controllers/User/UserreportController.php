<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Userreport;

use Illuminate\Support\Facades\Validator;

class UserreportController extends Controller
{

    
   public function reportUser(Request $request, $user_id)
{
    // Validate incoming request
    $validator = Validator::make($request->all(), [
        'report_id' => 'required|integer',
        'message' => 'required|string',
        'type' => 'required|string',
    ]);

    if ($validator->fails()) {
        return response()->json(['error' => $validator->errors()], 422);
    }

    // Check if the same user has already reported the same user with the same message and type
    $existingReport = Userreport::where('user_id', $user_id)
        ->where('report_id', $request->report_id)
        ->where('message', $request->message)
        ->where('type', $request->type)
        ->first();

    if ($existingReport) {
        return response()->json([
            'message' => 'You have already reported this user for the same reason.'
        ], 409);
    }

    // Create a new report
    $userReport = Userreport::create([
        'user_id' => $user_id,
        'report_id' => $request->report_id,
        'message' => $request->message,
        'type' => $request->type,
    ]);

    // Count the number of reports against the same user (report_id)
    $reportCount = Userreport::where('report_id', $request->report_id)->count();

    // If the report count reaches 10, deactivate the user
    if ($reportCount >= 10) {
        $user = User::find($request->report_id);
        if ($user) {
            $user->active = 0;
            $user->save();
        }
    }

    return response()->json([
        'success' => 'User reported successfully.',
        'report' => $userReport
    ], 200);
}


}
