<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Blockmessage;
use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\View;

class PostController extends Controller
{
    public function realPost(){
        $posts = Post::where('active', 1)->latest()->paginate(11);
        return view('admin.post.real_post', compact('posts'));
    }

    public function blockPost(Request $request)
    {
       

        $request->validate([
            'post_id' => 'required|exists:posts,id',
            'block_reason' => 'required|string|max:255',
        ]);
    
        
        $post = Post::find($request->input('post_id'));
        $post->active = false;
        $post->save();
    
   
        $blockMessage = new Blockmessage();
        $blockMessage->post_id = $request->input('post_id');
        $blockMessage->reason = $request->input('block_reason');
        $blockMessage->save();
    
        return redirect()->back()->with('success','Post is Blocked Successfully!!');
    }










    public function loadMorePosts(Request $request)
    {
        $page = $request->input('page') ?: 1;
        $posts = Post::where('active', 1)->latest()->skip(($page - 1) * 4)->take(4)->get();
    
        if ($request->ajax()) {
            return View::make('admin.post.posts', compact('posts'))->render();
        }
        return redirect()->back();
    }
    
    public function fakePost(){
        $posts = Post::where('active',0)->latest()->paginate(5);
        return view('admin.post.fake_post',compact('posts'));
    }



    public function updateIsActive(Request $request, $postId)
    {
        $post = Post::find($postId);
        if (!$post) {
            return response()->json(['error' => 'Post not found'], 404);
        }

        $post->active = $request->active;
        $post->save();

        return response()->json(['message' => 'Post  status updated successfully!! '], 200);
    }


    public function showLikesForPost(Post $post)
    {
        $likes = $post->likes()->with('user')->get();
    
        return view('admin.post.like', compact('likes', 'post'));
    }
    public function showCommentsForPost(Post $post)
    {
        $comments = $post->comments()->with('user')->get();
    
        return view('admin.post.comment', compact('comments', 'post'));
    }

    public function showWatclist(Post $post){
        $watches = $post->views()->with('user')->get();
        return view('admin.post.watch_list',compact('watches','post'));
    }
    


    public function showRealpost(Request $request) {
        $query = Post::where('active', 1); // Filter only active posts
    
        if ($request->has('date') && $request->date === Carbon::today()->toDateString()) {
            $query->whereDate('created_at', Carbon::today());
        } elseif ($request->has('start_date') && $request->has('end_date')) {
            $start_date = $request->start_date;
            $end_date = $request->end_date;
            $query->whereBetween('created_at', [$start_date, $end_date]);
        }
    
        $posts = $query->latest()->get(); // Get filtered posts
    
        return view('admin.post.real_post', compact('posts'));
    }
    public function showFakepost(Request $request) {
        $query = Post::where('active', 0); // Filter only active posts
    
        if ($request->has('date') && $request->date === Carbon::today()->toDateString()) {
            $query->whereDate('created_at', Carbon::today());
        } elseif ($request->has('start_date') && $request->has('end_date')) {
            $start_date = $request->start_date;
            $end_date = $request->end_date;
            $query->whereBetween('created_at', [$start_date, $end_date]);
        }
    
        $posts = $query->latest()->get(); // Get filtered posts
    
        return view('admin.post.fake_post', compact('posts'));
    }

    public function reportPost($post_id){
        $post = Post::findOrFail($post_id);
        $postreports = $post->postReports;
        if ($postreports) {
                    return view('admin.post.post_report', compact('postreports','post'));
                } else {
                    return redirect()->back()->with('error', 'No One Reported On this Post Yet');
                }
    }



    public function postInfo($post_id){
        $post = Post::findOrFail($post_id);

        return view('admin.post.post_info',compact('post'));
    }
    
}