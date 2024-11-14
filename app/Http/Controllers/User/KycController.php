<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Notification;
use App\Notifications\KycStatusNotification;
use Illuminate\Support\Facades\Validator;
use App\Models\Userdata;

class KycController extends Controller
{
    // public function updateKyc(Request $request, $userId){
    //     // Validate incoming request data
    //     $validator = Validator::make($request->all(), [
    //         'document_id1' => ['required', 'integer', function ($attribute, $value, $fail) {
    //             if (User::where('document_id1', $value)->exists()) {
    //                 $fail('Adhar number already registered.');
    //             }
    //         }],
    //         'document_id2' => ['required', function ($attribute, $value, $fail) {
    //             if (User::where('document_id2', $value)->exists()) {
    //                 $fail('PAN card number already registered.');
    //             }
    //         }],
    //     ]);
    
    //     // Check if validation fails
    //     if ($validator->fails()) {
    //         return response()->json(['message' => $validator->errors()->first()], 400);
    //     }
    
    //     // Find the user by user ID
    //     $user = User::find($userId);
    
    //     // Check if user exists
    //     if(!$user){
    //         return response()->json(['message' => 'User not found'], 404);
    //     }
    
    //     // Update KYC status to 1 and KYC date to current date
    //     $user->update([
    //         'kyc_status' => 1,
    //         'kyc_date' => now()->toDateString(),
    //         'document_id1' => $request->input('document_id1'),
    //         'document_id2' => $request->input('document_id2'),
    //     ]);
    
    //     // Check if it's been a year since KYC update and update status if necessary
    //     if($user->kyc_date && $user->kyc_date->addYear()->isPast()) {
    //         $user->update(['kyc_status' => 0]);
    
    //         // Calculate notification date 10 days before the kyc_date
    //         $notificationDate = $user->kyc_date->addYear()->subDays(10);
    
    //         // Send notification before 10 days of KYC status 0
    //         Notification::send($user, new KycStatusNotification($notificationDate));
    //     }
    
    //     return response()->json(['message' => 'KYC status updated successfully'], 200);
    // }




   

    public function updateKyc(Request $request, $userId){
        // Validate incoming request data
        $validator = Validator::make($request->all(), [
            'document_id1' => ['required', 'integer', function ($attribute, $value, $fail) {
                if (User::where('document_id1', $value)->exists()) {
                    $fail('Adhar number already registered.');
                }
            }],
            'document_id2' => ['nullable', function ($attribute, $value, $fail) {
                if (User::where('document_id2', $value)->exists()) {
                    $fail('PAN card number already registered.');
                }
            }],
            'father_name' => 'required|string',
            'name' => 'required|string',
            'address' => 'required|string',
            'dob' => 'required|date',
            'gender' => 'required',
        ]);
    
        // Check if validation fails
        if ($validator->fails()) {
            return response()->json(['message' => $validator->errors()->first()], 400);
        }
    
        // Find the user by user ID
        $user = User::find($userId);
    
        // Check if user exists
        if(!$user){
            return response()->json(['message' => 'User not found'], 404);
        }
    
        // Update KYC status to 1 and KYC date to current date
        $user->update([
            'kyc_status' => 1,
            'kyc_date' => now()->toDateString(),
            'document_id1' => $request->input('document_id1'),
            'document_id2' => $request->input('document_id2'),
        ]);
    
        $userdata = Userdata::firstOrCreate(
            ['user_id' => $userId],
            [
                'document_id1' => $request->input('document_id1'),
                'document_id2' => $request->input('document_id2'),
                'father_name' => $request->input('father_name'),
                'name' => $request->input('name'),
                'address' => $request->input('address'),
                'dob' => $request->input('dob'),
                'gender' => $request->input('gender'),
            ]
        );
    
        // Check if it's been a year since KYC update and update status if necessary
        if($user->kyc_date && $user->kyc_date->addYear()->isPast()) {
            $user->update(['kyc_status' => 0]);
    
            // Calculate notification date 10 days before the kyc_date
            $notificationDate = $user->kyc_date->addYear()->subDays(10);
    
            // Send notification before 10 days of KYC status 0
            Notification::send($user, new KycStatusNotification($notificationDate));
        }
    
        return response()->json(['message' => 'KYC status updated successfully'], 200);
    }
    













    public function sendKycExpirationNotifications()
    {
        // Find users whose KYC is expiring within the next 10 days
        $users = User::where('kyc_status', 1)
                     ->where('kyc_date', '<=', now()->addDays(10))
                     ->where('kyc_date', '>', now())
                     ->get();

        // Send notification to each user
        foreach ($users as $user) {
            // Calculate notification date 10 days before the KYC expiration date
            $notificationDate = $user->kyc_date->subDays(10);

            // Send notification
            Notification::send($user, new KycStatusNotification($notificationDate));
        }
    }
    
    
}
