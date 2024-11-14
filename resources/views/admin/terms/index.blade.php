<x-backend.app-layout>


    <div class="content">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="page-header-title">
                        <h4 class="pull-left page-title" style="font-size: 30px;"> Terms and Policies List </h4>
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
                                <a href="{{ route('admin.terms.create') }}" class="btn btn-primary"
                                    style="border-radius: 7px;"><i class=""></i>
                                    Add Terms and Policies</a>
                                
                            </div>
                        </div>

                       
                    </div>



                    <div class="table-responsive">
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>SN</th>
                                    <th>Terms Plicies Type</th>


                                    <th>EDIT</th>

                                </tr>
                            </thead>
                            @foreach($terms as $term)
                            <tbody>

                                <tr>


                                    <td>{{$loop->iteration}}</td>

                                    <td>{{$term->type}}</td>









                                    <td>
                                        <a class="btn btn-primary info-btn" href="{{route('admin.term.edit',$term)}}"
                                            style="background-image: #2196F3t;color:white;">
                                            <i class="fas fa-edit"></i>Show
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
