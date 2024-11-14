<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DeleteuserController extends Controller
{
    public function deleteUserAccount($user_id)
    {
        // Start a transaction to ensure all operations succeed or fail together
        DB::beginTransaction();

        try {
            // Find the user by user_id
            $user = User::findOrFail($user_id);

            // Mark the user as deleted (set deleted = 1)
            $user->deleted = 1;
            $user->save();

            // Delete related data
            $user->posts()->delete();
            $user->notifications()->delete();
            $user->likes()->delete();
            $user->withdrawl()->delete();
            $user->chats()->delete();
            $user->comments()->delete();
            $user->replycomments()->delete();
            $user->shares()->delete();
            $user->views()->delete();
            $user->wallet()->delete();
            $user->followers()->delete();
            $user->following()->delete();
            $user->savedPosts()->delete();
            $user->bank()->delete();
            $user->userdata()->delete();
            $user->verify()->delete();
            $user->livestreams()->delete();
            $user->blockmessage()->delete();
            $user->report()->delete();
            $user->posttag()->delete();

            // Commit the transaction
            DB::commit();

            return response()->json(['status' => 'success', 'message' => 'User account deleted successfully'], 200);
        } catch (\Exception $e) {
            // Rollback the transaction if something goes wrong
            DB::rollBack();

            return response()->json(['status' => 'error', 'message' => 'Failed to delete user account', 'error' => $e->getMessage()], 500);
        }
    }
}
