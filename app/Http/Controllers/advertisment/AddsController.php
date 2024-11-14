<?php

namespace App\Http\Controllers\advertisment;

use App\Http\Controllers\Controller;
use App\Models\Addcategory;
use App\Models\Advertiser;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class AddsController extends Controller
{

 

public function store(Request $request)
{
    
    
    $validatedData = $request->validate([
        'fullname' => 'required|string|max:255',
        'business_name' => 'required|string|max:255',
        'business_type' => 'required|string|max:255',
        'email' => 'required|string|email|max:255|unique:users',
        'mobile' => 'required|string|max:20',
        'url' => 'nullable|string|max:255',
        'password' => 'required|string|min:8|confirmed',
    ]);

   
    $advertiser = new Advertiser([
        'name' => $request->input('fullname'),
        'business_name' => $request->input('business_name'),
        'business_type' => $request->input('business_type'),
        'email' => $request->input('email'),
        'mobile' => $request->input('mobile'),
        'url' => $request->input('url'),
        'password' => bcrypt($request->input('password')), 
    ]);

   
    $advertiser->save();
    $addcategories  = Addcategory::latest()->get();
   
    return view('frontend.adds.update_info', ['advertiser' => $advertiser,'addcategories' =>$addcategories])->with('message', 'Registration successful!');
}










public function updateProfile(Request $request)
{
    // $validatedData = $request->all();

   
    $validatedData = $request->validate([
        'fullname' => 'required|string|max:255',
        'email' => 'required|string|email|max:255',
        'mobile' => 'required|string|max:20',
        'business_type' => 'nullable',
        'business_name' => 'nullable|string|max:255',
        'url' => 'nullable|max:255',
        'state' => 'nullable|string|max:255',
        'city' => 'nullable|string|max:255',
        'area' => 'nullable|string|max:255',
        'zipcode' => 'nullable|string|max:255',
        'business_document.*' => 'nullable|image|mimes:jpeg,png,jpg,gif', 
        'personel_documents.*' => 'nullable|image|mimes:jpeg,png,jpg,gif', 
    ]);


  
    $advertiser = Advertiser::where('mobile', $validatedData['mobile'])->first();


    if(!$advertiser){
        return view('frontend.home')->with('error', 'Advertiser not found.');
    }


    $advertiser->update([
        'name' => $validatedData['fullname'],
        'email' => $validatedData['email'],
        'mobile' => $validatedData['mobile'],
        'business_type' => $validatedData['business_type'],
        'business_name' => $validatedData['business_name'],
        'url' => $validatedData['url'],
        'state' => $validatedData['state'],
        'city' => $validatedData['city'],
        'area' => $validatedData['area'],
        'zipcode' => $validatedData['zipcode'],
    ]);

    if ($request->hasFile('business_document')) {
        $businessDocumentPaths = [];
        foreach ($request->file('business_document') as $file) {
            // Store file in storage
            $path = $file->store('public/business_documents');
            // Get the path relative to storage/app/public
            $relativePath = str_replace('public/', '', $path);
            $businessDocumentPaths[] = $relativePath;
        }
        
        $advertiser->update(['business_document' => implode(',', $businessDocumentPaths)]);
    }

    // Handle personal document uploads
    if ($request->hasFile('personel_documents')) {
        $personalDocumentPaths = [];
        foreach ($request->file('personel_documents') as $file) {
            // Store file in storage
            $path = $file->store('public/personal_documents');
            // Get the path relative to storage/app/public
            $relativePath = str_replace('public/', '', $path);
            $personalDocumentPaths[] = $relativePath;
        }
    
        $advertiser->update(['personel_documents' => implode(',', $personalDocumentPaths)]);
    }

    // Redirect back with success message
    return redirect()->route('frontend.home')->with('message', 'Profile updated successfully.');
}





    




}
