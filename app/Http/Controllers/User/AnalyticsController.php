<?php

namespace App\Http\Controllers;

use App\Models\Earning;
use App\Models\Follow;
use App\Models\Like;
use Illuminate\Http\Request;
use App\Models\Post;
use App\Models\View;
use Carbon\Carbon;
use Illuminate\Support\Collection;

class AnalyticsController extends Controller
{
    public function getAnalytics(Request $request)
    {
        // Validate the request parameters
        $request->validate([
            'user_id' => 'required|integer|exists:users,user_id',
            'post_id' => 'nullable|integer|exists:posts,id'
        ]);

        $userId = $request->input('user_id');
        $postId = $request->input('post_id');

        // Get the date of the user's first post
        $firstPostDate = Post::where('user_id', $userId)->orderBy('created_at', 'asc')->value('created_at');
        if (!$firstPostDate) {
            return response()->json([
                'data' => [
                    'count' => 0,
                    'is_down' => false,
                ],
                'content' => []
            ]);
        }

        // Set default dates if not provided, starting from the date of the user's first post
        $dateFrom = $request->has('date_from') ? Carbon::parse($request->input('date_from'))->startOfDay() : Carbon::parse($firstPostDate)->startOfDay();
        $dateTo = $request->has('date_to') ? Carbon::parse($request->input('date_to'))->endOfDay() : Carbon::now()->endOfDay();

        // Fetch the views for the given user within the specified date range
        $query = View::whereHas('post', function($q) use ($userId) {
            $q->where('user_id', $userId);
        })
        ->whereBetween('created_at', [$dateFrom, $dateTo]);

        if ($postId) {
            $query->where('post_id', $postId);
        }

        $views = $query->get();

        // Group the views by day and count them
        $groupedViews = $views->groupBy(function($date) {
            return Carbon::parse($date->created_at)->format('Y-m-d');
        });

        // Prepare the analytics data
        $analyticsContent = new Collection();

        // Iterate through each day in the date range
        for ($date = $dateFrom->copy(); $date->lte($dateTo); $date->addDay()) {
            $formattedDate = $date->format('Y-m-d');
            $dayData = $groupedViews->get($formattedDate, collect());
            $analyticsContent->push([
                'sums' => $dayData->count(),
                'year' => $date->year,
                'month' => $date->format('F'),
                'day' => $date->day,
            ]);
        }

        // Calculate the total sum of all days
        $totalSum = $views->count();

        // Prepare the final response data
        $responseData = [
            'data' => [
                'count' => $totalSum,
                'is_down' => false,
            ],
            'content' => $analyticsContent
        ];

        return response()->json($responseData);
    }

    public function getFollowersAnalytics(Request $request)
    {
        // Validate the request parameters
        $request->validate([
            'user_id' => 'required|integer|exists:users,user_id',
        ]);

        $userId = $request->input('user_id');

        // Get the date of the user's first follower
        $firstFollowDate = Follow::where('user_id', $userId)->orderBy('created_at', 'asc')->value('created_at');
        if (!$firstFollowDate) {
            $dateFrom = $request->has('date_from') ? Carbon::parse($request->input('date_from'))->startOfDay() : Carbon::parse(Carbon::now()->startOfMonth())->startOfDay();
            $dateTo = $request->has('date_to') ? Carbon::parse($request->input('date_to'))->endOfDay() : Carbon::now()->endOfDay();
            $totalSum = 0;
            $analyticsContent = [];

            // Iterate through each day in the date range and set sum as 0
            for ($date = $dateFrom->copy(); $date->lte($dateTo); $date->addDay()) {
                $analyticsContent[] = [
                    'sums' => 0,
                    'year' => $date->year,
                    'month' => $date->format('F'),
                    'day' => $date->day,
                ];
            }

            return response()->json([
                'data' => [
                    'count' => $totalSum,
                    'is_down' => false,
                ],
                'content' => $analyticsContent
            ]);
        }

        // Set default dates if not provided, starting from the date of the user's first follower
        $dateFrom = $request->has('date_from') ? Carbon::parse($request->input('date_from'))->startOfDay() : Carbon::parse($firstFollowDate)->startOfDay();
        $dateTo = $request->has('date_to') ? Carbon::parse($request->input('date_to'))->endOfDay() : Carbon::now()->endOfDay();

        // Fetch the followers for the given user within the specified date range
        $query = Follow::where('user_id', $userId)
            ->whereBetween('created_at', [$dateFrom, $dateTo]);

        $follows = $query->get();

        // Group the followers by day and count them
        $groupedFollows = $follows->groupBy(function($date) {
            return Carbon::parse($date->created_at)->format('Y-m-d');
        });

        // Prepare the analytics data
        $analyticsContent = new Collection();

        // Iterate through each day in the date range
        for ($date = $dateFrom->copy(); $date->lte($dateTo); $date->addDay()) {
            $formattedDate = $date->format('Y-m-d');
            $dayData = $groupedFollows->get($formattedDate, collect());
            $analyticsContent->push([
                'sums' => $dayData->count(),
                'year' => $date->year,
                'month' => $date->format('F'),
                'day' => $date->day,
            ]);
        }

        // Calculate the total sum of all days
        $totalSum = $follows->count();

        // Prepare the final response data
        $responseData = [
            'data' => [
                'count' => $totalSum,
                'is_down' => false,
            ],
            'content' => $analyticsContent
        ];

        return response()->json($responseData);
    }


