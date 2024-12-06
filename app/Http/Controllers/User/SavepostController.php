<?php

namespace App\Http\Controllers\user;

use App\Http\Controllers\Controller;
use App\Models\Follow;
use App\Models\User;
use App\Models\Verify;
use App\Models\Posttag;
use App\Models\View;
use Illuminate\Http\Request;

use App\Models\Savepost;
use Illuminate\Http\Response;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Storage;

class SavepostController extends Controller
{
    public function savePost(Request $request, $user_id)
    {
        // Validate only the post_id field
        $validator = \Validator::make($request->all(), [
            'post_id' => 'required|exists:posts,id',
     
        ], [
            'post_id.required' => 'The post_id field is required.',
           
            'post_id.exists' => 'The selected post_id is invalid.',
        ]);
    
        if ($validator->fails()) {
            return response()->json(['message' => 'Validation failed', 'errors' => $validator->errors()], 403);
        }
    
        // Check if the user has already saved the post
        $existingSavepost = Savepost::where('user_id', $user_id)
                                     ->where('post_id', $request->input('post_id'))
                                     ->first();
    
        if ($existingSavepost) {
            // Delete the existing savepost entry to toggle saving/un-saving the post
            $existingSavepost->delete();
            
            return response()->json(['message' => 'Post unsaved successfully'], 200);
        }
    
        // Create a new Savepost model instance
        $savepost = new Savepost();
        $savepost->user_id = $user_id; // Use the $user_id passed from the route
        $savepost->post_id = $request->input('post_id');
        
        // Save the data
        $savepost->save();
    
        // Return success response
        return response()->json(['message' => 'Post saved successfully'], 200);
    }
    



    

    
//     public function getUserSavedPosts($user_id)
// {
//     try {
//         // Retrieve user's saved posts with necessary relationships
//         $userPosts = Savepost::where('user_id', $user_id)
//             ->with('posts.likes', 'posts.comments.user', 'posts.tags.user')
//             ->get();

//         if ($userPosts->isEmpty()) {
//             return response()->json(['message' => 'No posts found for this user'], 200);
//         }

//         // Format the user's posts
//         $formattedPosts = $userPosts->map(function ($savepost) use ($user_id) {
//             $post = $savepost->posts;

//             // Format video and thumbnail URLs
//             $post->video = isset($post->video) ? Storage::disk('s3')->url($post->video) : null;
//             $post->thumbnail = $post->thumbnail ? asset("storage/thumbnail/{$post->thumbnail}") : null;

//             // Format user details
//             $post->username = $post->user->username;
//             $post->fcm_token = $post->user->fcm_token;
//             $post->fullname = $post->user->fname . ' ' . $post->user->lname;
//             $post->user_dp = $post->user->user_dp ? asset("storage/profile_pic/{$post->user->user_id}/{$post->user->user_dp}") : null;
//             $post->created_at_formatted = Carbon::parse($post->created_at)->diffForHumans();
//             unset($post->user);

//             // Count the likes where like_status is true and set like_count
//             $post->like_count = $post->likes->where('like_status', true)->count();
//             unset($post->likes);

//             // Count comments
//             $post->comment_count = $post->comments->count();
//             unset($post->comments);
//             $post->view_count = $post->views->count();
//             unset($post->views);

//             // Set like status
//             $like = $post->likes->firstWhere('user_id', $user_id);
//             $post->like_status = $like ? ($like->like_status == 1 ? true : false) : false;
//             unset($post->likes);

//             // Set save status
//             $post->save_status = true;

//             // Set view status (assuming it's not needed for saved posts)
//             $post->view_status = null;

//             // Set follow status
//             $followStatus = Follow::where('user_id', $user_id)
//                 ->where('follower_id', $post->user_id)
//                 ->exists();
//             $post->follow_status = $followStatus ? true : false;

//             // Check official status
//             $verification = Verify::where('user_id', $post->user->user_id)->first();
//             $officialStatus = $verification ? ($verification->status == 1 ? 1 : 2) : 0;
//             $post->official_status = $officialStatus;
//             unset($post->user);

//             // Include tags data
//               $post->tags_data = $post->tags->map(function ($tag) {
//                 if ($tag->user) {
//                     return [
//                         'tag_id' =>$tag->id,
//                         'user_id' => $tag->user->user_id,
//                         'username' => $tag->user->username,
//                         'user_dp' => $tag->user->user_dp
//                             ? asset("storage/profile_pic/{$tag->user->user_id}/{$tag->user->user_dp}")
//                             : null
//                     ];
//                 }
//                 return null; // Ensure to return null if tag->user is null to avoid errors
//             })->filter();
//             unset($post->tags);

//             return $post;
//         });

//         return response()->json(['message' => 'User saved posts retrieved successfully', 'data' => $formattedPosts], 200);
//     } catch (\Exception $e) {
//         return response()->json(['message' => 'Failed to retrieve user saved posts', 'error' => $e->getMessage()], 500);
//     }
// }


public function getUserSavedPosts($user_id, Request $request)
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

