<x-backend.app-layout>





    <div class="content">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="page-header-title">
                        <h4 class="pull-left page-title" style="font-size: 30px;">Lablum Staff List</h4>
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
                                <a href="{{ route('admin.user.create') }}" class="btn btn-primary" style="border-radius: 7px;"><i class=""></i>
                                    + Add</a>

                            </div>
                        </div>
                        {{-- <div class="col-md-6">
                            <div class="input-group" style="margin-top: 16px; float: right;">

                                <input type="text" class="form-control" placeholder="Search...">

                            </div>
                        </div> --}}
                    </div>



                    <div class="table-responsive">
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>S/N</th>
                                    <th>Role</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Phone No</th>
                                    {{-- <th>Role</th> --}}

                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($users as $user)
                                    <tr>
                                        <td>{{$loop->iteration}}</td>
                                        <td>{{$user->getRoleNames()->first() }}</td>
                                        <td>{{$user->name}}</td>
                                        <td>{{$user->email}}</td>
                                        <td>{{$user->phone}}</td>
                                        <td><a href="{{ route('admin.user.edit', ['admin' => $user->id]) }}" class="btn btn-primary">
    <i class="fas fa-edit"></i> Edit
</a>
</td>
<td>
    <form action="{{ route('admin.user.destroy', ['admin' => $user->id]) }}" method="POST" onsubmit="return confirm('Are you sure you want to delete this user?');">
        @csrf
        @method('DELETE')
        <button type="submit" class="btn btn-danger">
            <i class="fas fa-trash"></i> Delete
        </button>
    </form>
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
        document.addEventListener("DOMContentLoaded", function() {
            @if(session('success'))
                swal("Success", "{{ session('success') }}", "success");
            @endif
        });
    </script>


</x-backend.app-layout>
