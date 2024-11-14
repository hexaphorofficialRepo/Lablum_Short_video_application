<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Verify;
use App\Models\Wallet;
use Illuminate\Http\Request;

use Auth;
use App\Models\User;
use DateTime;
use Exception;
use JWTAuth;
use App\Mail\SendMail;
use App\Helpers\Common\Functions;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\DB;

use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Carbon\Carbon;
use App\Models\Follow;
use App\Models\Blockuser;
use Tymon\JWTAuth\JWTAuth as JWTAuthJWTAuth;

class UserRegisterController extends Controller
{
    private function _error_string($errArray)
    {
        $error_string = '';
        foreach ($errArray as $key) {
            $error_string .= $key . "\n";
        }
        return $error_string;
    }
    public function demo()
    {
        $responseData = ['message' => 'hello User'];

        return response()->json($responseData, Response::HTTP_OK);
    }





    public function index(Request $data)
{
    $validator = Validator::make(
        $data->all(),
        [
            'fname' => 'required',
            'email' => 'nullable|email|unique:users',
            'mobile' => 'required|unique:users',
            'username' => 'required|unique:users',
            'password' => 'required|min:6|confirmed',
            'gender' => 'nullable|in:m,f,ot',
        ],
        [
            'email.unique' => 'Your Email is already registered. Please login.',
            'email.email' => 'Email id is not valid.',
            'username.unique' => 'This username is already taken.',
            'password.confirmed' => 'Password doesn\'t match.',
            'gender.in' => 'Gender must be one of: m, f, ot',
            'mobile.unique' => 'Mobile number is already registered. Please use a different one.',
        ]
    );

    if ($validator->fails()) {
        return response()->json(['status' => 'error', 'msg' => $this->_error_string($validator->errors()->all())]);
    }

    DB::beginTransaction();

    try {
        $now = now();

        $user = DB::table('users')->insertGetId([
            'fname' => $data->fname,
            'lname' => $data->lname,
            'mobile' => $data->mobile,
            'username' => strtolower(strip_tags($data->username)),
            'dob' => $data->filled('dob') ? $data->dob : null,
            'gender' => $data->filled('gender') ? $data->gender : null,
            'email' => $data->email,
            'password' => Hash::make($data->password),
            'login_type' => 'O',
            'active' => 1,
            'created_at' => $now,
            'updated_at' => $now,
        ]);

        $token = Str::random(60);

        DB::table('users')->where('user_id', $user)->update([
            'app_token' => $token,
        ]);

        // Create wallet for the user
        $wallet = Wallet::create([
            'user_id' => $user,
            'points' => 0, 
        ]);

        DB::commit();

        $msg = " registration is successful.";
        $userData = ['app_token' => $token, 'user_id' => $user, 'username' => strtolower(strip_tags($data->username))];
        $response = ['status' => 'success', 'msg' => $msg, 'content' => $userData];

        return response()->json($response);
    } catch (\Exception $ex) {
        DB::rollback();

        return response()->json(['status' => 'error', 'msg' => $ex->getMessage()], 400);
    }
}






    public function generateOTP()
    {
        return mt_rand(100000, 999999);
    }

    public function sendOTP($email, $otp)
    {
        try {




            DB::table('users')->where('email', $email)->update(['verification_code' => $otp]);


            $mailSubject = "Login OTP";
            $mailBody = "Your OTP for login is: $otp";

            Mail::raw($mailBody, function ($message) use ($email, $mailSubject) {
                $message->to($email)->subject($mailSubject);
            });

            return true;
        } catch (\Exception $e) {

            return false;
        }
    }

    // public function login(Request $request)
    // {
    //     $validator = Validator::make(
    //         $request->all(),
    //         [
    //             'credential' => 'required',
    //             'password' => 'required',
    //         ],
    //         [
    //             'credential.required' => 'Credential is required',
    //             'password.required' => 'Password is required',
    //         ]
    //     );

    //     if ($validator->fails()) {
    //         return response()->json(['status' => 'error', 'msg' => $validator->errors()->first()], 400);
    //     }

    //     $credential = $request->credential;
    //     $password = $request->password;

    //     // Find the user by email, phone, or username
    //     $user = DB::table('users')
    //         ->where(function ($query) use ($credential) {
    //             $query->where('email', $credential)
    //                 ->orWhere('mobile', $credential)
    //                 ->orWhere('username', $credential);
    //         })
    //         ->first();

    //     if (!$user) {
    //         return response()->json(['status' => 'error', 'msg' => 'Invalid Credential'], 401);
    //     }

    //     if ($user->active != 1) {
    //         return response()->json(['status' => 'error', 'msg' => 'This account is deactivated'], 401);
    //     }

    //     if (!Hash::check($password, $user->password)) {
    //         return response()->json(['status' => 'error', 'msg' => 'Invalid Password'], 401);
    //     }

    //     // Update last login time
    //     $this->updateLastLoginTime($user->user_id);

    //     $userDpUrl = $user->user_dp ? asset("storage/profile_pic/{$user->user_id}/{$user->user_dp}") : null;
    //     $user_id = $user->user_id;
    //     $userData = [
    //         'username' => $user->username,
    //         'email' => $user->email,
    //         'mobile' => $user->mobile,
    //         'app_token' => $user->app_token,
    //         'user_dp' => $userDpUrl,
    //     ];
    //     return response()->json(['status' => true, 'msg' => 'Login successful', 'user_id' => $user_id, 'user' => $userData], 200);
    // }

