<?php

namespace App\Http\Controllers\admin\settings;

use App\Http\Controllers\Controller;
use App\Models\Otherlink;
use Illuminate\Http\Request;

class OtherlinkController extends Controller
{
    public function create(){
        return view('admin.settings.otherlinks.create');

    }

    public function store(Request $request)
    {
     
        $request->validate([
            'name' => 'required',
            'url' => 'required',

        ]);

        $otherlink = new Otherlink();
        $otherlink->name = $request->input('name');
        $otherlink->url = $request->input('url');




        if ($otherlink->save()) {
            return redirect()->route('admin.other_link.create')->with('success', 'Other Link  Created!!');
        }

        return redirect()->route('admin.other_link.create')->with(['error' => 'Unable to add Other Link']);
    }



    public function index(){
        $otherlinks =  Otherlink::latest()->get();
        return view('admin.settings.otherlinks.index',compact('otherlinks'));
    }

    public function edit(Otherlink $otherlink){
        return view('admin.settings.otherlinks.edit',compact('otherlink'));
    }


    public function update(Request $request, Otherlink $otherlink) {
        $request->validate([
            'name' => 'required',
            'url' => 'required',
            
        ]);
    
       
    
        // Update the category's title and slug
        $otherlink->name = $request->name;
        $otherlink->url = $request->url;
        $otherlink->save();
    
        // Redirect the user to the index page with a success message
        return redirect()->route('admin.other_link.index')->with('success', 'Other Links  updated successfully');
    }
}
