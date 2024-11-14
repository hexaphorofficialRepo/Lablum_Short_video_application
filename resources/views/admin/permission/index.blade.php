<x-backend.app-layout>





    <div class="content">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="page-header-title">
                        <h4 class="pull-left page-title" style="font-size: 30px;">Lablum Staff Permission Update</h4>
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
                                    <h3 class="panel-title">Permission Update</h3>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-sm-12 col-xs-12">
                                            <h3 class="header-title m-t-0"><small>Update Permission Here</small></h3>
                                            <div class="">
                                                <form action="{{route('admin.permissions.update',$role->id) }}" method="POST" class="grid grid-cols-12 gap-3" enctype="multipart/form-data">
                                                    @csrf
                                                    <div class="col-span-12 ">
                                                        @forelse ($permissions as $permission)
                                                        <label class="col-lg-3">
                                                            <input type="checkbox" name="{{ $permission->name }}" value="{{ $permission->id }}" {{ $data->contains($permission->id) ? 'checked' : '' }}>
                                                            {{ $permission->name }}
                                                        </label>
                                                        @empty
                                                        <p>No Permissions Found</p>
                                                        @endforelse
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
