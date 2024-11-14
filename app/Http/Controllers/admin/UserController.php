<?php

namespace App\Http\Controllers\admin;

use App\Exports\UserExport;
use App\Http\Controllers\Controller;
use App\Models\Bank;
use App\Models\Blockmessage;
use App\Models\User;
use App\Models\Verify;
use App\Models\Wallet;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Maatwebsite\Excel\Facades\Excel;

class UserController extends Controller
{
    public function realUser(){
        $users = User::where('active', 1)->latest()->paginate(10);
        return view('admin.user.real_user', compact('users'));
    }




    public function userDetails($user_id){
        $user = User::where('user_id', $user_id)->firstOrFail();
        return view('admin.user.user_info', compact('user'));
    }
    
    public function userBank($user_id){
        $user = User::findOrFail($user_id);
    
        // Check if the user has bank details
        $bank = $user->bank;
    
        if ($bank) {
            return view('admin.user.user_bank', compact('bank'));
        } else {
            return redirect()->back()->with('error', 'This user has not added bank details yet.');
        }
    }
    public function userData($user_id){
        $user = User::findOrFail($user_id);
    
        // Check if the user has bank details
        $userdata = $user->userdata;
    
        if ($userdata) {
            return view('admin.user.user_identity', compact('userdata'));
        } else {
            return redirect()->back()->with('error', 'This user has not Verfied Yet.');
        }
    }
    public function userWallet_record($user_id){
        $user = User::findOrFail($user_id);
    
        // Check if the user has bank details
        $userwallet = $user->wallet;
    
        if ($userwallet) {
            return view('admin.user.user_wallet', compact('userwallet'));
        } else {
            return redirect()->back()->with('error', 'This user has not Created Wallet For This User.');
        }
    }
    
    // In your controller, handle the blocking process
    public function blockUser(Request $request)
    {
       

$request->validate([
            'user_id' => 'required|exists:users,user_id',
            'block_reason' => 'required|string|max:255',
        ]);
    
        // Block user
        $user = User::find($request->input('user_id'));
        $user->active = false;
        $user->save();
    
        // Save block reason
        $blockMessage = new Blockmessage();
        $blockMessage->user_id = $request->input('user_id');
        $blockMessage->reason = $request->input('block_reason');
        $blockMessage->save();
    
        return redirect()->back()->with('message','User is Blocked Successfully!!');
    }











    public function updateIsActive(Request $request, $userId)
    {
        $user = User::find($userId);
        if (!$user) {
            return response()->json(['error' => 'User not found'], 404);
        }

        $user->active = $request->active;
        $user->save();

        return response()->json(['message' => 'User  status updated successfully!! User is Blocked Form Application'], 200);
    }



















    public function fakeUser(){
        $users = User::where('active', 0)->latest()->paginate(10);
        return view('admin.user.fake_user', compact('users'));
    }


    public function userWallet(){
        $wallets = Wallet::all();
        return view('admin.user.wallet',compact('wallets'));
    }

 

public function searchUserWallet(Request $request) {
    // Get the search query from the request
    $searchQuery = $request->input('search_query');

    // Perform the search using the query
    $wallets = Wallet::whereHas('user', function ($query) use ($searchQuery) {
        $query->where('username', 'like', '%' . $searchQuery . '%')
              ->orWhere('mobile', 'like', '%' . $searchQuery . '%')
              ->orWhere('email', 'like', '%' . $searchQuery . '%');
    })->get();

    // Return the view with the filtered results
    return view('admin.user.wallet', compact('wallets'));
}


public function offcialVrification(){
    $verifies = Verify::latest()->get();
    return view('admin.user.official',compact('verifies'));
}

public function updateStatus(Request $request, $id)
    {
        // Validate the request
        $request->validate([
            'active' => 'required|boolean',
        ]);

        // Find the verify record by ID
        $verify = Verify::findOrFail($id);

        // Update the verify status
        $verify->status = $request->active;
        $verify->save();

        // Return response
        return response()->json(['message' => 'Verify status updated successfully'], 200);
    }




    public function showUser(Request $request){
     

        $query = User::where('active', 1); // Filter only active posts
    
        if ($request->has('date') && $request->date === Carbon::today()->toDateString()) {
          
            $query->whereDate('created_at', Carbon::today());
        } elseif ($request->has('start_date') && $request->has('end_date')) {
            
            $start_date = $request->start_date;
            $end_date = $request->end_date;
            $query->whereBetween('created_at', [$start_date, $end_date]);
        }
    
        $users = $query->latest()->get();
    
        return view('admin.user.real_user', compact('users'));
    }


    
      public function downloadToday()
{
    $users = User::where('active', 1)->whereDate('created_at', Carbon::today())->get();
        return Excel::download(new UserExport($users), 'users_today.xlsx');
}
    
public function downloadByDate(Request $request)
{
    $startDate = $request->start_date;
    $endDate = $request->end_date;

 
    $users = User::where('active', 1)->whereBetween('created_at', [$startDate, $endDate])->get();

   
    return Excel::download(new UserExport($users), 'users_' . $startDate . '_to_' . $endDate . '.xlsx');
}
public function showfakeUser(Request $request){
     

    $query = User::where('active', 0); // Filter only active posts

    if ($request->has('date') && $request->date === Carbon::today()->toDateString()) {
      
        $query->whereDate('created_at', Carbon::today());
    } elseif ($request->has('start_date') && $request->has('end_date')) {
        
        $start_date = $request->start_date;
        $end_date = $request->end_date;
        $query->whereBetween('created_at', [$start_date, $end_date]);
    }

    $users = $query->latest()->get();

    return view('admin.user.fake_user', compact('users'));
}



public function downloadFakeToday()
{
    $users = User::where('active', 0)->whereDate('created_at', Carbon::today())->get();
        return Excel::download(new UserExport($users), 'users_today.xlsx');
}
    
public function downloadFakeByDate(Request $request)
{
    $startDate = $request->start_date;
    $endDate = $request->end_date;

 
    $users = User::where('active', 0)->whereBetween('created_at', [$startDate, $endDate])->get();

   
    return Excel::download(new UserExport($users), 'users_' . $startDate . '_to_' . $endDate . '.xlsx');
}

// public function reportAccount($user_id){
//     $user = User::findOrFail($user_id);
//     $userreports = $user->report;
//     if ($userreports) {
//         return view('admin.user.user_report', compact('userreports'));
//     } else {
//         return redirect()->back()->with('error', 'No One Reported On this Account Yet');
//     }
// }
   


}
