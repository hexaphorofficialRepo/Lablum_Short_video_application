<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Earning;
use Illuminate\Http\Request;

class EarningController extends Controller
{
  public function index(){
    $earnings = Earning::all();
    return view('admin.earning.index',compact('earnings'));
  }


    public function create(){
        return view('admin.earning.create');
    }
    public function store(Request $request)
    {
        // Validate the incoming request data
        $validatedData = $request->validate([
            'from' => 'required|numeric',
            'to' => 'required|numeric',
            'creator_points' => 'required|numeric',
            'viewer_points' => 'required|numeric',
        ]);

        // Create a new instance of your model
        $yourModel = new Earning();

        // Assign values from the form to the model's attributes
        $yourModel->from = $validatedData['from'];
        $yourModel->to = $validatedData['to'];
        $yourModel->creator_points = $validatedData['creator_points'];
        $yourModel->viewer_points = $validatedData['viewer_points'];

        // Save the model to the database
        $yourModel->save();

        // Redirect back with a success message or do something else
        return redirect()->route('admin.earning.list')->with('success', 'Form submitted successfully!');
    }

    public function edit(Earning $earning){
        return view('admin.earning.edit',compact('earning'));

    }

    public function update(Request $request, Earning $earning)
    {
        // Validate the incoming request data
        $validatedData = $request->validate([
            'from' => 'required|numeric',
            'to' => 'required|numeric',
            'creator_points' => 'required|numeric',
            'viewer_points' => 'required|numeric',
        ]);
    
        // Update the attributes of the $earning instance with the validated data
        $earning->from = $validatedData['from'];
        $earning->to = $validatedData['to'];
        $earning->creator_points = $validatedData['creator_points'];
        $earning->viewer_points = $validatedData['viewer_points'];
    
        // Save the changes to the database
        $earning->save();
    
        // Redirect back with a success message or do something else
        return redirect()->route('admin.earning.list')->with('success', 'Earning record updated successfully!');
    }
    


}
