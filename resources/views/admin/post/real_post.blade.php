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
            background-color: #af54cd;
        }

        input:focus+.toggle-slider {
            box-shadow: 0 0 1px #af54cd;
        }

        input:checked+.toggle-slider:before {
            -webkit-transform: translateX(26px);
            -ms-transform: translateX(26px);
            transform: translateX(26px);
        }


        .pagination-container {
    margin-top: 20px; /* Add space between table and pagination */
    display: flex;
    justify-content: center; /* Center the pagination links */
}

.pagination-container .pagination {
    margin: 0;
}

.pagination-container .pagination .page-link {
    color: #fff;
    background-color:#df5785; /* Button background color */
    border-color:#df5785;
}

.pagination-container .pagination .page-link:hover {
    background-color:#af54cd; /* Button background color on hover */
}

.pagination-container .pagination .page-item.disabled .page-link {
    color: #6c757d; /* Disabled button text color */
    background-color: #e9ecef; /* Disabled button background color */
    border-color: #dee2e6;
}

.pagination-container .pagination .page-item.active .page-link {
    z-index: 3;
    color: #fff;
    background-color: #28a745; /* Active button background color */
    border-color: #28a745;
}

.pagination-container .pagination .page-item:first-child .page-link,
.pagination-container .pagination .page-item:last-child .page-link {
    border-radius: 5px; /* Rounded corners for first and last buttons */
}

.pagination-container .pagination .page-item .page-link {
    padding: 10px 15px; /* Button padding */
}

.pagination-container .pagination .page-item {
    display: inline-block;
}

.pagination-container .pagination .page-item a {
    text-decoration: none;
}

.pagination-container {
    margin-top: -20px; /* Add space between table and pagination */
    display: flex;
    justify-content: center; /* Center the pagination links */
}

.pagination-box {
    padding: 20px;
}

.pagination-box + .pagination-box {
    margin-left: 10px; /* Gap between the two boxes */
}

.page-link {
    display: inline-block;
    padding: 10px 20px; /* Button padding */
    color: #fff;
    background-color:#df5785; /* Button background color */
    border: none;
    border-radius: 5px; /* Rounded corners */
    text-decoration: none;
}

.page-link:hover {
    background-color:#af54cd;
    color: #fff
     /* Button background color on hover */
}

