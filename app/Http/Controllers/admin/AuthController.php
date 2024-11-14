<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Addcategory;
use App\Models\Addpricing;
use App\Models\Advertiser;
use App\Models\Banneradd;
use App\Models\Blog;
use App\Models\Blogcategory;
use App\Models\Category;
use App\Models\Earning;
use App\Models\Gst;
use App\Models\Officialpayment;
use App\Models\Payment;
use App\Models\Post;
use App\Models\Song;
use App\Models\Staff;
use App\Models\Tax;
use App\Models\Taxcharge;
use App\Models\Term;
use App\Models\User;
use App\Models\Verify;
use App\Models\Wallet;
use App\Models\Withdrawl;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;

class AuthController extends Controller
{
    public function loginView(){
        return view('admin.auth.login');
    }
    public function dashboard()
    {
        // Count active users
        $activeUserCount = User::where('active', 1)->count();
        
        // Count fake users
        $fakeUserCount = User::where('active', 0)->count();
        
        // Count real posts
        $realPostCount = Post::where('active', 1)->count();
        
        // Count fake posts
        $fakePostCount = Post::where('active', 0)->count();
        $SongCount = Song::count();
        $BlogCategoryCount = Blogcategory::count();
        $BlogCount = Blog::count();
        $HashtagCount = Category::count();
        $EarningCount = Earning::count();
        $AddsCategoryCount = Addcategory::count();
        $AddsPricingCount = Addpricing::count();
        $AddsPartnersCount = Advertiser::count();
        $GstCount = Gst::count();
        $TaxCount = Tax::count();
        $TaxChargeCount = Taxcharge::count();
        $AdvertismentBillingCount = Payment::count();
        $WithdrawalCount = Withdrawl::count();
        $TermsCount = Term::count();
        $WalletCount = Wallet::count();
        $VerificationCount = Verify::count();
        $addbannerCount = Banneradd::count();
        $offcialPayment = Officialpayment::count();
       
        $officialPayments = Officialpayment::all();
        $officialPayments = Officialpayment::all();
        $totalAmount = 0;
        foreach ($officialPayments as $payment) {
            $totalAmount += intval($payment->amount); // Cast to integer
        }
        
    
        // Calculate total counts
        $totalUsers = $activeUserCount + $fakeUserCount;
        $totalPosts = $realPostCount + $fakePostCount;
    
        // Calculate percentages
        $activeUserPercentage = ($totalUsers != 0) ? number_format(($activeUserCount / $totalUsers) * 100, 2) : 0;
        $fakeUserPercentage = ($totalUsers != 0) ? number_format(($fakeUserCount / $totalUsers) * 100, 2) : 0;
        $realPostPercentage = ($totalPosts != 0) ? number_format(($realPostCount / $totalPosts) * 100, 2) : 0;
        $fakePostPercentage = ($totalPosts != 0) ? number_format(($fakePostCount / $totalPosts) * 100, 2) : 0;
        
        
        return view('admin.dashboard', [
            'activeUserCount' => $activeUserCount,
            'fakeUserCount' => $fakeUserCount,
            'realPostCount' => $realPostCount,
            'fakePostCount' => $fakePostCount,
            'activeUserPercentage' => $activeUserPercentage,
            'fakeUserPercentage' => $fakeUserPercentage,
            'realPostPercentage' => $realPostPercentage,
            'fakePostPercentage' => $fakePostPercentage,
            'SongCount'=> $SongCount,
            'BlogCategoryCount' => $BlogCategoryCount,
            'BlogCount' => $BlogCount,
            'HashtagCount' => $HashtagCount,
            'EarningCount' => $EarningCount,
            'AddsCategoryCount' => $AddsCategoryCount,
            'AddsPricingCount' => $AddsPricingCount,
            'AddsPartnersCount' => $AddsPartnersCount,
            'GstCount' => $GstCount,
            'TaxCount' => $TaxCount,
            'TaxChargeCount' => $TaxChargeCount,
            'AdvertismentBillingCount' => $AdvertismentBillingCount,
            'WithdrawalCount' => $WithdrawalCount,
            'TermsCount' => $TermsCount,
            'WalletCount' => $WalletCount,
            'VerificationCount' => $VerificationCount,
            'addbannerCount' => $addbannerCount,
            'offcialPayment' => $offcialPayment,
            'offcialPaymentAmount' => $totalAmount,
            
        ]);
    }
    
    
    public function adminLogin(Request $request)
    {
        $request->validate([
            'email'    => 'required|email',
            'password' => 'required',
        ]);

        $credentials = [
            'email'    => $request->email,
            'password' => $request->password,
        ];

        if (Auth::guard('admin')->attempt($credentials, $request->has('remember'))) {
            return redirect(route('admin.dashboard'))->with('success', 'Login success.');
        } else {
            return back()->with('error', 'Invalid email or password. Please try again.');
        }
    }


    public function logout()
    {
        Auth::guard('admin')->logout();
        return redirect()->route('login')->with('success', 'Logout Success.');
    }
    
    public function add_staff($id = null){
        $staffRecords = Staff::all();
        $staffToEdit = ($id) ? Staff::find($id) : null;
        $staff = Staff::find($id);
       
        return view('admin.add_staff', compact('staffRecords', 'staffToEdit','staff'));
  
    }
    
