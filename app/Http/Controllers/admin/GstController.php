<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Gst;
use Illuminate\Http\Request;

class GstController extends Controller
{


    public function index(){
        $gsts = Gst::latest()->get();
        return view('admin.tax.gst.index',compact('gsts'));
    }
    public function create(){
        return view('admin.tax.gst.create');
    }

    public function store(Request $request)
    {
        // Validate the form data
        $request->validate([
            'payment_type' => 'required',
            'payment_for' => 'required',
            'tax_percentage' => 'required|numeric|min:0|max:100', // Assuming GST percentage is between 0 and 100
        ]);
    
        // Store the data
        try {
            $gst = new Gst();
            $gst->payment_type = $request->input('payment_type');
            $gst->payment_for = $request->input('payment_for');
            $gst->tax_percentage = $request->input('tax_percentage');
            $gst->save();
    
            return redirect()->route('admin.gst.index')->with('success', 'GST details added successfully.');
        } catch (\Exception $e) {
            // Log or handle the exception as needed
            return redirect()->back()->withInput()->withErrors(['error' => 'Failed to add GST details. Please try again.']);
        }
    }

    public function edit(Gst $gst){
        return view('admin.tax.gst.edit',compact('gst'));
    }

    public function update(Request $request, Gst $gst)
    {
        // Validate the form data
        $request->validate([
            'payment_type' => 'required',
            'payment_for' => 'required',
            'tax_percentage' => 'required|numeric|min:0|max:100', // Assuming GST percentage is between 0 and 100
        ]);
    
        // Update the data
        try {
            $gst->update([
                'payment_type' => $request->input('payment_type'),
                'payment_for' => $request->input('payment_for'),
                'tax_percentage' => $request->input('tax_percentage'),
            ]);
    
            return redirect()->route('admin.gst.index')->with('success', 'GST details updated successfully.');
        } catch (\Exception $e) {
            // Log or handle the exception as needed
            return redirect()->back()->withInput()->withErrors(['error' => 'Failed to update GST details. Please try again.']);
        }
    }
    

}
