<?php

namespace App\Http\Controllers;

use App\Models\Organization;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;


class OrganizationController extends Controller
{
    public function add_organization($id = null){
        $organizationRecords = Organization::all();
        $organizationToEdit = ($id) ? Organization::find($id) : null;
       
       
        return view('admin.add_organization', compact('organizationRecords','organizationToEdit'));
  
    }

    public function organization_store(Request $request, $id = null)
    {
       



        if($id){
            $organization = Organization::find($id);
        } else {
            $organization = new Organization();
        }
       
        $request->validate([
            'name' => 'required|string|max:255',
            'organization_type' => 'required|string',
            'email' => 'required|email|unique:users',
            'url' => 'required|string',
            'contact' => 'required|numeric',
            'ph_no' => 'required|numeric',
            'password' => 'required|min:8',
            'cpassword' => 'required|same:password',
            'address' => 'nullable|string',
            'area' => 'nullable|string',
            'pincode' => 'nullable|numeric',
            'state' => 'required|string',
            'image' => 'required', 
            
        ]);
       
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = time() . '.' . $image->getClientOriginalExtension();
            $image->move(public_path('organization_image'), $imageName);
            $imagePath = 'organization_image/' . $imageName;
        } 
       
        // Create Organization Model
        $organization = new Organization([
            'name' => $request->input('name'),
            'organization_type' => $request->input('organization_type'),
            'email' => $request->input('email'),
            'url' => $request->input('url'),
            'contact' => $request->input('contact'),
            'ph_no' => $request->input('ph_no'),
            'password' => bcrypt($request->input('password')),
            'address' => $request->input('address'),
            'area' => $request->input('area'),
            'pincode' => $request->input('pincode'),
            'state' => $request->input('state'),
            'approve' => $request->input('approve'),
            'image' => $imagePath,
            
        ]);
      
       

        $organization->save();
        return redirect()->back();

       
    }
    public function organization_edit($id)
    {
       
        $organizationRecords= Organization::find($id);
        
        return view('admin.add_organization', compact('organizationRecords'));
    }


    public function organization_update(Request $request, Organization $organization){
        // Validation code
        // Image handling code
        

        
        // $request->validate([
        //     'name' => 'required|string|max:255',
        //     'image' => 'required',
        //     'staff_type' => 'required|string',
        //     'email' => 'required|email|unique:staff,email,' ,
        //     'ph_no' => 'required|string|min:10|max:15|unique:staff,ph_no,' ,
        //     'address' => 'required|string|max:255',
        //     'area' => 'required|string|max:255',
        //     'pincode' => 'required|numeric',
        // ]);
        if ($request->hasfile('image')) {
            $destination = 'organization_image' . $organization->image;
            if (File::exists($destination)) {
                File::delete($destination);
            }
            $file = $request->image;
            $extension = $file->getClientOriginalExtension();
            $filename = time() . '.' . $extension;
            $file->move('organization_image', $filename);
            $organization->image = $filename;

        }
      
        // Update organization member
        $organization->name = $request->input('name');
        $organization->organization_type = $request->input('organization_type');
        $organization->email = $request->input('email');
        $organization->url = $request->input('url');
        $organization->ph_no = $request->input('ph_no');
        $organization->contact = $request->input('contact');
        $organization->address = $request->input('address');
        $organization->area = $request->input('area');
        $organization->pincode = $request->input('pincode');
        $organization->state = $request->input('state');
        
        // Update password if provided
        if ($request->filled('password')) {
            $organization->password = bcrypt($request->input('password'));
        }
        
        $organization->save();

        return redirect()->route('add_organization');
    }
}
