<?php

namespace App\Http\Controllers\advertisment;

use App\Http\Controllers\Controller;
use App\Models\Advertiser;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Password;

class ForgetpasswordController extends Controller
{
    public function viewemailPage(){
        $advertisers = Advertiser::latest()->get();

        return view('frontend.adds.forgetpassword.forget_email',compact('advertisers'));
    }
    public function sendResetLink(Request $request)
{
    $request->validate(['email' => 'required|email|exists:users,email']);

    // Generate reset token
    $user = Advertiser::where('email', $request->email)->first();
    $token = Password::createToken($user);

    // Include email in the reset link
    $resetLink = route('password.reset', ['token' => $token, 'email' => $request->email]);

    // Send email with the reset link
    Mail::send('mail.reset_password', ['resetLink' => $resetLink], function ($message) use ($request) {
        $message->to($request->email)
            ->subject('Password Reset Request');
    });

    return redirect()->back()->with(['success' => 'Password reset link sent successfully! Please check your email.']);
}



    public function showResetForm(Request $request, $token)
{
    return view('frontend.adds.forgetpassword.resetpassword', [
        'token' => $token,
        'email' => $request->query('email') // Retrieve email from the query string
    ]);
}

public function resetPassword(Request $request)
{
    $request->validate([
        'token' => 'required',
        'email' => 'required|email|exists:users,email',
        'password' => 'required|confirmed|min:8',
    ]);

    $user = Advertiser::where('email', $request->email)->first();

    if (!$user) {
        return response()->json(['error' => 'Invalid token or email.'], 400);
    }

    // Update user's password
    $user->update(['password' => Hash::make($request->password)]);

    return redirect()->route('login')->with('status', 'Password reset successfully.');
}
    
}
