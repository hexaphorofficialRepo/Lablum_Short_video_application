
<div class="content-wrapper transition-all duration-150 xl:ltr:ml-[248px] xl:rtl:mr-[248px]" id="content_wrapper">
    <div class="page-content p-2">
        <div id="content_layout ">
            <div class="bg-blue p-3 m-2 rounded-md">
                @if (session()->has('message'))
                    <div class="alert alert-success" role="alert">{{ session('message') }}</div>
                @endif

                <div class="row">
                    <div class="col-md-6  text-center" style="font-weight: bold; font-size: 20px;">
                        <h3 class="mb-4 text-3xl font-extrabold text-gray-900 dark:text-white md:text-5xl lg:text-4xl"><span class="text-transparent bg-clip-text bg-gradient-to-r to-emerald-600 from-sky-400">Edit Post Category</span> </h3>
                    </div>




                </div>
                <div class="py-3">
                    <div class="col-md-6 mb-4">
                        <a href="{{route('admin.all.post.category')}}" class="btn btn-success btn-md float-end">

                            Show All Post Category
                        </a>
                    </div>

                    <form wire:submit.prevent="updateCategory" method="post" enctype="multipart/form-data"
                        class="grid grid-cols-12 gap-3">




                        <div class="col-span-6 md:col-span-6 mb-1">
                            <label>
                                <span>Category Title</span>
                                <input name="name" type="text"
                                    class="w-full px-2 py-2 bg-gray-100 border block mt-1.5 w-full rounded-md"
                                    wire:model="name" wire:keyup="generateslug">
                            </label>
                            @error('name')
                                <span class="text-red-700 text-sm">{{ $message }}</span>
                            @enderror
                        </div>

                        <div class="col-span-6 md:col-span-6 mb-1">
                            <label>
                                <label for="slug" class="form-label">Category slug</label>
                                <input type="text" name="slug" class="form-control"
                                    placeholder="Enter Category slug" wire:model="slug" readonly>
                                @error('slug')
                                    <p class="text-danger">{{ $message }}</p>
                                @enderror
                            </label>
                        </div>
                        <div class="col-span-12 md:col-span-6 mb-1">
                            <label>
                                <span>Image</span>



                                <!-- Input for choosing a new image -->
                                <input type="file" class="form-control" wire:model="image">
                           
                                <hr>
                                <img src="{{ asset($category->image) }}" alt="Current Image" class="mb-1 mt-1 mx-auto my-auto" style="max-width: 70px; max-height: 70px; display: block;">

                                <hr>
                               
                                
                    
                                @error('image')
                                    <p class="text-danger">{{ $message }}</p>
                                @enderror





                            </label>
                            @error('image')
                                <span class="text-red-700 text-sm">{{ $message }}</span>
                            @enderror
                        </div>





                        <div class="col-span-12">
                            <button type="submit"
                                class="bg-green-600 text-white rounded px-4 py-1.5 mt-1.5 shadow-md font-bold">
                                Submit</button>
                        </div>
                    </form>

                </div>
            </div>







        </div>
    </div>
</div>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const dropdownButton = document.getElementById('dropdownActionButton');
        const dropdownMenu = document.getElementById('dropdownAction');

        dropdownButton.addEventListener('click', function() {
            dropdownMenu.classList.toggle('hidden');
        });
    });
</script>
