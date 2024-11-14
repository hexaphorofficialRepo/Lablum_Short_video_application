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
                        <h4 class="pull-left page-title" style="font-size: 30px;"> User official Verification </h4>
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
                              
                                <a href="#" class="btn btn-primary" style="border-radius: 7px;">Filter <i
                                        class="fas fa-chevron-down" style="margin-left: 5px;"></i></a>
                            </div>
                        </div>

                        <div class="col-md-6">
                            {{-- <form id="searchForm" action="{{ route('admin.search.wallet') }}" method="GET">
                                <div class="input-group" style="margin-top: 16px; float: right;">
                                    <input type="text" class="form-control" name="search_query" id="searchInput" placeholder="Search...">
                                </div>
                            </form> --}}
                        </div>
                        
                        {{-- <script>
                            document.addEventListener("DOMContentLoaded", function() {
                                document.getElementById("searchInput").addEventListener("keypress", function(event) {
                                    if (event.key === "Enter") {
                                        event.preventDefault(); // Prevent default form submission
                                        document.getElementById("searchForm").submit(); // Submit the form
                                    }
                                });
                            });
                        </script> --}}
                        
                    </div>



                    <div class="table-responsive">
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>SN</th>
                                    <th>USER PROFILE</th>
                                    <th>USERNAME</th>
                                    <th>MOBILE NUMBER </th>
                                    <th>EMAIL ID</th>
                                    <th>USER FULL NAME</th>
                                    <th>CATEGORY</th>
                                    <th>COUNTRY</th>
                                    <th>KNOWN</th>
                                    <th>AUDIENCE</th>
                                    <th>LINK TYPE </th>
                                    <th>LINK URL</th>
                                    <th>LINK TYPE </th>
                                    <th>LINK URL</th>
                                    <th>LINK TYPE </th>
                                    <th>LINK URL</th>
                                    <th>DOCUMENT TYPE</th>
                                    <th>DOCUMENT FILE </th>
                                    <th> APPROVE OFFICIAL</th>
                                    <th>UPDATED ON </th>
                                  
                                    <th> USER INFO </th>
                                    <th>PAYMENT INFORMATION</th>
                                 


                                   

                                </tr>
                            </thead>
                            @foreach($verifies as $verify)
                            <tbody>

                                <tr>


                                    <td>{{$loop->iteration}}</td>

                                    <td>
                                    
                                        <img id="userImage" height="100px" width="100px" alt="user-profile-pic" class="mx-auto"
                                        style="box-shadow: rgba(105, 103, 103, 0) 0px 5px 15px 0px; border: 2px solid rgb(255, 255, 255); border-radius: 40px; object-fit: contain; display: block;"
                                        src="{{ asset('storage/profile_pic/' . $verify->user->user_id . '/' . $verify->user->user_dp) }}"
                                        onerror="this.onerror=null; this.src='{{ asset('assets/images/dummyusers.jpg') }}';">
                                    
                                    
                                    
                                    
                                    </td>
                                   
                                                                         


                                        <td>{{$verify->user->username}}</td>
                                        <td>{{$verify->user->mobile}}</td>
                                        <td>{{$verify->user->email}}</td>
                                        <td>{{$verify->name}}</td>
                                        <td>{{$verify->category}}</td>
                                        <td>{{$verify->country}}</td>
                                        <td>{{ $verify->known ?? 'not available' }}</td>
                                        <td>{{ $verify->audiance ?? 'not available' }}</td>
                                        <td>{{ $verify->link_type1 ?? 'not available' }}</td>
                                        <td>{{ $verify->link_url1 ?? 'not available' }}</td>
                                        <td>{{ $verify->link_type2 ?? 'not available' }}</td>
                                        <td>{{ $verify->link_url2 ?? 'not available' }}</td>
                                        <td>{{ $verify->link_type3 ?? 'not available' }}</td>
                                        <td>{{ $verify->link_url3 ?? 'not available' }}</td>
                                        <td>{{$verify->document_type}}</td>
                                    
                                     
                                        <td style="display: flex">
                                            @foreach (explode(',', $verify->document_pdf) as $path)
                                                @php
                                                    $extension = pathinfo($path, PATHINFO_EXTENSION);
                                                @endphp
                                                
                                                @if ($extension === 'pdf')
                                                    <div>
                                                        <img src="{{ asset('pdf-icon.png') }}" alt="PDF Icon" width="50" height="50">
                                                        <a href="{{ asset('storage/' . $path) }}" download>{{ basename($path) }}</a>
                                                    </div>
                                                @else
                                                    <div>
                                                        <img onclick="showImage('{{ asset('storage/' . $path) }}')" style="max-width: 150px; max-height: 150px; border-radius: 10px; padding: 5px;" src="{{ asset('storage/' . $path) }}" alt="Document Image" width="200" height="200">
                                                    </div>
                                                @endif
                                            @endforeach
                                        </td>


                                        <td>

                                            <label class="toggle-switch">
                                                <input type="checkbox" class="feature-toggle"
                                                data-verify-id="{{ $verify->id }}"
                                                    {{ $verify->status ? 'checked' : '' }}>
                                                <span class="toggle-slider"></span>
                                            </label>
                                            
                                          </td>

                                          <td>{{ date('F d, Y', strtotime($verify->created_at)) }}</td>
                                        <td>
                                            <a href="{{route('admin.user.details',['user_id' => $verify->user->user_id])}}" class="btn btn-primary info-btn"
                                                style="background:lightgreen; border-radius: 7px;">
                                                <i class="fas fa-info" style="margin-right: 5px;"></i> User Info
                                            </a>
                                        </td>
                                        <td>
                                            @php
                                                $paymentInfo = \App\Models\Officialpayment::where('user_id', $verify->user->user_id)->exists();
                                            @endphp
                                            @if($paymentInfo)
                                                <a href="{{ route('official.payment.user', ['user_id' => $verify->user->user_id]) }}" class="btn btn-primary info-btn" style="background:lightgreen; border-radius: 7px;">
                                                    <i class="fas fa-money-bill" style="margin-right: 5px;"></i>
                                                    Payment Information
                                                </a>
                                            @else
                                                <span style="color: red;">Not Done Payment Yet</span>
                                            @endif
                                        </td>
                                        
                                        
                                        <!-- JavaScript to display image in a modal -->
                                        <script>
                                            function showImage(imageUrl) {
                                                var modal = document.createElement('div');
                                                modal.innerHTML = '<div style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.5); z-index: 999;"></div>';
                                                modal.innerHTML += '<img src="' + imageUrl + '" style="position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); max-width: 80%; max-height: 80%; z-index: 1000;">';
                                                modal.addEventListener('click', function() {
                                                    modal.parentNode.removeChild(modal);
                                                });
                                                document.body.appendChild(modal);
                                            }
                                        </script>
                                        
                                   
                                        
                                     
                                        
                                        
                                      







                                   
                                  
                                </tr>

                                <!-- Repeat similar rows for other entries -->
                            </tbody>
                            @endforeach



                            <!-- Repeat similar rows for other entries -->

                            <!-- Repeat similar rows for other entries -->
                        </table>
                    </div>
                </div>
            </div>
        </div>
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

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<!-- Add this script inside your blade file -->
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const featureToggles = document.querySelectorAll(".feature-toggle");

        featureToggles.forEach((toggle) => {
            toggle.addEventListener("change", function() {
                const verifyId = toggle.getAttribute("data-verify-id");
                const active = toggle.checked ? 1 : 0;

                // Send the feature update to the backend using AJAX or any other method
                fetch(`/update-verify-status/${verifyId}`, {
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
                            Swal.fire({
                                title: "Success!",
                                text: data.message,
                                icon: "success",
                            });
                        } else {
                            // Show error message using SweetAlert
                            Swal.fire({
                                title: "Error!",
                                text: "Failed to update verify status",
                                icon: "error",
                            });
                        }
                    })
                    .catch((error) => {
                        console.error("Error:", error);
                        // Show error message using SweetAlert
                        Swal.fire({
                            title: "Error!",
                            text: "Failed to update verify status",
                            icon: "error",
                        });
                    });
            });
        });
    });
</script>




</x-backend.app-layout>
