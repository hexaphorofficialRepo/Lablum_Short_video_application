<x-backend.app-layout>


    <div class="content">
        <div class="container">
           
            <div class="row">
                <div class="col-sm-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Add New #Hastag </h3>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-sm-12 col-xs-12">
                                    <h3 class="header-title m-t-0"><small>Create #Hastag Here </small></h3>
                                    <div class="m-t-20">
                                        <form class="" action="{{route('admin.category.store')}}" enctype="multipart/form-data" method="POST">
                                            @csrf

                                            <div class="form-group">
                                                <label>#Hashtag Title</label>
                                                <input type="text" name="title" class="form-control" placeholder="#Hashtag Tile"  />
                                              
                                            </div>
                                        
                                            <div class="form-group">
                                                <label>#Hashtag</label>
                                                <textarea type="text" name="name" id="categoryName" class="form-control" placeholder="Place #Hashtag Here" ></textarea>
                                            </div>
                                            
                                            
                                            
                                            

                                            
                                           
                                            
                                        

                                            
                                         
                                            
                                         
                                           
                                            
                                           
                                            

                                        
                                            <div class="form-group">
                                                <div>
                                                    <button type="submit" class="btn btn-primary waves-effect waves-light">Submit</button>
                                                    <a href="{{route('admin.category.index')}}" type="reset" class="btn btn-default waves-effect m-l-5">Cancel</a>
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

{{-- <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        swal("Success", "{{ session('success') }}", "success");
    });
</script> --}}
    
</x-backend.app-layout>