    public function getEarningAnalytics(Request $request)
    {
        // Validate the request parameters
        $request->validate([
            'user_id' => 'required|integer|exists:users,user_id',
            'post_id' => 'required|integer|exists:posts,id'
        ]);

        $userId = $request->input('user_id');
        $postId = $request->input('post_id');
        $post = Post::where('id',$postId)->first();
        $videoLength = $post->length;
                $earning = Earning::where('from', '<=', $videoLength)
                                 ->where('to', '>=', $videoLength)
                                 ->first();

        // Get the date of the user's first post
        $firstPostDate = Post::where('user_id', $userId)->orderBy('created_at', 'asc')->value('created_at');
    
        if (!$firstPostDate) {
            return response()->json([
                'data' => [
                    'count' => 0,
                    'is_down' => false,
                ],
                'content' => []
            ]);
        }

        // Set default dates if not provided, starting from the date of the user's first post
        $dateFrom = $request->has('date_from') ? Carbon::parse($request->input('date_from'))->startOfDay() : Carbon::parse($firstPostDate)->startOfDay();
        $dateTo = $request->has('date_to') ? Carbon::parse($request->input('date_to'))->endOfDay() : Carbon::now()->endOfDay();

        // Fetch the views for the given user within the specified date range
        $query = View::whereHas('post', function($q) use ($userId) {
            $q->where('user_id', $userId);
        })
        ->whereBetween('created_at', [$dateFrom, $dateTo]);

        if ($postId) {
            $query->where('post_id', $postId);
        }

        $views = $query->get();

        // Group the views by day and count them
        $groupedViews = $views->groupBy(function($date) {
            return Carbon::parse($date->created_at)->format('Y-m-d');
        });

        // Prepare the analytics data
        $analyticsContent = new Collection();

        // Iterate through each day in the date range
        for ($date = $dateFrom->copy(); $date->lte($dateTo); $date->addDay()) {
            $formattedDate = $date->format('Y-m-d');
            $dayData = $groupedViews->get($formattedDate, collect());
            $dayindex = $dayData->count();
            $amountDay = $dayindex * $earning->creator_points;
            $amountDayf = number_format($amountDay, 2);
            $analyticsContent->push([
                'sums' => $amountDayf,
                'year' => $date->year,
                'month' => $date->format('F'),
                'day' => $date->day,
            ]);
        }

        // Calculate the total sum of all days
        $totalSum = $views->count();
        $totalamount = $totalSum * $earning->creator_points;
        $totalamountf = number_format($totalamount, 2);

        // Prepare the final response data
        $responseData = [
            'data' => [
                'count' => $totalamountf,
                'is_down' => false,
            ],
            'content' => $analyticsContent
        ];

        return response()->json($responseData);
    }


