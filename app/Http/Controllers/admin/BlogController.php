<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Blog;
use App\Models\Blogcategory;
use Illuminate\Http\Request;

class BlogController extends Controller
{


    public function index()
    {
        $categories = Blogcategory::latest()->get();
        return view('admin.blog.category.index', compact('categories'));
    }
    public function create()
    {
        return view('admin.blog.category.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required',

        ]);

        $category = new Blogcategory();
        $category->title = $request->input('title');
        $category->slug = $request->input('slug');




        if ($category->save()) {
            return redirect()->route('admin.blog.category.index')->with('success', 'Category Created!!');
        }

        return redirect()->route('admin.blog.category.index')->with(['error' => 'Unable to add Category']);
    }


    public function edit(Blogcategory $category)
    {
        return view('admin.blog.category.edit', compact('category'));

    }
    public function update(Request $request, Blogcategory $category)
    {
        $request->validate([
            'title' => 'required',
        ]);

        $category->title = $request->input('title');
        $category->slug = $request->input('slug');

        if ($category->save()) {
            return redirect()->route('admin.blog.category.index')->with('success', 'Category Updated!');
        }

        return redirect()->route('admin.blog.category.edit', $category)->with('error', 'Unable to update Category');
    }



    public function createBlog()
    {
        $categories = Blogcategory::all();
        return view('admin.blog.news.create', compact('categories'));
    }
    public function storeBlog(Request $request)
    {


        try {
            // Validate the request data
            $validatedData = $request->validate([
                'title' => 'required|string|max:255',
                'slug' => 'required',
                'category_id' => 'required',
                'thumbnail' => 'required|image|mimes:jpeg,png,jpg,gif',
                'images.*' => 'nullable|image|mimes:jpeg,png,jpg,gif',
                'tags' => 'required',


                'meta_description' => 'required|string',
                'description' => 'required|string',
            ]);

            // Handle Thumbnail Upload


            // Create the blog entry
            $blog = new Blog();
            $blog->title = $validatedData['title'];
            $blog->slug = $validatedData['slug'];
            $blog->category_id = $validatedData['category_id'];

            $blog->tag = $request->input('tags_hidden');
            $blog->meta_description = $validatedData['meta_description'];
            $blog->description = $validatedData['description'];


            if ($request->hasFile('images')) {
                $blogGallery = [];
                foreach ($request->file('images') as $file) {
                    $path = $file->store('gallery', 'public');
                    $blogGallery[] = $path;
                }
                $blog->image1 = implode(',', $blogGallery);
            }

            // Process and store personal documents
            if ($request->hasFile('thumbnail')) {
                $thumbnailPath = $request->file('thumbnail')->store('thumbnails', 'public');
                $blog->thumbnail = $thumbnailPath;
            }
            

            $blog->save();

            // Redirect with success message
            return redirect()->route('admin.blog.index')->with('success', 'Blog created successfully');
        } catch (\Exception $e) {
            // Log the error
            \Log::error('Error saving blog: ' . $e->getMessage());

            // Return with error message and old input
            return redirect()->back()->withInput()->with('error', 'Error saving blog: ' . $e->getMessage());
        }
    }


    public function blogIndex()
    {
        $blogs = Blog::latest()->get();
        return view('admin.blog.news.index', compact('blogs'));

    }

    public function editBlog($slug)
    {
        // Find the blog entry by slug
        $blog = Blog::where('slug', $slug)->firstOrFail();

        // Retrieve categories for the dropdown
        $categories = Blogcategory::all();

        return view('admin.blog.news.edit', compact('blog', 'categories'));
    }
    public function updateBlog(Request $request, $slug)
    {
        try {
            // Validate the request data
            $validatedData = $request->validate([
                'title' => 'required|string|max:255',
                'slug' => 'required',
                'category_id' => 'required',
                'thumbnail' => 'nullable|image|mimes:jpeg,png,jpg,gif',
                'images.*' => 'nullable|image|mimes:jpeg,png,jpg,gif',
                'tags' => 'required',
                'meta_description' => 'required|string',
                'description' => 'required|string',
            ]);

            // Find the blog entry by slug
            $blog = Blog::where('slug', $slug)->firstOrFail();

            // Update the blog entry
            $blog->title = $validatedData['title'];
            $blog->slug = $validatedData['slug'];
            $blog->category_id = $validatedData['category_id'];
            $blog->tag = $request->input('tags_hidden');
            $blog->meta_description = $validatedData['meta_description'];
            $blog->description = $validatedData['description'];

            // Handle Thumbnail Upload if provided
            if ($request->hasFile('thumbnail')) {
                $thumbnailPath = $request->file('thumbnail')->store('thumbnails', 'public');
                $blog->thumbnail = $thumbnailPath;
            }
            

            // Handle Gallery Images Upload if provided
            if ($request->hasFile('images')) {
                $galleryImagesPaths = [];
                foreach ($request->file('images') as $image) {
                    $galleryImagesPaths[] = $image->store('gallery');
                }
                $blog->image1 = implode(',', $galleryImagesPaths); // Save gallery images paths separated by comma
            }

            // Save the changes
            $blog->save();

            // Redirect with success message
            return redirect()->route('admin.blog.index')->with('success', 'Blog updated successfully');
        } catch (\Exception $e) {
            // Log the error
            \Log::error('Error updating blog: ' . $e->getMessage());

            // Return with error message and old input
            return redirect()->back()->withInput()->with('error', 'Error updating blog: ' . $e->getMessage());
        }
    }

    public function destroy($id)
    {
        // Find the blog entry by ID
        $blog = Blog::findOrFail($id);

        // Perform authorization checks here if needed

        // Delete the blog entry
        $blog->delete();

        return redirect()->route('admin.blog.index')->with('success', 'Blog deleted successfully.');
    }



}
