<x-backend.app-layout>


    <div class="content">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="page-header-title">
                        <h4 class="pull-left page-title" style="font-size: 30px;"> Earning Points List </h4>
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
                                <a href="{{ route('admin.create.earning') }}" class="btn btn-primary"
                                    style="border-radius: 7px;"><i class=""></i>
                                    Add News Earning Points</a>
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
                                    <th>FROM (In Seconds)</th>
                                    <th>TO (In Seconds)</th>
                                    <th>CONTENT WRITERS EARNING IN (₹)</th>
                                    <th>CONTENT VIEWER EARNING IN (₹)</th>


                                    <th>EDIT</th>

                                </tr>
                            </thead>
                            @foreach($earnings as $earning)
                            <tbody>

                                <tr>


                                    <td>{{$loop->iteration}}</td>

                                    <td>{{$earning->from}}</td>
                                    <td>{{$earning->to}}</td>
                                    <td>{{$earning->creator_points}}</td>
                                    <td>{{$earning->viewer_points}}</td>









                                    <td>
                                        <a class="btn btn-primary info-btn" href="{{route('admin.edit.earning',$earning)}}"
                                            style="background-image:#2196F;color:white;">
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
    </script>




</x-backend.app-layout>
