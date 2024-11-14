<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Addplan;
use App\Models\Addvideo;
use App\Models\State;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Models\Advertiser;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Redirect;

use Illuminate\Support\Facades\Storage;


class AdvertiserController extends Controller
{
    public function advertiserList(){
        $advertisers = Advertiser::latest()->get();
        return view('admin.advertisment.advertiser',compact('advertisers'));
    }

    public function createAdvertiser(){
      $states = State::all();
      return view('admin.advertisment.create_advertiser',compact('states'));
    }



    public function updatePlanStatusAndDates(Request $request, $planId)
{
    $plan = Addplan::findOrFail($planId);

    // Update add_status
    $plan->update([
        'add_status' => $request->add_status,
    ]);

    // If status is active (1), update activation and expiration dates
    if ($request->add_status == 1) {
        $activationDate = Carbon::now();
        $expirationDate = $activationDate->copy()->addDays($plan->days_count);

        $plan->update([
            'avtivation_date' => $activationDate,
            'expire_date' => $expirationDate,
        ]);
    } else {
        // If status is inactive (0), set activation and expiration dates to null
        $plan->update([
            'avtivation_date' => null,
            'expire_date' => null,
        ]);
    }

    // Return a response
    return response()->json(['success' => true, 'message' => 'Status and dates updated successfully']);
}



    public function storeAdvertiser(Request $request)
    {

      
        try {
            $request->validate([
                'name' => 'required',
                'email' => 'required|email',
                'mobile' => 'required',
                'business_type' => 'required',
                'business_name' => 'required',
                'area' => 'required',
                'city' => 'required',
                'state' => 'required',
                'zipcode' => 'required',
                'password' => 'required|confirmed',
                'business_document' => 'nullable|array',
                'business_document.*' => 'nullable|image|mimes:jpeg,png,jpg,gif', // Adjust max size as needed
                'personal_documents' => 'nullable|array',
                'personal_documents.*' => 'nullable|image|mimes:jpeg,png,jpg,gif', // Adjust max size as needed
            ]);
    
            $advertiser = new Advertiser();
            $advertiser->name = $request->input('name');
            $advertiser->email = $request->input('email');
            $advertiser->mobile = $request->input('mobile');
            $advertiser->business_type = $request->input('business_type');
            $advertiser->business_name = $request->input('business_name');
            $advertiser->url = $request->input('url');
            $advertiser->area = $request->input('area');
            $advertiser->city = $request->input('city');
            $advertiser->state = $request->input('state');
            $advertiser->zipcode = $request->input('zipcode');
            $advertiser->password = $request->input('password');
    
            // Process and store business documents
            if ($request->hasFile('business_document')) {
                $businessDocuments = [];
                foreach ($request->file('business_document') as $file) {
                    $path = $file->store('business_documents', 'public');
                    $businessDocuments[] = $path;
                }
                $advertiser->business_document = implode(',', $businessDocuments);
            }
    
            // Process and store personal documents
            if ($request->hasFile('personal_documents')) {
                $personalDocuments = [];
                foreach ($request->file('personal_documents') as $file) {
                    $path = $file->store('personal_documents', 'public');
                    $personalDocuments[] = $path;
                }
                $advertiser->personel_documents = implode(',', $personalDocuments);
            }
    
            $advertiser->save();
    
            return redirect()->route('admin.advertiser.list')->with('success', 'Advertiser added successfully');
        } catch (\Exception $e) {
            Log::error('Error storing advertiser: ' . $e->getMessage());
            return redirect()->back()->with('error', 'An error occurred while adding the advertiser. Please try again.');
        }
    }


    public function updateIsActive(Request $request, $postId)
    {
        $post = Advertiser::find($postId);
        if (!$post) {
            return response()->json(['error' => 'Advertiser not found'], 404);
        }

        $post->is_approve = $request->is_approve;
        $post->save();

        return response()->json(['message' => 'Advertiser  status updated successfully!! '], 200);
    }


 

public function showPlan($advertiserId)
{
    // Retrieve the advertiser along with their plans
    $advertiser = Advertiser::findOrFail($advertiserId);
    
    // Retrieve the plans associated with the advertiser
    $plan = Addplan::where('advertiser_id', $advertiserId)->first();
    
    // Check if a plan exists
    if ($plan) {
        // Check if payment has been made for this plan
        $paymentStatus = $plan->payments()->exists() ? 'completed' : 'pending';
        // Pass the advertiser, plan, and payment status data to the view
        return view('admin.advertisment.plan', compact('advertiser', 'plan', 'paymentStatus'));
    } else {
        // If no plan is found, redirect back with a message
        return Redirect::back()->with('success', 'No active plan found for this advertiser.');
    }
}



public function showPaymentDetails($planId)
{
    // Retrieve the plan along with its payments
    $plan = Addplan::findOrFail($planId);
    $payments = $plan->payments;

    // Pass the plan and payments data to the view
    return view('admin.advertisment.payment_details', compact('plan', 'payments'));
}



    public function showVideo($addplanId)
    {
        // Retrieve the videos associated with the specified plan
        $videos = Addvideo::where('addplan_id', $addplanId)->get();
    
        // Pass the videos data to the view
        return view('admin.advertisment.add_video', compact('videos'));
    }

    public function updateVideoActive(Request $request, $videoId)
    {
        $video = Addvideo::find($videoId);
        if (!$video) {
            return response()->json(['error' => 'Video not found'], 404);
        }

        $video->status = $request->status;
        $video->save();

        return response()->json(['message' => 'Add status updated successfully!! '], 200);
    }
    public function deleteAddVideo($videoId)
    {
        $video = Addvideo::find($videoId);

        if (!$video) {
            return response()->json(['error' => 'Video not found'], 404);
        }

        // Delete the video file from storage
        if (Storage::disk('public')->exists($video->video)) {
            Storage::disk('public')->delete($video->video);
        }

        // Delete the video record from the database
        $video->delete();

        return response()->json(['message' => 'Add video deleted successfully'], 200);
    }



    
}

