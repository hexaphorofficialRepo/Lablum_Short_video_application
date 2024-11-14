<x-add.app-layout>
<style>

.status-badge {
    display: inline-block;
    padding: 5px 10px;
    border-radius: 5px;
    color: white;
}

.inactive {
    background-color: red;
}

.active {
    background-color: green;
}

    </style>

    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="add-new-btn" style="padding: 16px;">
                    <!-- Button trigger modal -->
                    <a type="button" href="{{route('add.add.video')}}" class="btn btn-primary" style="border-radius: 7px;"
                       >
                        <i class=""></i> + New
                </a>
                </div>
            </div>
            <div class="col-md-6">
                <!-- <div class="input-group" style="margin-top: 16px; float: right;">
                    <input type="text" class="form-control" placeholder="Search...">
                </div> -->
            </div>
        </div>

      


        <div class="table-responsive">
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>SN</th>
                        <th>VIDEO</th>
                     
                        <th>Website URL</th>
                        <th>Facebook URL</th>
                        <th>Instagram URL</th>
                         <th>Advertisment Type</th>
                      
                        <th>Active</th>
                    </tr>
                </thead>

                @foreach($videos as $video)
                <tbody>
                    <tr>
                        <td>{{$loop->iteration}}</td>
                        <td>
                            <!-- Add the responsive image here -->
                            <video id="myVideo" height="100px" width="100px" alt="app"
           controls="" class="mx-auto"
           style="box-shadow: rgba(105, 103, 103, 0) 0px 5px 15px 0px; border: 2px solid rgb(255, 255, 255); border-radius: 10px; object-fit: cover; display: block;">
        <!-- Add your video source here -->
        <source src="{{ Storage::disk('s3')->url('add_videos/' . $video->video) }}">
    </video>
                        </td>
                      
                        <td>{{$video->web_link}}</td>
                        <td>{{$video->fb_link}}</td>
                        <td>{{$video->insta_link}}</td>
                          <td>{{$video->video_type}}</td>
                      
                        <td>
                            <span class="status-badge {{ $video->status == 0 ? 'inactive' : 'active' }}">
                                {{ $video->status == 0 ? 'Please Wait For Video Verification' : 'Active Now' }}
                            </span>
                        </td>
                        
                        

                    </tr>
                    <!-- Repeat similar rows for other entries -->
                </tbody>
                @endforeach
              
                <!-- Repeat similar rows for other entries -->
            </table>
        </div>







    </div>


    <script>
        document.addEventListener("DOMContentLoaded", function() {
            var video = document.getElementById("myVideo");

            // Toggle play/pause when the video is clicked
            video.addEventListener("click", function() {
                if (video.paused) {
                    video.play();
                } else {
                    video.pause();
                }
            });
        });
    </script>
</x-add.app-layout>