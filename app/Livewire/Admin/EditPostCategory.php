<?php

namespace App\Livewire\Admin;

use App\Models\Category;
use Livewire\Component;
use Livewire\WithFileUploads;
use Illuminate\Support\Str;

class EditPostCategory extends Component
{

    use WithFileUploads;

    public $category;
    public $name;
    public $slug;
    public $image;

    public function mount(Category $category)
    {
        $this->category = $category;
        $this->name = $category->name;
        $this->slug = $category->slug;
    }

    public function generateslug()
    {
        $this->slug = Str::slug($this->name);
    }

    public function updateCategory()
    {
        $this->validate([
            'name' => 'required',
            'slug' => 'required',
            'image' => 'image', // Adjust max size as needed
        ]);

        $this->category->name = $this->name;
        $this->category->slug = $this->slug;

        if ($this->image) {
            $imageName = time() . '.' . $this->image->getClientOriginalExtension();
            $destinationPath = 'category_image';

            $this->image->storeAs($destinationPath, $imageName, 'public');

            $this->category->image = 'storage/' . $destinationPath . '/' . $imageName;
        }

        $this->category->save();

        session()->flash('message', 'Category has been updated successfully');

        // Redirect or emit an event to update UI as needed
    }

    public function render()
    {
    
        return view('livewire.admin.edit-post-category')->layout('components.backend.app-layout');
    }



    
}
