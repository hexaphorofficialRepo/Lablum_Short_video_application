<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Addcategory;
use App\Models\Addpricing;
use Illuminate\Http\Request;

class AddpricingController extends Controller
{


    public function index(){
        $addpricing = Addpricing::all();
        return view('admin.advertisment.pricing.index',compact('addpricing'));
    }
    public function create(){
        $addcategories  = Addcategory::latest()->get();
        return view('admin.advertisment.pricing.create',compact('addcategories'));
    }
    public function store(Request $request)
    {
        // Validate the incoming request data
        $validatedData = $request->validate([
            'video_count' => 'required|numeric',
            'days_count' => 'required|numeric',
            'price' => 'required|numeric',
            'category' => 'required',
        ]);
    
     
        $existingRecord = Addpricing::where('category', $validatedData['category'])->first();
    
      
        if ($existingRecord) {
         
            return redirect()->route('admin.add.pricing.index')->with('error', 'A record already exists for this category!');
        }
    
        // Create a new instance of your model
        $yourModel = new Addpricing();
    
        // Assign values from the form to the model's attributes
        $yourModel->video_count = $validatedData['video_count'];
        $yourModel->days_count = $validatedData['days_count'];
        $yourModel->price = $validatedData['price'];
        $yourModel->category = $validatedData['category'];
    
        // Save the model to the database
        $yourModel->save();
    
        // Redirect back with a success message or do something else
        return redirect()->route('admin.add.pricing.index')->with('success', 'Form submitted successfully!');
    }
    
    public function edit(Addpricing $pricing){
        $addcategories  = Addcategory::latest()->get();
        return view('admin.advertisment.pricing.edit',compact('pricing','addcategories'));
    }

    public function update(Request $request, Addpricing $pricing)
    {
        // Validate the incoming request data
        $validatedData = $request->validate([
            'video_count' => 'required|numeric',
            'days_count' => 'required|numeric',
            'price' => 'required|numeric',
            'category' => 'required',
          
        ]);
        // $existingRecord = Addpricing::where('category', $validatedData['category'])->first();
    
      
        // if ($existingRecord) {
         
        //     return redirect()->route('admin.add.pricing.index')->with('error', 'A record already exists for this category!');
        // }


        $pricing->video_count = $validatedData['video_count'];
        $pricing->days_count = $validatedData['days_count'];
        $pricing->price = $validatedData['price'];
        $pricing->category = $validatedData['category'];
        // Update the attributes of the $earning instance with the validated data
      
    
        // Save the changes to the database
        $pricing->save();
    
        // Redirect back with a success message or do something else
        return redirect()->route('admin.add.pricing.index')->with('success', 'Add Pricing record updated successfully!');
    }


}
