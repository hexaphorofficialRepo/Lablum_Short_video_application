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
                        <h4 class="pull-left page-title" style="font-size: 30px;"> {{ $post->title }}</h4>
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

                        

                       
                    </div>



                    <div class="table-responsive">
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>SN</th>
                                    <th>VIDEO</th>
                                    <th>REPORTER PROFILE</th>
                                    <th>REPORTER ID</th>
                                    <th>REPORTER USERNAME</th>

                                    <th>REPORTED FULL NAME</th>
                                    <th>REPORTER MOBILE NUMBER</th>
                                    <th>REPORT REASON </th>

                                    <th>REPORTED DATE</th>
                                    <th>POST INFO</th>
                                    <th>WATCH LIST</th>

                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($postreports as $postreport)
                                    <tr>

                                        <td>{{ $loop->iteration }}</td>

                                        <td>
                                            <video id="myVideo" height="100px" width="100px" alt="app"
                                                controls="" class="mx-auto"
                                                style="box-shadow: rgba(105, 103, 103, 0) 0px 5px 15px 0px; border: 2px solid rgb(255, 255, 255); border-radius: 10px; object-fit: cover; display: block;">
                                                <!-- Add your video source here -->
                                                <source src="{{ asset("storage/post/{postreport->post->video}") }}">
                                                Your browser does not support the video tag.
                                            </video>



                                        </td>
                                        <td>
                                            <img id="userImage" height="100px" width="100px" alt="user-profile-pic"
                                                class="mx-auto"
                                                style="box-shadow: rgba(105, 103, 103, 0) 0px 5px 15px 0px; border: 2px solid rgb(255, 255, 255); border-radius: 40px; object-fit: contain; display: block;"
                                                src="{{ asset('storage/profile_pic/' . $postreport->user->user_id . '/' . $postreport->user->user_dp) }}">
                                        </td>
                                        <td> {{ $postreport->user->user_id }}</td>
                                        <td> {{ $postreport->user->username }}</td>
                                        <td>{{ $postreport->user->fname }} {{ $postreport->user->lname }}</td>

                                        <td>{{ $postreport->user->mobile }}</td>

                                        <td>{{ $postreport->created_at->diffForHumans() }}</td>
                                        <td>{{ $postreport->message}}</td>
                                        <td>
                                            <a href="{{route('admin.post.info',['post_id' => $post->id])}}" class="btn btn-primary info-btn"
                                                style="background:lightgreen; border-radius: 7px;">
                                                <i class="fas fa-info" style="margin-right: 5px;"></i> Info
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
                    const postId = toggle.getAttribute("data-post-id"); // Corrected variable name
                    const active = toggle.checked ? 1 : 0;

                    // Send the feature update to the backend using AJAX or any other method
                    fetch(`/update-post-is_active/${postId}`, {
                            method: "POST",
                            headers: {
                                "Content-Type": "application/json",
                                "X-CSRF-TOKEN": document.querySelector(
                                    'meta[name="csrf-token"]').content,
                            },
                            body: JSON.stringify({
                                active: active
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
