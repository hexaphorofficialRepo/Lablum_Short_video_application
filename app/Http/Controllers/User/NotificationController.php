<?php

namespace App\Http\Controllers\user;

use App\Http\Controllers\Controller;
use App\Models\Notification;
use App\Models\User;
use Illuminate\Http\Request;
use Validator;

class NotificationController extends Controller
{
    public function store(Request $request, $fcm_token){
        $user = User::where('fcm_token', $fcm_token)->first();
    
        if (!$user) {
            return response()->json(['error' => 'FCM token does not exist'], 404);
        }
        $validator = Validator::make($request->all(), [
        
            'notification' => 'required',
            'title' => 'required',
            'thumbnail' => 'required',
          
        ]);
    
        // Check if validation fails
        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 400);
        }
    
        try {
            // Create new instance of your model
            $model = new Notification();
    
            // Assign values from request to the model
            $model->fcm_token = $fcm_token;
            $model->user_id = $user->user_id;
            $model->user_dp = $request->user_dp;
         
            $model->notification = $request->notification;
            $model->title = $request->title;
            $model->thumbnail = $request->thumbnail;
            $model->path_url = $request->path_url;
    
            // Save the data
            $model->save();
    
            // Return success response
            return response()->json(['message' => 'Data saved successfully'], 200);
        } catch (\Exception $e) {
            // Return error response if any exception occurs
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    public function getNotifications($fcm_token) {
        // Check if the provided fcm_token exists in the User model
        $user = User::where('fcm_token', $fcm_token)->first();
    
        if (!$user) {
            return response()->json(['error' => 'FCM token does not exist'], 404);
        }
    
        // Retrieve notifications for the given fcm_token
        $notifications = Notification::where('fcm_token', $fcm_token)->get();
    
        // Return the notifications
        return response()->json($notifications, 200);
    }

}
