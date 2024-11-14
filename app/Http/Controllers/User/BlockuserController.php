<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Blockuser;
use App\Models\User;
use App\Models\Follow;
use App\Models\Posttag;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class BlockuserController extends Controller
{
//   public function blockUser(Request $request, $user_id)
// {
//     $validator = Validator::make($request->all(), [
//         'block_uuid' => 'required|exists:users,uuid',
//         'type' => 'required|in:0,1', // Ensure type is either 0 or 1
//     ]);

//     if ($validator->fails()) {
//         return response()->json(['error' => $validator->errors()], 422);
//     }

//     $blockingUser = User::where('user_id', $user_id)->first();
//     if (!$blockingUser) {
//         return response()->json(['error' => 'User not found'], 404);
//     }

//     $blockedUser = User::where('uuid', $request->block_uuid)->first();
//     if (!$blockedUser) {
//         return response()->json(['error' => 'Blocked user not found'], 404);
//     }

//     $existingBlock = Blockuser::where('user_id', $blockingUser->user_id)
//                               ->where('block_uuid', $request->block_uuid)
//                               ->first();

//     if ($request->type == 1) {
//         // Block user
//         if ($existingBlock) {
//             return response()->json(['message' => 'You have already blocked this user'], 400);
//         }

//         $blockuser = Blockuser::create([
//             'user_id' => $blockingUser->user_id,
//             'full_name' => $blockingUser->fname . ' ' . $blockingUser->lname,
//             'block_uuid' => $request->block_uuid,
//             'block_id' => $blockedUser->user_id,
//             'blocked_at' => now(),
//         ]);

//         return response()->json(['message' => 'User blocked successfully', 'data' => $blockuser], 200);
//     } elseif ($request->type == 0) {
//         // Unblock user
//         if (!$existingBlock) {
//             return response()->json(['message' => 'This user is not blocked'], 400);
//         }

//         $existingBlock->delete();
//         return response()->json(['message' => 'User unblocked successfully'], 200);
//     }

//     return response()->json(['error' => 'Invalid request'], 400);
// }

// public function blockUser(Request $request, $user_id)
// {
//     $validator = Validator::make($request->all(), [
//         'block_uuid' => 'required|exists:users,uuid',
//         'type' => 'required|in:0,1', // Ensure type is either 0 or 1
//     ]);

//     if ($validator->fails()) {
//         return response()->json(['error' => $validator->errors()], 422);
//     }

//     $blockingUser = User::where('user_id', $user_id)->first();
//     if (!$blockingUser) {
//         return response()->json(['error' => 'User not found'], 404);
//     }

//     $blockedUser = User::where('uuid', $request->block_uuid)->first();
//     if (!$blockedUser) {
//         return response()->json(['error' => 'Blocked user not found'], 404);
//     }

//     $existingBlock = Blockuser::where('user_id', $blockingUser->user_id)
//                               ->where('block_uuid', $request->block_uuid)
//                               ->first();

//     if ($request->type == 1) {
//         // Block user
//         if ($existingBlock) {
//             return response()->json(['message' => 'You have already blocked this user'], 400);
//         }

//         // Remove the blocked user from follow and following lists
//         Follow::where('user_id', $blockingUser->user_id)
//             ->where('follower_id', $blockedUser->user_id)
//             ->delete();

//         Follow::where('user_id', $blockedUser->user_id)
//             ->where('follower_id', $blockingUser->user_id)
//             ->delete();

//         $blockuser = Blockuser::create([
//             'user_id' => $blockingUser->user_id,
//             'full_name' => $blockingUser->fname . ' ' . $blockingUser->lname,
//             'block_uuid' => $request->block_uuid,
//             'block_id' => $blockedUser->user_id,
//             'blocked_at' => now(),
//         ]);

//         return response()->json(['message' => 'User blocked successfully', 'data' => $blockuser], 200);
//     } elseif ($request->type == 0) {
//         // Unblock user
//         if (!$existingBlock) {
//             return response()->json(['message' => 'This user is not blocked'], 400);
//         }

//         $existingBlock->delete();
//         return response()->json(['message' => 'User unblocked successfully'], 200);
//     }

//     return response()->json(['error' => 'Invalid request'], 400);
// }
public function blockUser(Request $request, $user_id)
{
    $validator = Validator::make($request->all(), [
        'block_uuid' => 'required|exists:users,uuid',
        'type' => 'required|in:0,1', // Ensure type is either 0 or 1
    ]);

    if ($validator->fails()) {
        return response()->json(['error' => $validator->errors()], 422);
    }

    $blockingUser = User::where('user_id', $user_id)->first();
    if (!$blockingUser) {
        return response()->json(['error' => 'User not found'], 404);
    }

    $blockedUser = User::where('uuid', $request->block_uuid)->first();
    if (!$blockedUser) {
        return response()->json(['error' => 'Blocked user not found'], 404);
    }

    $existingBlock = Blockuser::where('user_id', $blockingUser->user_id)
                              ->where('block_uuid', $request->block_uuid)
                              ->first();

    if ($request->type == 1) {
        // Block user
        if ($existingBlock) {
            return response()->json(['message' => 'You have already blocked this user'], 400);
        }

        // Remove the blocked user from follow and following lists
        Follow::where('user_id', $blockingUser->user_id)
            ->where('follower_id', $blockedUser->user_id)
            ->delete();

        Follow::where('user_id', $blockedUser->user_id)
            ->where('follower_id', $blockingUser->user_id)
            ->delete();

        // Create a new block record
        $blockuser = Blockuser::create([
            'user_id' => $blockingUser->user_id,
            'full_name' => $blockingUser->fname . ' ' . $blockingUser->lname,
            'block_uuid' => $request->block_uuid,
            'block_id' => $blockedUser->user_id,
            'blocked_at' => now(),
        ]);

        // Remove tags only from posts where the blocking user is tagged in the blocked user's posts
        Posttag::whereHas('post', function($query) use ($blockedUser) {
            $query->where('user_id', $blockedUser->user_id); // Posts by the blocked user
        })->where('user_id', $blockingUser->user_id)->delete(); // Tags for the blocking user

        return response()->json(['message' => 'User blocked successfully, and your tag removed from their posts', 'data' => $blockuser], 200);
    } elseif ($request->type == 0) {
        // Unblock user
        if (!$existingBlock) {
            return response()->json(['message' => 'This user is not blocked'], 400);
        }

        $existingBlock->delete();
        return response()->json(['message' => 'User unblocked successfully'], 200);
    }

    return response()->json(['error' => 'Invalid request'], 400);
}



    
    public function getBlockedUsers($user_id)
    {
        $blockingUser = User::where('user_id', $user_id)->first();

        if (!$blockingUser) {
            return response()->json(['error' => 'User not found'], 404);
        }

        $blockedUsers = Blockuser::where('blockusers.user_id', $user_id)
            ->join('users', 'blockusers.block_id', '=', 'users.user_id')
            ->select('users.user_id', 'users.uuid', 'users.username', 'users.user_dp', 'users.fname', 'users.lname' )
            ->get();

        $blockedUsersList = $blockedUsers->map(function ($user) {
            return [
                'user_id' => $user->user_id,
                'uuid' => $user->uuid,
                  'full_name' => $user->fname . ' ' . $user->lname,
                'username' => $user->username,
                'user_dp' => $user->user_dp ? asset("storage/profile_pic/{$user->user_id}/{$user->user_dp}") : null,
            ];
        });

        return response()->json(['blocked_users' => $blockedUsersList], 200);
    }
    
    
}
