<x-backend.app-layout>
    <x-backend.app-layout>


        <div class="content">
            <div class="container">

                <div class="row">
                    <div class="col-sm-12">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title">update User</h3>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-12 col-xs-12">
                                        <h3 class="header-title m-t-0"><small>Update User Here</small></h3>
                                        <div class="m-t-20">

                                            <form class="card-body"  action="{{route('admin.user.update',["admin"=>$admin->id])}}"  method="post" enctype="multipart/form-data">
                                                @csrf

                                                <div class="row g-3">
                                                    <div class="col-md-6">
                                                        <label class="form-label" for="multicol-username">Name</label>
                                                        <input type="text" id="multicol-username" name="name"
                                                        value="{{ $admin->name }}" class="form-control"
                                                            placeholder="Enter Your Name" />
                                                        @error('name')
                                                            <p class="text-xs text-red-500">{{ $message }}</p>
                                                        @enderror
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label" for="multicol-email">Email</label>

                                                        <input type="text" id="multicol-email" name="email"
                                                        value="{{ $admin->email}}" class="form-control"
                                                            placeholder="Enter Your Email" aria-label="john.doe"
                                                            aria-describedby="multicol-email2" />
                                                        @error('email')
                                                            <p class="text-xs text-red-500">{{ $message }}</p>
                                                        @enderror


                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label" for="multicol-username">Phone No</label>
                                                        <input type="text" id="multicol-username"name="phone"
                                                        value="{{ $admin->phone }}" class="form-control"
                                                            placeholder="Enter Your Phone No" />
                                                        @error('phone')
                                                            <p class="text-xs text-red-500">{{ $message }}</p>
                                                        @enderror
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="form-label" for="multicol-country">Roles</label>
                                                        <select id="multicol-country" class="form-control"
                                                            data-allow-clear="true" name="role_id" id="">
                                                            <option value="">Select Roles</option>

                                                            @foreach($roles as $role)
                                                            <option value="{{$role->id}}" {{$admin->getRoleNames()->first() == $role->name?'selected':''}}>{{$role->name}}</option>
                                                            @endforeach

                                                        </select>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-password-toggle">
                                                            <label class="form-label"
                                                                for="multicol-password">Password</label>

                                                            <input type="password" name="password" value=""
                                                                id="multicol-password" class="form-control"
                                                                placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
                                                                aria-describedby="multicol-password2" />
                                                            @error('password')
                                                                <p class="text-xs text-red-500">{{ $message }}</p>
                                                            @enderror
                                                            <span class="input-group-text cursor-pointer"
                                                                id="multicol-password2"><i class="bx bx-hide"></i></span>

                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-password-toggle">
                                                            <label class="form-label"
                                                                for="multicol-confirm-password">Confirm Password</label>

                                                            <input type="password" name="password_confirm" value=""
                                                                id="multicol-confirm-password" class="form-control"
                                                                placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
                                                                aria-describedby="multicol-confirm-password2" />
                                                            @error('password_confirm')
                                                                <p class="text-xs text-red-500">{{ $message }}</p>
                                                            @enderror
                                                            <span class="input-group-text cursor-pointer"
                                                                id="multicol-confirm-password2"><i
                                                                    class="bx bx-hide"></i></span>

                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="pt-4 ">
                                                    <button type="submit"
                                                        class="btn btn-primary me-sm-3 me-1 mt-5">Submit</button>

                                                </div>
                                            </form>

                                            <!-- Preview Image -->



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

                var form = document.getElementById('songForm');
                form.addEventListener('submit', function(event) {
                    event.preventDefault();


                    var songAddedSuccessfully = true;

                    if (songAddedSuccessfully) {
                        swal("Success", "Song added successfully", "success").then(function() {

                            window.location.href = "{{ route('admin.song.index') }}";
                        });
                    } else {

                        swal("Error", "Failed to add song", "error");
                    }
                });
            });
        </script>

        {{-- <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            swal("Success", "{{ session('success') }}", "success");
        });
    </script> --}}

    </x-backend.app-layout>

</x-backend.app-layout>