        // Retrieve paginated saved posts with necessary relationships
        $userPosts = Savepost::where('user_id', $user_id)
            ->with(['posts.likes', 'posts.comments.user', 'posts.tags.user'])
            ->paginate($perPage);

        if ($userPosts->isEmpty()) {
            return response()->json(['message' => 'No posts found for this user'], 200);
        }

        // Process and format the user's saved posts
        $userPosts->getCollection()->transform(function ($savepost) use ($user_id) {
            $post = $savepost->posts;

            // Format video and thumbnail URLs
            $post->video = isset($post->video) ? Storage::disk('s3')->url($post->video) : null;
            $post->thumbnail = $post->thumbnail ? asset("storage/thumbnail/{$post->thumbnail}") : null;

            // Format user details
            $post->username = $post->user->username;
            $post->fcm_token = $post->user->fcm_token;
            $post->fullname = "{$post->user->fname} {$post->user->lname}";
            $post->user_dp = $post->user->user_dp
                ? asset("storage/profile_pic/{$post->user->user_id}/{$post->user->user_dp}")
                : null;
            $post->created_at_formatted = Carbon::parse($post->created_at)->diffForHumans();
            unset($post->user);

            // Count likes, comments, and views
            $post->like_count = $post->likes->where('like_status', true)->count();
            $post->comment_count = $post->comments->count();
            $post->view_count = $post->views->count();

            // Set like status
            $like = $post->likes->firstWhere('user_id', $user_id);
            $post->like_status = $like ? ($like->like_status == 1 ? true : false) : false;

            // Set save and follow statuses
            $post->save_status = true;
            $post->follow_status = Follow::where('user_id', $user_id)
                ->where('follower_id', $post->user_id)
                ->exists();

            // Official status
            $verification = Verify::where('user_id', $post->user_id)->first();
            $post->official_status = $verification ? ($verification->status == 1 ? 1 : 2) : 0;

            // Include tags data
            $post->tags_data = $post->tags->map(function ($tag) {
                if ($tag->user) {
                    return [
                        'tag_id' => $tag->id,
                        'user_id' => $tag->user->user_id,
                        'username' => $tag->user->username,
                        'user_dp' => $tag->user->user_dp
                            ? asset("storage/profile_pic/{$tag->user->user_id}/{$tag->user->user_dp}")
                            : null,
                    ];
                }
                return null;
            })->filter();
            unset($post->tags);

            return $post;
        });

        return response()->json([
            'message' => 'User saved posts retrieved successfully',
            'data' => $userPosts,
        ], 200);
    } catch (\Exception $e) {
        return response()->json([
            'message' => 'Failed to retrieve user saved posts',
            'error' => $e->getMessage(),
        ], 500);
    }
}


// public function getUserTaggedPosts($user_id)
// {
//     try {
//         // Retrieve posts tagged by the specified user
//         $taggedPosts = Posttag::where('user_id', $user_id)
//             ->with('post.likes', 'post.comments.user', 'post.user', 'post.tags.user')
//             ->get();

//         if ($taggedPosts->isEmpty()) {
//             return response()->json(['message' => 'No posts found tagged by this user'], 200);
//         }

//         // Format the tagged posts
//         $formattedPosts = $taggedPosts->map(function ($posttag) use ($user_id) {
//             $post = $posttag->post;

//             if (!$post || !$post->user) {
//                 return null; // Skip this post if it doesn't have a user
//             }

//             // Format video and thumbnail URLs
//             $post->video = isset($post->video) ? Storage::disk('s3')->url($post->video) : null;
//             $post->thumbnail = $post->thumbnail ? asset("storage/thumbnail/{$post->thumbnail}") : null;

//             // Format user details with null checks
//             $post->username = $post->user->username ?? null;
//             $post->fcm_token = $post->user->fcm_token ?? null;
//             $post->fullname = ($post->user->fname ?? '') . ' ' . ($post->user->lname ?? '');
//             $post->user_dp = $post->user->user_dp ? asset("storage/profile_pic/{$post->user->user_id}/{$post->user->user_dp}") : null;
//             $post->created_at_formatted = $post->created_at ? Carbon::parse($post->created_at)->diffForHumans() : null;

//             // Count the likes where like_status is true and set like_count
//             $post->like_count = $post->likes->where('like_status', true)->count();
//             unset($post->likes);

//             // Count comments
//             $post->comment_count = $post->comments->count();
//             unset($post->comments);
//             $post->view_count = $post->views->count();
//             unset($post->views);

