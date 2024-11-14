<?php

namespace App\Http\Controllers\admin\settings;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class UpdatepasswordController extends Controller
{
    public function updatepasswordview(){
        return view('admin.settings.password.update');
    }




    public function updatePassword(Request $request) {
  
        $request->validate([
            'old_password' => 'required',
            'new_password' => 'required',
            'password_confirmation' => 'required|same:new_password',
        ]);
        
   
      
        $admin = Auth::guard('admin')->user();
    
        // Check if old password matches
        if (!Hash::check($request->old_password, $admin->password)) {
            return back()->with('error', 'The old password is incorrect.');
        }
      
        // Update the password
        $admin->password = Hash::make($request->new_password);
        $admin->save();
    
        return redirect()->route('admin.update.password.view')->with('success', 'Password updated successfully.');
    }

}
