<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Verify;
use Illuminate\Support\Facades\Log;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class OfficialVerifyController extends Controller
{

   
    // public function officialverify(Request $request, $user_id) {
    //     try {
    //         // Check if user is already verified
    //         if (Verify::where('user_id', $user_id)->exists()) {
    //             return response()->json(['message' => 'User is already verified'], 402);
    //         }
    
    //         // Validate the request data
    //         $validatedData = $request->validate([
    //             'name' => 'required|string|max:255',
    //             'category' => 'required|string|max:255',
    //             'country' => 'required|string|max:255',
    //             'known' => 'nullable|string|max:255',
    //             'audiance' => 'nullable|string|max:255',
    //             'link_type1' => 'nullable|string|max:255',
    //             'link_url1' => 'nullable|url|max:255',
    //             'link_type2' => 'nullable|string|max:255',
    //             'link_url2' => 'nullable|url|max:255',
    //             'link_type3' => 'nullable|string|max:255',
    //             'link_url3' => 'nullable|url|max:255',
    //             'document_type' => 'required|string|max:255',
    //             'document_pdf' => 'required|array',
    //             'document_pdf.*' => 'required|file|mimes:pdf,jpeg,jpg,png', // Limit file size to 2MB
    //         ]);
    
    //         // Retrieve the user
    //         $user = User::findOrFail($user_id);
    //         $documentPaths = [];
    
    //         // Store each document and collect the paths
    //         if ($request->hasFile('document_pdf')) {
    //             foreach ($request->file('document_pdf') as $file) {
    //                 $filePath = $file->store('Official_documents','public');
    //                 $documentPaths[] = $filePath;
    //             }
    //         }
    
    //         // Convert document paths array to a comma-separated string
    //         $documentPathsString = implode(',', $documentPaths);
    
    //         // Prepare the verification data
    //         $verificationData = [
    //             'user_id' => $user_id,
    //             'name' => $validatedData['name'],
    //             'category' => $validatedData['category'],
    //             'country' => $validatedData['country'],
    //             'known' => $validatedData['known'] ?? null,
    //             'audiance' => $validatedData['audiance'] ?? null,
    //             'link_type1' => $validatedData['link_type1'] ?? null,
    //             'link_url1' => $validatedData['link_url1'] ?? null,
    //             'link_type2' => $validatedData['link_type2'] ?? null,
    //             'link_url2' => $validatedData['link_url2'] ?? null,
    //             'link_type3' => $validatedData['link_type3'] ?? null,
    //             'link_url3' => $validatedData['link_url3'] ?? null,
    //             'document_type' => $validatedData['document_type'],
    //             'document_pdf' => $documentPathsString,
    //             'status' => 2, // Set a default status
    //         ];
    
    //         // Create the verification record
    //         $verification = Verify::create($verificationData);
    
    //         return response()->json(['message' => 'Document verification stored successfully'], 200);
    //     } catch (\Exception $e) {
    //         // Log the error message
    //         Log::error('Failed to store document files: ' . $e->getMessage());
    //         return response()->json(['message' => 'Failed to store document verification'], 500);
    //     }
    // }
    
    public function officialverify(Request $request, $user_id) {
    try {
        // Check if the user already has a verification record
        $existingVerification = Verify::where('user_id', $user_id)->first();

        // Handle cases based on the existing verification status
        if ($existingVerification) {
            if ($existingVerification->status === 1) {
                return response()->json(['message' => 'User is already verified'], 402);
            } else {
                // Delete the existing record if the status is 2 or 0
                $existingVerification->delete();
            }
        }

        // Validate the request data
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'category' => 'required|string|max:255',
            'country' => 'required|string|max:255',
            'known' => 'nullable|string|max:255',
            'audiance' => 'nullable|string|max:255',
            'link_type1' => 'nullable|string|max:255',
            'link_url1' => 'nullable|url|max:255',
            'link_type2' => 'nullable|string|max:255',
            'link_url2' => 'nullable|url|max:255',
            'link_type3' => 'nullable|string|max:255',
            'link_url3' => 'nullable|url|max:255',
            'document_type' => 'required|string|max:255',
            'document_pdf' => 'required|array',
            'document_pdf.*' => 'required|file|mimes:pdf,jpeg,jpg,png', // Limit file size to 2MB
        ]);

        // Retrieve the user
        $user = User::findOrFail($user_id);
        $documentPaths = [];

        // Store each document and collect the paths
        if ($request->hasFile('document_pdf')) {
            foreach ($request->file('document_pdf') as $file) {
                $filePath = $file->store('Official_documents', 'public');
                $documentPaths[] = $filePath;
            }
        }

        // Convert document paths array to a comma-separated string
        $documentPathsString = implode(',', $documentPaths);

        // Prepare the verification data
        $verificationData = [
            'user_id' => $user_id,
            'name' => $validatedData['name'],
            'category' => $validatedData['category'],
            'country' => $validatedData['country'],
            'known' => $validatedData['known'] ?? null,
            'audiance' => $validatedData['audiance'] ?? null,
            'link_type1' => $validatedData['link_type1'] ?? null,
            'link_url1' => $validatedData['link_url1'] ?? null,
            'link_type2' => $validatedData['link_type2'] ?? null,
            'link_url2' => $validatedData['link_url2'] ?? null,
            'link_type3' => $validatedData['link_type3'] ?? null,
            'link_url3' => $validatedData['link_url3'] ?? null,
            'document_type' => $validatedData['document_type'],
            'document_pdf' => $documentPathsString,
            'status' => 2, // Set a default status
        ];

        // Create the verification record
        $verification = Verify::create($verificationData);

        return response()->json(['message' => 'Document verification stored successfully'], 200);
    } catch (\Exception $e) {
        // Log the error message
        Log::error('Failed to store document files: ' . $e->getMessage());
        return response()->json(['message' => 'Failed to store document verification'], 500);
    }
}

    
    



    
    
    
}
