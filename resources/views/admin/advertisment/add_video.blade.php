<x-backend.app-layout>

    <style>
        .toggle-switch {
            position: relative;
            display: inline-block;
            width: 60px;
            height: 34px;
        }

        .toggle-switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }

        .toggle-slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            -webkit-transition: .4s;
            transition: .4s;
            border-radius: 34px;
            background: red;
        }

        .toggle-slider:before {
            position: absolute;
            content: "";
            height: 26px;
            width: 26px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            -webkit-transition: .4s;
            transition: .4s;
            border-radius: 50%;
        }

        input:checked+.toggle-slider {
            background-color: #2196F3;
        }

        input:focus+.toggle-slider {
            box-shadow: 0 0 1px #2196F3;
        }

        input:checked+.toggle-slider:before {
            -webkit-transform: translateX(26px);
            -ms-transform: translateX(26px);
            transform: translateX(26px);
        }




        /* .add-new-btn {
        display: flex;
        justify-content: flex-end;
      } */
    </style>

    <div class="content">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="page-header-title">
                        <h4 class="pull-left page-title" style="font-size: 30px;"> Advertisement Videos</h4>
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
                                <a href="" class="btn btn-primary" style="border-radius: 7px;"><i
                                        class=""></i>
                                    Life Time</a>
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
                                    <th>VIDEO</th>
                                    <th>PLAN ADD COUNT</th>
                                    <th>PLAN DAYS COUNT</th>
                                    <th>FACEBOOK LINK</th>
                                     <th>INSTAGRAM LINK</th>
                                    <th>WEBSITE LINK</th>
                                    <th>ACTIVE</th>

                                  
                                    <th>DELETE</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($videos as $video)
                                    <tr>


                                        <td>{{ $loop->iteration }}</td>
                                        <td>
                                            <video id="myVideo" height="100px" width="100px" alt="app"
           controls="" class="mx-auto"
           style="box-shadow: rgba(105, 103, 103, 0) 0px 5px 15px 0px; border: 2px solid rgb(255, 255, 255); border-radius: 10px; object-fit: cover; display: block;">
        <!-- Add your video source here -->
        <source src="{{ Storage::disk('s3')->url('add_videos/' . $video->video) }}">
    </video>



                                        </td>
                                        <td>{{ $video->addplan->add_count }}</td>
                                      
                                        <td>{{ $video->addplan->days_count }}</td>
                                        <td>{{ $video->fb_link }}</td>
                                        <td>{{ $video->insta_link }}</td>
                                        <td>{{ $video->web_link }}</td>


                                       <td>
                                            <label class="toggle-switch">
                                                <input type="checkbox" class="feature-toggle"
                                                    data-add-id="{{ $video->id }}"
                                                    {{ $video->status ? 'checked' : '' }}>
                                                <span class="toggle-slider"></span>
                                            </label>
                                        </td>






                                        
                                        <td> <a class="btn btn-secondary history-btn"
                                                style="background-image: linear-gradient(352deg,#af0888,#131597)!important;color:white;"
                                              href="{{route('admin.add.video.delete',['videoId' => $video->id])}}">
                                                <i class="fas fa-trash-alt"></i>Delete
                                            </a>
                                        </td>
                                    </tr>
                                @endforeach
                                <!-- Repeat similar rows for other entries -->
                            </tbody>



                            <!-- Repeat similar rows for other entries -->

                            <!-- Repeat similar rows for other entries -->
                        </table>
                    </div>
                </div>
            </div>
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


    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const featureToggles = document.querySelectorAll(".feature-toggle");

            featureToggles.forEach((toggle) => {
                toggle.addEventListener("change", function() {
                    const videoId = toggle.getAttribute("data-add-id");
                    const status = toggle.checked ? 1 : 0;

                    // Send the feature update to the backend using AJAX or any other method
                    fetch(`/update-video-status/${videoId}`, {
                            method: "POST",
                            headers: {
                                "Content-Type": "application/json",
                                "X-CSRF-TOKEN": document.querySelector(
                                    'meta[name="csrf-token"]').content,
                            },
                            body: JSON.stringify({
                                status: status
                            }),
                        })
                        .then((response) => response.json())
                        .then((data) => {
                            // Handle the response from the backend
                            if (data.message) {
                                // Show success message using SweetAlert
                                swal({
                                    title: "Success!",
                                    text: data.message,
                                    icon: "success",
                                });
                            } else {
                                // Show error message using SweetAlert
                                swal({
                                    title: "Error!",
                                    text: "Failed to update user active status",
                                    icon: "error",
                                });
                            }
                        })
                        .catch((error) => {
                            console.error("Error:", error);
                            // Show error message using SweetAlert
                            swal({
                                title: "Error!",
                                text: "Failed to update user active status",
                                icon: "error",
                            });
                        });
                });
            });
        });
    </script>


</x-backend.app-layout>
