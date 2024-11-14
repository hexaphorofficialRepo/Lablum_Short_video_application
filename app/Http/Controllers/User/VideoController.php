<?php

namespace App\Http\Controllers\user;

use App\Http\Controllers\Controller;
use App\Models\Addvideo;
use App\Models\Blockuser;
use App\Models\Category;
use App\Models\Comment;
use App\Models\Commentlike;
use App\Models\Follow;
use App\Models\Like;
use App\Models\Post;
use App\Models\Posttag;
use App\Models\Replycomment;
use App\Models\Share;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use App\Models\Verify;
use App\Models\View;
use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Str;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\File;

use Image;


class VideoController extends Controller
{



    public function suggestHashtag(Request $request)
    
    {
        // Retrieve the input text from the request
        $input = $request->input('text');

        // Check if the input starts with "#"
        if (strpos($input, '#') === 0) {
            // Extract the text without "#"
            $inputText = substr($input, 1);

            // Fetch hashtag suggestions based on the input text
            $suggestions = Category::where('name', 'like', '%' . $inputText . '%')->get();

            // Return the suggestions as JSON response
            return response()->json($suggestions);
        }

        // If the input does not start with "#", return an empty array
        return response()->json([]);
    }




  

public function Poststore(Request $request, $user_id)
{
    $validator = \Validator::make($request->all(), [
        'title' => 'required',
        'length' => 'required|numeric|min:5|max:180', // Restricts the length to be between 0 and 180 seconds
        'video' => 'required|mimes:mp4|max:110000',
        'thumbnail' => 'required|image|mimes:jpeg,png,jpg,gif', 
        'tags' => 'nullable|string'
    ]);

    if ($validator->fails()) {
        return response()->json(['message' => 'Validation failed', 'errors' => $validator->errors()], 403);
    }

    try {
        $videoFile = $request->file('video');
        $thumbnailFile = $request->file('thumbnail');

        // Store video
        $timestamp = now()->timestamp; // Get the current timestamp
        $randomString = Str::random(10); // Generate a random string
        $uniqueVideoName = 'video_' . $timestamp . '_' . $randomString . '.' . $videoFile->getClientOriginalExtension(); // Generate a unique filename
        $videoFileName = $videoFile->storeAs('post', $uniqueVideoName, 's3'); // Store the video file with the unique filename in AWS S3

        // Store thumbnail
        $thumbnailPath = $thumbnailFile->store('public/thumbnail');
        $thumbnailFileName = basename($thumbnailPath);

        // Create post
        $post = Post::create([
            'user_id' => $user_id,
            'title' => $request->input('title'),
            'length' => $request->input('length'),
            'description' => $request->input('description'),
            'video' => $videoFileName,
            'thumbnail' => $thumbnailFileName,
        ]);

        // Form complete URLs
        $videoUrl = Storage::disk('s3')->url($videoFileName);
        $thumbnailUrl = url('storage/thumbnail/' . $thumbnailFileName);

        // Associate tags with the post if tags are provided
        $tagUserIds = [];
        if ($request->has('tags') && !empty($request->input('tags'))) {
            $tagIds = explode(',', $request->input('tags')); // Split tag ids by comma
            foreach ($tagIds as $tagId) {
                // Validate if the user exists
                $userExists = User::where('user_id', $tagId)->exists();
                if ($userExists) {
                    $tagUserIds[] = $tagId;
                    $postTag = new PostTag();
                    $postTag->post_id = $post->id;
                    $postTag->user_id = $tagId;
                    $postTag->save();
                }
            }
        }

        // Modify the response to include complete URLs and tag users' IDs
        $response = [
            'message' => 'Post created successfully',
            'data' => $post,
            'video' => $videoUrl,
            'thumbnail' => $thumbnailUrl,
        ];

        if (!empty($tagUserIds)) {
            $response['Tag Users'] = $tagUserIds;
        }

        return response()->json($response, 200);
    } catch (\Exception $e) {
        return response()->json(['message' => 'Failed to create post', 'error' => $e->getMessage()], 500);
    }
}











    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   



    
    
public function getAllPosts($user_id = null, Request $request)
{
    try {
        $limit = $request->input('limit', 10);
        $offset = $request->input('offset', 1);

        // Retrieve the list of blocked user IDs for the requesting user
        $blockedUserIds = [];
        if ($user_id) {
            $blockedUserIds = Blockuser::where('user_id', $user_id)
                ->pluck('block_id')
                ->toArray();
        }

        $postsQuery = Post::with([
            'user' => function ($query) use ($user_id) {
                $query->select('user_id', 'username', 'fname', 'lname', 'user_dp', 'fcm_token');
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
            },
            'tags.user' // Load tags with their user relationship
        ])
        ->whereNotNull('user_id') // Ensure user_id is not null
        ->whereNotIn('user_id', $blockedUserIds) // Exclude posts from blocked users
        ->inRandomOrder();

        $postsQuery->offset(($offset - 1) * $limit)->limit($limit + 1);

        $posts = $postsQuery->get(['id', 'user_id', 'title', 'description', 'video', 'thumbnail', 'created_at', 'updated_at']);

        $allPosts = collect();
        $advertisementIndex = 0;
        $advertisementSequence = [3, 6, 4, 2, 1]; // Sequence for placing advertisements

        foreach ($posts as $index => $post) {
            if ($index < $limit) {
                // Check if it's time to insert an advertisement
                if ($advertisementIndex < count($advertisementSequence) && $index === array_sum(array_slice($advertisementSequence, 0, $advertisementIndex + 1))) {
                    $advertisement = $this->getRandomAdvertisement($user_id);
                    if (!empty($advertisement)) {
                        $allPosts->push($advertisement);
                    }
                    $advertisementIndex++;
                }
                $allPosts->push($post);
            }
        }

        if ($allPosts->count() > $limit) {
            $allPosts->pop();
        }

        $totalCount = Post::whereNotNull('user_id') // Ensure user_id is not null
            ->whereNotIn('user_id', $blockedUserIds)
            ->count();
        $remainingPosts = $totalCount - $limit;
        $totalPages = ceil($totalCount / $limit);

        $allPosts->transform(function ($post) use ($user_id) {
            if (!$post || $post['type'] === 'Advertisement') {
                return $post;
            }

            if (isset($post->video)) {
                $post->video = Storage::disk('s3')->url($post->video);
            }
            if (isset($post->thumbnail)) {
                $post->thumbnail = asset("storage/thumbnail/{$post->thumbnail}");
            }
            $post->like_count = $post->likes ? $post->likes->count() : 0;
            $post->comment_count = $post->comments()->count();
            $post->share_count = $post->shares()->count();
            $post->view_count = $post->views()->count();
            $post->type = 'Reels';

            if ($post->user) { // Check if the user relationship exists
                $post->username = $post->user->username ?? null;
                $post->fcm_token = $post->user->fcm_token ?? null;
                $post->fullname = ($post->user->fname ?? '') . ' ' . ($post->user->lname ?? '');
                $post->user_dp = $post->user->user_dp ? asset("storage/profile_pic/{$post->user->user_id}/{$post->user->user_dp}") : null;
                $verification = Verify::where('user_id', $post->user->user_id)->first();
                $officialStatus = $verification ? ($verification->status == 1 ? 1 : 2) : 0;
                $post->official_status = $officialStatus;
            } else {
                $post->username = null;
                $post->fcm_token = null;
                $post->fullname = null;
                $post->user_dp = null;
                $post->official_status = 0;
            }

            $post->created_at_formatted = $post->created_at ? Carbon::parse($post->created_at)->diffForHumans() : null;

          $post->like_status = $user_id && $post->likes ? (bool) ($post->likes->where('user_id', $user_id)->first()['like_status'] ?? false) : null;
            $post->save_status = $user_id ? $post->saveposts()->where('user_id', $user_id)->exists() : false;
            $post->view_status = $user_id ? $post->views()->where('user_id', $user_id)->exists() : null;
            // $post->follow_status = $user_id ? ($post->user ? $post->user->followers->contains('follower_id', $user_id) : null) : null;
               $post->follow_status = $user_id && $post->user ? 
                (bool) Follow::where('follower_id', $post->user_id)
                            ->where('user_id', $user_id)
                            ->exists() 
                : false;

            // Handle tags data

            unset($post->likes);

            $post->tags_data = $post->tags->map(function ($tag) {
                return [
                    'tag_id' =>$tag->id,
                    'user_id' => $tag->user->user_id ?? null,
                    'username' => $tag->user->username ?? null,
                    'user_dp' => $tag->user && $tag->user->user_dp ? asset("storage/profile_pic/{$tag->user->user_id}/{$tag->user->user_dp}") : null,
                ];
            });
            unset($post->tags);
            unset($post->user);

            return $post;
        });

        $nextPageUrl = null;
        if ($posts->count() > $limit) {
            $lastPost = $allPosts->last();
            $nextOffset = $offset + 1;
            $nextPageUrl = url()->current() . '?offset=' . $nextOffset . '&limit=' . $limit;
        } elseif ($remainingPosts > 0) {
            $nextPageUrl = url()->current() . '?offset=' . $offset . '&limit=' . $remainingPosts;
        }

        return response()->json([
            'message' => 'Posts retrieved successfully',
            'data' => $allPosts,
            'next_page' => $nextPageUrl,
            'limit' => $limit,
            'remaining_posts' => $remainingPosts,
            'total_pages' => $totalPages,
            'total_posts' => $totalCount,
        ], 200);
    } catch (\Exception $e) {
        return response()->json(['message' => 'Failed to retrieve posts', 'error' => $e->getMessage()], 500);
    }
}







    
    

    
    private function getRandomAdvertisement($user_id) {
        // Get a random advertisement
        $advertisement = Addvideo::where('status', 1)->inRandomOrder()->first();
        
        // Check if an advertisement is found
        if ($advertisement) {
            // Fetch likes count
            $likeCount = $advertisement->likes()->where('like_status', 1)->count();
        
            // Fetch views count
            $viewCount = $advertisement->views()->count();
        
            // Check if the user has liked the advertisement
            $likeStatus = false;
            if ($user_id) {
                $like = $advertisement->likes()->where('user_id', $user_id)->first();
                $likeStatus = $like ? true : false;
            }
        
            // Check if the user has viewed the advertisement
            $viewStatus = false;
            if ($user_id) {
                $view = $advertisement->views()->where('user_id', $user_id)->first();
                $viewStatus = $view ? true : false;
            }
        
            // Return the advertisement with likes and views count
            return [
                'id' => $advertisement->id,
                'user_id' => null,
                'thumbnail' => null,
                'created_at' => $advertisement->created_at,
            
                'fcm_token' => null,
                'full_name' => $advertisement->video_type,
                'user_dp' =>null,
                'username' => $advertisement->advertiser->business_name,
                'created_at_formatted' => null,
            
                'save_status' => null,
               
                'follow_status' => null,
                'official_status' => null,
        
                'title' => $advertisement->advertiser->addcategory->title,
                'type' => 'Advertisement',
                'description' =>$advertisement->web_link,
                'video' => Storage::disk('s3')->url("add_videos/{$advertisement->video}"),
                // Assuming storage location for advertisements
                'like_count' => $likeCount,
                'comment_count' =>null,
                'view_count' => $viewCount,
                'like_status' => $likeStatus,
                'view_status' => $viewStatus,
                  'tags_data' => [],
                // Add any other necessary fields from the advertisement model
            ];
        } else {
            // Return an empty array if no advertisement is found
            return [];
        }
    }
    










// public function getSinglePost($user_id, $post_id)
// {
//     try {
//         $post = Post::with([
//                 'user' => function ($query) {
//                     $query->select('user_id', 'username', 'fname', 'lname', 'user_dp', 'fcm_token');
//                 },
//                 'likes' => function ($query) {
//                     $query->where('like_status', 1);
//                 },
//                 'tags.user' // Include tags and the associated user data
//             ])
//             ->find($post_id, ['id', 'user_id', 'title', 'description', 'video', 'thumbnail', 'created_at', 'updated_at']);

//         if (!$post) {
//             return response()->json(['message' => 'Post not found'], 404);
//         }

//         // Transform video and thumbnail URLs
//         $post->video = $post->video ? Storage::disk('s3')->url($post->video) : null;
//         $post->thumbnail = $post->thumbnail ? asset("storage/thumbnail/{$post->thumbnail}") : null;

//         // Additional transformations and data processing
//         $post->username = $post->user->username ?? 'unknown';
//         $post->fcm_token = $post->user->fcm_token ?? null;
//         $post->fullname = ($post->user->fname ?? 'unknown') . ' ' . ($post->user->lname ?? 'unknown');
//         $post->user_dp = $post->user->user_dp ? asset("storage/profile_pic/{$post->user->user_id}/{$post->user->user_dp}") : null;
//         $post->created_at_formatted = Carbon::parse($post->created_at)->diffForHumans();

//         // Count the likes where like_status is 1 and set like_count
//         $post->like_count = $post->likes->count();

//         // Check if the user has liked the post
//         $like = $post->likes->firstWhere('user_id', $user_id);
//         $post->like_status = $like ? true : false;

//         // Check if the user has saved the post
//         $post->save_status = $post->saveposts()->where('user_id', $user_id)->exists();

//         // Check if the user has viewed the post
//         $post->view_status = $post->views()->where('user_id', $user_id)->exists();

//         // Check if the user specified in the route is following the user who made the post
//         $post->follow_status = Follow::where('user_id', $user_id)
//             ->where('follower_id', $post->user_id)
//             ->exists();

//         // Check official status
//         $verification = Verify::where('user_id', $post->user->user_id)->first();
//         $post->official_status = $verification ? ($verification->status == 1 ? 1 : 2) : 0;

//         // Format tags data
//         // $post->tags_data = $post->tags->map(function ($tag) {
//         //     return [
//         //         'tag_id' =>$tag->id,
//         //         'user_id' => $tag->user->user_id,
//         //         'username' => $tag->user->username,
//         //         'user_dp' => $tag->user->user_dp ? asset("storage/profile_pic/{$tag->user_id}/{$tag->user->user_dp}") : null
//         //     ];
//         // });
//           $post->tags_data = $post->tags->map(function ($tag) {
//                 return [
//                     'tag_id' =>$tag->id,
//                     'user_id' => $tag->user->user_id ?? null,
//                     'username' => $tag->user->username ?? null,
//                     'user_dp' => $tag->user && $tag->user->user_dp ? asset("storage/profile_pic/{$tag->user->user_id}/{$tag->user->user_dp}") : null,
//                 ];
//             });

//         // Unset unnecessary attributes
//         unset($post->user);
//         unset($post->likes);
//         unset($post->tags);

//         return response()->json(['message' => 'Post retrieved successfully', 'data' => $post], 200);
//     } catch (\Exception $e) {
//         return response()->json(['message' => 'Failed to retrieve post', 'error' => $e->getMessage()], 500);
//     }
// }


public function getSinglePost($user_id, $post_id)
{
    try {
        $post = Post::with([
                'user' => function ($query) {
                    $query->select('user_id', 'username', 'fname', 'lname', 'user_dp', 'fcm_token');
                },
                'likes' => function ($query) {
                    $query->where('like_status', 1);
                },
                'tags.user' // Include tags and the associated user data
            ])
            ->find($post_id, ['id', 'user_id', 'title', 'description', 'video', 'thumbnail', 'created_at', 'updated_at']);

        if (!$post) {
            return response()->json(['message' => 'Post not found'], 404);
        }

        // Transform video and thumbnail URLs
        $post->video = $post->video ? Storage::disk('s3')->url($post->video) : null;
        $post->thumbnail = $post->thumbnail ? asset("storage/thumbnail/{$post->thumbnail}") : null;

        // Additional transformations and data processing
        $post->username = $post->user->username ?? 'unknown';
        $post->fcm_token = $post->user->fcm_token ?? null;
        $post->fullname = ($post->user->fname ?? 'unknown') . ' ' . ($post->user->lname ?? 'unknown');
        $post->user_dp = $post->user->user_dp ? asset("storage/profile_pic/{$post->user->user_id}/{$post->user->user_dp}") : null;
        $post->created_at_formatted = Carbon::parse($post->created_at)->diffForHumans();

        // Check if the user has liked the post
        $post->like_status = $user_id && $post->likes ? (bool) ($post->likes->where('user_id', $user_id)->first()['like_status'] ?? false) : null;

        // Check if the user has saved the post
        $post->save_status = $user_id ? $post->saveposts()->where('user_id', $user_id)->exists() : false;

        // Check if the user has viewed the post
        $post->view_status = $user_id ? $post->views()->where('user_id', $user_id)->exists() : null;

        // Check if the user is following the post owner
        $post->follow_status = $user_id && $post->user ? 
            (bool) Follow::where('follower_id', $post->user_id)
                        ->where('user_id', $user_id)
                        ->exists() 
            : false;

        // Check official status
        $verification = Verify::where('user_id', $post->user->user_id)->first();
        $post->official_status = $verification ? ($verification->status == 1 ? 1 : 2) : 0;

        // Format tags data
        $post->tags_data = $post->tags->map(function ($tag) {
            return [
                'tag_id' => $tag->id,
                'user_id' => $tag->user->user_id ?? null,
                'username' => $tag->user->username ?? null,
                'user_dp' => $tag->user && $tag->user->user_dp ? asset("storage/profile_pic/{$tag->user->user_id}/{$tag->user->user_dp}") : null,
            ];
        });

        // Unset unnecessary attributes
        unset($post->user);
        unset($post->likes);
        unset($post->tags);

        return response()->json(['message' => 'Post retrieved successfully', 'data' => $post], 200);
    } catch (\Exception $e) {
        return response()->json(['message' => 'Failed to retrieve post', 'error' => $e->getMessage()], 500);
    }
}