  public function login(Request $request)
    {
        $validator = Validator::make(
            $request->all(),
            [
                'credential' => 'required',
                'password' => 'required',
            ],
            [
                'credential.required' => 'Credential is required',
                'password.required' => 'Password is required',
            ]
        );
    
        if ($validator->fails()) {
            return response()->json(['status' => 'error', 'msg' => $validator->errors()->first()], 400);
        }
    
        $credential = $request->credential;
        $password = $request->password;
    
        // Find the user by email, phone, or username
        $user = DB::table('users')
            ->where(function ($query) use ($credential) {
                $query->where('email', $credential)
                    ->orWhere('mobile', $credential)
                    ->orWhere('username', $credential);
            })
            ->first();
    
        if (!$user) {
            return response()->json(['status' => 'error', 'msg' => 'Invalid Credential'], 401);
        }
    
        if ($user->deleted == 1) { // Check if the account is marked as deleted
            return response()->json(['status' => 'error', 'msg' => 'Your account has been deleted'], 401);
        }
    
        if ($user->active != 1) {
            return response()->json(['status' => 'error', 'msg' => 'This account is deactivated'], 401);
        }
    
        if (!Hash::check($password, $user->password)) {
            return response()->json(['status' => 'error', 'msg' => 'Invalid Password'], 401);
        }
    
        // Update last login time
        $this->updateLastLoginTime($user->user_id);
    
        $userDpUrl = $user->user_dp ? asset("storage/profile_pic/{$user->user_id}/{$user->user_dp}") : null;
        $user_id = $user->user_id;
        $userData = [
            'username' => $user->username,
            'email' => $user->email,
            'mobile' => $user->mobile,
            'app_token' => $user->app_token,
            'user_dp' => $userDpUrl,
        ];
    
        return response()->json(['status' => true, 'msg' => 'Login successful', 'user_id' => $user_id, 'user' => $userData], 200);
    }



    
public function updateUserFCMToken(Request $request, $user_id)
{
    $validator = Validator::make(
        $request->all(),
        [
            'fcm_token' => 'nullable', // Allow nullable fcm_token
        ],
        [
            'fcm_token.required' => 'FCM token is required',
        ]
    );

    if ($validator->fails()) {
        return response()->json(['status' => 'error', 'msg' => $validator->errors()->first()], 400);
    }

    // Check if the user exists
    $user = DB::table('users')->where('user_id', $user_id)->first();
    if (!$user) {
        return response()->json(['status' => 'error', 'msg' => 'User not found'], 402);
    }
   

    // Update the FCM token
    $fcm_token = $request->input('fcm_token'); // Get the value of fcm_token from the request
    DB::table('users')->where('user_id', $user_id)->update(['fcm_token' => $fcm_token]);

 
    DB::table('notifications')->where('user_id', $user_id)->update(['fcm_token' => $fcm_token]);
 

    return response()->json(['status' => true, 'msg' => 'FCM token updated successfully', 'user_id' => $user_id, 'fcm_token' => $fcm_token], 200);
}













    

    public function formatCount($count)
    {
        if ($count >= 1000 && $count < 10000) {
            return round($count / 1000, 1) . 'k';
        } elseif ($count >= 10000) {
            return round($count / 1000000, 1) . 'M';
        } else {
            return $count;
        }
    }

public function userProfile($user_id)
{
    // Find the user by user_id
    $user = User::find($user_id);

    if (!$user) {
        return response()->json(['status' => 'error', 'msg' => 'User not found'], 404);
    }

    // Check if the account is deleted
    if ($user->deleted == 1) {
        return response()->json(['status' => 'error', 'msg' => 'This account is deleted'], 403);
    }

    // Retrieve counts of followers and following
    $followersCount = $this->formatCount($user->followers()->count());
    $followingCount = $this->formatCount($user->following()->count());

    $fullName = $user->fname . ' ' . $user->lname;

    $userDpUrl = $user->user_dp ? asset("storage/profile_pic/{$user->user_id}/{$user->user_dp}") : null;

    // Check official status
    $verification = Verify::where('user_id', $user->user_id)->first();
    $officialStatus = $verification ? ($verification->status == 1 ? 1 : 2) : 0;

    $userData = [
        'user_id' => $user->user_id,
        'username' => $user->username,
        'fname' => $user->fname,
        'lname' => $user->lname,
        'fullName' => $fullName,
        'dob' => $user->dob,
        'bio' => $user->bio,
        'email' => $user->email,
        'mobile' => $user->mobile,
        'fcm_token' => $user->fcm_token ?? null,
        'user_dp' => $userDpUrl,
        'followers_count' => $followersCount,
        'following_count' => $followingCount,
        'official_status' => $officialStatus,
    ];

    return response()->json(['status' => true, 'msg' => 'Success', 'profile' => $userData]);
}

    



