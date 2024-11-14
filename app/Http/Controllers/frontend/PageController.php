<?php

namespace App\Http\Controllers\frontend;

use App\Http\Controllers\admin\BlogController;
use App\Http\Controllers\Controller;
use App\Models\Addcategory;
use App\Models\Blog;
use App\Models\Blogcategory;
use App\Models\Category;
use App\Models\Term;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class PageController extends Controller
{
    public function home(){
      $addcategories  = Addcategory::latest()->get();
        $blogs = Blog::latest()->take(3)->get();
        return view('frontend.home',compact('blogs','addcategories'));
    }
    public function aboutUs(){
        return view('frontend.about');
    }

    public function blogList(){
        $blogs = Blog::latest()->get();
        return view('frontend.blog',compact('blogs'));
    }

    public function blogDetails($slug){
    
        $blog = Blog::where('slug', $slug)->firstOrFail();
        
       
        $similarBlogs = Blog::where('category_id', $blog->category_id)
                            ->where('id', '!=', $blog->id) 
                            ->limit(5) 
                            ->get();
                            $blogCategories = Blogcategory::latest()->get();
        
        return view('frontend.blog_details', compact('blog', 'similarBlogs','blogCategories'));
    }

    public function blogsByCategory($slug){
   
        $category = Blogcategory::where('slug', $slug)->firstOrFail();
        
        // Fetch blogs associated with the category
        $blogs = $category->Blogs()->latest()->get();
     
        
        return view('frontend.blog', compact('category', 'blogs'));
    }


  public function contactUs(){
    return view('frontend.contact');
  }

  public function viewTerms()
  {
      // Retrieve the first term where type is "terms"
      $term = Term::where('type', 'terms')->first();
      
      return view('frontend.terms', compact('term'));
  }
  public function viewAddpolicy()
  {
      // Retrieve the first term where type is "terms"
      $term = Term::where('type', 'advertisment')->first();
      
      return view('frontend.add_policy', compact('term'));
  }
  public function viewOfficialpolicy(){
    $term = Term::where('type', 'official')->first();
    return view('frontend.official', compact('term'));
  }
  public function viewprivacypolicies(){
    $term = Term::where('type', 'privacy')->first();
    return view('frontend.privacy', compact('term'));
  }
  public function viewcontentCreator(){
    $term = Term::where('type', 'viewer')->first();
    return view('frontend.content_creator', compact('term'));
  }
  public function viewViewerpolicies(){
    $term = Term::where('type', 'creator')->first();
    return view('frontend.viewer', compact('term'));
  }
  
  public function payment_success(){
      return view('payment_success');
  }
   
    
    
}