    // Function to get a random advertisement
   
    



public function likePost(Request $request, $userId)
{
    $validator = \Validator::make($request->all(), [
        'post_id' => 'sometimes|required_without:add_id|exists:posts,id',
        'add_id' => 'sometimes|required_without:post_id|exists:addvideos,id',
    ], [
        'post_id.required_without' => 'Either post_id or add_id is required.',
        'post_id.exists' => 'The specified post does not exist.',
        'add_id.required_without' => 'Either post_id or add_id is required.',
        'add_id.exists' => 'The specified advertisement does not exist.',
    ]);

    if ($validator->fails()) {
        return response()->json(['errors' => $validator->errors()], 400);
    }

    $postId = $request->input('post_id');
    $addId = $request->input('add_id');

    if ($postId) {
        $likeableType = 'post';
        $likeableId = $postId;
    } elseif ($addId) {
        $likeableType = 'add';
        $likeableId = $addId;
    } else {
        return response()->json(['message' => 'Either post_id or add_id is required'], 400);
    }

    // Check if the user has already liked the post or advertisement
    $like = Like::where('user_id', $userId)
        ->where($likeableType.'_id', $likeableId)
        ->first();

    // Toggle like status
    if ($like) {
        $likeStatus = !$like->like_status; // Toggle like status
    } else {
        $likeStatus = true; // Set like status to true for the first time like
    }

    // Update like count based on like_status
    $likeCount = Like::where($likeableType.'_id', $likeableId)
        ->where('like_status', true)
        ->count();

    if ($likeStatus) {
        $likeCount++;
    } else {
        $likeCount--;
        // If unliking, delete the like record from the database
        $like->delete();
    }

    $message = $likeStatus ? 'Liked successfully' : 'Unliked successfully';

    // Create or update the like record
    if ($like) {
        $like->update(['like_status' => $likeStatus]);
    } else {
        Like::create([
            'user_id' => $userId,
            $likeableType.'_id' => $likeableId,
            'like_status' => $likeStatus,
        ]);
    }

    return response()->json(['message' => $message, 'like_count' => $likeCount]);
}


