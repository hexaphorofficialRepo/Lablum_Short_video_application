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

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

    <div class="content">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="page-header-title">
                        <h4 class="pull-left page-title" style="font-size: 30px;"> Fake / Blocked  Users </h4>
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
                                <button id="downloadBtn" class="btn btn-primary" style="border-radius: 7px;">Download as
                                    Excel</button>
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
                                                href="{{ route('filter.user.date', ['date' => \Carbon\Carbon::today()->toDateString()]) }}">Today's
                                                Register Users</a></p>
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
                                window.location.href = "{{ route('filter.user.date') }}?start_date=" + startDate + "&end_date=" +
                                    endDate;
                            }
                        </script>



                 
                        <div id="downloadModal" class="modal" style="display: none;">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                        <h4 class="modal-title">Download Options</h4>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>

                                    <!-- Modal Body -->
                                    <div class="modal-body">
                                        <p><a href="{{ route('download.today.users') }}">Download Today's Data</a></p>
                                        <p><a href="#" id="dateRangeDownloadLink">Download by Date Range</a></p>
                                        <div id="dateRangeDownloadInputs" style="display: none;">
                                            <input type="date" id="startDateDownload">
                                            <input type="date" id="endDateDownload">
                                            <button onclick="downloadByDateRange()">Download</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <script>
                         
                            document.getElementById('downloadBtn').addEventListener('click', function() {
                                document.getElementById('downloadModal').style.display = 'block';
                            });

                      
                            document.querySelectorAll('.close').forEach(function(el) {
                                el.addEventListener('click', function() {
                                    document.getElementById('downloadModal').style.display = 'none';
                                });
                            });

                           
                            document.getElementById('dateRangeDownloadLink').addEventListener('click', function() {
                                document.getElementById('dateRangeDownloadInputs').style.display = 'block';
                            });

                          
                            function downloadByDateRange() {
                                var startDate = document.getElementById('startDateDownload').value;
                                var endDate = document.getElementById('endDateDownload').value;
                                window.location.href = "{{ route('download.by.date.users') }}?start_date=" + startDate + "&end_date=" + endDate;
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
                                    <th>USER ID</th>
                                    <th>PROFILE IMAGE</th>
                                    <th>USER NAME</th>
                                    <th>FULL NAME</th>
                                    <th>DATE OF BIRTH</th>
                                    <th>GENDER</th>
                                    <th>EMAIL</th>
                                    <th>MOBILE NUMBER</th>
                                    <th>LAST ACTIVE</th>

                                    <th>LIKE</th>
                                    <th>COMMENT</th>

                                    <th>REGSTERATION DATE</th>
                                    <th> USER STATUS </th>
                                    <th> USER BLOCK MESSAGE</th>
                                    <th>VIEW</th>
                                  
                                    <th>USER BANK DETAILS</th>
                                    <th>USER VERIFICATION DOCUMENTS</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($users as $user)
                                    <tr>
                                        <td>{{ $loop->iteration }}</td>
                                        <td>{{ $user->user_id }}</td>
                                        <td>
                                            <!-- Add the responsive image here -->
                                            <img id="userImage" height="100px" width="100px" alt="user-profile-pic"
                                            class="mx-auto"
                                            style="box-shadow: rgba(105, 103, 103, 0) 0px 5px 15px 0px; border: 2px solid rgb(255, 255, 255); border-radius: 40px; object-fit: contain; display: block;"
                                            src="{{ asset('storage/profile_pic/' . $user->user_id . '/' . $user->user_dp) }}"
                                            onerror="this.onerror=null; this.src='{{ asset('assets/images/dummyusers.jpg') }}';">

                                        </td>
                                        <td>{{ $user->username }}</td>
                                        <td>{{ $user->fname }} {{ $user->lname }}</td>
                                        <td>{{ date('F d, Y', strtotime($user->dob)) }}</td>

                                        <td>
                                            {{ $user->gender === 'm' ? 'Male' : ($user->gender === 'f' ? 'Female' : 'Other') }}
                                        </td>

                                        <td>{{ $user->email }}</td>

                                        <td>{{ $user->mobile }}</td>
                                        <td>
                                            @if (isset($user->last_active))
                                                {{ $user->last_active->diffForHumans() }}
                                            @else
                                                N/A
                                            @endif
                                        </td>



                                        <td>
                                            {{ $user->likes->count() }}
                                        </td>
                                        <td>
                                            {{ $user->comments->count() }}
                                        </td>
                                        <td>{{ date('F d, Y', strtotime($user->created_at)) }}</td>
                                        <td>
                                            <label class="toggle-switch">
                                                <input type="checkbox" class="feature-toggle" data-user-id="{{ $user->user_id }}" {{ $user->active ? 'checked' : '' }}>
                                                <span class="toggle-slider"></span>
                                            </label>
                                        </td>

                                        <td>
                                            @foreach($user->blockmessage as $blockmessage)
                                                {{ $blockmessage->reason }}
                                            @endforeach
                                        </td>
                                        
                                        <td>
                                            <a href="{{route('admin.user.details',['user_id' => $user->user_id])}}" class="btn btn-primary info-btn"
                                                style="background:lightgreen; border-radius: 7px;">
                                                <i class="fas fa-info" style="margin-right: 5px;"></i> Info
                                            </a>
                                        </td>
                                        <td> <a href="{{route('admin.user.bank.details',['user_id' => $user->user_id])}}" class="btn btn-secondary history-btn"
                                                style="  background: linear-gradient(285deg, #AF54CD, #ea07ff) !important;;color:white;"
                                              >
                                                <i class="fas fa-piggy-bank" style="margin-right: 5px;"></i>Bank Details
                                        </a>
                                        </td>
                                        <td> <a href="{{route('admin.user.data',['user_id' => $user->user_id])}}" class="btn btn-secondary history-btn"
                                                style="       background: linear-gradient(285deg, #AF54CD, #ea07ff) !important;;color:white;"
                                              >
                                                <i class="fas fa-piggy-bank" style="margin-right: 5px;"></i>Verification Details
                                        </a>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>




                            <!-- Repeat similar rows for other entries -->
                        </table>
                    </div>

                    <div class="pagination-container">
                        <div class="pagination-box">
                            <a href="{{$users->previousPageUrl()}}" class="page-link">&laquo; Previous</a>
                        </div>
                        <div class="pagination-box">
                            <a href="{{$users->withQueryString()->nextPageUrl()}}" class="page-link">Next &raquo;</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const featureToggles = document.querySelectorAll(".feature-toggle");
    
            featureToggles.forEach((toggle) => {
                toggle.addEventListener("change", function () {
                    const userId = toggle.getAttribute("data-user-id");
                    const active = toggle.checked ? 1 : 0;
    
                    // Send the feature update to the backend using AJAX or any other method
                    fetch(`/update-is_active/${userId}`, {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/json",
                            "X-CSRF-TOKEN": document.querySelector('meta[name="csrf-token"]').content,
                        },
                        body: JSON.stringify({ active: active }),
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
        let errorMessage = '{{ session('error') }}';
        if (errorMessage) {
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
