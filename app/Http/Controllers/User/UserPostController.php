<?php

namespace App\Http\Controllers\user;

use App\Http\Controllers\Controller;
use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use App\Models\User;
use App\Models\Verify;
use App\Models\Follow;
use Illuminate\Support\Facades\Storage;

class UserPostController extends Controller
{
   

// public function getUserPosts($user_id, $view_id = null)
// {
//     try {
//         // Ensure user_id is provided and valid
//         if (!$user_id) {
//             return response()->json(['message' => 'User ID is required'], 400);
//         }

//         $user = User::find($user_id);
//         if (!$user) {
//             return response()->json(['message' => 'User does not exist'], 400);
//         }

//         // Retrieve posts for the given user_id
//         $posts = Post::with(['user', 'tags.user', 'likes'])
//             ->where('user_id', $user_id)
//             ->latest()
//             ->get(['id', 'user_id', 'title', 'description', 'video', 'thumbnail', 'created_at', 'updated_at']);

//         if ($posts->isEmpty()) {
//             return response()->json(['message' => 'There are no posts for this user'], 400);
//         }

//         // Process each post to include additional information (like counts, user details, etc.)
//         $posts->each(function ($post) use ($user_id, $view_id) {
//             $post->video = Storage::disk('s3')->url("{$post->video}");
//             $post->thumbnail = asset("storage/thumbnail/{$post->thumbnail}");
//             $post->like_count = $post->likes()->count();
//             $post->comment_count = $post->comments()->count();
//             $post->share_count = $post->shares()->count();
//             $post->view_count = $post->views()->count();

//             // User details for the post owner
//             $post->username = $post->user->username;
//             $post->fullname = $post->user->fname . ' ' . $post->user->lname;
//             $post->user_dp = $post->user->user_dp
//                 ? asset("storage/profile_pic/{$post->user->user_id}/{$post->user->user_dp}")
//                 : null;
//             $post->fcm_token = $post->user->fcm_token ?? null;
//             $post->created_at_formatted = Carbon::parse($post->created_at)->diffForHumans();

//             // Check verification status for the post's owner
//             $verification = Verify::where('user_id', $post->user->user_id)->first();
//             $post->official_status = $verification ? ($verification->status == 1 ? 1 : 2) : 0;

//             // Check like, save, and view statuses
//             if ($view_id) {
//                 // Viewer is specified
//                 $like = $post->likes->firstWhere('user_id', $view_id);
//                 $post->like_status = $like ? ($like->like_status == 1 ? true : false) : false;
//                 $post->save_status = $post->saveposts()->where('user_id', $view_id)->exists();
//                 $post->view_status = $post->views()->where('user_id', $view_id)->exists();
//             } else {
//                 // Viewer is the post owner
//                 $post->like_status = $post->likes->contains('user_id', $user_id);
//                 $post->save_status = $post->saveposts()->where('user_id', $user_id)->exists();
//                 $post->view_status = $post->views()->where('user_id', $user_id)->exists();
//             }

//             // Check if view_id follows post's user_id (follow relationship)
//             $post->follow_status = $view_id && $post->user ? 
//                 (bool) Follow::where('follower_id', $post->user_id)
//                             ->where('user_id', $view_id)
//                             ->exists() 
//                 : false;

//             // Handle tags data
//             $post->tags_data = $post->tags->map(function ($tag) {
//                 if ($tag->user) {
//                     return [
//                         'tag_id' => $tag->id,
//                         'user_id' => $tag->user->user_id,
//                         'username' => $tag->user->username,
//                         'user_dp' => $tag->user->user_dp
//                             ? asset("storage/profile_pic/{$tag->user->user_id}/{$tag->user->user_dp}")
//                             : null
//                     ];
//                 }
//                 return null; // Return null if tag->user is null
//             })->filter(); // Remove any null entries

//             // Unset unused relationships to avoid sending unnecessary data
//             unset($post->tags);
//             unset($post->user);
//             unset($post->likes);
//         });

//         return response()->json(['message' => 'Posts retrieved successfully', 'data' => $posts], 200);
//     } catch (\Exception $e) {
//         return response()->json(['message' => 'Failed to retrieve posts', 'error' => $e->getMessage()], 500);
//     }
// }

public function getUserPosts($user_id, $view_id = null, Request $request)
{
    try {
        // Ensure user_id is provided and valid
        if (!$user_id) {
            return response()->json(['message' => 'User ID is required'], 400);
        }

        $user = User::find($user_id);
        if (!$user) {
            return response()->json(['message' => 'User does not exist'], 400);
        }

        // Pagination parameters
        $perPage = $request->input('per_page', 10); // Default items per page
        $posts = Post::with(['user', 'tags.user', 'likes'])
            ->where('user_id', $user_id)
            ->latest()
            ->paginate($perPage, ['id', 'user_id', 'title', 'description', 'video', 'thumbnail', 'created_at', 'updated_at']);

        if ($posts->isEmpty()) {
            return response()->json(['message' => 'There are no posts for this user'], 400);
        }

        // Process each post to include additional information
        $posts->getCollection()->transform(function ($post) use ($user_id, $view_id) {
            $post->video = Storage::disk('s3')->url($post->video);
            $post->thumbnail = asset($post->thumbnail);
            $post->like_count = $post->likes()->count();
            $post->comment_count = $post->comments()->count();
            $post->share_count = $post->shares()->count();
            $post->view_count = $post->views()->count();

            // User details for the post owner
            $post->username = $post->user->username;
            $post->fullname = "{$post->user->fname} {$post->user->lname}";
            $post->user_dp = $post->user->user_dp
                ? asset("storage/profile_pic/{$post->user->user_id}/{$post->user->user_dp}")
                : null;
            $post->fcm_token = $post->user->fcm_token ?? null;
            $post->created_at_formatted = $post->created_at->diffForHumans();

            // Verification status for the post owner
            $verification = Verify::where('user_id', $post->user->user_id)->first();
            $post->official_status = $verification ? ($verification->status == 1 ? 1 : 2) : 0;

            // Like, save, and view statuses
            $post->like_status = $view_id
                ? $post->likes->firstWhere('user_id', $view_id)?->like_status == 1
                : $post->likes->contains('user_id', $user_id);
            $post->save_status = $post->saveposts()->where('user_id', $view_id ?? $user_id)->exists();
            $post->view_status = $post->views()->where('user_id', $view_id ?? $user_id)->exists();

            // Follow status
            $post->follow_status = $view_id && $post->user
                ? Follow::where('follower_id', $post->user_id)->where('user_id', $view_id)->exists()
                : false;

            // Tags data
            $post->tags_data = $post->tags->map(function ($tag) {
                return $tag->user ? [
                    'tag_id' => $tag->id,
                    'user_id' => $tag->user->user_id,
                    'username' => $tag->user->username,
                    'user_dp' => $tag->user->user_dp
                        ? asset("storage/profile_pic/{$tag->user->user_id}/{$tag->user->user_dp}")
                        : null,
                ] : null;
            })->filter();

            // Clean up unused relationships
            unset($post->tags, $post->user, $post->likes);

            return $post;
        });

        return response()->json([
            'message' => 'Posts retrieved successfully',
            'data' => $posts,
        ], 200);
    } catch (\Exception $e) {
        return response()->json([
            'message' => 'Failed to retrieve posts',
            'error' => $e->getMessage(),
        ], 500);
    }
}



}
