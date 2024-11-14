<x-backend.app-layout>


    <div class="content">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="page-header-title">
                        <h4 class="pull-left page-title" style="font-size: 30px;"> User Verification Details </h4>
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

                        
                        
                        <script>
                            document.addEventListener("DOMContentLoaded", function() {
                                document.getElementById("searchInput").addEventListener("keypress", function(event) {
                                    if (event.key === "Enter") {
                                        event.preventDefault(); // Prevent default form submission
                                        document.getElementById("searchForm").submit(); // Submit the form
                                    }
                                });
                            });
                        </script>
                        
                    </div>



                    <div class="table-responsive">
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    {{-- <th>SN</th> --}}
                                    <th> User DP</th>
                                    <th>Full Name</th>
                                    <th>USERNAME</th>
                                    <th> User Contact</th>
                                    <th>Adhar Number </th>
                                    <th>PAN Number</th>
                                    <th>Name</th>
                                    <th>Father Name</th>
                                   
                                    <th>Date Of Birth</th>
                                    <th>Gender</th>
                                    <th>Address</th>
                                    <t> USER INFO</th>


                                   

                                </tr>
                            </thead>
                         
                            <tbody>

                                <tr>


                                  

                                    <td>
                                    
                                        <img id="userImage" height="100px" width="100px" alt="user-profile-pic" class="mx-auto"
                                        style="box-shadow: rgba(105, 103, 103, 0) 0px 5px 15px 0px; border: 2px solid rgb(255, 255, 255); border-radius: 40px; object-fit: contain; display: block;"
                                        src="{{ asset('storage/profile_pic/' . $userdata->user->user_id . '/' . $userdata->user->user_dp) }}"
                                        onerror="this.onerror=null; this.src='{{ asset('assets/images/dummyusers.jpg') }}';">
                                    
                                    
                                    
                                    
                                    </td>


                                        <td>{{$userdata->user->username}}</td>
                                        <td>{{$userdata->user->fname}} {{$userdata->user->lname}}</td>
                                        <td>{{$userdata->user->mobile}}</td>
                                        <td>{{$userdata->document_id1}}</td>
                                        <td>{{$userdata->document_id2}}</td>
                                        <td>{{$userdata->name}}</td>
                                        <td>{{$userdata->father_name}}</td>
                                        <td>{{$userdata->dob}}</td>
                                        <td>   @if($userdata->gender == 'm')
                                            Male
                                        @elseif($userdata->gender == 'f')
                                            Female
                                        @else
                                            Others
                                        @endif</td>
                                        <td >
                                          {{$userdata->address}}
                                        </td>
                                        
                                     


                                        <td>
                                            <a href="{{route('admin.user.details',['user_id' => $userdata->user->user_id])}}" class="btn btn-primary info-btn"
                                                style="background:lightgreen; border-radius: 7px;">
                                                <i class="fas fa-info" style="margin-right: 5px;"></i> User Info
                                            </a>
                                        </td>






                                   
                                  
                                </tr>

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




</x-backend.app-layout>
