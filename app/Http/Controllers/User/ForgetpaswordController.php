<?php

namespace App\Http\Controllers\user;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;



class ForgetpaswordController extends Controller
{
    public function validateUser(Request $request)
    {
        // Validate the incoming request
        $validator = Validator::make($request->all(), [
            'mobile_number' => 'required',
        ]);

        // Check if validation fails
        if ($validator->fails()) {
            return response()->json([
                'error' => 'Mobile Number is Required'
            ], 402);
        }

        // Retrieve the user by mobile number
        $user = User::where('mobile', $request->mobile_number)->first();

        if ($user) {
            // User found, return success response with user_id
            return response()->json([
                'message' => 'User Exists For This Mobile Number',
                'user_id' => $user->user_id,
            ], 200);
        } else {
            // User not found, return error response
            return response()->json([
                'message' => 'User not found',
            ], 404);
        }
    }


    public function updatePassword(Request $request, $userId)
    {
        
        $validator = Validator::make($request->all(), [
            'password' => 'required',
        ]);
    
        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()->first()], 402);
        }
    
     
        $user = User::find($userId);
    
        if (!$user) {
            return response()->json(['error' => 'User not found'], 404);
        }
    
       
        try {
            $user->password = Hash::make($request->password);
            $user->save();
    
            return response()->json(['message' => 'Password updated successfully'], 200);
        } catch (\Exception $ex) {
            return response()->json(['error' => 'Failed to update password'], 500);
        }
    }







}
