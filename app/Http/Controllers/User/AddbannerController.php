<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Banneradd;
use Illuminate\Http\Request;

class AddbannerController extends Controller
{
   public function getBanners(Request $request)
{
    try {
        // Fetch banners where status is 1
        $banners = Banneradd::where('status', 1)->get(['id', 'banner']);
        
        // Transform banner paths to complete URLs and include banner id
        $baseUrl = $request->getSchemeAndHttpHost();
        $bannerUrls = $banners->map(function ($banner) use ($baseUrl) {
            return [
                'id' => $banner->id,
                'url' => $baseUrl . '/storage/' . $banner->banner
            ];
        });

        return response()->json(['banners' => $bannerUrls], 200);
    } catch (\Exception $e) {
        return response()->json(['error' => 'Failed to fetch banners.'], 500);
    }
}
public function increaseViewCount(Request $request, $addbannerId)
    {
        try {
            // Find the banner by its ID
            $banner = Banneradd::find($addbannerId);

            if (!$banner) {
                return response()->json(['error' => 'Banner not found.'], 404);
            }
            
            // Increase the view count
            $banner->increment('view_count');

            return response()->json(['message' => 'View count increased successfully.'], 200);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Failed to increase view count.'], 500);
        }
    }


}
