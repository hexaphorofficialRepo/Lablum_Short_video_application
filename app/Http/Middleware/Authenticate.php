<?php

namespace App\Http\Middleware;

use Illuminate\Auth\Middleware\Authenticate as Middleware;
use Illuminate\Http\Request;

class Authenticate extends Middleware
{
    /**
     * Get the path the user should be redirected to when they are not authenticated.
     */
  protected function redirectTo(Request $request): ?string

    {

        if (! $request->expectsJson()) {
            if (in_array('auth:admin', $request->route()->middleware())) {
                return route('login');
            }


            if (in_array('auth:advertiser', $request->route()->middleware())) {
                return route('admin.add.dashboard');
            }
           


        }
        return null;
    }
    

    
    
    
}
