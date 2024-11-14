<?php

namespace App\Http\Controllers\user;

use App\Http\Controllers\Controller;
use App\Models\Livestream;
use App\Models\User;
use Illuminate\Http\Request;

class LiveController extends Controller
{
    public function addlive(Request $request, $userId) {
      
        $request->validate([
            'live_id' => 'required',
        ]);
        
        try {
            // Check if the user exists
            $user = User::findOrFail($userId);
            
            // If the user exists, create the live stream associated with the user
            $live = new Livestream();
            $live->live_id = $request->input('live_id');
            
            // Associate the live stream with the user
            $user->livestreams()->save($live);
    
            return response()->json(['status' => 'success', 'message' => 'You Are Live Now', 'live' => $live], 200);
        } catch (\Exception $e) {
            return response()->json(['status' => 'error', 'message' => 'Oops, something went wrong', 'error' => $e->getMessage()], 500);
        }
    }

    public function deleteLiveByUser(Request $request, $userId) {
        try {
            // Find the user
            $user = User::findOrFail($userId);
            
            // Delete all live streams associated with the user
            $user->livestreams()->delete();
    
            return response()->json(['status' => 'success', 'message' => 'All live streams deleted successfully for user with ID ' . $userId], 200);
        } catch (\Exception $e) {
            return response()->json(['status' => 'error', 'message' => 'Oops, something went wrong', 'error' => $e->getMessage()], 500);
        }
    }

    public function getAllLiveStreams() {
        try {
            // Retrieve all live streams
            $liveStreams = LiveStream::all();
    
            // Modify the live stream data to include additional information
            $formattedLiveStreams = $liveStreams->map(function ($liveStream) {
                $user = $liveStream->user; // Assuming there's a 'user' relationship defined in Livestream model
                $userDpUrl = $user->user_dp ? asset("storage/profile_pic/{$user->user_id}/{$user->user_dp}") : null;
    
                return [
                    'live_id' => $liveStream->live_id,
                    'user_id' => $user->id,
                    'user_name' => $user->username,
                    'full_name' => $user->fname . ' ' . $user->lname,
                    'user_dp' => $userDpUrl,
                    // Add more fields as needed
                ];
            });
    
            return response()->json(['status' => 'success', 'live_streams' => $formattedLiveStreams], 200);
        } catch (\Exception $e) {
            return response()->json(['status' => 'error', 'message' => 'Oops, something went wrong', 'error' => $e->getMessage()], 500);
        }
    }



}
