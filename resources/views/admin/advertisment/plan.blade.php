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
                        <h4 class="pull-left page-title" style="font-size: 30px;">Add Advertisement Partners </h4>
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
                                <a href="{{route('admin.add.advertiser')}}" class="btn btn-primary" style="border-radius: 7px;"><i
                                        class=""></i>
                                    Add Advertisement Partners</a>
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
                               
                                    <th>Name</th>
                                    <th>Email</th>
                                 
                                    <th>Mobile Number</th>
                                    <th>Business Type</th>
                                    <th>Business Name</th>
                                    <th>Advertisement Video Count</th>
                                    <th>Plan Active for Days</th>
                                    <th>Target Audience</th>
                                    <th>Target Age Group</th>
                                    <th>Preferred Location</th>
                                    <th>Total Amount (₹)</th>
                                   
                                    
                                    <th>Plan Activation Date</th>
                                    <th>Plan Expiring Date </th>
                                    <th>Status</th>
                                    <th>Payment Status</th>
                                   
                                    <th>View Plan</th>
                             
                                 
                                </tr>
                            </thead>
                       
                            <tbody>
                           
                                <tr>


                                  
                                    <td>{{$advertiser->name}}</td>
                                    <td>{{$advertiser->email}}</td>
                                    <td>{{$advertiser->mobile}}</td>
                                    <td>{{$advertiser->business_type}}</td>
                                    <td>{{$advertiser->business_name}}</td>
                                    <td>{{ $plan->add_count }}</td>
                                    <td>{{ $plan->days_count }}</td>
                 
                                    <td>{{ $plan->target_audiance }}</td>
                                    <td>{{ $plan->target_age_group }}</td>
                                    <td>{{ $plan->location }}</td>
                                    <td>{{ $plan->payment_amount }}</td>

                                   


                                    <td>{{ $plan->avtivation_date }}</td>
                                    <td>{{ $plan->expire_date }}</td>

                                    
                                    <td>
                                        <label class="toggle-switch">
                                            <input type="checkbox" class="feature-toggle" data-plan-id="{{ $plan->id }}" {{ $plan->add_status ? 'checked' : '' }}>
                                            <span class="toggle-slider"></span>
                                        </label>
                                    </td>
                       
                                  
                                    <td>
                                        @php
                                            $paymentStatus = optional($plan)->payments->isNotEmpty() ? 'completed' : 'pending';
                                            $statusColor = $paymentStatus == 'completed' ? 'success' : 'danger';
                                        @endphp
                                        @if($paymentStatus == 'completed')
                                            <a href="{{ route('payment.details', ['planId' => optional($plan)->id]) }}" class="btn btn-{{ $statusColor }}">{{ $paymentStatus }}</a>
                                        @else
                                            <button class="btn btn-{{ $statusColor }}" id="paymentButton{{ optional($plan)->id }}">{{ $paymentStatus }}</button>
                                            <span id="paymentMessage{{ optional($plan)->id }}" style="display: none;">Pending for this Plan</span>
                                        @endif
                                    </td>
                                    
                                    
                                 


                                    
                                    <td>
                                        <a href="{{ route('plan.videos', ['addplanId' => $plan->id]) }}" class="btn btn-primary info-btn" 
                                        style="background-image: linear-gradient(352deg,#08af85,#3bd41d)!important;color:white;"
                                       >
                                        <i class="fas fa-edit"></i>View Video
                                </a>
                            </td>


                          
                      
                                </tr>
                             
                              
                            </tbody>
                           



                          
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
    

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<script>
  document.addEventListener("DOMContentLoaded", function () {
    const featureToggles = document.querySelectorAll(".feature-toggle");

    featureToggles.forEach((toggle) => {
        toggle.addEventListener("change", function () {
            const planId = toggle.getAttribute("data-plan-id");
            const addStatus = toggle.checked ? 1 : 0; // Adjusted variable name

            // Send the status update to the backend using AJAX
            fetch(`/update-plan-status/${planId}`, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    "X-CSRF-TOKEN": document.querySelector('meta[name="csrf-token"]').content,
                },
                body: JSON.stringify({ add_status: addStatus }), // Updated parameter name
            })
            .then((response) => response.json())
            .then((data) => {
                // Handle the response from the backend
                if (data.success) {
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
                        text: data.message || "Failed to update plan status",
                        icon: "error",
                    });
                }
            })
            .catch((error) => {
                console.error("Error:", error);
                // Show error message using SweetAlert
                swal({
                    title: "Error!",
                    text: "Failed to update plan status",
                    icon: "error",
                });
            });
        });
    });
});

</script>

<script>
    $(document).ready(function() {
        @if($paymentStatus == 'pending')
            $('#paymentButton{{$plan->id}}').click(function(event) {
                event.preventDefault(); // Prevent the default action of the button click
                $('#paymentMessage{{$plan->id}}').show(); // Show the pending message
            });
        @endif
    });
</script>



    


</x-backend.app-layout>
