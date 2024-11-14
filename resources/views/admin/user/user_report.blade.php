<x-backend.app-layout>


    <div class="content">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="page-header-title">
                        <h4 class="pull-left page-title" style="font-size: 30px;">Account Report Record</h4>
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
                                 
                                    <th> User DP</th>
                                    <th>Full Name</th>
                                    <th>USERNAME</th>
                                    <th> User Contact</th>
                                    


                                   

                                </tr>
                            </thead>
                         
                            <tbody>
                                @foreach ($userreports as $userreport)

                                <tr>


                                  

                                    <td>
                                    
                                        <img id="userImage" height="100px" width="100px" alt="user-profile-pic" class="mx-auto"
                                        style="box-shadow: rgba(105, 103, 103, 0) 0px 5px 15px 0px; border: 2px solid rgb(255, 255, 255); border-radius: 40px; object-fit: contain; display: block;"
                                        src="{{ asset('storage/profile_pic/' . $userreport->user->user_id . '/' . $userreport->user->user_dp) }}"
                                        onerror="this.onerror=null; this.src='{{ asset('assets/images/dummyusers.jpg') }}';">
                                    
                                    
                                    
                                    
                                    </td>


                                        <td>{{$userreport->user->username}}</td>
                                        <td>{{$userreport->user->fname}} {{$userreport->user->lname}}</td>
                                        <td>{{$userreport->user->mobile}}</td>
                                     
                                        
                                     









                                   
                                  
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
