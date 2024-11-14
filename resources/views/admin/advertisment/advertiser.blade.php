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
            background-color:#af54cd;
        }

        input:focus+.toggle-slider {
            box-shadow: 0 0 1px#af54cd;
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
                                    <th>SN</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                 
                                    <th>Mobile Number</th>
                                    <th>Business Type</th>
                                    <th>Business Name</th>
                                    <th>Business Domain Link</th>
                                    <th>Area</th>
                                    <th>City</th>
                                    <th>State</th>
                                    <th>Zipcode</th>
                                    <th>Business Documents</th>
                                    <th>Personal Documents</th>
                                    <th>Status</th>
                                   
                                    <th>View Plan</th>
                                 
                                </tr>
                            </thead>
                            @foreach($advertisers as $advertiser)
                            <tbody>
                           
                                <tr>


                                    <td>{{$loop->iteration}}</td>
                                    <td>{{$advertiser->name}}</td>
                                    <td>{{$advertiser->email}}</td>
                                    <td>{{$advertiser->mobile}}</td>
                                    <td>{{$advertiser->business_type}}</td>
                                    <td>{{$advertiser->business_name}}</td>
                                    <td>{{$advertiser->url}}</td>
                                    <td>{{$advertiser->area}}</td>
                                    <td>{{$advertiser->city}}</td>
                                    <td>{{$advertiser->state}}</td>
                                    <td>{{$advertiser->zipcode}}</td>
                                    <td>
                                        @if ($advertiser->business_document)
                                            @php
                                                $documents = explode(',', $advertiser->business_document);
                                            @endphp
                                            @foreach ($documents as $document)
                                                <a href="{{ asset('storage/' . $document) }}" download>
                                                    <img src="{{ asset('storage/' . $document) }}" alt="Business Document" style="max-width: 100px; max-height: 100px;">
                                                </a>
                                            @endforeach
                                        @else
                                            No documents uploaded
                                        @endif
                                    </td>
                                    <td>
                                        @if ($advertiser->personel_documents)
                                            @php
                                                $documents = explode(',', $advertiser->personel_documents);
                                            @endphp
                                            @foreach ($documents as $document)
                                                <a href="{{ asset('storage/' . $document) }}" download>
                                                    <img src="{{ asset('storage/' . $document) }}" alt="Business Document" style="max-width: 100px; max-height: 100px;">
                                                </a>
                                            @endforeach
                                        @else
                                            No documents uploaded
                                        @endif
                                    </td>

                                    <td>
                                        <label class="toggle-switch">
                                            <input type="checkbox" class="feature-toggle"
                                                data-advertiser-id="{{ $advertiser->id }}"
                                                {{ $advertiser->is_approve ? 'checked' : '' }}>
                                            <span class="toggle-slider"></span>
                                        </label>
                                    </td>
                                    
                             
                       
                                  
                                 
                             



                                 


                                    
                                    <td>
                                        <a class="btn btn-primary info-btn" href="{{ route('plan.show', $advertiser) }}"
                                        style="background-image: background-image: linear-gradient(352deg, #af0888, #131597) !important;color:white;"
                                       >
                                        <i class="fas fa-edit"></i>View Plan
                                </a>
                            </td>
                      
                                </tr>
                             
                              
                            </tbody>
                            @endforeach



                          
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


<script>
  document.addEventListener("DOMContentLoaded", function () {
    const featureToggles = document.querySelectorAll(".feature-toggle");

    featureToggles.forEach((toggle) => {
        toggle.addEventListener("change", function () {
            const postId = toggle.getAttribute("data-advertiser-id"); // Corrected variable name
            const is_approve = toggle.checked ? 1 : 0;

            // Send the feature update to the backend using AJAX or any other method
            fetch(`/update-advertiser-is_active/${postId}`, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    "X-CSRF-TOKEN": document.querySelector('meta[name="csrf-token"]').content,
                },
                body: JSON.stringify({ is_approve: is_approve }),
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