    public function getLikesAnalytics(Request $request)
{
    // Validate the request parameters
    $request->validate([
        'post_id' => 'required|integer|exists:posts,id'
    ]);

    $postId = $request->input('post_id');

    // Get the date of the post creation
    $postCreationDate = Post::where('id', $postId)->value('created_at');
    if (!$postCreationDate) {
        return response()->json([
            'data' => [
                'count' => 0,
                'is_down' => false,
            ],
            'content' => []
        ]);
    }

    // Set default dates if not provided, starting from the date of the post creation
    $dateFrom = $request->has('date_from') ? Carbon::parse($request->input('date_from'))->startOfDay() : Carbon::parse($postCreationDate)->startOfDay();
    $dateTo = $request->has('date_to') ? Carbon::parse($request->input('date_to'))->endOfDay() : Carbon::now()->endOfDay();

    // Fetch the likes for the given post within the specified date range
    $query = Like::where('post_id', $postId)
        ->whereBetween('created_at', [$dateFrom, $dateTo]);

    $likes = $query->get();

    // Group the likes by day and count them
    $groupedLikes = $likes->groupBy(function($date) {
        return Carbon::parse($date->created_at)->format('Y-m-d');
    });

    // Prepare the analytics data
    $analyticsContent = new Collection();

    // Iterate through each day in the date range
    for ($date = $dateFrom->copy(); $date->lte($dateTo); $date->addDay()) {
        $formattedDate = $date->format('Y-m-d');
        $dayData = $groupedLikes->get($formattedDate, collect());
        $analyticsContent->push([
            'sums' => $dayData->count(),
            'year' => $date->year,
            'month' => $date->format('F'),
            'day' => $date->day,
        ]);
    }

    // Calculate the total sum of all days
    $totalSum = $likes->count();

    // Prepare the final response data
    $responseData = [
        'data' => [
            'count' => $totalSum,
            'is_down' => false,
        ],
        'content' => $analyticsContent
    ];

    return response()->json($responseData);
}


// public function getTopPostsByViews(Request $request)
// {
//     // Validate the request parameters
//     $request->validate([
//         'user_id' => 'required|integer|exists:users,user_id',
//     ]);

//     $userId = $request->input('user_id');

//     // Get all posts for the user
//     $posts = Post::where('user_id', $userId)
//         ->get();

//     // Calculate view counts for each post
//     $postsWithViews = $posts->map(function ($post) {
//         // Count views directly from the View model
//         $viewCount = View::where('post_id', $post->id)->count();

//         return [
//             'post_id' => $post->id,
//             'title' => $post->title,
//             'thumbnail' => $post->thumbnail = asset("storage/thumbnail/{$post->thumbnail}"),
           
//             'view_count' => $viewCount, // Calculate the view count
           
//         ];
//     });

//     // Sort the posts by view count in descending order and take the top 10
// $topPosts = $postsWithViews->sortByDesc('view_count');

//     return response()->json(['posts' => $topPosts]);
// }

public function getTopPostsByViews(Request $request)
{
    // Validate the request parameters
    $request->validate([
        'user_id' => 'required|integer|exists:users,user_id',
        'offset' => 'nullable|integer|min:0', // For pagination offset
        'limit' => 'nullable|integer|min:1|max:50', // For pagination limit (max 50 items)
    ]);

    $userId = $request->input('user_id');
    $offset = $request->input('offset', 0); // Default offset is 0
    $limit = $request->input('limit', 10); // Default limit is 10

    // Get all posts for the user
    $posts = Post::where('user_id', $userId)->get();

    // Calculate view counts for each post
    $postsWithViews = $posts->map(function ($post) {
        $viewCount = View::where('post_id', $post->id)->count();

        return [
            'post_id' => $post->id,
            'title' => $post->title,
            'thumbnail' => $post->thumbnail = asset("storage/thumbnail/{$post->thumbnail}"),
            'view_count' => $viewCount,
        ];
    });

    // Sort the posts by view count in descending order
    $sortedPosts = $postsWithViews->sortByDesc('view_count')->values();

    // Apply offset and limit for pagination
    $paginatedPosts = $sortedPosts->slice($offset, $limit)->values();

    // Return the response with pagination details
    return response()->json([
        'total_count' => $sortedPosts->count(), // Total number of posts
        'offset' => $offset,
        'limit' => $limit,
        'posts' => $paginatedPosts,
    ]);
}

}
