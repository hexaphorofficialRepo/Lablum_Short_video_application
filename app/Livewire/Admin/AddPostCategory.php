<?php

namespace App\Livewire\Admin;

use App\Models\Category;
use Carbon\Carbon;
use Illuminate\Support\Facades\File;
use Livewire\Component;
use Illuminate\Support\Facades\Storage; // Added use statement
use Illuminate\Support\Str;
use Livewire\WithFileUploads;

class AddPostCategory extends Component
{
    use WithFileUploads;

    public $name;
    public $slug;
    public $image;
    public $category_id;

    public function generateslug()
    {
        $this->slug = Str::slug($this->name);
    }
    public function storeCategory()
    {
        $this->validate([
            'name' => 'required',
            'slug' => 'required',
            'image' => 'image', // Adjust max size as needed
        ]);
    
        $category = new Category();
        $category->name = $this->name;
        $category->slug = $this->slug;
    
        if ($this->image) {
            $imageName = time() . '.' . $this->image->getClientOriginalExtension();
            $destinationPath = 'category_image';
    
      
            $this->image->storeAs($destinationPath, $imageName, 'public');
    
          
            $category->image = 'storage/' . $destinationPath . '/' . $imageName;
        } else {
          
            $category->image = 'storage/category_image/default.jpg';
        }
    
        $category->save();
    
        session()->flash('message', 'Category has been created successfully');
    }
    
    
    public function render()
    {
        $categories = Category::all();
        return view('livewire.admin.add-post-category', ['categories' => $categories])->layout('components.backend.app-layout');
    }
}
