<?php

namespace App\Http\Controllers\user;

use App\Http\Controllers\Controller;
use App\Models\Post;
use App\Models\Postreport;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

class ReportController extends Controller
{
    public function storePostreport(Request $request, $post_id)
    {
       
        $existingReport = Postreport::where('user_id', $request->user_id)
                                     ->where('post_id', $post_id)
                                     ->first();
    
        if ($existingReport) {
            return response()->json(['status' => 'error', 'message' => 'You have already reported this post'], 400);
        }
    
     
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|exists:users,user_id',
            'message' => 'required|string',
        ], [
            'user_id.exists' => 'User not found',
            'user_id.required' => 'User ID is required',
            'message.required' => 'Message is required',
        ]);
    
        if ($validator->fails()) {
            return response()->json(['status' => 'error', 'message' => $validator->errors()->first()], 400);
        }
    
        $post = Post::find($post_id);
        if (!$post) {
            return response()->json(['status' => 'error', 'message' => 'Post not found'], 404);
        }
    
        $report = new Postreport();
        $report->user_id = $request->user_id;
        $report->post_id = $post_id;
        $report->message = $request->message;
        $report->save();
    
        $reportCount = Postreport::where('post_id', $post_id)->count();
        if ($reportCount > 5) {
            $post->active = false;
            $post->save();
            return response()->json(['status' => 'success', 'message' => 'Report created successfully. Post blocked.'], 200);
        }
    
        return response()->json(['status' => 'success', 'message' => 'Report created successfully'], 200);
    }
    
    
    
}
