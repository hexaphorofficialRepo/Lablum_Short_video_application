<?php

namespace App\Http\Controllers\advertisment;

use App\Http\Controllers\Controller;
use App\Models\Addcategory;
use App\Models\Addplan;
use App\Models\Addvideo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
   


    public function addLogin(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);
    
        
        if (Auth::guard('advertiser')->attempt(['email' => $request->email, 'password' => $request->password, 'is_approve' => 1], $request->remember)) {
          
            $advertiser = Auth::guard('advertiser')->user();
            
         
            return redirect()->route('add.dashboard',compact('advertiser'))->with('message','Login Successfully');
        }
    
        return back()->with('error', 'Something Wrong.');
    }
    public function addDashboard(){
        $advertiser = Auth::guard('advertiser')->user();
        $addPlanCount = Addplan::where('advertiser_id', $advertiser->id)->count();
        $addVideoCount = Addvideo::where('adevrtiser_id', $advertiser->id)->count();
            
        return view('frontend.adds.dashboard', compact('advertiser', 'addPlanCount', 'addVideoCount'));
    }
    

    public function updateloginProfile(){
        $advertiser = Auth::guard('advertiser')->user();
        $addcategories  = Addcategory::latest()->get();
        return view('frontend.adds.update_profile',compact('advertiser','addcategories'));
    }


    public function logout()
    {
        Auth::guard('advertiser')->logout();
    
        return redirect()->route('frontend.home')->with('message', 'Logout successfully');
    }


}
