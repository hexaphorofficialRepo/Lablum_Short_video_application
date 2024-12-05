<?php

namespace App\Http\Controllers\user;

use App\Http\Controllers\Controller;
use App\Models\Follow;
use App\Models\Blockuser;
use App\Models\Post;
use App\Models\User;
use App\Models\Verify;
use App\Models\View;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class SearchController extends Controller
{


    public function allPosts($user_id = null)
    {
        try {
            $posts = Post::with([
                'user' => function ($query) use ($user_id) {
                    $query->select('user_id', 'username', 'fname', 'lname', 'user_dp','fcm_token');
    
                    // Include follow status if user_id is provided
                    if ($user_id) {
                        $query->with([
                            'followers' => function ($followerQuery) use ($user_id) {
                                $followerQuery->where('follower_id', $user_id);
                            }
                        ]);
                    }
                },
                'likes' => function ($query) {
                    $query->where('like_status', 1);
                }
            ])->latest()->get(['id', 'user_id',  'title', 'description', 'video', 'thumbnail', 'created_at', 'updated_at']);
    
            $posts->each(function ($post) use ($user_id) {
                $post->video = Storage::disk('s3')->url("{$post->video}");
                $post->thumbnail = asset($post->thumbnail);
                $post->like_count = $post->likes()->count();
                $post->comment_count = $post->comments()->count();
                $post->share_count = $post->shares()->count();
                $post->username = $post->user->username;
                $post->fcm_token = $post->user->fcm_token;
                $post->fullname = $post->user->fname . ' ' . $post->user->lname;
                $post->user_dp = $post->user->user_dp
                    ? asset("storage/profile_pic/{$post->user->user_id}/{$post->user->user_dp}")
                    : null;
    
                $post->created_at_formatted = Carbon::parse($post->created_at)->diffForHumans();
                unset ($post->user);
    
                // Count the likes where like_status is 1 and set like_count
                $post->like_count = $post->likes->count();
                unset ($post->likes); // Unset the likes collection
    
                // Check if the user has liked the post
                if ($user_id) {
                    $like = $post->likes->firstWhere('user_id', $user_id);
                    $post->like_status = $like ? ($like->like_status == 1 ? true : false) : false;
                    unset ($post->likes); // Unset the likes collection
                } else {
                    $post->like_status = null;
                }
    
                // Check if the user has saved the post
                if ($user_id) {
                    $post->save_status = $post->saveposts()->where('user_id', $user_id)->exists();
                } else {
                    $post->save_status = false;
                }
    
                if ($user_id) {
                    $view = View::where('post_id', $post->id)
                        ->where('user_id', $user_id)
                        ->first();
                    $post->view_status = $view ? true : false;
                } else {
                    $post->view_status = null;
                }
    
                // Check if the user specified in the route is following the user who made the post
                if ($user_id) {
                    $followStatus = Follow::where('user_id', $user_id)
                        ->where('follower_id', $post->user->user_id)
                        ->exists();
    
                    $post->follow_status = $followStatus ? true : false;
                } else {
                    $post->follow_status = null;
                }
    
                // Fetch verification status for the user who made the post
                $verification = Verify::where('user_id', $post->user_id)->first();
                if ($verification) {
                    if ($verification->status == 1) {
                        $officialStatus = 1; // Status is approved
                    } else {
                        $officialStatus = 2; // Status is pending
                    }
                } else {
                    $officialStatus = 0; // Status not available (user not verified)
                }
                $post->official_status = $officialStatus;
    
                // Unset unnecessary attributes
                unset ($post->user->followers);
                unset ($post->user);
            });
    
            return response()->json(['message' => 'Posts retrieved successfully', 'data' => $posts], 200);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Failed to retrieve posts', 'error' => $e->getMessage()], 500);
        }
    }
    

















   


   public function getAllUsers()
{
    try {
        // Get all users excluding those marked as deleted
        $users = User::where('deleted', 0)->latest()->get();

        // Format response data
        $formattedUsers = $users->map(function ($user) {
            // Check verification status for the user
            $verification = Verify::where('user_id', $user->user_id)->first();
            $officialStatus = $verification ? ($verification->status == 1 ? 1 : 2) : 0;

            return [
                'user_id' => $user->user_id,
                'username' => $user->username,
                'fullname' => $user->fname . ' ' . $user->lname,
                'user_dp' => $user->user_dp ? asset("storage/profile_pic/{$user->user_id}/{$user->user_dp}") : null,
                'official_status' => $officialStatus,
            ];
        });

        return response()->json(['message' => 'Users retrieved successfully', 'data' => $formattedUsers], 200);
    } catch (\Exception $e) {
        return response()->json(['message' => 'Failed to retrieve users', 'error' => $e->getMessage()], 500);
    }
}

    











    // public function searchPost(Request $request, $user_id = null)
    // {
    //     try {
    //         // Get the search query from the request query parameters
    //         $searchQuery = $request->query('search_input');
    
    //         // Check if search query is empty
    //         if (!$searchQuery) {
    //             return response()->json(['message' => 'Search query is empty'], 400);
    //         }
    
    //         // Query the posts where title or description contains the search query
    //         $posts = Post::with(['user', 'likes' => function ($query) use ($user_id) {
    //             $query->where('user_id', $user_id);
    //         }])
    //             ->where('title', 'like', "%$searchQuery%")
    //             ->orWhere('description', 'like', "%$searchQuery%")
    //             ->latest()
    //             ->get(['id', 'user_id', 'like_count', 'comment_count', 'share_count', 'title', 'description', 'video', 'thumbnail', 'created_at', 'updated_at']);
    
    //         $posts->each(function ($post) use ($user_id) {
    //             $post->video = Storage::disk('s3')->url("{$post->video}");
    //             $post->thumbnail = asset("storage/thumbnail/{$post->thumbnail}");
    
    //             $post->username = $post->user->username;
    //             $post->fullname = $post->user->fname . ' ' . $post->user->lname;
    //             $post->user_dp = $post->user->user_dp
    //                 ? asset("storage/profile_pic/{$post->user->user_id}/{$post->user->user_dp}")
    //                 : null;
    //             $post->created_at_formatted = Carbon::parse($post->created_at)->diffForHumans();
    
    //             // Count the likes where like_status is 1 and set like_count
    //             $post->like_count = $post->likes->count();
    //             unset($post->likes); // Unset the likes collection
    
    //             // Check if the user has liked the post
    //             $like = $post->likes->firstWhere('user_id', $user_id);
    //             $post->like_status = $like ? ($like->like_status == 1 ? true : false) : false;
    //             unset($post->likes);
    
    //             // Check if the user has saved the post
    //             $post->save_status = $user_id ? $post->saveposts()->where('user_id', $user_id)->exists() : false;
    
    //             // Check if the user has viewed the post
    //             $post->view_status = $user_id ? View::where('post_id', $post->id)->where('user_id', $user_id)->exists() : false;
    
    //             // Check if the user is following the author of the post
    //             $post->follow_status = $user_id ? Follow::where('user_id', $user_id)->where('follower_id', $post->user->user_id)->exists() : null;
    
    //             // Check verification status for the post user
    //             $verification = Verify::where('user_id', $post->user->user_id)->first();
    //             if ($verification) {
    //                 if ($verification->status == 1) {
    //                     $post->official_status = 1; // Status is approved
    //                 } else {
    //                     $post->official_status = 2; // Status is pending
    //                 }
    //             } else {
    //                 $post->official_status = 0; // Status not available (user not verified)
    //             }
    
    //             unset($post->user);
    //         });
    
    //         return response()->json(['message' => 'Posts retrieved successfully', 'data' => $posts], 200);
    //     } catch (\Exception $e) {
    //         return response()->json(['message' => 'Failed to retrieve posts', 'error' => $e->getMessage()], 500);
    //     }
    // }
    
    
    //  public function searchPost(Request $request, $user_id = null)
    // {
    //     try {

    //         $searchQuery = $request->query('search_input');
    
         
    //         if (!$searchQuery) {
    //             return response()->json(['message' => 'Search query is empty'], 400);
    //         }
    
            
    //         $posts = Post::with([
    //             'user', 
    //             'likes' => function ($query) use ($user_id) {
    //                 $query->where('user_id', $user_id);
    //             },
    //             'tags.user'
    //         ])
    //             ->where('title', 'like', "%$searchQuery%")
    //             ->orWhere('description', 'like', "%$searchQuery%")
    //             ->latest()
    //             ->get(['id', 'user_id', 'like_count', 'comment_count', 'share_count', 'title', 'description', 'video', 'thumbnail', 'created_at', 'updated_at']);
    
    //         $posts->each(function ($post) use ($user_id) {
    //             $post->video = isset($post->video) ? Storage::disk('s3')->url($post->video) : null;
    //             $post->thumbnail = $post->thumbnail ? asset("storage/thumbnail/{$post->thumbnail}") : null;
    
    //             $post->username = $post->user->username ?? null;
    //             $post->fullname = ($post->user->fname ?? '') . ' ' . ($post->user->lname ?? '');
    //             $post->user_dp = $post->user->user_dp
    //                 ? asset("storage/profile_pic/{$post->user->user_id}/{$post->user->user_dp}")
    //                 : null;
                    
    //                 $post->fcm_token = $post->user->fcm_token ?? null;
    //             $post->created_at_formatted = $post->created_at ? Carbon::parse($post->created_at)->diffForHumans() : null;
    
          
    //             $post->like_count = $post->likes->where('like_status', true)->count();
    //             unset($post->likes); 
    
               
    //             $like = $post->likes->firstWhere('user_id', $user_id);
    //             $post->like_status = $like ? ($like->like_status == 1 ? true : false) : false;
    
            
    //             $post->save_status = $user_id ? $post->saveposts()->where('user_id', $user_id)->exists() : false;
    
      
    //             $post->view_status = $user_id ? View::where('post_id', $post->id)->where('user_id', $user_id)->exists() : false;
    
         
    //             $post->follow_status = $user_id ? Follow::where('user_id', $user_id)->where('follower_id', $post->user->user_id)->exists() : null;
    
  
    //             $verification = Verify::where('user_id', $post->user->user_id)->first();
    //             if ($verification) {
    //                 $post->official_status = $verification->status == 1 ? 1 : 2;
    //             } else {
    //                 $post->official_status = 0;
    //             }
    
    //             // Include tags data with null checks
    //             $post->tags_data = $post->tags->map(function ($tag) {
    //                 return [
    //                     'user_id' => $tag->user->user_id ?? null,
    //                     'username' => $tag->user->username ?? null,
    //                     'user_dp' => $tag->user ? ($tag->user->user_dp ? asset("storage/profile_pic/{$tag->user->user_id}/{$tag->user->user_dp}") : null) : null
    //                 ];
    //             });
    //             unset($post->tags);
    
    //             unset($post->user);
    //             unset($post->like);
    //         });
    
    //         return response()->json(['message' => 'Posts retrieved successfully', 'data' => $posts], 200);
    //     } catch (\Exception $e) {
    //         return response()->json(['message' => 'Failed to retrieve posts', 'error' => $e->getMessage()], 500);
    //     }
    // }
    
    
    
    // public function searchPost(Request $request, $user_id = null)
    // {
    //     try {
    //         $searchQuery = $request->query('search_input');
    
    //         if (!$searchQuery) {
    //             return response()->json(['message' => 'Search query is empty'], 400);
    //         }
    
    //         // Get the IDs of users who have blocked the searching user
    //         $blockedUserIds = Blockuser::where('block_id', $user_id)->pluck('user_id');
    
    //         // Query the posts, excluding posts from users who have blocked the searching user
    //         $posts = Post::with(['user', 'likes' => function ($query) use ($user_id) {
    //             $query->where('user_id', $user_id);
    //         }])
    //             ->whereNotIn('user_id', $blockedUserIds) // Exclude posts from blocked users
    //             ->where(function ($query) use ($searchQuery) {
    //                 $query->where('title', 'like', "%$searchQuery%")
    //                     ->orWhere('description', 'like', "%$searchQuery%");
    //             })
    //             ->latest()
    //             ->get(['id', 'user_id', 'like_count', 'comment_count', 'share_count', 'title', 'description', 'video', 'thumbnail', 'created_at', 'updated_at']);
    
    //         $posts->each(function ($post) use ($user_id) {
    //             $post->video = Storage::disk('s3')->url("{$post->video}");
    //             $post->thumbnail = asset("storage/thumbnail/{$post->thumbnail}");
    
    //             $post->username = $post->user->username;
    //             $post->fullname = $post->user->fname . ' ' . $post->user->lname;
    //             $post->user_dp = $post->user->user_dp
    //                 ? asset("storage/profile_pic/{$post->user->user_id}/{$post->user->user_dp}")
    //                 : null;
    //             $post->created_at_formatted = Carbon::parse($post->created_at)->diffForHumans();
    
    //             // Count the likes where like_status is 1 and set like_count
    //             $post->like_count = $post->likes->count();
    //             unset($post->likes); // Unset the likes collection
    
    //             // Check if the user has liked the post
    //             $like = $post->likes->firstWhere('user_id', $user_id);
    //             $post->like_status = $like ? ($like->like_status == 1 ? true : false) : false;
    //             unset($post->likes);
    
    //             // Check if the user has saved the post
    //             $post->save_status = $user_id ? $post->saveposts()->where('user_id', $user_id)->exists() : false;
    
    //             // Check if the user has viewed the post
    //             $post->view_status = $user_id ? View::where('post_id', $post->id)->where('user_id', $user_id)->exists() : false;
    
    //             // Check if the user is following the author of the post
    //             $post->follow_status = $user_id ? Follow::where('user_id', $user_id)->where('follower_id', $post->user->user_id)->exists() : null;
    
    //             // Check verification status for the post user
    //             $verification = Verify::where('user_id', $post->user->user_id)->first();
    //             if ($verification) {
    //                 $post->official_status = $verification->status == 1 ? 1 : 2; // 1: Approved, 2: Pending
    //             } else {
    //                 $post->official_status = 0; // Status not available (user not verified)
    //             }
    
    //             unset($post->user);
    //         });
    
    //         return response()->json(['message' => 'Posts retrieved successfully', 'data' => $posts], 200);
    //     } catch (\Exception $e) {
    //         return response()->json(['message' => 'Failed to retrieve posts', 'error' => $e->getMessage()], 500);
    //     }
    // }
    
    
    public function searchPost(Request $request, $user_id = null)
{
    try {
        $searchQuery = $request->query('search_input');

        if (!$searchQuery) {
            return response()->json(['message' => 'Search query is empty'], 400);
        }

        // Get the IDs of users who have blocked the searching user
        $blockedUserIds = Blockuser::where('block_id', $user_id)->pluck('user_id');

        // Query the posts, excluding posts from users who have blocked the searching user
        $posts = Post::with(['user', 'likes' => function ($query) use ($user_id) {
            $query->where('user_id', $user_id);
        }, 'tags'])
            ->whereNotIn('user_id', $blockedUserIds) // Exclude posts from blocked users
            ->where(function ($query) use ($searchQuery) {
                $query->whereRaw('LOWER(title) LIKE ?', ["%".strtolower($searchQuery)."%"])
                      ->orWhereRaw('LOWER(description) LIKE ?', ["%".strtolower($searchQuery)."%"]);
            })
            ->latest()
            ->get(['id', 'user_id', 'like_count', 'comment_count', 'share_count', 'title', 'description', 'video', 'thumbnail', 'created_at', 'updated_at']);

        $posts->each(function ($post) use ($user_id) {
            $post->video = Storage::disk('s3')->url($post->video);
            $post->thumbnail = asset("storage/thumbnail/{$post->thumbnail}");

            $post->username = $post->user->username;
            $post->fullname = $post->user->fname . ' ' . $post->user->lname;
            $post->user_dp = $post->user->user_dp
                ? asset("storage/profile_pic/{$post->user->user_id}/{$post->user->user_dp}")
                : null;
            $post->created_at_formatted = Carbon::parse($post->created_at)->diffForHumans();

            // Count the likes where like_status is 1 and set like_count
            $post->like_count = $post->likes->count();
            unset($post->likes); // Unset the likes collection

            // Check if the user has liked the post
            $like = $post->likes->firstWhere('user_id', $user_id);
            $post->like_status = $like ? ($like->like_status == 1 ? true : false) : false;
            unset($post->likes);

            // Check if the user has saved the post
            $post->save_status = $user_id ? $post->saveposts()->where('user_id', $user_id)->exists() : false;

            // Check if the user has viewed the post
            $post->view_status = $user_id ? View::where('post_id', $post->id)->where('user_id', $user_id)->exists() : false;

            // Check if the user is following the author of the post
            $post->follow_status = $user_id ? Follow::where('user_id', $user_id)->where('follower_id', $post->user->user_id)->exists() : null;

            // Check verification status for the post user
            $verification = Verify::where('user_id', $post->user->user_id)->first();
            if ($verification) {
                $post->official_status = $verification->status == 1 ? 1 : 2; // 1: Approved, 2: Pending
            } else {
                $post->official_status = 0; // Status not available (user not verified)
            }

            unset($post->user);

            // Include tags data
            $post->tags_data = $post->tags->map(function ($tag) {
                return [
                    'tag_id' => $tag->id,
                    'tag_name' => $tag->tag_name, // Assuming `tag_name` is a column in the `tags` table
                    'user_id' => $tag->user->user_id ?? null,
                    'username' => $tag->user->username ?? null,
                    'user_dp' => $tag->user->user_dp
                        ? asset("storage/profile_pic/{$tag->user->user_id}/{$tag->user->user_dp}")
                        : null
                ];
            });

            unset($post->tags);
        });

        return response()->json(['message' => 'Posts retrieved successfully', 'data' => $posts], 200);
    } catch (\Exception $e) {
        return response()->json(['message' => 'Failed to retrieve posts', 'error' => $e->getMessage()], 500);
    }
}


   public function searchUsers(Request $request, $user_id = null)
{
    try {
        $searchQuery = $request->input('search_input');

        // If search query is empty, return an error response
        if (!$searchQuery) {
            return response()->json(['message' => 'Search query is empty'], 400);
        }

        // Get the IDs of users who have blocked the searching user
        $blockedByUserIds = $user_id ? Blockuser::where('block_id', $user_id)->pluck('user_id') : collect();

        // Search users based on the provided parameters, excluding those who have blocked the searching user and users marked as deleted
        $users = User::whereNotIn('user_id', $blockedByUserIds)
            ->where('deleted', 0) // Exclude users with deleted = 1
            ->where(function ($query) use ($searchQuery) {
                $query->where('fname', 'like', "%$searchQuery%")
                    ->orWhere('lname', 'like', "%$searchQuery%")
                    ->orWhere('username', 'like', "%$searchQuery%")
                    ->orWhere('mobile', 'like', "%$searchQuery%");
            })
            ->get();

        // Format response data
        $formattedUsers = $users->map(function ($user) {
            // Check verification status for the user
            $verification = Verify::where('user_id', $user->user_id)->first();
            $officialStatus = $verification ? ($verification->status == 1 ? 1 : 2) : 0;

            return [
                'user_id' => $user->user_id,
                'username' => $user->username,
                'fullname' => $user->fname . ' ' . $user->lname,
                'user_dp' => $user->user_dp ? asset("storage/profile_pic/{$user->user_id}/{$user->user_dp}") : null,
                'official_status' => $officialStatus,
            ];
        });

        return response()->json(['message' => 'Users retrieved successfully', 'data' => $formattedUsers], 200);
    } catch (\Exception $e) {
        return response()->json(['message' => 'Failed to retrieve users', 'error' => $e->getMessage()], 500);
    }
}


    


}
