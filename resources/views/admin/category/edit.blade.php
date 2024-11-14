<x-backend.app-layout>

    <div class="content">
        <div class="container">

            <div class="row">
                <div class="col-sm-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Update #Hashtag</h3>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-sm-12 col-xs-12">
                                    <h3 class="header-title m-t-0"><small>Update Reel #Hashtag Here</small></h3>
                                    <div class="m-t-20">
                                        <form class="" action="{{route('admin.category.update',$category)}}" enctype="multipart/form-data"
                                            method="POST">
                                            @csrf

                                      

                                            <div class="form-group">
                                                <label>#Hashtag Title</label>
                                                <input type="text" name="title" value="{{ $category->title }}"
                                                    id="categoryTitle" class="form-control"
                                                    placeholder="Category Title" />
                                            </div>
                                            <div class="form-group">
                                                <label>#Hashtag</label>
                                                <input type="text" name="name" value="{{ $category->name }}"
                                                    id="categoryName" class="form-control"
                                                    placeholder="Category Title" />
                                            </div>
                                            
                                        
                                            
                                            

                                          

                                         

                                            <div class="form-group">
                                                <div>
                                                    <button type="submit"
                                                        class="btn btn-primary waves-effect waves-light">Update
                                                        #Hastag</button>
                                                    <a href="{{ route('admin.category.index') }}" type="reset"
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
        </div>
    </div>

    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            var form = document.getElementById('songForm');
            form.addEventListener('submit', function(event) {
                event.preventDefault();

                var songAddedSuccessfully = true;

                if (songAddedSuccessfully) {
                    swal("Success", "Song added successfully", "success").then(function() {
                        window.location.href = "{{ route('admin.song.index') }}";
                    });
                } else {
                    swal("Error", "Failed to add song", "error");
                }
            });
        });
    </script>

</x-backend.app-layout>
