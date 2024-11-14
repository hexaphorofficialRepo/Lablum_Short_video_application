<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Term;
use Illuminate\Http\Request;

class TermsController extends Controller
{

    public function index(){
        $terms = Term::latest()->get();
        return view('admin.terms.index',compact('terms'));
    }
    public function create(){
        return view('admin.terms.create');
    }

    public function store(Request $request)
    {
        // Validate the incoming request data
        $validatedData = $request->validate([
            'type' => 'required',
            'terms' => 'required',
        ]);

        // Create a new Policy instance and fill it with the validated data
        $policy = new Term();
        $policy->type = $validatedData['type'];
        $policy->terms = $validatedData['terms'];

        // Save the policy to the database
        $policy->save();

        // Redirect back to the previous page with a success message
        return redirect()->route('admin.terms.create')->with('success', 'Policy created successfully.');
    }

    public function edit(Term $term){
        return view('admin.terms.edit',compact('term'));

    }

    public function updateTerms(Request $request, Term $term)
    {
        // Validate the incoming request data
        $validatedData = $request->validate([
            'type' => 'required',
            'terms' => 'required',
        ]);

        // Update the term with the validated data
        $term->update($validatedData);

        // Redirect back to the previous page with a success message
        return redirect()->route('admin.term.edit',compact('term'))->with('success', 'Term updated successfully.');
    }
}
