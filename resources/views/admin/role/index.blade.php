<x-backend.app-layout>





    <div class="content">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="page-header-title">
                        <h4 class="pull-left page-title" style="font-size: 21px;">Lablum Staff Roles And Permission</h4>
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
                        <div class="col-sm-12">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Role Create</h3>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-sm-12 col-xs-12">
                                            <h3 class="header-title m-t-0"><small>Add New Role Here</small></h3>
                                            <div class="">
                                                <form action="{{ route('admin.role.store') }}" method="POST"
                                                    enctype="multipart/form-data">
                                                    @csrf
                                                    <div class="form-group">
                                                        <label for="">
                                                            <p class="mb-2">Role Name</p>
                                                        </label>
                                                        <input type="text" name="name" value="{{ old('name') }}"
                                                            class="form-control" placeholder="Name">
                                                        @error('name')
                                                            <p class="text-xs text-red-500">{{ $message }}</p>
                                                        @enderror

                                                    </div>
                                                    <div class="col-span-12 my-4">
                                                        <button type="submit" class="btn btn-primary">
                                                            <i class="fas fa-plus"></i> Create
                                                        </button>

                                                    </div>
                                                </form>



                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>



                    <div class="table-responsive">
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>S/N</th>
                                    <th>Name</th>

                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($roles as $role)
                                    <tr>
                                        <td>{{$loop->iteration}}</td>
                                        <td>{{$role->name}}</td>
                                        <td><a href="{{route('admin.permissions', $role->id)}}" class="btn btn-primary">
    <i class="fas fa-lock"></i> Permission
</a>
</td>
                                    </tr>
                                @endforeach

                            </tbody>


                            <!-- Repeat similar rows for other entries -->
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            @if(session('success'))
                swal("Success", "{{ session('success') }}", "success");
            @endif
        });
    </script>


</x-backend.app-layout>