    public function updateProfile(Request $request, $user_id)
    {

        $user = User::find($user_id);

        if (!$user) {
            return response()->json(['status' => 'error', 'msg' => 'User not found'], 404);
        }


        $validationRules = [];
        $validationMessages = [];

        if ($request->filled('fname')) {
            $validationRules['fname'] = 'string|max:255';
        }

        if ($request->filled('lname')) {
            $validationRules['lname'] = 'string|max:255';
        }

        if ($request->filled('username')) {
            $validationRules['username'] = 'unique:users';
            $validationMessages['username.unique'] = 'This username is already taken.';
        }

        if ($request->filled('mobile')) {
            $validationRules['mobile'] = 'unique:users';
            $validationMessages['mobile.unique'] = 'Mobile number is already registered. Please use a different one.';
        }
        if ($request->filled('email')) {
            $validationRules['email'] = 'unique:users';
            $validationMessages['email.unique'] = 'Email number is already registered. Please use a different one.';
        }
        if ($request->filled('bio')) {
            $validationRules['bio'] = [
                'string',
                'regex:/\b(\w+\s*){10,150}\b/',
                'max:255',
            ];
        }

        if ($request->hasFile('profile_pic_file')) {
            $validationRules['profile_pic_file'] = 'image|mimes:jpeg,png,jpg,gif|max:2048';
            $validationMessages['profile_pic_file.image'] = 'Profile picture must be an image.';
            $validationMessages['profile_pic_file.mimes'] = 'Profile picture must be in the format: jpeg, png, jpg, gif.';
            $validationMessages['profile_pic_file.max'] = 'Profile picture must not be larger than 2 MB.';
        }

        $validator = Validator::make($request->all(), $validationRules, $validationMessages);

        if ($validator->fails()) {
            return response()->json(['status' => 'error', 'msg' => $validator->errors()], 422);
        }

        if ($request->hasFile('profile_pic_file')) {
            $image_file = $request->file('profile_pic_file');

            if ($image_file->isValid()) {
                $path = 'profile_pic/' . $user_id;
                $filename = Carbon::now()->timestamp . '.' . $image_file->getClientOriginalExtension();
                $filenametostore = $image_file->storeAs($path, $filename, 'public');

                if ($user->user_dp) {
                    Storage::disk('public')->delete("profile_pic/{$user_id}/{$user->user_dp}");
                }

                // Update the user_dp field using Eloquent model
                $user->user_dp = $filename;
                $user->save();
            }
        }

        // Update other profile information based on filled fields
        $user->fname = $request->filled('fname') ? $request->input('fname') : $user->fname;
        $user->lname = $request->filled('lname') ? $request->input('lname') : $user->lname;
        $user->bio = $request->filled('bio') ? $request->input('bio') : $user->bio;
        $user->username = $request->filled('username') ? $request->input('username') : $user->username;
        $user->mobile = $request->filled('mobile') ? $request->input('mobile') : $user->mobile;
        $user->email = $request->filled('email') ? $request->input('email') : $user->email;
        $user->save();

        return response()->json(['status' => "true", 'msg' => 'Profile updated successfully']);
    }




    public function verifyOTP1(Request $data)
    {
        $validator = Validator::make($data->all(), [
            'user_id' => 'sometimes|required_without:email|exists:users,user_id',
            'email' => 'sometimes|required_without:user_id|email|exists:users,email',
            'otp' => 'required|digits:6',
        ]);

        if (!$validator->passes()) {
            return response()->json(['status' => 'error', 'msg' => $this->_error_string($validator->errors()->all())]);
        }

        $identifierType = $data->filled('email') ? 'email' : 'user_id';
        $identifierValue = $data->{$identifierType};

        $user = DB::table('users')->where($identifierType, $identifierValue)->whereNotNull('email_verified')->first();

        if ($user && $user->verification_code === $data->otp) {
            DB::table('users')->where($identifierType, $identifierValue)->update([
                'active' => 1,
                'verification_code' => null,
                'verification_time' => now(),
                'email_verified' => 1,
            ]);

            $this->updateLastLoginTime($user->user_id);

            // Generate full URL for profile image
            $profileImageUrl = $user->user_dp ? asset('storage/profile_pic/' . $user->user_id . '/' . $user->user_dp) : null;

            // Retrieve additional information
            $userInfo = [
                'user_id' => $user->user_id,
                'username' => $user->username,
                'email' => $user->email,
                'app_token' => $user->app_token,
                'profile_image_url' => $profileImageUrl,

            ];

            return response()->json(['status' => 'success', 'msg' => 'Email verification successful', 'user_info' => $userInfo]);
        }

        return response()->json(['status' => 'error', 'msg' => 'Invalid OTP']);
    }



    public function updateLastLoginTime($userId)
    {
        $now = now();
        DB::table('users')
            ->where('user_id', $userId)
            ->update(['last_active' => $now]);
    }

    public function resendOtp(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'sometimes|exists:users,user_id',
            'email' => 'sometimes|email|exists:users,email',
        ], [
            'user_id.exists' => 'User not found',
            'email.exists' => 'Email not found',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 'error', 'msg' => $this->_error_string($validator->errors()->all())]);
        } else {
            $userRecord = null;

            if ($request->filled('user_id')) {
                $userRecord = DB::table('users')
                    ->select("user_id", "email")
                    ->where('user_id', $request->user_id)
                    ->first();
            } elseif ($request->filled('email')) {
                $userRecord = DB::table('users')
                    ->select("user_id", "email")
                    ->where('email', $request->email)
                    ->first();
            }

            if ($userRecord) {
                $otp = $this->generateOTP();
                $now = now();

                DB::table('users')
                    ->where('user_id', $userRecord->user_id)
                    ->update(['verification_code' => $otp]);

                $mailBody = "Use the OTP to verify your email address: $otp";
                $mailSubject = "Email Verification OTP";
                $toEmail = $userRecord->email;

                Mail::raw($mailBody, function ($message) use ($toEmail, $mailSubject) {
                    $message->to($toEmail)->subject($mailSubject);
                });

                $response = [
                    "status" => "success",
                    "msg" => "A new OTP has been sent to your Email",
                    'user_id' => $userRecord->user_id,
                    'user_email' => $userRecord->email,
                ];
            } else {
                $response = ["status" => "failed", "msg" => "Invalid user!"];
            }

            return response()->json($response);
        }
    }











//   public function viewProfile($viewer_id, Request $request)
// {
//     $profile_id = $request->input('profile_id');
    
//     // Find the profile owner and the viewer by their user_id
//     $profileOwner = User::where('user_id', $profile_id)->first();
//     $viewer = User::where('user_id', $viewer_id)->first();

//     if (!$profileOwner || !$viewer) {
//         return response()->json(['status' => 'error', 'msg' => 'User not found'], 404);
//     }

//     // Check if the profile owner's account is deleted
//     if ($profileOwner->deleted == 1) {
//         return response()->json(['status' => 'error', 'msg' => 'This account is deleted'], 403);
//     }

//     // Retrieve counts of followers and following for the profile owner
//     $followersCount = $this->formatCount($profileOwner->followers()->count());
//     $followingCount = $this->formatCount($profileOwner->following()->count());