.page-link:disabled {
    cursor: not-allowed;
    background-color: #e9ecef; /* Disabled button background color */
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
                        <h4 class="pull-left page-title" style="font-size: 30px;">Real/Streaming Posts</h4>
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
                                {{-- <button id="downloadBtn" class="btn btn-primary" style="border-radius: 7px;">Download as
                                    Excel</button> --}}
                                <button id="filterBtn" class="btn btn-primary" style="border-radius: 7px;">Filter <i
                                        class="fas fa-chevron-down" style="margin-left: 5px;"></i></button>
                            </div>
                        </div>

                        <!-- Modal -->
                        <div id="filterModal" class="modal" style="display: none;">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                        <h4 class="modal-title">Filter Options</h4>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>

                                    <!-- Modal Body -->
                                    <div class="modal-body">
                                        <p><a
                                                href="{{ route('filter.post.date', ['date' => \Carbon\Carbon::today()->toDateString()]) }}">Today's
                                                Posts</a></p>
                                        <p><a href="#" id="dateRangeLink">Date Range</a></p>
                                        <div id="dateRangeInputs" style="display: none;">
                                            <input type="date" id="startDate">
                                            <input type="date" id="endDate">
                                            <button onclick="filterByDateRange()">Filter</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <script>
                            // Show modal when filter button is clicked
                            document.getElementById('filterBtn').addEventListener('click', function() {
                                document.getElementById('filterModal').style.display = 'block';
                            });

                            // Hide modal when close button is clicked
                            document.querySelectorAll('.close').forEach(function(el) {
                                el.addEventListener('click', function() {
                                    document.getElementById('filterModal').style.display = 'none';
                                });
                            });

                            // Show date range inputs when "Date Range" link is clicked
                            document.getElementById('dateRangeLink').addEventListener('click', function() {
                                document.getElementById('dateRangeInputs').style.display = 'block';
                            });

                            // Filter by date range when "Filter" button is clicked
                            function filterByDateRange() {
                                var startDate = document.getElementById('startDate').value;
                                var endDate = document.getElementById('endDate').value;
                                window.location.href = "{{ route('filter.post.date') }}?start_date=" + startDate + "&end_date=" +
                                    endDate;
                            }
                        </script>



                 





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
                                    <th>POST ID
                                    <th>VIDEO</th>
                                    <th>USER</th>
                                     <th>VIEW</th>
                                    <th>LIKE</th>
                                    <th>COMMENT</th>
                                    <th>SHARE</th>
                                    <th>TITLE</th>
                                    <th>DESCRIPTION</th>
                                    <th>POSTED DATE</th>
                                    <th>VIEW LIKE</th>
                                    <th>VIEW COMMENT</th>
                                    <th>WATCH LIST</th>
                                    <th>ACTIVE</th>
                                    <th>REPORTED POST</th>
                                    <th>POST INFO</th>

                                    {{-- <th>EDIT</th>
                                    <th>DELETE</th> --}}
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($posts as $post)
                                    <tr>


                                        <td>{{ $loop->iteration }}</td>
                                        <td>{{ $post->id }}</td>
                             
                                        <td>
                                            <video id="myVideo" height="100px" width="100px" alt="app"
                                                controls="" class="mx-auto"
                                                style="box-shadow: rgba(105, 103, 103, 0) 0px 5px 15px 0px; border: 2px solid rgb(255, 255, 255); border-radius: 10px; object-fit: cover; display: block;">
                                                <!-- Add your video source here -->
                                                <source  src="{{ Storage::disk('s3')->url($post->video) }}">
                                                Your browser does not support the video tag.
                                            </video>



                                        </td>
                                        <td>{{ $post->user->fname }} {{ $post->user->lname }}</td>
                                        {{-- <td>0</td> --}}
                                        <td>{{ $post->views()->count() }}</td>
                                        <td>{{ $post->likes()->count() }}</td>
                                        <td>{{ $post->comments()->count() }}</td>
                                        <td>{{ $post->shares()->count() }}</td>

                                        <td>{{ $post->title }}</td>
                                        <td>{{ $post->description }}</td>
                                        <td>{{ $post->created_at->diffForHumans() }}</td>
                                        <td>
                                            <a href="{{ route('admin.like.post', $post) }}"
                                                class="btn btn-primary info-btn"
                                                style="background:lightgreen; border-radius: 7px;">
                                                <i class="fas fa-thumbs-up"></i>
                                                View Like
                                            </a>
                                        </td>
                                        <td> <a href="{{ route('admin.comment.post', $post) }}"
                                                class="btn btn-primary info-btn"
                                                style="background:lightgreen; border-radius: 7px;">
                                                <i class="fas fa-comment-dots"></i> View Comment
                                            </a></td>
                                        <td> <a href="{{ route('admin.post.watchlist', $post) }}"
                                                class="btn btn-primary info-btn"
                                                style="background:lightgreen; border-radius: 7px;">
                                                <i class="fas fa-eye"></i>
                                                Watch List
                                            </a></td>
                                            <td>
                                                <label class="toggle-switch">
                                                    <input type="checkbox" class="feature-toggle"
                                                        data-post-id="{{ $post->id }}"
                                                        {{ $post->active ? 'checked' : '' }}>
                                                    <span class="toggle-slider"></span>
                                                </label>
                                            </td>



                                      
                                        <td> <a href="{{ route('admin.reported.post',['post_id'=>$post->id ]) }}"
                                                class="btn btn-primary info-btn"
                                                style="background:lightgreen; border-radius: 7px;">
                                                <i class="fas fa-eye"></i>
                                                Reported
                                            </a></td>
                                         

                                                <td>
                                                    <a href="{{route('admin.post.info',['post_id' => $post->id])}}" class="btn btn-primary info-btn"
                                                        style="background:lightgreen; border-radius: 7px;">
                                                        <i class="fas fa-info" style="margin-right: 5px;"></i> Info
                                                    </a>
                                                </td>
                                   
                                    </tr>

                                    
                                   
                                @endforeach
                           
                              
                            </tbody>

                      
                            <!-- Repeat similar rows for other entries -->

                            <!-- Repeat similar rows for other entries -->
                        </table>

                   

                    </div>
                    <div class="pagination-container">
                        <div class="pagination-box">
                            <a href="{{$posts->previousPageUrl()}}" class="page-link">&laquo; Previous</a>
                        </div>
                        <div class="pagination-box">
                            <a href="{{$posts->withQueryString()->nextPageUrl()}}" class="page-link">Next &raquo;</a>
                        </div>
                    </div>
                    
                
                </div>
            </div>
        </div>
    </div>

    
    
    <!-- JavaScript -->
   

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

<div id="blockPostModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Block Post</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form action="{{ route('admin.block.post') }}" method="POST">
                    @csrf
                    <input type="hidden" name="post_id" id="blockedPostId">
                    <div class="form-group">
                        <label for="blockReason">Reason for blocking:</label>
                        <textarea class="form-control" id="blockReason" name="block_reason" rows="4"
                            placeholder="Enter reason for blocking"></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Block</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        // When toggle switch is changed
        $('.feature-toggle').on('change', function () {
            var postId = $(this).data('post-id');
            $('#blockedPostId').val(postId); // Set post_id in the modal form
            $('#blockPostModal').modal('show'); // Show the block post modal
        });

        // When block post form is submitted
        $('#blockPostModal form').submit(function (event) {
            event.preventDefault();
            var formData = $(this).serialize();
            $.ajax({
                url: "{{ route('admin.block.post') }}",
                type: "POST",
                data: formData,
                success: function (response) {
                    // Handle success
                    $('#blockPostModal').modal('hide'); // Hide modal after success
                    // You may want to refresh the page or update UI
                },
                error: function (xhr, status, error) {
                    // Handle error
                    console.error(xhr.responseText);
                }
            });
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



<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<!-- Script to show SweetAlert message -->
<script>
    // Check if there is a success message flashed from controller
    let successMessage = '{{ session('success') }}';
    let errorMessage = '{{ session('error') }}';

    if (successMessage) {
        Swal.fire({
            icon: 'success',
            title: 'Success',
            text: successMessage,
            showConfirmButton: false,
            timer: 2000 // Close alert after 2 seconds
        });
    } else if (errorMessage) {
        Swal.fire({
            icon: 'error',
            title: 'Error',
            text: errorMessage,
            showConfirmButton: false,
            timer: 2000 // Close alert after 2 seconds
        });
    }
</script>



</x-backend.app-layout>
