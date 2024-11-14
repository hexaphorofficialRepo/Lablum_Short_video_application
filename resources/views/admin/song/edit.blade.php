<x-backend.app-layout>


    <div class="content">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="page-header-title">
                        <h4 class="pull-left page-title">Form Validation</h4>
                        <ol class="breadcrumb pull-right">
                            <li><a href="#">Xadmino</a></li>
                            <li><a href="#">Forms</a></li>
                            <li class="active">Form Validation</li>
                        </ol>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
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
                                        <form class="" action="{{route('admin.song.update',$song)}}" enctype="multipart/form-data" method="POST">
                                            @csrf
                                        
                                            <div class="form-group">
                                                <label>Song Banner Image</label>
                                                <input type="file" name="image" class="form-control" placeholder="Song Banner" onchange="previewImage(event)" />
                                                <hr>
                                                
                                                <div id="imagePreview">
                                                    @if ($song->image)
                                                        <img src="{{ asset('storage/song_images/' . $song->image) }}" style="max-width: 236px;
                                                        max-height: 243px;
                                                        border: solid 2px #03a9f4;
                                                        border-radius: 33px;" >
                                                    @endif
                                                </div>
                                                <hr>
                                            </div>
                                                                            
                                            <!-- Other form fields -->
                                                                            
                                            <div class="form-group">
                                                <label>Song Title</label>
                                                <input type="text" name="title" class="form-control" placeholder="Song Title" value="{{$song->title}}" />
                                            </div>
                                                                            
                                            <div class="form-group">
                                                <label>Singer</label>
                                                <div>
                                                    <input name="singer" value="{{$song->singer}}" type="text" class="form-control"  placeholder="Singer Name" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label>Current Song</label>
                                                @if ($song->music)
                                                    <div>
                                                        <audio controls style="height: 42px; color: blue;">
                                                            <source src="{{ asset('storage/song/' . $song->music) }}" type="audio/mpeg">
                                                            Your browser does not support the audio element.
                                                        </audio>
                                                    </div>
                                                @else
                                                    <p>No song uploaded yet.</p>
                                                @endif
                                            </div>
                                            
                                            <div class="form-group">
                                                <label>Song File</label>
                                                <div id="uploadSection">
                                                    <input name="music" id="musicFile" type="file" class="form-control" onchange="previewAudio(event)" accept=".mp3" />
                                                </div>
                                            </div>
                                            
                                            <!-- Preview Audio -->
                                            <div id="audioPreviewSection" @if($song->music) style="display: none;" @endif>
                                                <audio controls id="audioPreview" style="display: none;"></audio>
                                                <button onclick="cancelUpload()" class="btn btn-danger">Remove</button>
                                            </div>
                                            
                                            
                                            <div class="form-group">
                                                <div>
                                                    <button type="submit" class="btn btn-primary waves-effect waves-light">Submit</button>
                                                    <a href="{{route('admin.song.index')}}" type="reset" class="btn btn-default waves-effect m-l-5">Cancel</a>
                                                </div>
                                            </div>
                                        </form>
                                                                                
                                        <script>
                                            function previewImage(event) {
                                                const fileInput = event.target;
                                                const files = fileInput.files;
                                                
                                                if (files.length > 0) {
                                                    const reader = new FileReader();
                                                    reader.onload = function (e) {
                                                        const imagePreview = document.getElementById('imagePreview');
                                                        // Replace existing image if exists
                                                        if (imagePreview.querySelector('img')) {
                                                            imagePreview.querySelector('img').remove();
                                                        }
                                                        const img = document.createElement('img');
                                                        img.src = e.target.result;
                                                        img.style.maxWidth = '200px';
                                                        img.style.maxHeight = '200px';
                                                        imagePreview.appendChild(img);
                                                    }
                                                    reader.readAsDataURL(files[0]);
                                                }
                                            }
                                        
                                            function previewAudio(event) {
                                                const fileInput = event.target;
                                                const files = fileInput.files;
                                                
                                                if (files.length > 0) {
                                                    const reader = new FileReader();
                                                    reader.onload = function (e) {
                                                        const audioPreview = document.getElementById('audioPreview');
                                                        const audioPreviewSection = document.getElementById('audioPreviewSection');
                                                        const uploadSection = document.getElementById('uploadSection');
                                                        
                                                        audioPreview.src = e.target.result;
                                                        audioPreview.style.display = 'block';
                                                        uploadSection.style.display = 'none';
                                                        audioPreviewSection.style.display = 'block';
                                                    }
                                                    reader.readAsDataURL(files[0]);
                                                }
                                            }
                                        
                                            function cancelUpload() {
                                                const uploadSection = document.getElementById('uploadSection');
                                                const audioPreviewSection = document.getElementById('audioPreviewSection');
                                                
                                                // Clear the file input field
                                                document.getElementById('musicFile').value = '';
                                        
                                                const audioPreview = document.getElementById('audioPreview');
                                                audioPreview.style.display = 'none';
                                                audioPreview.pause(); // Pause the audio playback
                                                audioPreview.currentTime = 0; // Reset audio playback to the beginning
                                        
                                                uploadSection.style.display = 'block';
                                                audioPreviewSection.style.display = 'none';
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
</x-backend.app-layout>
