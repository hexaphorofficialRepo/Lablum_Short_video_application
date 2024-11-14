<?php

namespace App\View\Components\frontend;

use App\Models\Addcategory;
use Closure;
use Illuminate\Contracts\View\View;
use Illuminate\View\Component;

class Header extends Component
{
    /**
     * Create a new component instance.
     */
    public function __construct()
    {
        //
    }

    /**
     * Get the view / contents that represent the component.
     */
    public function render(): View|Closure|string
    {
        $addcategories  = Addcategory::latest()->get();
        return view('components.frontend.header',compact('addcategories'));
    }
}