    public function commentPost(Request $request, $userId)
    {

        $userExists = User::where('user_id', $userId)->exists();
        if (!$userExists) {
            return response()->json(['message' => 'User not found'], 400);
        }
        $validator = \Validator::make($request->all(), [
            'post_id' => 'required|exists:posts,id',
            'comment' => 'required',
        ], [
            'post_id.required' => 'The post_id field is required.',
            'post_id.exists' => 'The specified post does not exist.',
            'comment.required' => 'The comment field is required.',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 400);
        }

        $postId = $request->input('post_id');
        $commentContent = $request->input('comment');

        $comment = Comment::create([
            'user_id' => $userId,
            'post_id' => $postId,
            'comment' => $commentContent,
        ]);

        if (!$comment) {
            return response()->json(['message' => 'Failed to post comment'], 500);
        }

        // Increment comment count for the post
        $post = Post::find($postId);
        if (!$post) {
            return response()->json(['message' => 'Post not found'], 404);
        }

        $post->comment_count++;
        $post->save();

        return response()->json(['message' => 'Comment posted successfully']);
    }




    public function replyToComment(Request $request, $commentId)
    {
        // Check if the comment exists
        $commentExists = Comment::where('id', $commentId)->exists();
        if (!$commentExists) {
            return response()->json(['message' => 'Comment not found'], 404);
        }
    
        $validator = \Validator::make($request->all(), [
            'user_id' => ['required', 'exists:users,user_id'], // Validates if user_id exists in the users table
            'comment' => 'required',
        ], [
            'user_id.required' => 'The user_id field is required.',
            'user_id.exists' => 'The selected user is invalid.',
            'comment.required' => 'The comment field is required.',
        ]);
    
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 400);
        }
    
        $userId = $request->input('user_id');
        $commentContent = $request->input('comment');
    
        $replyComment = Replycomment::create([
            'comment_id' => $commentId,
            'user_id' => $userId,
            'comment' => $commentContent,
        ]);
    
        if (!$replyComment) {
            return response()->json(['message' => 'Failed to reply to comment'], 500);
        }
    
        return response()->json(['message' => 'Reply to comment posted successfully']);
    }






    public function likeComment(Request $request, $userId)
    {
        $userExists = User::where('user_id', $userId)->exists();
        if (!$userExists) {
            return response()->json(['message' => 'User not found'], 400);
        }
        
        $validator = \Validator::make($request->all(), [
            'comment_id' => 'required|exists:comments,id',
        ], [
            'comment_id.required' => 'The comment_id field is required.',
            'comment_id.exists' => 'The specified comment does not exist.',
        ]);
    
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 400);
        }
    
        $commentId = $request->input('comment_id');
    
        // Check if the user has already liked the comment
        $existingLike = Commentlike::where('user_id', $userId)
                                    ->where('comment_id', $commentId)
                                    ->first();
    
        // If the user has already liked the comment, delete the like
        if ($existingLike) {
            $existingLike->delete();
            return response()->json(['message' => 'Comment unliked successfully']);
        }
    
        // If the user hasn't liked the comment, create a new like
        $like = Commentlike::create([
            'user_id' => $userId,
            'comment_id' => $commentId,
            'like_status' => true, // Initially liking the comment
        ]);
    
        if (!$like) {
            return response()->json(['message' => 'Failed to like comment'], 500);
        }
    
        return response()->json(['message' => 'Comment liked successfully']);
    }



















   public function getCommentsByPostId(Request $request, $postId, $user_id = null)
    {
        $postExists = Post::where('id', $postId)->exists();
        if (!$postExists) {
            return response()->json(['message' => 'Post does not exist'], 400);
        }
    
        // Get the limit and page parameters from the request
        $limit = $request->input('limit');
        $page = $request->input('page');
    
        try {
            // If user_id is provided, get the IDs of users who have blocked this user
            $blockedUserIds = $user_id ? Blockuser::where('block_id', $user_id)->pluck('user_id') : collect();
    
            // Fetch all comments for the post along with their users and replies, excluding comments from users who have blocked the viewing user
            $comments = Comment::where('post_id', $postId)
                ->whereNotIn('user_id', $blockedUserIds) // Exclude comments from blocked users
                ->with(['user', 'replies' => function ($query) use ($blockedUserIds) {
                    // Also exclude replies from blocked users
                    $query->whereNotIn('user_id', $blockedUserIds);
                }, 'replies.user'])
                ->orderBy('created_at', 'desc');
    
            // If limit and page are provided, paginate the results
            if (!empty($limit) && !empty($page)) {
                $comments = $comments->paginate($limit, ['*'], 'page', $page);
            } else {
                $comments = $comments->get();
            }
    
            // Format comments and their replies as needed
            $comments->each(function ($comment) {
                $comment->username = $comment->user->username;
                $comment->fcm_token = $comment->user->fcm_token;
                $comment->user_dp = $comment->user->user_dp
                    ? asset("storage/profile_pic/{$comment->user->user_id}/{$comment->user->user_dp}")
                    : null;
                $comment->user_id = $comment->user->user_id;
                $comment->created_at_formatted = Carbon::parse($comment->created_at)->diffForHumans();
                $comment->reply_count = $comment->replies->count();
                $comment->like_count = $comment->likes->where('like_status', true)->count();
                unset($comment->user);
    
                // Format each reply within the comment
                $comment->replies->each(function ($reply) {
                    $reply->username = $reply->user->username;
                    $reply->fcm_token = $reply->user->fcm_token;
                    $reply->user_dp = $reply->user->user_dp
                        ? asset("storage/profile_pic/{$reply->user->user_id}/{$reply->user->user_dp}")
                        : null;
                    $reply->created_at_formatted = Carbon::parse($reply->created_at)->diffForHumans();
                    unset($reply->user);
                });
            });
    
            // Return the comments data
            return response()->json(['message' => 'Comments retrieved successfully', 'data' => $comments], 200);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Failed to retrieve comments', 'error' => $e->getMessage()], 500);
        }
    }
    




    public function sharePost(Request $request, $postId)
    {

        $postExists = Post::where('id', $postId)->exists();
        if (!$postExists) {
            return response()->json(['message' => 'Post not found'], 404);
        }


        $userId = $request->input('user_id');
        $status = $request->input('status', 'true');


        $share = Share::create([
            'user_id' => $userId,
            'post_id' => $postId,
            'status' => $status,
        ]);

        if (!$share) {
            return response()->json(['message' => 'Failed to post Share'], 500);
        }


        $post = Post::find($postId);
        if (!$post) {
            return response()->json(['message' => 'Post not found'], 404);
        }
        $post->share_count++;
        $post->save();

        return response()->json(['message' => 'Share posted successfully']);
    }



    public function getLikePosts($user_id)
    {
        try {
            $userId = $user_id; // Retrieve user_id from the route parameter

            $posts = Post::with([
                'user' => function ($query) {
                    $query->select('user_id', 'username', 'fname', 'lname', 'user_dp');
                },
                'comments' => function ($query) {
                    $query->with([
                        'user' => function ($query) {
                            $query->select('user_id', 'username', 'user_dp');
                        }
                    ]);
                },
                'likes' => function ($query) use ($userId) {
                    $query->where('user_id', $userId);
                }
            ])
                ->latest()
                ->get(['id', 'user_id', 'like_count', 'comment_count', 'share_count', 'title', 'description', 'video', 'thumbnail', 'created_at', 'updated_at']);

            $posts->each(function ($post) use ($userId) {
                $post->video = asset("storage/post/{$post->video}");
                $post->thumbnail = asset("storage/thumbnail/{$post->thumbnail}");

                $post->username = $post->user->username;
                $post->fullname = $post->user->fname . ' ' . $post->user->lname;
                $post->user_dp = $post->user->user_dp
                    ? asset("storage/profile_pic/{$post->user->user_id}/{$post->user->user_dp}")
                    : null;

                $post->created_at_formatted = Carbon::parse($post->created_at)->diffForHumans();
                unset ($post->user);

                // Check if the user has liked the post
                $post->like_status = $post->likes->isEmpty() ? false : true;
                unset ($post->likes);
                $post->save_status = $post->saveposts->isEmpty() ? false : true;
                unset ($post->saveposts);

                // Check if the user has saved the post

            });

            return response()->json(['message' => 'Posts retrieved successfully', 'data' => $posts], 200);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Failed to retrieve posts', 'error' => $e->getMessage()], 500);
        }
    }

        public function deleteTag(Request $request, $tag_id)
        {
            try {
                // Find the PostTag entry by the provided tag_id
                $postTag = PostTag::where('id', $tag_id)->first();
        
                // Check if the tag exists
                if (!$postTag) {
                    return response()->json(['message' => 'Tag not found'], 404);
                }
        
                // Delete the tag
                $postTag->delete();
        
                return response()->json(['message' => 'Tag deleted successfully'], 200);
            } catch (\Exception $e) {
                // Catch any errors and return a 500 response with the error message
                return response()->json(['message' => 'Failed to delete tag', 'error' => $e->getMessage()], 500);
            }
        }



    // public function deletePost(Request $request, $post_id)
    // {
    //     try {
    //         // Find the post by its ID
    //         $post = Post::findOrFail($post_id);

    //         // Start a transaction to ensure all related data is deleted or nothing is deleted in case of an error
    //         DB::transaction(function () use ($post) {
    //             // Delete related comments
    //             $post->comments()->delete();
                
    //             // Delete related likes
    //             $post->likes()->delete();
                
    //             // Delete related shares
    //             $post->shares()->delete();
                
    //             // Delete related views
    //             $post->views()->delete();
                
    //             // Delete related saved posts
    //             $post->saveposts()->delete();
                
    //             // Delete related reports
    //             $post->postReports()->delete();
                
    //             // Delete related block messages
    //             $post->blockmessage()->delete();
                
    //             // Delete related tags
    //             $post->tags()->delete();

    //             // Delete the post itself
    //             $post->delete();
    //         });

    //         return response()->json(['message' => 'Post and related data deleted successfully'], 200);
    //     } catch (\Exception $e) {
    //         // Log the error details for debugging
    //         Log::error('Failed to delete post: '.$e->getMessage());

    //         return response()->json(['message' => 'Failed to delete post', 'error' => 'An error occurred. Please try again later.'], 500);
    //     }
    // }
    
    


