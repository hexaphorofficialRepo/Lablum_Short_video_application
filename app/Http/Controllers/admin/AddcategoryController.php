<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Addcategory;
use Illuminate\Http\Request;

class AddcategoryController extends Controller
{
    public function create(){
        return view('admin.advertisment.category.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required',

        ]);

        $category = new Addcategory();
        $category->title = $request->input('title');
        $category->slug = $request->input('slug');




        if ($category->save()) {
            return redirect()->route('admin.index.add.category')->with('success', 'Category Created!!');
        }

        return redirect()->route('admin.create.add.category')->with(['error' => 'Unable to add Category']);
    }
    

    public function index(){
        $categories = Addcategory::all();
        return view('admin.advertisment.category.index',compact('categories'));
    }

    public function edit($slug){
        // Retrieve the category based on the provided slug
        $category = Addcategory::where('slug', $slug)->first();
    
        // Check if the category exists
        if (!$category) {
            // If category doesn't exist, you can return an error message or redirect to a different page
            return redirect()->route('admin.index.add.category')->with('error', 'Category not found');
        }
    
        // Pass the category data to the view
        return view('admin.advertisment.category.edit', compact('category'));
    }

    public function update(Request $request, $slug) {
        $request->validate([
            'title' => 'required|unique:addcategories,title,' . $slug . ',slug', // Ensure the title is unique except for the current category
            'slug' => 'required|unique:addcategories,slug,' . $slug . ',slug', // Ensure the slug is unique except for the current category
        ]);
    
        // Retrieve the category based on the provided slug
        $category = Addcategory::where('slug', $slug)->first();
    
        // Check if the category exists
        if (!$category) {
            // If category doesn't exist, you can return an error message or redirect to a different page
            return redirect()->route('admin.index.add.category')->with('error', 'Category not found');
        }
    
        // Update the category's title and slug
        $category->title = $request->title;
        $category->slug = $request->slug;
        $category->save();
    
        // Redirect the user to the index page with a success message
        return redirect()->route('admin.index.add.category')->with('success', 'Category updated successfully');
    }
}
