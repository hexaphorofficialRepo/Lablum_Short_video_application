<?php

namespace App\Http\Controllers\advertisment;

use App\Http\Controllers\Controller;
use App\Models\Addplan;
use App\Models\Addpricing;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

class AddplanController extends Controller
{
    public function choosePlan(){
        $advertiser = Auth::guard('advertiser')->user();
        return view('frontend.adds.plan',compact('advertiser'));
    }

    public function calculatePaymentAmount(Request $request)
    {
        // Validate the incoming request data
        $validatedData = $request->validate([
            'video_count' => 'required|integer|min:1',
            'days_count' => 'required|integer|min:1',
        ]);

        // Get the authenticated advertiser
        $advertiser = Auth::guard('advertiser')->user();

        // Get the pricing data for the advertiser's business type
        $pricing = Addpricing::where('category', $advertiser->business_type)->first();

        // Calculate the payment amount
        $videoCount = $validatedData['video_count'];
        $daysCount = $validatedData['days_count'];

        if ($pricing) {
            // Calculate payment amount based on pricing
            $paymentAmount = $videoCount * $daysCount * $pricing->price;
        } else {
            // Default payment calculation if pricing data not found
            // Assuming $10 per video per day
            $paymentAmount = $videoCount * $daysCount * 10;
        }

        return response()->json(['paymentAmount' => $paymentAmount]);
    }




   


    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'video_count' => 'required|integer|min:1',
            'days_count' => 'required|integer|min:1',
            'target_audience' => 'required',
            'target_age_min' => 'required',
            'target_age_max' => 'required',
            'payment_amount' => 'required',
        ]);
    
        // Store the advertisement data
        $advertisement = new Addplan();
        $advertisement->advertiser_id = $request->advertiser_id;
        $advertisement->add_count = $request->video_count;
        $advertisement->days_count = $request->days_count;
        $advertisement->target_audiance = $request->target_audience;
        $advertisement->target_age_min = $request->target_age_min;
        $advertisement->target_age_max = $request->target_age_max;
        $advertisement->location = $request->location;
        $advertisement->city = $request->city;
        $advertisement->state = $request->state;
        $advertisement->zipcode = $request->zipcode;
        $advertisement->payment_amount = $request->payment_amount;
        
        // Attempt to save the advertisement
        if ($advertisement->save()) {
            // Advertisement saved successfully, show success message with SweetAlert
            return redirect()->route('payment.index', [
                'advertiser_id' => $request->advertiser_id,
                'advertisement' => $advertisement,
                'payment_amount' => $request->payment_amount,
                'addplan_id' => $advertisement->id // Assuming id is the primary key of the Addplan model
            ])->with('success', 'Advertisement added successfully!! Please Done the Payment To Activate It!!');
        } else {
            // Advertisement save failed, show error message with SweetAlert
            return redirect()->back()->withInput()->with('error', 'Failed to save advertisement!');
        }
    }


    public function myAddshow()
    {
        // Retrieve the currently logged-in advertiser
        $advertiser = Auth::guard('advertiser')->user();

        // Retrieve the add plan associated with the advertiser
        $addPlans = Addplan::where('advertiser_id', $advertiser->id)->get();

        // If no add plan found, you can handle it accordingly
        if (!$addPlans) {
            return redirect()->back()->with('error', 'No add plan found!');
        }

        // Pass the advertiser and add plan data to the view
        return view('frontend.adds.my_plan', compact('advertiser', 'addPlans'));
    }
}
