<?php

namespace App\Livewire\Admin;

use App\Models\Category;
use Livewire\Component;

class AllPostCategory extends Component
{
    public function render()
    {
        $categories = Category::all();
        return view('livewire.admin.all-post-category',compact('categories'))->layout('components.backend.app-layout');
    }
}
