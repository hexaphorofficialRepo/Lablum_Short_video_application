<?php

namespace App\View\Components\frontend;

use Closure;
use Illuminate\Contracts\View\View;
use Illuminate\View\Component;

class AppLayout extends Component
{
    /**
     * Create a new component instance.
     */
   public $canonicalUrl;

    public function __construct($canonicalUrl = null)
    {
        $this->canonicalUrl = $canonicalUrl;
    }
    /**
     * Get the view / contents that represent the component.
     */
    public function render(): View|Closure|string
    {
        return view('components.frontend.app-layout');
    }
}
