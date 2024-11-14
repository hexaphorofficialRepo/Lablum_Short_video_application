<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Comment;
use App\Models\Commentreport;
use App\Models\Replycomment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CommentreportController extends Controller
{
    public function reportCommentOrReply(Request $request, $id)
    {
        try {
            $request->validate([
                'type' => 'required|in:0,1', // 0 for comment, 1 for reply
                'message' => 'required|string',
                'user_id' => 'required|exists:users,user_id',
            ]);
    
            $type = $request->type;
            $user_id = $request->user_id;
            $message = $request->message;
    
            // Check if the user has already reported this comment or reply with the same message
            $existingReport = Commentreport::where(function ($query) use ($type, $id) {
                if ($type == 0) {
                    $query->where('comment_id', $id);
                } elseif ($type == 1) {
                    $query->where('reply_id', $id);
                }
            })
            ->where('user_id', $user_id)
            ->where('message', $message)
            ->first();
    
            if ($existingReport) {
                return response()->json(['message' => 'You have already reported this comment/reply with the same message'], 400);
            }
    
            $reportData = null; // To store the report data for response
    
            DB::transaction(function () use ($request, $id, &$reportData) {
                $type = $request->type;
                $user_id = $request->user_id;
                $message = $request->message;
    
                if ($type == 0) {
                    // Handle comment report
                    $comment = Comment::findOrFail($id);
    
                    // Create the report
                    $reportData = Commentreport::create([
                        'comment_id' => $comment->id,
                        'reply_id' => null,
                        'user_id' => $user_id,
                        'type' => $type,
                        'message' => $message
                    ]);
    
                    // Check if the comment has 5 reports
                    $reportCount = Commentreport::where('comment_id', $comment->id)->count();
                    if ($reportCount >= 5) {
                        // Delete the comment and its relationships
                        $comment->replies()->delete(); // Delete replies
                        $comment->likes()->delete();   // Delete likes
                        $comment->delete();            // Delete the comment itself
                    }
    
                } elseif ($type == 1) {
                    // Handle reply report
                    $reply = Replycomment::findOrFail($id);
    
                    // Create the report
                    $reportData = Commentreport::create([
                        'comment_id' => null,
                        'reply_id' => $reply->id,
                        'user_id' => $user_id,
                        'type' => $type,
                        'message' => $message
                    ]);
    
                    // Check if the reply has 5 reports
                    $reportCount = Commentreport::where('reply_id', $reply->id)->count();
                    if ($reportCount >= 5) {
                        $reply->delete(); // Delete the reply
                    }
                }
            });
    
            return response()->json([
                'message' => 'Report submitted successfully',
                'data' => $reportData
            ], 200);
    
        } catch (\Exception $e) {
            // Catch any errors and return a 404 response with the error message
            return response()->json(['message' => $e->getMessage()], 404);
        }
    }


    public function deleteCommentOrReply(Request $request, $id)
{
    try {
        $request->validate([
            'type' => 'required|in:0,1', // 0 for comment, 1 for reply
        ]);

        $type = $request->type;

        if ($type == 0) {
            // Handle comment deletion
            $comment = Comment::findOrFail($id);

            DB::transaction(function () use ($comment) {
                // Delete the comment's relationships (replies and likes)
                $comment->replies()->delete(); // Delete replies
                $comment->likes()->delete();   // Delete likes

                // Delete the comment itself
                $comment->delete();
            });

            return response()->json(['message' => 'Comment and its related data deleted successfully'], 200);

        } elseif ($type == 1) {
            // Handle reply deletion
            $reply = Replycomment::findOrFail($id);

            DB::transaction(function () use ($reply) {
                // Delete the reply
                $reply->delete();
            });

            return response()->json(['message' => 'Reply deleted successfully'], 200);
        }

    } catch (\Exception $e) {
        // Catch any errors and return a 404 response with the error message
        return response()->json(['message' => $e->getMessage()], 404);
    }
}

    
    
}