//             // Set like status
//             $like = $post->likes->firstWhere('user_id', $user_id);
//             $post->like_status = $like ? ($like->like_status == 1 ? true : false) : false;
//             unset($post->likes);

//             // Set save status
//             $post->save_status = true;

//             // Set view status (assuming it's not needed for tagged posts)
//             $post->view_status = null;

//             // Set follow status
//             $followStatus = Follow::where('user_id', $user_id)
//                 ->where('follower_id', $post->user_id)
//                 ->exists();
//             $post->follow_status = $followStatus ? true : false;

//             // Check official status
//             $verification = Verify::where('user_id', $post->user->user_id)->first();
//             $officialStatus = $verification ? ($verification->status == 1 ? 1 : 2) : 0;
//             $post->official_status = $officialStatus;
//             unset($post->user);

//             // Include tags data with null checks
//             $post->tags_data = $post->tags->map(function ($tag) {
//                 return [
//                     'tag_id' =>$tag->id,
//                     'user_id' => $tag->user->user_id ?? null,
//                     'username' => $tag->user->username ?? null,
//                     'user_dp' => $tag->user ? ($tag->user->user_dp ? asset("storage/profile_pic/{$tag->user_id}/{$tag->user->user_dp}") : null) : null
//                 ];
//             });
//             unset($post->tags);

//             return $post;
//         })->filter(); // Filter out null values

//         return response()->json(['message' => 'User tagged posts retrieved successfully', 'data' => $formattedPosts], 200);
//     } catch (\Exception $e) {
//         return response()->json(['message' => 'Failed to retrieve user tagged posts', 'error' => $e->getMessage()], 500);
//     }
// }

public function getUserTaggedPosts($user_id, Request $request)
{
    try {
        // Validate user ID
        if (!$user_id) {
            return response()->json(['message' => 'User ID is required'], 400);
        }

        // Check if the user exists
        $user = User::find($user_id);
        if (!$user) {
            return response()->json(['message' => 'User does not exist'], 404);
        }

        // Pagination parameters
        $perPage = $request->input('per_page', 10); // Default items per page

        // Fetch tagged posts with pagination
        $taggedPosts = Posttag::where('user_id', $user_id)
            ->with(['post.user', 'post.tags.user', 'post.likes', 'post.comments', 'post.views'])
            ->paginate($perPage);

        if ($taggedPosts->isEmpty()) {
            return response()->json(['message' => 'No posts found tagged by this user'], 200);
        }

        // Format the tagged posts
        $formattedPosts = $taggedPosts->getCollection()->map(function ($posttag) use ($user_id) {
            $post = $posttag->post;

            if (!$post || !$post->user) {
                return null; // Skip invalid posts
            }

            // Format URLs
            $post->video = $post->video ? Storage::disk('s3')->url($post->video) : null;
            $post->thumbnail = $post->thumbnail ? asset($post->thumbnail) : null;

            // User details
            $post->username = $post->user->username ?? null;
            $post->fullname = trim(($post->user->fname ?? '') . ' ' . ($post->user->lname ?? ''));
            $post->user_dp = $post->user->user_dp ? asset("storage/profile_pic/{$post->user->user_id}/{$post->user->user_dp}") : null;
            $post->created_at_formatted = $post->created_at ? $post->created_at->diffForHumans() : null;

            // Count stats
            $post->like_count = $post->likes->where('like_status', true)->count();
            $post->comment_count = $post->comments->count();
            $post->view_count = $post->views->count();

            // Status checks
            $post->like_status = $post->likes->contains('user_id', $user_id);
            $post->save_status = true; // Adjust if necessary
            $post->follow_status = Follow::where('user_id', $user_id)
                ->where('follower_id', $post->user_id)
                ->exists();

            // Official status
            $verification = $post->user->verify ?? null;
            $post->official_status = $verification ? ($verification->status == 1 ? 1 : 2) : 0;

            // Tags data
            $post->tags_data = $post->tags->map(function ($tag) {
                return [
                    'tag_id' => $tag->id,
                    'user_id' => $tag->user->user_id ?? null,
                    'username' => $tag->user->username ?? null,
                    'user_dp' => $tag->user && $tag->user->user_dp
                        ? asset("storage/profile_pic/{$tag->user->user_id}/{$tag->user->user_dp}")
                        : null,
                ];
            });

            // Remove unnecessary relationships
            unset($post->tags, $post->likes, $post->comments, $post->views, $post->user);

            return $post;
        })->filter(); // Remove null values

        // Replace the collection with the formatted data
        $taggedPosts->setCollection($formattedPosts);

        return response()->json([
            'message' => 'User tagged posts retrieved successfully',
            'data' => $taggedPosts,
        ], 200);
    } catch (\Exception $e) {
        return response()->json([
            'message' => 'Failed to retrieve user tagged posts',
            'error' => $e->getMessage(),
        ], 500);
    }
}


    
}
