<x-backend.app-layout>
    <style>
        .tag {
        display: inline-block;
        background-color: #007bff;
        color: white;
        padding: 5px 10px;
        border-radius: 5px;
        margin-right: 5px;
    }


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
    
        </style>
    
        <div class="content">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="page-header-title">
                            <h4 class="pull-left page-title" style="font-size: 30px;"> News And Blog List </h4>
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
                                    <a href="{{ route('admin.create.banner.add') }}" class="btn btn-primary"
                                        style="border-radius: 7px;"><i class=""></i>
                                        Add Advertisment Banner</a>
                                   
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
                                        <th>ADVERTISMENT BANNER</th>
                                        <th>ADVERTISER NAME</th>
                                        <th>COMPANY/ORGANIZATION NAME</th>
                                   
                                        <th>BUSINESS TYPE</th>
                                        <th>REDIRECT URL</th>
                                        <th>PUBLISH DATE</th>
                                        <th>EXPIRE DATE</th>
                                        <th>STATUS</th>
    
    
                                        <th>EDIT</th>
                                      
    
                                    </tr>
                                </thead>
                                @foreach($banneradds as $banneradd)
                                <tbody>
    
                                    <tr>
    
    
                                        <td>{{$loop->iteration}}</td>
                                        <td>
                                            <img style="max-width: 107px; border-radius: 11px;" src="{{ asset('storage/' . $banneradd->banner) }}" alt="Banner">
                                        </td>
    
                                        <td>{{$banneradd->name}}</td>
                                        <td>{{$banneradd->com_name}}</td>
                                       
                                        
                                        <td>{{$banneradd->business_type}}</td>
                                        <td>{{$banneradd->url}}</td>
                                        <td>{{ $banneradd->active_date }}</td>
                                        <td>{{ $banneradd->expire_date }}</td>
                                        <td>
                                            <label class="toggle-switch">
                                                <input type="checkbox" class="feature-toggle" data-addbanner-id="{{ $banneradd->id }}" {{ $banneradd->status ? 'checked' : '' }}>
                                                <span class="toggle-slider"></span>
                                            </label>
                                        </td>
                                        
                                        
    
    
    
    
    
    
    
    
                                        <td>
                                            <a class="btn btn-primary info-btn" 
                                                style="background-image: #a1d2fa;color:white;">
                                                <i class="fas fa-edit"></i>Edit
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
    
    
            <!-- Delete Confirmation Modal -->
    
    
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
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const featureToggles = document.querySelectorAll(".feature-toggle");
        
                featureToggles.forEach((toggle) => {
                    toggle.addEventListener("change", function () {
                        const addbannerId = toggle.getAttribute("data-addbanner-id");
                        const status = toggle.checked ? 1 : 0;
        
                        // Send the feature update to the backend using AJAX or any other method
                        fetch(`/admin/update-banner-status/${addbannerId}`, {
                            method: "POST",
                            headers: {
                                "Content-Type": "application/json",
                                "X-CSRF-TOKEN": document.querySelector('meta[name="csrf-token"]').content,
                            },
                            body: JSON.stringify({ status: status }),
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
    