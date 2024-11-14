<?php

namespace App\Http\Controllers\user;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Follow;
use App\Models\Blockuser;
use App\Models\Verify;
use Illuminate\Http\Request;

class FollowController extends Controller
{
    public function store(Request $request, $userId)
{
    // Validate request data
    $request->validate([
        'follower_id' => 'required|exists:users,user_id', // Ensure follower_id exists in users table
    ]);

    $followerId = $request->input('follower_id');

    // Check if a follow relationship already exists for the given user and follower
    $existingFollow = Follow::where('user_id', $userId)
                            ->where('follower_id', $followerId)
                            ->first();

    if ($existingFollow) {
        // If follow relationship exists, delete it (unfollow)
        $existingFollow->delete();

        // Return a success response for unfollowing
        return response()->json([
            'message' => 'You have successfully unfollowed this person.',
        ]);
    }

    // Create a new follow relationship
    $follow = new Follow();
    $follow->user_id = $userId;
    $follow->follower_id = $followerId;
    $follow->status = 'true'; // You may adjust the status as needed
    $follow->save();

    // Return a success response for following
    return response()->json([
        'message' => 'You are now following this person.',
        'follow' => $follow,
    ], 201); // 201 Created status code
}



    public function followCounts($userId)
{
    // Find the user
    $user = User::find($userId);

    if (!$user) {
        return response()->json([
            'error' => 'User not found.',
        ], 404);
    }

    // Count followers and following
    $followersCount = $user->followers()->count();
    $followingCount = $user->following()->count();

    return response()->json([
        'user_id' => $userId,
        'followers_count' => $followersCount,
        'following_count' => $followingCount,
    ]);
    
}




// public function followingList($user_id)
// {
//     // Find the user by user_id
//     $user = User::find($user_id);

//     if (!$user) {
//         return response()->json(['status' => 'error', 'msg' => 'User not found'], 404);
//     }

//     // Retrieve the following list for the user with selected fields
//     $followingList = $user->following()->with(['following' => function($query) {
//         $query->select('user_id', 'username', 'fname', 'lname', 'user_dp','fcm_token');
//     }])->get();

//     // Extracting only specific fields for each follower
//     $uniqueFollowersArray = $followingList->map(function ($item) {
//         return $item->followers->map(function ($follower) {
//             return [
//                 'user_id' => $follower->user_id,
//                 'username' => $follower->username,
//                 'fcm_token' => $follower->fcm_token,
//                 'fullname' => $follower->fname.' '.$follower->lname,
//                 'user_dp' => $follower->user_dp ? asset("storage/profile_pic/{$follower->user_id}/{$follower->user_dp}") : null,
//             ];
//         });
//     })->flatten(1)->unique('user_id')->values(); // Flatten the array and remove duplicates

//     // Count of followers and following for the user
//     $followersCount = $user->followers()->count();
//     $followingCount = $user->following()->count();
//     unset($user);

//     // Check verification status for each user in the following list
//     $verifiedFollowers = collect();
//     foreach ($uniqueFollowersArray as $follower) {
//         $verification = Verify::where('user_id', $follower['user_id'])->first();
//         if ($verification) {
//             if ($verification->status == 1) {
//                 $follower['official_status'] = 1; // Status is approved
//             } else {
//                 $follower['official_status'] = 2; // Status is pending
//             }
//         } else {
//             $follower['official_status'] = 0; // Status not available (user not verified)
//         }
//         $verifiedFollowers->push($follower);
//     }

//     // Suggested users who are not followed by the user
//     $suggestedUsers = User::whereNotIn('user_id', $verifiedFollowers->pluck('user_id'))
//         ->where('user_id', '!=', $user_id)
//         ->get(['user_id', 'username', \DB::raw("CONCAT(fname, ' ', lname) as fullname"), 'user_dp','fcm_token'])
//         ->map(function ($user) {
//             $user->user_dp = $user->user_dp ? asset("storage/profile_pic/{$user->user_id}/{$user->user_dp}") : null;
//             $verification = Verify::where('user_id', $user->user_id)->first();
//             if ($verification) {
//                 if ($verification->status == 1) {
//                     $user['official_status'] = 1; // Status is approved
//                 } else {
//                     $user['official_status'] = 2; // Status is pending
//                 }
//             } else {
//                 $user['official_status'] = 0; // Status not available (user not verified)
//             }
//             return $user;
//         });

//     return response()->json([
//         'status' => true,
//         'msg' => 'Success',
//         'following_list' => $verifiedFollowers,
//         'followers_count' => $followersCount,
//         'following_count' => $followingCount,
//         'suggested_users' => $suggestedUsers,
//     ]);
// }

public function followingList($user_id)
{
    // Find the user by user_id
    $user = User::find($user_id);

    if (!$user) {
        return response()->json(['status' => 'error', 'msg' => 'User not found'], 404);
    }

    // Retrieve the following list for the user with selected fields
    $followingList = $user->following()->with(['following' => function($query) {
        $query->select('user_id', 'username', 'fname', 'lname', 'user_dp', 'fcm_token');
    }])->get();

    // Extracting only specific fields for each follower
    $uniqueFollowersArray = $followingList->map(function ($item) {
        return $item->followers->map(function ($follower) {
            return [
                'user_id' => $follower->user_id,
                'username' => $follower->username,
                'fcm_token' => $follower->fcm_token,
                'fullname' => $follower->fname.' '.$follower->lname,
                'user_dp' => $follower->user_dp ? asset("storage/profile_pic/{$follower->user_id}/{$follower->user_dp}") : null,
            ];
        });
    })->flatten(1)->unique('user_id')->values(); // Flatten the array and remove duplicates

    // Count of followers and following for the user
    $followersCount = $user->followers()->count();
    $followingCount = $user->following()->count();
    unset($user);

    // Check verification status for each user in the following list
    $verifiedFollowers = collect();
    foreach ($uniqueFollowersArray as $follower) {
        $verification = Verify::where('user_id', $follower['user_id'])->first();
        if ($verification) {
            if ($verification->status == 1) {
                $follower['official_status'] = 1; // Status is approved
            } else {
                $follower['official_status'] = 2; // Status is pending
            }
        } else {
            $follower['official_status'] = 0; // Status not available (user not verified)
        }
        $verifiedFollowers->push($follower);
    }

    // Retrieve users who have blocked the current user
    $blockedByUserIds = $user_id ? Blockuser::where('block_id', $user_id)->pluck('user_id') : collect();

    // Retrieve users blocked by the current user
    $blockedUsersByCurrentUser = $user_id ? Blockuser::where('user_id', $user_id)->pluck('block_id') : collect();

    // Combine both sets of blocked users
    $blockedUsers = $blockedByUserIds->merge($blockedUsersByCurrentUser);

    // Suggested users who are not followed by the user and are not blocked or blocked by the user
    $suggestedUsers = User::whereNotIn('user_id', $verifiedFollowers->pluck('user_id'))
        ->where('user_id', '!=', $user_id)
        ->whereNotIn('user_id', $blockedUsers) // Exclude blocked or blocking users
        ->get(['user_id', 'username', \DB::raw("CONCAT(fname, ' ', lname) as fullname"), 'user_dp', 'fcm_token'])
        ->map(function ($user) {
            $user->user_dp = $user->user_dp ? asset("storage/profile_pic/{$user->user_id}/{$user->user_dp}") : null;
            $verification = Verify::where('user_id', $user->user_id)->first();
            if ($verification) {
                if ($verification->status == 1) {
                    $user['official_status'] = 1; // Status is approved
                } else {
                    $user['official_status'] = 2; // Status is pending
                }
            } else {
                $user['official_status'] = 0; // Status not available (user not verified)
            }
            return $user;
        });

    return response()->json([
        'status' => true,
        'msg' => 'Success',
        'following_list' => $verifiedFollowers,
        'followers_count' => $followersCount,
        'following_count' => $followingCount,
        'suggested_users' => $suggestedUsers,
    ]);
}





public function followerList($user_id)
{
    // Find the user by user_id
    $user = User::find($user_id);

    if (!$user) {
        return response()->json(['status' => 'error', 'msg' => 'User not found'], 404);
    }

    // Retrieve the follower list for the user with selected fields
    $followerList = $user->followers()->with(['user' => function($query) {
        $query->select('user_id', 'username', 'fname', 'lname', 'user_dp','fcm_token');
    }])->get();

    // Extracting only specific fields for each follower and adding profile picture URL
    $formattedFollowerList = $followerList->map(function ($follower) use ($user) {
        $isFollowingBack = $user->following()->where('follower_id', $follower->user->user_id)->exists();
        
        // Check verification status for the follower
        $verification = Verify::where('user_id', $follower->user->user_id)->first();
        if ($verification) {
            if ($verification->status == 1) {
                $officialStatus = 1; // Status is approved
            } else {
                $officialStatus = 2; // Status is pending
            }
        } else {
            $officialStatus = 0; // Status not available (user not verified)
        }

        return [
            'user_id' => $follower->user->user_id,
            'username' => $follower->user->username,
            'fcm_token' => $follower->user->fcm_token,
            'full_name' => $follower->user->fname . ' ' . $follower->user->lname,
            'user_dp' => $follower->user->user_dp ? asset("storage/profile_pic/{$follower->user->user_id}/{$follower->user->user_dp}") : null,
            'status' => $isFollowingBack ? true : false,
            'official_status' => $officialStatus,
        ];
    });

    // Count of followers and following for the user
    $followersCount = $user->followers()->count();
    $followingCount = $user->following()->count();

    return response()->json([
        'status' => true,
        'msg' => 'Success',
        'follower_list' => $formattedFollowerList,
        'followers_count' => $followersCount,
        'following_count' => $followingCount,
    ]);
}




}