//     $fullName = $profileOwner->fname . ' ' . $profileOwner->lname;

//     $userDpUrl = $profileOwner->user_dp ? asset("storage/profile_pic/{$profileOwner->user_id}/{$profileOwner->user_dp}") : null;

//     // Check official status for the profile owner
//     $verification = Verify::where('user_id', $profileOwner->user_id)->first();
//     $officialStatus = $verification ? ($verification->status == 1 ? 1 : 2) : 0;

//     // Check if the viewer is following the profile owner
//     $followStatus = Follow::where('user_id', $viewer_id)
//                           ->where('follower_id', $profile_id)
//                           ->exists();

//     $userData = [
//         'user_id' => $profileOwner->user_id,
//         'uuid' => $profileOwner->uuid,
//         'username' => $profileOwner->username,
//         'fname' => $profileOwner->fname,
//         'lname' => $profileOwner->lname,
//         'fullName' => $fullName,
//         'dob' => $profileOwner->dob,
//         'bio' => $profileOwner->bio,
//         'email' => $profileOwner->email,
//         'mobile' => $profileOwner->mobile,
//         'fcm_token' => $profileOwner->fcm_token ?? null,
//         'user_dp' => $userDpUrl,
//         'followers_count' => $followersCount,
//         'following_count' => $followingCount,
//         'official_status' => $officialStatus,
//         'follow_status' => $followStatus,
//     ];

//     return response()->json(['status' => true, 'msg' => 'Success', 'profile' => $userData]);
// }

    



