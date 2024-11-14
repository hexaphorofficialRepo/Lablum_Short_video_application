<x-backend.app-layout>


    <div class="content">
        <div class="container">
           
            <div class="row">
                <div class="col-sm-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Upload Song</h3>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-sm-12 col-xs-12">
                                    <h3 class="header-title m-t-0"><small>Upload New Song Here</small></h3>
                                    <div class="m-t-20">
                                        <form class="" action="{{route('admin.song.store')}}" enctype="multipart/form-data" method="POST">
                                            @csrf

                                            <div class="form-group">
                                                <label>Song Banner Image</label>
                                                <input type="file" name="image" class="form-control" placeholder="Song Banner" onchange="previewImage(event)" />
                                                <div id="imagePreview"></div>
                                            </div>
                                        
                                            <div class="form-group">
                                                <label>Song Title</label>
                                                <input type="text" name="title" class="form-control" placeholder="Song Title" />
                                            </div>
                                        
                                            <!-- Other form fields -->
                                        
                                            <div class="form-group">
                                                <label>Singer</label>
                                                <div>
                                                    <input name="singer" type="text" class="form-control"  placeholder="Singer Name" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label>Song File</label>
                                                <div id="uploadSection">
                                                    <input name="music" id="musicFile" type="file" class="form-control" onchange="previewAudio(event)" placeholder="Singer Name" accept=".mp3" />
                                                </div>
                                            </div>
                                            
                                            <!-- Preview Audio -->
                                            <div id="audioPreviewSection" style="display: none;">
                                                <audio controls id="audioPreview"></audio>
                                                <button onclick="cancelUpload()" class="btn btn-danger" style="    margin-top: -48px;
                                                margin-left: 21px;
                                                border-radius: 50px;">Remove</button>
                                            </div>
                                            
                                            <script>
                                                function previewAudio(event) {
                                                    const fileInput = event.target;
                                                    const files = fileInput.files;
                                                    
                                                    if (files.length > 0) {
                                                        const reader = new FileReader();
                                                        reader.onload = function (e) {
                                                            const audioPreview = document.getElementById('audioPreview');
                                                            const uploadSection = document.getElementById('uploadSection');
                                                            const audioPreviewSection = document.getElementById('audioPreviewSection');
                                                            
                                                            audioPreview.src = e.target.result;
                                                            audioPreviewSection.style.display = 'block';
                                                            uploadSection.style.display = 'none';
                                                        }
                                                        reader.readAsDataURL(files[0]);
                                                    }
                                                }
                                            
                                                function cancelUpload() {
                                                    const uploadSection = document.getElementById('uploadSection');
                                                    const audioPreviewSection = document.getElementById('audioPreviewSection');
                                                    
                                                    // Clear the file input field
                                                    document.getElementById('musicFile').value = '';
                                            
                                                    audioPreviewSection.style.display = 'none';
                                                    uploadSection.style.display = 'block';
                                                }
                                            </script>
                                            

                                        
                                            <div class="form-group">
                                                <div>
                                                    <button type="submit" class="btn btn-primary waves-effect waves-light">Submit</button>
                                                    <a href="{{route('admin.song.index')}}" type="reset" class="btn btn-default waves-effect m-l-5">Cancel</a>
                                                </div>
                                            </div>
                                        </form>
                                        
                                        <!-- Preview Image -->
                                     
                                        
                                        <script>
                                            function previewImage(event) {
                                                const fileInput = event.target;
                                                const files = fileInput.files;
                                                
                                                if (files.length > 0) {
                                                    const reader = new FileReader();
                                                    reader.onload = function (e) {
                                                        const imagePreview = document.getElementById('imagePreview');
                                                        imagePreview.innerHTML = `<img src="${e.target.result}" style="max-width: 200px; max-height: 200px;" />`;
                                                    }
                                                    reader.readAsDataURL(files[0]);
                                                }
                                            }
                                        </script>
                                        
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
