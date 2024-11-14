<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class CanonicalMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle($request, Closure $next)
    {
        $response = $next($request);

        // Append canonical URL to the response headers
        $canonicalUrl = $request->url();
        $response->headers->set('Link', '<' . $canonicalUrl . '>; rel="canonical"');

        return $response;
    }
}