public function viewProfile($viewer_id, Request $request)
{
    $profile_id = $request->input('profile_id');
    
    // Find the profile owner and the viewer by their user_id
    $profileOwner = User::where('user_id', $profile_id)->first();
    $viewer = User::where('user_id', $viewer_id)->first();

    if (!$profileOwner || !$viewer) {
        return response()->json(['status' => 'error', 'msg' => 'User not found'], 404);
    }

    // Check if the profile owner's account is deleted
    if ($profileOwner->deleted == 1) {
        return response()->json(['status' => 'error', 'msg' => 'This account is deleted'], 403);
    }

    // Check if the profile owner has blocked the viewer
    $isBlocked = Blockuser::where('user_id', $profile_id)
                          ->where('block_id', $viewer_id)
                          ->exists();

    if ($isBlocked) {
        return response()->json(['status' => 'error', 'msg' => 'You are blocked by this user'], 403);
    }

    // Retrieve counts of followers and following for the profile owner
    $followersCount = $this->formatCount($profileOwner->followers()->count());
    $followingCount = $this->formatCount($profileOwner->following()->count());

    $fullName = $profileOwner->fname . ' ' . $profileOwner->lname;

    $userDpUrl = $profileOwner->user_dp ? asset("storage/profile_pic/{$profileOwner->user_id}/{$profileOwner->user_dp}") : null;

    // Check official status for the profile owner
    $verification = Verify::where('user_id', $profileOwner->user_id)->first();
    $officialStatus = $verification ? ($verification->status == 1 ? 1 : 2) : 0;

    // Check if the viewer is following the profile owner
    $followStatus = Follow::where('user_id', $viewer_id)
                          ->where('follower_id', $profile_id)
                          ->exists();

    $userData = [
        'user_id' => $profileOwner->user_id,
        'uuid' => $profileOwner->uuid,
        'username' => $profileOwner->username,
        'fname' => $profileOwner->fname,
        'lname' => $profileOwner->lname,
        'fullName' => $fullName,
        'dob' => $profileOwner->dob,
        'bio' => $profileOwner->bio,
        'email' => $profileOwner->email,
        'mobile' => $profileOwner->mobile,
        'fcm_token' => $profileOwner->fcm_token ?? null,
        'user_dp' => $userDpUrl,
        'followers_count' => $followersCount,
        'following_count' => $followingCount,
        'official_status' => $officialStatus,
        'follow_status' => $followStatus,
    ];

    return response()->json(['status' => true, 'msg' => 'Success', 'profile' => $userData]);
}






    // Helper function to validate OTP

    public function me()
    {
        return response()->json(auth('api')->user());
    }

    public function refresh()
    {
        return $this->respondWithToken(auth('api')->refresh());
    }

    protected function respondWithToken($token)
    {
        $data = array();
        $data = auth('api')->user();
        //   dd($data);
        $file_path = '';
        $small_file_path = '';
        if ($data->user_dp != '' && $data->user_dp != null) {
            if (stripos($data->user_dp, 'https://') !== false) {
                $file_path = $data->user_dp;
                $small_file_path = $data->user_dp;
            } else {
                $file_path = asset(Storage::url('public/profile_pic/' . $data->user_id . "/" . $data->user_dp));
                $small_file_path = asset(Storage::url('public/profile_pic/' . $data->user_id . "/small/" . $data->user_dp));
                if ($file_path == "") {
                    $file_path = asset('default/default.png');
                }
                if ($small_file_path == "") {
                    $small_file_path = asset('default/default.png');
                }
            }
        }

        return response()->json([
            'status' => "success",
            'msg' => 'User login successfully!',
            'content' => array(
                'user_id' => $data->user_id,
                'username' => $data->username,
                'fname' => $data->fname,
                'lname' => $data->lname,
                'email' => $data->email,
                'mobile' => $data->mobile,
                'dob' => $data->dob,
                'gender' => $data->gender,
                'image' => $file_path,
                'country' => $data->country,
                'login_type' => $data->login_type,
                'small_pic' => $small_file_path,
                'user_dp' => $file_path,
                'bio' => ($data->bio == null) ? '' : $data->bio,
                'app_token' => $token,
                'expires_in' => strtotime(date("Y-m-d", strtotime('+' . auth('api')->factory()->getTTL() . ' minutes')))
            ),
        ]);
    }



    public function loginProfileInformation(Request $request)
    {

        if (auth()->guard('api')->user()) {
            $user_id = auth()->guard('api')->user()->user_id;
            $userRecord = DB::table('users')
                ->select(DB::Raw("*,ifnull(dob,'" . date('Y-m-d', strtotime('-13 years')) . "') as dob,ifnull(bio,'') as bio"))
                ->where('user_id', $user_id)
                ->first();
            if (stripos($userRecord->user_dp, 'https://') !== false) {
                $file_path = $userRecord->user_dp;
                $small_file_path = $userRecord->user_dp;
            } else {
                $file_path = asset(Storage::url('public/profile_pic/' . $user_id . "/" . $userRecord->user_dp));
                $small_file_path = asset(Storage::url('public/profile_pic/' . $user_id . "/small/" . $userRecord->user_dp));

                if ($file_path == "") {
                    $file_path = asset('default/default.png');
                }
                if ($small_file_path == "") {
                    $small_file_path = asset('default/default.png');
                }
            }


            if ($userRecord) {
                $custom = collect(['large_pic' => $file_path, 'small_pic' => $small_file_path]);
                $userRecord = $custom->merge($userRecord);
                $response = array("status" => "success", "content" => $userRecord, 'large_pic' => $file_path, 'small_pic' => $small_file_path);
            } else {
                $response = array("status" => "failed", "msg" => "Invalid user!");
            }

            return response()->json($response);
        }
    }
    public function fetchUserInformation(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required'
        ], [
            'user_id.required' => 'User is required'
        ]);

        if (!$validator->passes()) {
            return response()->json(['status' => 'error', 'msg' => $this->_error_string($validator->errors()->all())]);
        } else {
            $userRecord = DB::table('users')
                ->select(DB::Raw("*,ifnull(dob,'" . date('Y-m-d', strtotime('-13 years')) . "') as dob,ifnull(bio,'') as bio"))
                ->where('user_id', $request->user_id)
                ->first();
            if (stripos($userRecord->user_dp, 'https://') !== false) {
                $file_path = $userRecord->user_dp;
                $small_file_path = $userRecord->user_dp;
            } else {
                $file_path = asset(Storage::url('public/profile_pic/' . $request->user_id . "/" . $userRecord->user_dp));
                $small_file_path = asset(Storage::url('public/profile_pic/' . $request->user_id . "/small/" . $userRecord->user_dp));

                if ($file_path == "") {
                    $file_path = asset('default/default.png');
                }
                if ($small_file_path == "") {
                    $small_file_path = asset('default/default.png');
                }
            }


            if ($userRecord) {
                $custom = collect(['large_pic' => $file_path, 'small_pic' => $small_file_path]);
                $userRecord = $custom->merge($userRecord);
                $response = array("status" => "success", "content" => $userRecord, 'large_pic' => $file_path, 'small_pic' => $small_file_path);
            } else {
                $response = array("status" => "failed", "msg" => "Invalid user!");
            }

            return response()->json($response);
        }
    }

    public function updateUserInformation(Request $request)
    {
        $validator = Validator::make($request->all(), [

            'username' => 'required',
            'name' => 'required',
            'email' => 'required',
            // 'mobile'          => 'required',
            'gender' => 'required',
            'dob' => 'required',
        ], [
            'username.required' => 'Username is required',
            //'username.unique' => 'Username is already taken, try another one.',
            'name.required' => 'Name is required',
            'email.required' => 'Email is required',
            'mobile.required' => 'Mobile is required',
            'gender.required' => 'Gender is required',
            'dob.required' => 'DOB is required',
        ]);

        if (!$validator->passes()) {
            return response()->json(['status' => 'error', 'msg' => $this->_error_string($validator->errors()->all())]);
        } else {

            if (auth()->guard('api')->user()) {
                $user_id = auth()->guard('api')->user()->user_id;
                $userRecord = DB::table('users')
                    ->select("*")
                    ->where('user_id', $user_id)
                    ->first();

                if ($userRecord) {
                    $nameArr = explode(" ", $request->name);
                    $fname = $nameArr[0];
                    if (isset($nameArr[1])) {
                        $lname = $nameArr[1];
                    } else {
                        $lname = '';
                    }

                    DB::table('users')
                        ->where('user_id', $userRecord->user_id)
                        ->update(['username' => strtolower($request->username), 'fname' => $fname, 'lname' => $lname, 'email' => $request->email, 'mobile' => $request->mobile != null ? $request->mobile : '', 'bio' => strip_tags($request->bio), 'gender' => $request->gender, 'dob' => date('Y-m-d', strtotime($request->dob))]);

                    $user = DB::table('users')
                        ->select("*")
                        ->where('user_id', $userRecord->user_id)
                        ->first();

                    $file_path = '';
                    $small_file_path = '';


                    if ($user->user_dp != '' && $user->user_dp != null) {
                        if (stripos($user->user_dp, 'https://') !== false) {
                            $file_path = $user->user_dp;
                            $small_file_path = $user->user_dp;
                        } else {
                            $file_path = asset(Storage::url('public/profile_pic/' . $user->user_id . "/" . $user->user_dp));
                            $small_file_path = asset(Storage::url('public/profile_pic/' . $user->user_id . "/small/" . $user->user_dp));
                            if ($file_path == "") {
                                $file_path = asset('default/default.png');
                            }
                            if ($small_file_path == "") {
                                $small_file_path = asset('default/default.png');
                            }
                        }
                    }

                    $user_content = array(
                        // 'user_id'           => $user->user_id,
                        // 'username'          => strtolower(strip_tags($user->username)),
                        // 'fname'             => strip_tags($user->fname),
                        // 'lname'             => strip_tags($user->lname),
                        // 'email'             => $user->email,
                        // 'mobile'            => ($user->mobile !=null) ? $user->mobile : '',
                        // 'dob'               => $user->dob,
                        // 'active'            => $user->active,
                        // 'gender'            => $user->gender,
                        // 'user_dp'           => $user->user_dp,                    
                        // // 'app_token'         => $user->app_token,
                        // 'country'           => strip_tags($user->country),
                        // 'languages'         => $user->languages,
                        // 'player_id'         => '',
                        // 'timezone'          => $user->time_zone,
                        // 'login_type'        => $user->login_type,
                        // 'ios_uuid'         => $user->ios_uuid,
                        // 'last_active'       => Functions::fSafeChar($user->last_active),

                        'user_id' => $user->user_id,
                        'username' => strtolower(strip_tags($user->username)),
                        'fname' => strip_tags($user->fname),
                        'lname' => strip_tags($user->lname),
                        'email' => $user->email,
                        'mobile' => ($user->mobile != null) ? $user->mobile : '',
                        'dob' => $user->dob,
                        'gender' => $user->gender,
                        'image' => $file_path,
                        'country' => $user->country,
                        // 'state'           => $user->state,
                        // 'city'           => $user->city,
                        'login_type' => $user->login_type,
                        'small_pic' => $small_file_path,
                        'user_dp' => $file_path,
                        'bio' => ($user->bio == null) ? '' : $user->bio,
                        'app_token' => auth('api')->refresh()
                        // 'address'        => ($user->address == null) ? '' : $user->address,
                        // 'app_token' => $token,
                        // 'expires_in' => strtotime(date("Y-m-d",strtotime('+'.auth('api')->factory()->getTTL().' minutes')))

                    );
                    $response = array("status" => "success", "msg" => "User information updated successfully.", "content" => $user_content);
                } else {
                    $response = array("status" => "failed", "msg" => "Invalid user!");
                }

                return response()->json($response);
            } else {
                return response()->json([
                    "status" => "error",
                    "msg" => "Unauthorized user!"
                ]);
            }
        }
    }

    public function socialLogin(Request $request)
    {
        $email = $request->email;
        $functions = new Functions();
        $isRecord = false;
        if ($request->login_type == "A") {
            if (isset($request->ios_uuid)) {
                //$user = DB::table("users")->where("ios_uuid",$request->ios_uuid)->first();
                $user = User::where("ios_uuid", $request->ios_uuid)->first();
                if ($user) {
                    DB::table("users")->where('user_id', $user->user_id)->update(['login_type' => $request->login_type]);
                    $isRecord = true;
                } elseif (isset($request->email)) {
                    $user = DB::table("users")->where("email", $request->email)->first();
                    if ($user) {
                        DB::table("users")->where('user_id', $user->user_id)->update(['ios_uuid' => $request->ios_uuid, 'login_type' => $request->login_type]);
                        $isRecord = true;
                    } else {
                        $isRecord = false;
                    }
                } else {
                    $isRecord = false;
                }
            }
        } else {
            $user = User::whereRaw(DB::raw("(email='" . $email . "') and email<>''"))->first();
            // $user = DB::table("users")->whereRaw(DB::raw("(email='".$email."') and email<>''"))->first();
            if ($user) {
                $isRecord = true;
            } else {
                $isRecord = false;
            }
        }
        if ($isRecord) {
            if ($user->active == 1) {
                $ios_uuid = "";
                if ($request->login_type == "A") {
                    $ios_uuid = $request->ios_uuid;
                }
                $uniques_user_id_res = DB::table("unique_users_ids")->select("unique_id", "user_id", "unique_token")->where('unique_token', $request->unique_token)->first();
                if ($uniques_user_id_res) {
                    DB::table('unique_users_ids')
                        ->where('unique_token', $request->unique_token)
                        ->update(['user_id' => $user->user_id]);
                    DB::table('video_views')
                        ->where('unique_id', $uniques_user_id_res->unique_id)
                        ->where('user_id', 0)
                        ->update(['user_id' => $user->user_id]);
                } else {
                    DB::table('unique_users_ids')->insert(['unique_token' => $request->unique_token, 'user_id' => $user->user_id]);
                }
                $accessToken = $this->getAccessTokenBasedOnUserEmail($user->email);

                if ($accessToken == "") {
                    return response()->json(['status' => false, 'msg' => 'Some error occur in our server. please try again.']);
                }
                // $data=auth('api')->user();
                // print_r($data);
                // exit;

                $now = date("Y-m-d H:i:s");
                $data2 = array(
                    'time_zone' => $request->time_zone,
                    'updated_at' => $now
                );
                DB::table('users')
                    ->where('user_id', $user->user_id)
                    ->update($data2);



                if (stripos($user->user_dp, 'https://') !== false) {
                    $file_path = $user->user_dp;
                    $small_file_path = $user->user_dp;
                } else {
                    $file_path = asset(Storage::url('public/profile_pic/' . $user->user_id . "/" . $user->user_dp));
                    $small_file_path = asset(Storage::url('public/profile_pic/' . $user->user_id . "/small/" . $user->user_dp));
                    if ($file_path == "") {
                        $file_path = asset('default/default.png');
                    }
                    if ($small_file_path == "") {
                        $small_file_path = asset('default/default.png');
                    }
                }
                $user_content = array(
                    'user_id' => $user->user_id,
                    'username' => strtolower(strip_tags($user->username)),
                    'fname' => strip_tags($user->fname),
                    'lname' => strip_tags($user->lname),
                    'email' => $user->email,
                    'mobile' => ($user->mobile != null) ? $user->mobile : '',
                    'dob' => $user->dob,
                    'active' => $user->active,
                    'gender' => $user->gender,
                    'user_dp' => $file_path,
                    'app_token' => $accessToken,
                    'country' => $user->country,
                    'languages' => $user->languages,
                    'player_id' => Functions::fSafeChar($request->player_id),
                    'timezone' => $user->time_zone,
                    'login_type' => $request->login_type,
                    'ios_uuid' => $ios_uuid,
                    'last_active' => Functions::fSafeChar($user->last_active),
                );

                // $is_following_videos=0;
                // $followingVideos = DB::table("follow")
                // ->select(DB::raw("follow_id"))
                // ->where("follow_by",$user->user_id)
                // ->first(); 
                // if($followingVideos) {
                //     $is_following_videos = 1;
                // }
                // $user_content['is_following_videos']=$is_following_videos;

                $response = array("status" => "success", 'msg' => 'Social login successfully', 'content' => $user_content);
            } else {
                $response = array("status" => "error", 'msg' => 'Account inactive');
            }
        } else {
            $max_id = 1001;
            $username = "user" . $max_id;
            while (DB::table("users")->select("user_id")->where("username", $username)->first()) {
                $max_id++;
                $username = "user" . $max_id;
            }
            $user_token = Hash::make($functions->_password_generate(20));
            $now = date("Y-m-d H:i:s");
            $ios_uuid = "";
            if ($request->login_type == "A") {
                $ios_uuid = $request->ios_uuid;
            }
            $gender = "";
            if ($request->gender != null && $request->gender != "") {
                if (strtolower($request->gender) == "male" || strtolower($request->gender) == "m") {
                    $gender = "m";
                } else if (strtolower($request->gender) == "female" || strtolower($request->gender) == "f") {
                    $gender = "f";
                } else {
                    $gender = "ot";
                }
            }
            $data = array(
                'username' => $username,
                'fname' => strip_tags($request->fname),
                'lname' => strip_tags($request->lname),

                'active' => '1',
                'gender' => $gender,
                'app_token' => $user_token,
                'country' => Functions::fSafeChar($request->country),
                'languages' => Functions::fSafeChar($request->languages),
                'time_zone' => Functions::fSafeChar($request->timezone),
                'user_dp' => Functions::fSafeChar($request->user_dp),
                'login_type' => $request->login_type,
                // 'login_type'        => 'FB',
                'created_at' => $now,
                'updated_at' => $now,
                'ios_uuid' => $ios_uuid,
                'email_verified' => 1
            );

            if (isset($request->dob) && $request->dob != '') {
                $data['dob'] = date("Y-m-d", strtotime($request->dob));
            }
            if (isset($request->email)) {
                $data['email'] = $request->email;
            }

            if (isset($request->mobile)) {
                $data['mobile'] = $request->mobile;
            }

            // if($request->login_type == "A") {
            $apple_user_id = DB::table("users")->insertGetId($data);
            $data['user_id'] = $apple_user_id;
            $accessToken = $this->getAccessTokenBasedOnUserEmail($request->email);
            if ($accessToken == "") {
                return response()->json(['status' => false, 'msg' => 'Some error occur in our server. please try again.']);
            }
            $user_content = array(
                'user_id' => $apple_user_id,
                'username' => $username,
                'fname' => strip_tags($request->fname),
                'lname' => strip_tags($request->lname),

                'active' => '1',
                'gender' => $gender,
                'app_token' => $accessToken,
                'country' => Functions::fSafeChar($request->country),
                'languages' => Functions::fSafeChar($request->languages),
                'time_zone' => Functions::fSafeChar($request->timezone),
                'user_dp' => Functions::fSafeChar($request->user_dp),
                'login_type' => $request->login_type,
                'created_at' => $now,
                'updated_at' => $now,
                'ios_uuid' => $ios_uuid,
                'email_verified' => 1
            );
            $response = array("status" => "success", 'msg' => 'Social login successfully', 'isRecord' => false, 'content' => $user_content);
        }

        return response()->json($response);
    }

    public function verifyOtp(Request $request)
    {
        $otp = $request->otp;
        if (strlen($otp) <= 6) {
            $user_id = $request->user_id;
            $app_token = $request->app_token;
            $userDpPath = asset(Storage::url('public/profile_pic'));
            $chk = DB::table("users")->select(DB::raw("user_id,case when user_dp !='' THEN case when INSTR(user_dp,'https://') > 0 THEN user_dp ELSE concat('" . $userDpPath . "/',user_id,'/small/',user_dp)  END ELSE '' END as user_dp,app_token,fname,lname,mobile,email,gender,ifnull(dob,'NA') as dob,username,verification_time,verification_code"))->where("user_id", $user_id)->whereNotNull("verification_time")->first();

            if ($chk) {
                $now = date('Y-m-d H:i:s');
                $datetime = \DateTime::createFromFormat('Y-m-d H:i:s', $chk->verification_time);
                $datetime->modify('+10 minutes');
                $expiryTime = $datetime->format('Y-m-d H:i:s');
                $datetime = \DateTime::createFromFormat('Y-m-d H:i:s', $chk->verification_time);
                $datetime->modify('+10 minutes');
                $expiryTime = $datetime->format('Y-m-d H:i:s');
                if (strtotime($now) > strtotime($expiryTime)) {
                    $response = array("status" => "error", 'msg' => 'Otp Expired');
                } else {
                    if (($chk->verification_code) != trim($otp)) {
                        $response = array("status" => "error", 'msg' => 'Otp doesn\'t match.');
                    } else {
                        // dd($chk);
                        $accessToken = $this->getAccessTokenBasedOnUserEmail($chk->email);
                        // dd($chk->email);
                        if ($accessToken == "") {
                            return response()->json(['status' => false, 'msg' => 'Some error occur in our server. please try again.']);
                        }
                        unset($chk->verification_time);
                        unset($chk->verification_code);
                        DB::table("users")->where("user_id", $user_id)->update(array("active" => '1', "email_verified" => '1', 'verification_code' => '', 'verification_time' => null));
                        // $response = array("status" => "success",'msg'=>'Profile activated successfully. Proceed to Login', 'content' => $user_content);   
                        $user = User::find($chk->user_id);

                        auth()->guard("api")->login($user);
                        return $this->respondWithToken($accessToken);
                    }
                }
            } else {
                $response = array("status" => "error", 'msg' => 'OTP expired');
            }
        } else {
            $response = array("status" => "error", 'msg' => 'Otp should be of 6 digits');
        }

        return response()->json($response);
    }

    public function socialRegister(Request $data)
    {
        $rules = [
            'email' => 'required|email|unique:users',
            'fname' => 'required',
            // 'gender' => 'required',
            'lname' => 'required',
            'username' => 'required|unique:users',
            'password' => 'required|min:6',
        ];

        // if($data->login_type!='A'){
        //     $rules['email'] = 'required|email|unique:users';
        // }

        $messages = [
            'username.unique' => 'This username is already taken.',
            'password.confirmed' => 'Password doesn\'t match.',
            'email.unique' => 'Your Email is already registered please login.',
            'email.email' => 'Email id is not valid.'
        ];

        // if($data->login_type!='A'){
        //     $messages['email.unique'] = 'Your Email is already registered please login.';
        //     $messages['email.email'] = 'Email id is not valid.';
        // }

        $validator = Validator::make(
            $data->all(),
            $rules,
            $messages
        );
        if (!$validator->passes()) {
            return response()
                ->json([
                    'status' => 'error',
                    'msg' => $this->_error_string($validator->errors()
                        ->all())
                ]);
        } else {

            if ($data->password == $data->confirm_password) {
                $functions = new Functions();
                $now = date("Y-m-d H:i:s");
                $otp = mt_rand(100000, 999999);
                $user_token = Hash::make($functions->_password_generate(20));

                if (isset($data->profile_pic)) {
                    $profile_pic = $data->profile_pic;
                } else {
                    $profile_pic = "";
                }
                // $ios_uuid = "";
                // if($data->login_type == "A") {
                //     $ios_uuid = $data->ios_uuid;    
                // }
                $res = array(
                    'fname' => strip_tags($data->fname),
                    'lname' => strip_tags($data->lname),
                    'username' => strtolower(strip_tags($data->username)),
                    'verification_code' => '',
                    'verification_time' => null,
                    'dob' => date('Y-m-d', strtotime($data->dob)),
                    'email' => $data->email,
                    'password' => Hash::make($data->password),
                    // 'gender' => $data->gender,
                    'app_token' => $user_token,
                    'login_type' => isset($data->login_type) ? $data->login_type : 'O',
                    'user_dp' => $profile_pic,
                    'active' => 1,
                    // 'ios_uuid' => $ios_uuid,
                    'email_verified' => 1
                );
                if ($data->login_type == "A") {
                    $res['updated_at'] = $now;
                    $dataRes = DB::table("users")->where('email', $data->email)->first();
                    DB::table("users")->where('user_id', $dataRes->user_id)->update($res);
                    $user_id = $dataRes->user_id;
                    unset($res['updated_at']);
                } else {
                    $res['created_at'] = $now;
                    $res['updated_at'] = $now;
                    $user_id = DB::table('users')->insertGetId($res);
                    unset($res['created_at']);
                    unset($res['updated_at']);
                }

                unset($res['password']);
                $res['user_id'] = $user_id;
                $path = $functions->_getUserFolderName($user_id, "public/videos");
                $path2 = $functions->_getUserFolderName($user_id, "public/photos");
                $path3 = $functions->_getUserFolderName($user_id, 'public/profile_pic');
                $path4 = $functions->_getUserFolderName($user_id, 'public/sounds');
                $video_gif_path = "public/videos/" . $user_id . '/gif';
                $folderExists = Storage::disk('local')->exists($video_gif_path);
                if (!$folderExists) {
                    Storage::disk('local')->makeDirectory($video_gif_path);
                }
                $video_thumb_path = "public/videos/" . $user_id . '/thumb';
                $folderExistsThumb = Storage::disk('local')->exists($video_thumb_path);
                if (!$folderExistsThumb) {
                    Storage::disk('local')->makeDirectory($video_thumb_path);
                }

                if ($data->hasFile('profile_pic_file')) {
                    try {
                        $image_file = $data->file('profile_pic_file');

                        if ($image_file->isvalid()) {

                            $path = 'public/profile_pic/' . $user_id;

                            $filenametostore = request()->file('profile_pic_file')
                                ->store($path);
                            Storage::setVisibility($filenametostore, 'public');
                            $fileArray = explode('/', $filenametostore);
                            $fileName = array_pop($fileArray);
                            // dd(asset(Storage::url('public/profile_pic/'.$user->user_id.'/'.$fileName)));
                            $functions->_cropImage($image_file, 300, 300, 0, 0, $path . '/small', $fileName);
                            // dd(66);
                            $file_path = asset(Storage::url('public/profile_pic/' . $user_id . "/" . $fileName));

                            $small_file_path = asset(Storage::url('public/profile_pic/' . $user_id . "/small/" . $fileName));
                            if ($file_path == "") {
                                $file_path = asset(config('app.profile_path')) . 'default-user.png';
                            }
                            if ($small_file_path == "") {
                                $small_file_path = asset(config('app.profile_path')) . 'default-user.png';
                            }


                            $res['user_dp'] = $file_path;

                            DB::table('users')->where('user_id', $user_id)->update(['user_dp' => $fileName]);
                        }
                    } catch (Exception $ex) {
                        dd($ex->getMessage());
                        return redirect()
                            ->back();
                    }
                }

                $msg = "User Register Successfully";
                $response = array(
                    "status" => "success",
                    'msg' => $msg,
                    'content' => $res
                );
                return response()->json($response);
            } else {
                return response()->json(['status' => 'error', 'msg' => "Password and confirm password must be same."]);
            }
        }
    }
}
