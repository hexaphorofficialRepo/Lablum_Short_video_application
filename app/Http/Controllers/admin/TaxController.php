<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Tax;
use App\Models\Taxcharge;
use Illuminate\Http\Request;

class TaxController extends Controller
{
    public function create(){
        return view('admin.tax.taxes.create');
    }
    public function store(Request $request)
    {
        // Validate the form data
        $request->validate([
        'tax_type' => 'required|unique:taxes,tax_type',
           
        ]);
    
        // Store the data
        try {
            $tax = new Tax();
            $tax->tax_type = $request->input('tax_type');
         
            $tax->save();
    
            return redirect()->route('admin.taxes.type.index')->with('success', 'Type of Taxes is Added Successfully!!');
        } catch (\Exception $e) {
            // Log or handle the exception as needed
            return redirect()->back()->withInput()->withErrors(['error' => 'Failed to add Tax Type. Please try again.']);
        }

        
    }

    public function index(){
        $taxes = Tax::latest()->get();
        return view('admin.tax.taxes.index',compact('taxes'));
    }

    public function edit(Tax $tax){
        return view('admin.tax.taxes.edit',compact('tax'));
    }

    public function update(Request $request, Tax $tax)
    {
        // Validate the form data
    
            $request->validate([
                'tax_type' => 'required|unique:taxes,tax_type,' . $tax->id,
            ]);
            

    
        // Update the data
        try {
            $tax->update([
                'tax_type' => $request->input('tax_type'),
            ]);
    
            return redirect()->route('admin.taxes.type.index')->with('success', 'Type of Taxes is Updated Successfully!!');
        } catch (\Exception $e) {
            // Log or handle the exception as needed
            return redirect()->back()->withInput()->withErrors(['error' => 'Failed to update Tax Type. Please try again.']);
        }
    }


    public function createTaxcharge(){
        $taxes = Tax::all();
        return view('admin.tax.taxcharge.create',compact('taxes'));
    }


    public function storeTaxcharge(Request $request)
    {
        // Validate the form data
        $request->validate([
            'tax_id' => 'required',
            'payment_type' => 'required',
            'payment_for' => 'required',
            'tax_percentage' => 'required|numeric|min:0|max:100', // Assuming GST percentage is between 0 and 100
        ]);
    
        // Store the data
        try {
            $taxcharge = new Taxcharge();
            $taxcharge ->tax_id = $request->input('tax_id');
            $taxcharge->payment_type = $request->input('payment_type');
            $taxcharge->payment_for = $request->input('payment_for');
            $taxcharge->tax_percentage = $request->input('tax_percentage');
            $taxcharge->save();
    
            return redirect()->route('admin.tax.charges.index')->with('success', 'Tax Charges and  details added successfully.');
        } catch (\Exception $e) {
            // Log or handle the exception as needed
            return redirect()->back()->withInput()->withErrors(['error' => 'Failed to add Tac Charge and Details details. Please try again.']);
        }
    }
public function indexTaxcharges(){
    $taxcharges = Taxcharge::latest()->get();
    return view('admin.tax.taxcharge.index',compact('taxcharges'));
}

public function editTaxcharges(Taxcharge $taxcharge){
    $taxes = Tax::all();
    return view('admin.tax.taxcharge.edit',compact('taxcharge','taxes'));

}
public function updateTaxcharge(Request $request, Taxcharge $taxcharge)
{
    // Validate the form data
    $request->validate([
        'tax_id' => 'required',
        'payment_type' => 'required',
        'payment_for' => 'required',
        'tax_percentage' => 'required|numeric|min:0|max:100', // Assuming GST percentage is between 0 and 100
    ]);

    // Update the data
    try {
        $taxcharge->update([
            'tax_id' => $request->input('tax_id'),
            'payment_type' => $request->input('payment_type'),
            'payment_for' => $request->input('payment_for'),
            'tax_percentage' => $request->input('tax_percentage'),
        ]);

        return redirect()->route('admin.tax.charges.index')->with('success', 'Tax Charges and details updated successfully.');
    } catch (\Exception $e) {
        // Log or handle the exception as needed
        return redirect()->back()->withInput()->withErrors(['error' => 'Failed to update Tax Charge and Details. Please try again.']);
    }
}


    
}
