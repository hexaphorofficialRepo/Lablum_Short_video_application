<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Term;
use Illuminate\Support\Facades\Log;
use Illuminate\Http\Request;

class PoliciesController extends Controller
{
    // public function ourPolicies() {
    //     try {
    //         // Fetch all terms from the database
    //         $terms = Term::all();
    
    //         // Group terms by type
    //         $groupedTerms = [];
    //         foreach ($terms as $term) {
    //             if (!isset($groupedTerms[$term->type])) {
    //                 $groupedTerms[$term->type] = [];
    //             }
    //             $groupedTerms[$term->type][] = $term->terms;
    //         }
    
    //         // Format the response
    //         $response = [];
    //         foreach ($groupedTerms as $type => $terms) {
    //             $response[] = [
    //                 $type => $terms
    //             ];
    //         }
    
    //         return response()->json(['data' => $response], 200);
    //     } catch (\Exception $e) {
    //         Log::error('Failed to fetch policies: ' . $e->getMessage());
    //         return response()->json(['message' => 'Failed to fetch policies'], 500);
    //     }
    // }
   public function ourPolicies()
{
    try {
        // Fetch all terms from the database
        $terms = Term::all();

        // Group terms by type
        $groupedTerms = [];
        foreach ($terms as $term) {
            // Ensure we have an array for each type
            if (!isset($groupedTerms[$term->type])) {
                $groupedTerms[$term->type] = [];
            }
            // Add the term to the appropriate type
            $groupedTerms[$term->type] = $term->terms;
        }

        // Format the response
        return response()->json(['data' => $groupedTerms], 200);
    } catch (\Exception $e) {
        Log::error('Failed to fetch policies: ' . $e->getMessage());
        return response()->json(['message' => 'Failed to fetch policies'], 500);
    }
}

    
    
}
