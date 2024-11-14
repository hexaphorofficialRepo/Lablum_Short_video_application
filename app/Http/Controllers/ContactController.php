<?php

namespace App\Http\Controllers;

use App\Models\Contact;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ContactController extends Controller
{
    public function store(Request $request)
    {
        // Validate the form data
        $validator = Validator::make($request->all(), [
            'fullname' => 'required|string|max:255',
            'email' => 'required|email|max:255',
            'phone' => 'nullable|string|max:20',
            'subject' => 'nullable|string|max:255',
            'message' => 'required|string',
        ]);
    
        // If validation fails, redirect back with errors and old input
        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }
    
        // Store the form data
        $formData = new Contact();
        $formData->name = $request->fullname;
        $formData->email = $request->email;
        $formData->phone = $request->phone;
        $formData->subject = $request->subject;
        $formData->message = $request->message;
        $formData->save();
    
        // Optionally, you can redirect the user after successful submission
        return redirect()->back()->with('success', 'Thank you for contacting us. Our team will get in touch with you very soon.');
    }
    
    

    }

