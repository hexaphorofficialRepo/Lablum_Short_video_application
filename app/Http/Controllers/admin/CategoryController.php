<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class CategoryController extends Controller
{
    public function index(){
        $categories = Category::all();
        $titles = Category::pluck('title')->unique();
        return view('admin.category.index',compact('categories','titles'));
    }



    public function filter(Request $request)
{
    $title = $request->input('title');
    $categories = Category::where('title', $title)->get();
    return view('admin.category.index', compact('categories'));
}


    public function create(){
        return view('admin.category.create');
    }


    public function storeCategory(Request $request)
    {
    
        $request->validate([
            'name' => 'required',
           
            'title' => 'required',
        ]);
    
        $names = explode('#', $request->input('name'));
        $names = array_filter($names); // Remove empty elements
    
     
    
        foreach ($names as $name) {
            $category = new Category();
            $category->name = '#' . trim($name); // Remove leading/trailing whitespace
            $category->slug = $request->input('slug'); // Use the same slug for all categories
            $category->title = $request->input('title'); // Use the same title for all categories
          
            $category->save();
        }
    
        return redirect()->route('admin.category.index')->with('success', '#HashTags have been created successfully');
    }
    
    public function edit(Category $category){
        return view('admin.category.edit',compact('category'));
    }

    public function update(Request $request, Category $category)
    {
        $request->validate([
            'name' => 'required',
            'title' => 'title',
          
        ]);

        $category->name = $request->input('name');
        $category->title = $request->input('title');
       

      

        $category->save();

        return redirect()->route('admin.category.index')->with('success', '#HashTag has been updated successfully');
    }
}
