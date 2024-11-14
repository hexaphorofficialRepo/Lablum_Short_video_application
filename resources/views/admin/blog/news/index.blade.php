<x-backend.app-layout>
<style>
    .tag {
    display: inline-block;
    background-color: #007bff;
    color: white;
    padding: 5px 10px;
    border-radius: 5px;
    margin-right: 5px;
}

    </style>

    <div class="content">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="page-header-title">
                        <h4 class="pull-left page-title" style="font-size: 30px;"> News And Blog List </h4>
                        <ol class="breadcrumb pull-right">

                        </ol>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>



        <div class="row">
            <div class="col-md-12">
                <div class="container">
                    <div class="row">

                        <div class="col-md-6">
                            <div class="add-new-btn" style="padding: 16px;">
                                <a href="{{ route('admin.blog.create') }}" class="btn btn-primary"
                                    style="border-radius: 7px;"><i class=""></i>
                                    Add News And Blog</a>
                                <a href="#" class="btn btn-primary" style="border-radius: 7px;">Filter <i
                                        class="fas fa-chevron-down" style="margin-left: 5px;"></i></a>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="input-group" style="margin-top: 16px; float: right;">

                                <input type="text" class="form-control" placeholder="Search...">

                            </div>
                        </div>
                    </div>



                    <div class="table-responsive">
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>SN</th>
                                    <th>THUMBNAIL</th>
                                    <th>TITLE</th>
                                    <th>SLUG</th>
                               
                                    <th>CATEGORY</th>
                                    <th>TAGS</th>
                                    <th>META DESCRIPTION</th>
                                    <th>DESCRIPTION</th>
                                    <th> BLOG GALLERY </th>


                                    <th>EDIT</th>
                                    <th>DELETE</th>

                                </tr>
                            </thead>
                            @foreach($blogs as $blog)
                            <tbody>

                                <tr>


                                    <td>{{$loop->iteration}}</td>
                                    <td>
                                        <img style="max-width: 107px;
                                        border-radius: 11px;" src="{{ asset('storage/' . $blog->thumbnail) }}" alt="Thumbnail">
                                    </td>

                                    <td>{{$blog->title}}</td>
                                    <td>{{$blog->slug}}</td>
                                   
                                    
                                    <td>{{$blog->category->title}}</td>
                                    <td>
                                        @foreach(explode(',', $blog->tag) as $tag)
                                            <span class="tag">{{ $tag }}</span>
                                        @endforeach
                                    </td>
                                    <td>{{$blog->meta_description}}</td>
                                    <td>{!! $blog->description !!}</td>
                                    <td style="display: flex;">
                                        @php
                                            $images = explode(',', $blog->image1);
                                        @endphp
                                        @foreach ($images as $image)
                                            <img src="{{ asset('storage/' . trim($image)) }}" alt="Gallery Image" style="max-width: 100px;
                                            max-height: 100px;
                                            margin-right: 5px;
                                            padding: 2px;
                                            border-radius: 11px;">
                                        @endforeach
                                    </td>
                                    
                                    








                                    <td>
                                        <a class="btn btn-primary info-btn"  href="{{ route('admin.blog.edit', $blog->slug) }}"
                                            style="background-image: linear-gradient(352deg,#08af85,#3bd41d)!important;color:white;">
                                            <i class="fas fa-edit"></i>Edit
                                        </a>
                                    </td>
                                    <td>
                                        <a class="btn btn-secondary history-btn" href="#" data-toggle="modal" data-target="#deleteConfirmationModal"
                                        style="background-image: linear-gradient(352deg,#af0888,#131597)!important;color:white;">
                                         <i class="fas fa-trash-alt"></i> Delete
                                     </a>
                                     </td> 
                                </tr>

                                <!-- Repeat similar rows for other entries -->
                            </tbody>


                            <div class="modal fade" id="deleteConfirmationModal" tabindex="-1" role="dialog" aria-labelledby="deleteConfirmationModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="deleteConfirmationModalLabel">Confirm Deletion</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            Are you sure you want to delete this blog?
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                            <form id="deleteForm" action="{{ route('blogs.destroy', $blog->id) }}" method="POST" style="display: inline;">
                                                @csrf
                                                @method('DELETE')
                                                <button type="submit" class="btn btn-danger">Delete</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            @endforeach



                            <!-- Repeat similar rows for other entries -->

                            <!-- Repeat similar rows for other entries -->
                        </table>
                    </div>
                </div>
            </div>
        </div>


        <!-- Delete Confirmation Modal -->


    </div>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

    <!-- Script to show SweetAlert message -->
    <script>
        // Check if there is a success message flashed from controller
        let successMessage = '{{ session('success') }}';
        if (successMessage) {
            Swal.fire({
                icon: 'success',
                title: 'Success',
                text: successMessage,
                showConfirmButton: false,
                timer: 2000 // Close alert after 2 seconds
            });
        }
    </script>




</x-backend.app-layout>
