<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Banneradd;
use Illuminate\Http\Request;

class BanneraddController extends Controller
{
    public function create(){
        return view('admin.banneradd.create');
    }

    public function store(Request $request)
    {
       
        $request->validate([
            'name' => 'required|string|max:255',
            'org_name' => 'required|string|max:255',
            'business_type' => 'required|string|max:255',
            'banner' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'url' => 'required',
            'active_date' => 'required',
            'expire_date' => 'required',
        ]);
        

        $bannerPath = $request->file('banner')->store('banners', 'public');

        $banneradd = new Banneradd([
            'name' => $request->input('name'),
            'com_name' => $request->input('org_name'),
            'business_type' => $request->input('business_type'),
            'banner' => $bannerPath,
            'url' => $request->input('url'),
            'amount' => $request->input('amount'),
            'active_date' => $request->input('active_date'),
            'expire_date' => $request->input('expire_date'),
            'status' => 0,
        ]);

        $banneradd->save();

        return redirect()->route('admin.add.banner.index')->with('success', 'Advertisement banner added successfully.');
    }

public function index(){
    $banneradds = Banneradd::latest()->get();
    return view('admin.banneradd.index',compact('banneradds'));
}

// Add this method to your controller

public function updateIsActive(Request $request, $addbannerId)
{
    $addbanner =Banneradd ::find($addbannerId);
    if (!$addbanner) {
        return response()->json(['error' => 'Banner Advertisment not found'], 404);
    }

    $addbanner->status = $request->status;
    $addbanner->save();

    return response()->json(['success' => 'Advertisment Banner Status Updated!! '], 200);
}


}