public function deletePost(Request $request, $post_id)
{
    try {
        // Find the post by its ID
        $post = Post::findOrFail($post_id);

        // Get the video file path and thumbnail file path if they exist
        $videoFilePath = $post->video; // Assuming 'video' column stores the S3 path
        $thumbnailFilePath = $post->thumbnail; // Assuming 'thumbnail' column stores the local path

        // Start a transaction to ensure all related data is deleted or nothing is deleted in case of an error
        DB::transaction(function () use ($post, $videoFilePath, $thumbnailFilePath) {
            // Delete related comments
            $post->comments()->delete();
            
            // Delete related likes
            $post->likes()->delete();
            
            // Delete related shares
            $post->shares()->delete();
            
            // Delete related views
            $post->views()->delete();
            
            // Delete related saved posts
            $post->saveposts()->delete();
            
            // Delete related reports
            $post->postReports()->delete();
            
            // Delete related block messages
            $post->blockmessage()->delete();
            
            // Delete related tags
            $post->tags()->delete();

            // Delete the video from AWS S3 if it exists
            if (!empty($videoFilePath) && Storage::disk('s3')->exists($videoFilePath)) {
                Storage::disk('s3')->delete($videoFilePath);
            }

            // Optionally: Delete the thumbnail from local storage if it exists
            if (!empty($thumbnailFilePath) && Storage::exists('public/thumbnail/' . $thumbnailFilePath)) {
                Storage::delete('public/thumbnail/' . $thumbnailFilePath);
            }

            // Delete the post itself
            $post->delete();
        });

        return response()->json(['message' => 'Post, video, and related data deleted successfully'], 200);
    } catch (\Exception $e) {
        // Log the error details for debugging
        Log::error('Failed to delete post: '.$e->getMessage());

        return response()->json(['message' => 'Failed to delete post', 'error' => 'An error occurred. Please try again later.'], 500);
    }
}



}
