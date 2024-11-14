<x-backend.app-layout>


    <div class="content">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="page-header-title">
                        <h4 class="pull-left page-title" style="font-size: 30px;"> User wallet List </h4>
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
                              
                                {{-- <a href="#" class="btn btn-primary" style="border-radius: 7px;">Filter <i
                                        class="fas fa-chevron-down" style="margin-left: 5px;"></i></a> --}}
                            </div>
                        </div>

                        <div class="col-md-6">
                            <form id="searchForm" action="{{ route('admin.search.wallet') }}" method="GET">
                                <div class="input-group" style="margin-top: 16px; float: right;">
                                    <input type="text" class="form-control" name="search_query" id="searchInput" placeholder="Search For User Wallet">
                                </div>
                            </form>
                        </div>
                        
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
                                    <th>SN</th>
                                    <th>USER PROFILE</th>
                                    <th>USERNAME</th>
                                    <th>FULL NAME </th>
                                    <th>MOBILE NUMBER </th>
                                    <th>EMAIL ID</th>
                                    <th>WALLET TOTAL AMOUNT RECORD (In ₹) </th>
                                    <th> GST AMOUNT (In ₹)</th>
                                    <th> ADDITIONAL TAXES AMOUNT (In ₹)</th>
                                    <th>ADDITIONAL TAXES DETAILS </th>
                                    <th>NET WALLET AMOUNT (In ₹)</th>
                                    <th>UPDATED ON </th>
                                    <th>USER INFO </th>


                                   

                                </tr>
                            </thead>
                            @foreach($wallets as $wallet)
                            <tbody>

                                <tr>


                                    <td>{{$loop->iteration}}</td>

                                    <td>
                                    
                                        <img id="userImage" height="100px" width="100px" alt="user-profile-pic" class="mx-auto"
                                        style="box-shadow: rgba(105, 103, 103, 0) 0px 5px 15px 0px; border: 2px solid rgb(255, 255, 255); border-radius: 40px; object-fit: contain; display: block;"
                                        src="{{ asset('storage/profile_pic/' . $wallet->user->user_id . '/' . $wallet->user->user_dp) }}"
                                        onerror="this.onerror=null; this.src='{{ asset('assets/images/dummyusers.jpg') }}';">
                                    
                                    
                                    
                                    
                                    </td>


                                        <td>{{$wallet->user->username}}</td>
                                        <td>{{$wallet->user->fname}} {{$wallet->user->lname}}</td>
                                        <td>{{$wallet->user->mobile}}</td>
                                        <td>{{$wallet->user->email}}</td>


                                        <td>{{$wallet->points}}</td>
                                        <td>{{$wallet->gst_amount}}</td>
                                        <td>{{$wallet->additional_tax_amount}}</td>
                                        <td>
                                            @if($wallet->additional_tax_details)
                                                @php
                                                    $taxDetails = json_decode($wallet->additional_tax_details, true);
                                                @endphp
                                                @if(is_array($taxDetails))
                                                    <table class="table table-bordered table-sm">
                                                        <thead>
                                                            <tr>
                                                                <th>Tax Name</th>
                                                                <th>Amount (₹)</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            @foreach($taxDetails as $taxDetail)
                                                                <tr>
                                                                    <td>{{ $taxDetail['tax_name'] }}</td>
                                                                    <td>{{ $taxDetail['tax_amount'] }}</td>
                                                                </tr>
                                                            @endforeach
                                                        </tbody>
                                                    </table>
                                                @else
                                                    <p>No additional tax details available.</p>
                                                @endif
                                            @else
                                                <p>No additional tax details available.</p>
                                            @endif
                                        </td>
                                        <td>{{$wallet->net_amount}}</td>



                                        <td>{{ $wallet->updated_at->diffForHumans() }}</td>
                                        
                                        <td>
                                            <a href="{{route('admin.user.details',['user_id' => $wallet->user->user_id])}}" class="btn btn-primary info-btn"
                                                style="background:lightgreen; border-radius: 7px;">
                                                <i class="fas fa-info" style="margin-right: 5px;"></i> User Info
                                            </a>
                                        </td>








                                   
                                  
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




</x-backend.app-layout>