    public function staff_store(Request $request, $id = null)
    {
        if($id){
            $staff = Staff::find($id);
        } else {
            $staff = new Staff();
        }
        
        $request->validate([
            'name' => 'required|string|max:255',
            'image' => 'required', 
            'staff_type' => 'required|string',
            'email' => 'required|email|unique:users',
            'ph_no' => 'required|numeric',
            'password' => 'required|min:8',
            'cpassword' => 'required|same:password',
            'address' => 'nullable|string',
            'area' => 'nullable|string',
            'pincode' => 'nullable|numeric',
        ]);
       

        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = time() . '.' . $image->getClientOriginalExtension();
            $image->move(public_path('Staff_image'), $imageName);
            $imagePath = 'Staff_image/' . $imageName;
        } 
      
       
        // Create Staff Model
        $staff = new Staff([
            'name' => $request->input('name'),
            'staff_type' => $request->input('staff_type'),
            'email' => $request->input('email'),
            'ph_no' => $request->input('ph_no'),
            'password' => bcrypt($request->input('password')),
            'address' => $request->input('address'),
            'area' => $request->input('area'),
            'pincode' => $request->input('pincode'),
            'image' => $imagePath,
        ]);
      
       

        $staff->save();
        return redirect()->back();

       
    }
    public function staff_edit($id)
    {
        $staffRecords= Staff::find($id);
        
        return view('admin.add_staff', compact('staffRecords'));
    }


    // protected $table = 'staffs';
    public function staff_update(Request $request, Staff $staff){
        // Validation code
        // Image handling code
        

        
        // $request->validate([
        //     'name' => 'required|string|max:255',
        //     'image' => 'required',
        //     'staff_type' => 'required|string',
        //     'email' => 'required|email|unique:staff,email,' ,
        //     'ph_no' => 'required|string|min:10|max:15|unique:staff,ph_no,' ,
        //     'address' => 'required|string|max:255',
        //     'area' => 'required|string|max:255',
        //     'pincode' => 'required|numeric',
        // ]);
        if ($request->hasfile('image')) {
            $destination = 'Staff_image' . $staff->image;
            if (File::exists($destination)) {
                File::delete($destination);
            }
            $file = $request->image;
            $extension = $file->getClientOriginalExtension();
            $filename = time() . '.' . $extension;
            $file->move('Staff_image', $filename);
            $staff->image = $filename;

        }
      
        // Update staff member
        $staff->name = $request->input('name');
        $staff->staff_type = $request->input('staff_type');
        $staff->email = $request->input('email');
        $staff->ph_no = $request->input('ph_no');
        $staff->address = $request->input('address');
        $staff->area = $request->input('area');
        $staff->pincode = $request->input('pincode');
        
        // Update password if provided
        if ($request->filled('password')) {
            $staff->password = bcrypt($request->input('password'));
        }
        
        $staff->save();

        return redirect()->route('add_staff');
    }
    public function staff_delete($id)
    {
        $staffRecord = Staff::find($id);

        if (is_null($staffRecord)) {

            return redirect()->back();

        } else {
            $staffRecord->delete();

            if ($staffRecord) {

                return redirect()->route('add_staff');

            } else {

                echo "Unable to Delete Resource";

            }
        }

    }
    public function getPostStatsForPeriod($period = null)
    {
        $now = Carbon::now();
        
        if ($period) {
            switch ($period) {
                case 'today':
                    $startDate = $now->startOfDay();
                    break;
                case 'weekly':
                    $startDate = $now->startOfWeek();
                    break;
                case 'monthly':
                    $startDate = $now->startOfMonth();
                    break;
                default:
                    return response()->json(['error' => 'Invalid period'], 400);
            }

            $endDate = $now->endOfDay();
            $createdPosts = Post::whereBetween('created_at', [$startDate, $endDate])->count();
            $activePosts = Post::where('active', 1)->whereBetween('created_at', [$startDate, $endDate])->count();
            $blockedPosts = Post::where('active', 0)->whereBetween('created_at', [$startDate, $endDate])->count();
        } else {
            $createdPosts = Post::count();
            $activePosts = Post::where('active', 1)->count();
            $blockedPosts = Post::where('active', 0)->count();
        }

        return response()->json([
            'created' => $createdPosts,
            'active' => $activePosts,
            'blocked' => $blockedPosts,
        ]);
    }

    public function getUserStatsForPeriod($period = null)
    {
        $now = Carbon::now();
        
        if ($period) {
            switch ($period) {
                case 'today':
                    $startDate = $now->startOfDay();
                    break;
                case 'weekly':
                    $startDate = $now->startOfWeek();
                    break;
                case 'monthly':
                    $startDate = $now->startOfMonth();
                    break;
                default:
                    return response()->json(['error' => 'Invalid period'], 400);
            }

            $endDate = $now->endOfDay();
            $createdUsers = User::whereBetween('created_at', [$startDate, $endDate])->count();
            $activeUsers = User::where('active', 1)->whereBetween('created_at', [$startDate, $endDate])->count();
            $blockedUsers = User::where('active', 0)->whereBetween('created_at', [$startDate, $endDate])->count();
        } else {
            $createdUsers = User::count();
            $activeUsers = User::where('active', 1)->count();
            $blockedUsers = User::where('active', 0)->count();
        }

        return response()->json([
            'created' => $createdUsers,
            'active' => $activeUsers,
            'blocked' => $blockedUsers,
        ]);
    }


}
