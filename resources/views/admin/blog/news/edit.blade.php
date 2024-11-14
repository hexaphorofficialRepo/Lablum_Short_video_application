<x-backend.app-layout>


    <!-- Include jQuery (example CDN) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Include Summernote CSS and JavaScript (example CDN) -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet"
        style="importance: high !important;">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"
        style="importance: high !important;"></script>

    <!-- Your HTML code -->



    <style>
        .tag-close {
            display: none;
        }
        .tag-item {
            /* Add your tag styling here */
            background-color: #3490dc;
            color: #ffffff;
            padding: 5px 10px;
            margin: 3px;
            border-radius: 5px;
            display: inline-block;
        }

        /* Style for the delete icon in tags */
        .tag-item span {
            cursor: pointer;
            margin-left: 5px;
            color: #ffffff;
        }
    </style>


    <div class="content">
        <div class="container">

            <div class="row">
                <div class="col-sm-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Add News And Blog</h3>
                        </div>
                        <div class="panel-body">

                            <h3 class="header-title m-t-0"><small>Update News And Blog </small></h3>
                            <div class="m-t-20">
                                <form class="" id="blogForm" action="{{ route('admin.blog.update',$blog->slug) }}"
                                    enctype="multipart/form-data" method="POST">
                                    @csrf
                                    <div class="row">
                                        <div class="col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Blog Title</label>
                                                <input type="text" class="form-control" id="title" name="title"
                                                    placeholder="Blog Title" value="{{$blog->title}}">
                                                @error('title')
                                                    <div class="error-message" style="color: red;">{{ $message }}</div>
                                                @enderror
                                            </div>
                                        </div>

                                        <!-- Slug Field -->
                                        <div class="col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Slug</label>
                                                <input type="text" class="form-control" id="slug" name="slug"
                                                    placeholder="Auto-generated Slug" readonly
                                                    value="{{$blog->slug}}">
                                            </div>
                                        </div>

                                        <script>
                                            // Get the title and slug input elements
                                            const titleInput = document.getElementById('title');
                                            const slugInput = document.getElementById('slug');

                                            // Listen for input events on the title input
                                            titleInput.addEventListener('input', function() {
                                                // Generate slug from the title value
                                                const slug = generateSlug(this.value);

                                                // Update the value of the slug input
                                                slugInput.value = slug;
                                            });

                                            // Function to generate slug from title
                                            function generateSlug(title) {
                                                return title.trim().toLowerCase().replace(/\s+/g, '-');
                                            }
                                        </script>




                                        <div class="col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Blog Category</label>
                                                <select type="text" name="category_id" id="category"
                                                    class="form-control" placeholder="Blog Category">
                                                    <option value=""> Select Category</option>
                                                    @foreach ($categories as $category)
                                                        <option value="{{ $category->id }}"
                                                            {{  $blog->category_id ? 'selected' : '' }}>
                                                            {{ $category->title }}</option>
                                                    @endforeach
                                                </select>
                                                @error('category_id')
                                                    <div class="error-message" style="color: red;">{{ $message }}</div>
                                                @enderror
                                            </div>
                                        </div>


                                        <!-- Blog Tags Field -->
                                        <div class="col-sm-6 col-xs-12">
                                            <div class="form-group">
                                            <label>
                                                <span>Blog Tags</span>
                                               
                                                    <input id="tagTextarea" name="tags[]" class="form-control"
                                                        rows="3">
                                                    <div id="tag-container"></div>
                                                    <!-- Add the hidden input field to store tags -->
                                                    <input type="hidden" name="tags_hidden" id="tagsHiddenInput">
                                        
                                            </label>
                                            @error('tags')
                                                <span class="text-red-700 text-sm">{{ $message }}</span>
                                            @enderror
                                            </div>
                                        </div>
                                        
                                        <script>
                                            document.addEventListener("DOMContentLoaded", function() {
                                                var tagContainer = document.getElementById('tag-container');
                                                var textarea = document.getElementById('tagTextarea');
                                                var tagsHiddenInput = document.getElementById('tagsHiddenInput');
                                        
                                                // Split the tags provided by $blog->tag by commas and add each tag to the tag container
                                                var tagsArray = {!! json_encode(explode(',', $blog->tag)) !!};
                                                tagsArray.forEach(function(tag) {
                                                    addTag(tag);
                                                });
                                        
                                                textarea.addEventListener('keypress', function(event) {
                                                    if (event.key === 'Enter') {
                                                        event.preventDefault();
                                                        addTag(textarea.value.trim());
                                                        textarea.value = '';
                                                    }
                                                    updateHiddenInput();
                                                });
                                        
                                                function addTag(tagText) {
                                                    if (tagText.trim() !== "") {
                                                        var tagElement = document.createElement('div');
                                                        tagElement.className =
                                                            'tag-item inline-block bg-blue-500 text-white px-2 py-1 rounded-full mr-2 mb-2';
                                                        tagElement.textContent = tagText;
                                                        tagElement.innerHTML += ' <span class="cursor-pointer ml-1" onclick="removeTag(this)">✖</span>';
                                                        tagContainer.appendChild(tagElement);
                                                    }
                                                }
                                        
                                                tagContainer.addEventListener('click', function(event) {
                                                    if (event.target.tagName === 'SPAN' && event.target.classList.contains('cursor-pointer')) {
                                                        removeTag(event.target.parentNode);
                                                    }
                                                    updateHiddenInput();
                                                });
                                        
                                                function removeTag(tagElement) {
                                                    tagContainer.removeChild(tagElement);
                                                }
                                        
                                                function updateHiddenInput() {
                                                    var tags = Array.from(tagContainer.children)
                                                        .map(function(tagElement) {
                                                            // Extract only the tag text without the remove button
                                                            return tagElement.textContent.trim().replace(/\s+\S*$/, ''); // Remove last word (remove button)
                                                        })
                                                        .filter(Boolean); // Use filter to remove falsy values, including null
                                        
                                                    // Update the value of the hidden input field
                                                    tagsHiddenInput.value = tags.join(',');
                                                }
                                            });
                                        </script>
                                        

                                        <div class="col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Blog Thumbnail</label>
                                                <input type="file" class="form-control" id="thumbnail" name="thumbnail" placeholder="Upload Thumbnail Image">
                                                <div class="error-message" id="ThumbnailError" style="color: red;"></div>
                                            </div>
                                            <hr>
                                            <img id="thumbnail-preview" src="{{ $blog->thumbnail ? asset('storage/' . $blog->thumbnail) : '#' }}" alt="Thumbnail Preview"
                                                style="max-width: 150px; height: 150px; border-radius: 50px; {{ $blog->thumbnail ? '' : 'display: none;' }}">
                                            <hr>
                                        </div>
                                        
                                        <script>
                                            document.getElementById('thumbnail').addEventListener('change', function() {
                                                const file = this.files[0];
                                                const thumbnailPreview = document.getElementById('thumbnail-preview');
                                        
                                                if (file) {
                                                    const reader = new FileReader();
                                        
                                                    reader.onload = function(e) {
                                                        thumbnailPreview.src = e.target.result;
                                                        thumbnailPreview.style.display = 'block';
                                                    }
                                        
                                                    reader.readAsDataURL(file);
                                                } else {
                                                    thumbnailPreview.src = '{{ $blog->thumbnail ? asset('storage/' . $blog->thumbnail) : '#' }}';
                                                    thumbnailPreview.style.display = '{{ $blog->thumbnail ? 'block' : 'none' }}';
                                                }
                                            });
                                        </script>
                                        


                                        <div class="col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Blog Gallery Images</label>
                                                <input type="file" class="form-control" id="image1" name="images[]" multiple placeholder="Upload Gallery Images">
                                                <div class="error-message" id="GalleryError" style="color: red;"></div>
                                            </div>
                                            <hr>
                                            <div id="gallery-preview">
                                                @foreach (explode(',', $blog->image1) as $image)
                                                    <img src="{{ asset('storage/' . trim($image)) }}" alt="Gallery Image" style="max-width: 150px; height: 150px; padding: 20px; border-radius: 30px; margin-right: 5px;">
                                                @endforeach
                                            </div>
                                            <hr>
                                        </div>
                                        
                                        <script>
                                            document.getElementById('image1').addEventListener('change', function() {
                                                const files = this.files;
                                                const galleryPreview = document.getElementById('gallery-preview');
                                        
                                                // Clear previous previews
                                                galleryPreview.innerHTML = '';
                                        
                                                // Display previously stored images
                                                @foreach (explode(',', $blog->image1) as $image)
                                                    const prevImg = document.createElement('img');
                                                    prevImg.src = '{{ asset('storage/' . trim($image)) }}';
                                                    prevImg.style.maxWidth = '150px';
                                                    prevImg.style.height = '150px';
                                                    prevImg.style.padding = '20px';
                                                    prevImg.style.borderRadius = '30px';
                                                    galleryPreview.appendChild(prevImg);
                                                @endforeach
                                        
                                                if (files.length > 0) {
                                                    for (let i = 0; i < files.length; i++) {
                                                        const file = files[i];
                                                        const reader = new FileReader();
                                        
                                                        reader.onload = function(e) {
                                                            const img = document.createElement('img');
                                                            img.src = e.target.result;
                                                            img.style.maxWidth = '150px';
                                                            img.style.height = '150px';
                                                            img.style.padding = '20px';
                                                            img.style.borderRadius = '30px';
                                                            galleryPreview.appendChild(img);
                                                        }
                                        
                                                        reader.readAsDataURL(file);
                                                    }
                                                }
                                            });
                                        </script>
                                        

                                        <div class="col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label for="meta_description">Blog Meta Description</label>
                                                <textarea class="form-control" id="meta_description" name="meta_description" placeholder="Blog Meta Description">{{ $blog->meta_description }}</textarea>
                                                <div class="error-message" id="metaDescriptionError" style="color: red;"></div>
                                            </div>
                                        </div>
                                        





                                        <!-- Include CKEditor script -->
                                        <!-- Include CKEditor script -->
                                        <script src="https://cdn.ckeditor.com/ckeditor5/41.2.0/classic/ckeditor.js"></script>

                                        <div class="col-sm-12 col-xs-12">
                                            <div class="form-group">
                                                <label>Blog Description</label>
                                                <textarea name="description" class="form-control" id="description" style="height: 200px;"
                                                    placeholder="Write About Blog">{{ $blog->description }}</textarea>
                                                <div class="error-message" id="DescriptionError" style="color: red;">
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Your CKEditor initialization script -->
                                        <script>
                                            document.addEventListener("DOMContentLoaded", function(event) {
                                                ClassicEditor
                                                    .create(document.querySelector('#description'), {
                                                        // Configuration options here
                                                    })
                                                    .then(editor => {
                                                        console.log('Editor initialized successfully');
                                                    })
                                                    .catch(error => {
                                                        console.error('Error initializing editor:', error);
                                                    });
                                            });
                                        </script>









                                    </div>















                                    <div class="form-group" style="display: flex; justify-content: center">
                                        <div>
                                            <button
                                                style="    padding-left: 58px;
                                                    padding-right: 50px;
                                                    font-size: large; margin-right: 20px;
                                                }"
                                                type="submit"
                                                class="btn btn-primary waves-effect waves-light">Update</button>
                                            <a style="    padding-left: 58px;
                                                    padding-right: 50px;
                                                    font-size: large;
                                                }"
                                                href="{{ route('admin.blog.index') }}" type="reset"
                                                class="btn btn-default waves-effect m-l-5">Cancel</a>
                                        </div>
                                    </div>
                                </form>

                                <!-- Preview Image -->




                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <link href="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.css" rel="stylesheet">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Include jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script>
        // Validate form fields on input change
        document.addEventListener('input', function(event) {
            if (event.target.tagName.toLowerCase() === 'input' || event.target.tagName.toLowerCase() === 'select') {
                validateField(event.target);
            }
        });

        // Validate individual field
        function validateField(input) {
            let fieldName = input.getAttribute('name');
            let errorMessage = '';

            switch (fieldName) {
                case 'title':
                    errorMessage = validateTitle(input.value);
                    break;
                case 'category_id':
                    errorMessage = validateCategory(input.value);
                    break;
                case 'description':
                    errorMessage = validateDescription(input.value);
                    break;
                    // Add cases for other fields as needed

                default:
                    errorMessage = '';
            }

            let errorDiv = document.getElementById(`${fieldName}Error`);
            if (errorMessage) {
                errorDiv.innerText = errorMessage;
            } else {
                errorDiv.innerText = '';
            }
        }

        // Validation functions for each field
        function validateTitle(title) {
            if (!title.trim()) {
                return 'Title is required.';
            }
            return '';
        }

        function validateCategory(category) {
            if (!category.trim()) {
                return 'Category is required.';
            }
            return '';
        }

        function validateDescription(description) {
            if (!description.trim()) {
                return 'Description is required.';
            }
            return '';
        }

        // Add similar validation functions for other fields if needed
    </script>



</x-backend.app-layout>
