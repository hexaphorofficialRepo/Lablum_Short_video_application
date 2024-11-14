<?php

namespace App\Http\Controllers\advertisment;

use App\Http\Controllers\Controller;
use App\Models\Addplan;
use App\Models\Addpricing;
use App\Models\Addvideo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log; // Import the Log facade
use Illuminate\Support\Facades\Storage;

class AddvideoController extends Controller
{
    public function addVideo(){
        // Get the authenticated advertiser
        $advertiser = Auth::guard('advertiser')->user();
    
        // Get the active plan for the advertiser
        $plan = $advertiser->addplans()->where('add_status', 1)->latest()->get();
    
        // Check if the advertiser has an active plan
        if ($plan) {
            // Pass the advertiser and plan data to the add video view
            return view('frontend.adds.add_video', compact('advertiser', 'plan'));
        } else {
            // Redirect back with error message
            return redirect()->back()->with('error', 'You do not have an active plan to add videos.');
        }
    }



    public function calculatePaymentAmount(Request $request)
    {
        $videoCount = $request->input('video_count');
        $daysCount = $request->input('days_count');

        // Perform any validation here if required

        // Fetch pricing data based on video count and days count
        $pricing = Addpricing::where('video_count', $videoCount)
            ->where('days_count', $daysCount)
            ->first();

        if (!$pricing) {
            // If pricing data is not found, you can return an error response
            return response()->json(['error' => 'Pricing data not found for the specified video count and days count'], 404);
        }

        // Calculate the payment amount based on the pricing data
        $paymentAmount = $pricing->price;

        // Return the calculated payment amount
        return response()->json(['paymentAmount' => $paymentAmount], 200);
    }




    // public function store(Request $request)
    // {
    //     try {
    //         $request->validate([
    //             'adevrtiser_id' => 'required',
    //             'addplan_id' => 'required',
    //             'web_link' => 'required|url',
    //             'fb_link' => 'required|url',
    //             'insta_link' => 'required|url',
    //             'video' => 'required|mimes:mp4',
    //         ]);
    
    //         // Get the authenticated advertiser
    //         $advertiser = Auth::guard('advertiser')->user();
    
    //         // Get the Addplan for the advertiser
    //         $addplan = Addplan::findOrFail($request->addplan_id);
    
    //         // Check if the advertiser has reached the upload limit
    //         if ($advertiser->add_count >= $addplan->add_count) {
    //             return redirect()->back()->withErrors(['upload_error' => 'You have reached the maximum upload limit for this plan.']);
    //         }
    
    //         // Store the video file on AWS S3
    //         $videoFile = $request->file('video');
    //         $videoName = $videoFile->getClientOriginalName(); // Get the original filename
    //         $videoPath = $videoFile->storeAs('add_videos', $videoName, 's3');
    
    //         // Create a new video record in the database
    //         $video = new Addvideo();
    //         $video->adevrtiser_id = $request->adevrtiser_id;
    //         $video->addplan_id = $request->addplan_id;
    //         $video->web_link = $request->web_link;
    //         $video->fb_link = $request->fb_link;
    //         $video->insta_link = $request->insta_link;
    //         $video->video = $videoName; // Save the original filename in the database
    //         $video->save();
    
    //         // Increment advertiser's add_count
    //         $advertiser->add_count++;
    //         $advertiser->save();
    
    //         return redirect()->route('addplan.show')->with('message', 'Video uploaded successfully');
    //     } catch (\Exception $e) {
    //         \Log::error('Error uploading video: ' . $e->getMessage());
    //         return redirect()->back()->withInput()->withErrors(['upload_error' => 'An error occurred while uploading the video. Please try again.']);
    //     }
    // }
    public function store(Request $request)
    {
        try {
            $request->validate([
                'adevrtiser_id' => 'required',
                'addplan_id' => 'required',
                'web_link' => 'required|url',
                'fb_link' => 'required|url',
                'insta_link' => 'required|url',
                'video' => 'required|mimes:mp4',
                'video_type'=> 'required',
            ]);
    
            // Get the authenticated advertiser
            $advertiser = Auth::guard('advertiser')->user();
    
            // Get the Addplan for the advertiser
            $addplan = Addplan::findOrFail($request->addplan_id);
    
            // Check if the advertiser has reached the upload limit
            if ($advertiser->add_count >= $addplan->add_count) {
                return redirect()->back()->withErrors(['upload_error' => 'You have reached the maximum upload limit for this plan.']);
            }
    
            // Store the video file on AWS S3
            $videoFile = $request->file('video');
            $videoName = $videoFile->getClientOriginalName(); // Get the original filename
            $videoPath = $videoFile->storeAs('add_videos', $videoName, 's3');
    
            // Create a new video record in the database
            $video = new Addvideo();
            $video->adevrtiser_id = $request->adevrtiser_id;
            $video->addplan_id = $request->addplan_id;
            $video->web_link = $request->web_link;
            $video->fb_link = $request->fb_link;
            $video->insta_link = $request->insta_link;
            $video->video = $videoName;
            $video->video_type = $request->video_type; // Save the original filename in the database
            $video->save();
    
            // Increment advertiser's add_count
            $advertiser->add_count++;
            $advertiser->save();
    
            return redirect()->route('addplan.show')->with('message', 'Video uploaded successfully');
        } catch (\Exception $e) {
            \Log::error('Error uploading video: ' . $e->getMessage());
            return redirect()->back()->withInput()->withErrors(['upload_error' => 'An error occurred while uploading the video. Please try again.']);
        }
    }
    public function showVideo()
    {
        // Get the authenticated advertiser
        $advertiser = Auth::guard('advertiser')->user();
    
        // Get the videos uploaded by the advertiser
        $videos = Addvideo::where('adevrtiser_id', $advertiser->id)->get();
    
        // Pass the videos data to the view
        return view('frontend.adds.my_add', compact('videos'));
    }
    
}
