<x-backend.app-layout>


    <div class="content">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="page-header-title">
                        <h4 class="pull-left page-title" style="font-size: 30px;"> Advertisement Pricing Plan List </h4>
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
                                <a href="{{ route('admin.addpricing.create') }}" class="btn btn-primary"
                                    style="border-radius: 7px;"><i class=""></i>
                                    Add New Advertisment Pricing Plan</a>
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
                                    <th>VIDEOS COUNT</th>
                                    <th>DAYS COUNT</th>
                                    <th>STREAMING PRICING (₹)</th>
                                    <th> ADD CATEGORY</th>
                                  


                                    <th>EDIT</th>

                                </tr>
                            </thead>
                            @foreach($addpricing as $pricing)
                            <tbody>

                                <tr>


                                    <td>{{$loop->iteration}}</td>

                                    <td>{{$pricing->video_count}}</td>
                                    <td>{{$pricing->days_count}}</td>
                                    <td>{{$pricing->price}}</td>
                                    <td>{{$pricing->addcategory->title}}</td>
                               









                                    <td>
                                        <a class="btn btn-primary info-btn" href="{{route('admin.add.pricing.edit',$pricing)}}"
                                            style="background-image: #2196F3t;color:white;">
                                            <i class="fas fa-edit"></i>Edit
                                        </a>
                                    </td>
                                    {{-- <td> --}}
                                    {{-- <button class="btn btn-secondary history-btn"
                                            style="background-image: linear-gradient(352deg,#af0888,#131597)!important;color:white;"
                                            onclick="showHistory()">
                                            <i class="fas fa-trash-alt"></i>Delete
                                        </button> --}}
                                    {{-- </td> --}}
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
    
        // Check if there is an error message flashed from controller
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
