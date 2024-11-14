<x-backend.app-layout>
    <style>
        .password-toggle-icon {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            z-index: 1;
        }
    
        .password-input {
            padding-right: 30px;
        }
    </style>

    <div class="content">
        <div class="container">

            <div class="row">
                <div class="col-sm-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Update Admin Password</h3>
                        </div>
                        <div class="panel-body">
                           
                                    <h3 class="header-title m-t-0"><small>Update Admin Password </small></h3>
                                    <div class="m-t-20">
                                        <form class="" enctype="multipart/form-data" method="POST" action="{{ route('admin.update.password') }}">
                                            @csrf
                                            <div class="row">
                                                <div class="col-sm-6 col-xs-12">
                                                    <div class="form-group">
                                                        <label>Old Password</label>
                                                        <input type="password" class="form-control" id="old_password" name="old_password" placeholder="Old Password">
                                                        @error('old_password')
                                                            <div class="error-message" style="color: red;">{{ $message }}</div>
                                                        @enderror
                                                    </div>
                                                </div>
                                               
                                                <div class="col-sm-6 col-xs-12">
                                                    <div class="form-group">
                                                        <label>New Password</label>
                                                        <input type="password" class="form-control" id="new_password" name="new_password" placeholder="New Password">
                                                        @error('new_password')
                                                            <div class="error-message" style="color: red;">{{ $message }}</div>
                                                        @enderror
                                                    </div>
                                                </div>
                                                
                                                <div class="col-sm-6 col-xs-12">
                                                    <div class="form-group">
                                                        <label>Confirm Password</label>
                                                        <input type="password" class="form-control" id="password_confirmation" name="password_confirmation" placeholder="Confirm Password">
                                                        @error('password_confirmation')
                                                            <div class="error-message" style="color: red;">{{ $message }}</div>
                                                        @enderror
                                                    </div>
                                                </div>
                                            </div>
                                        
                                            <div class="form-group" style="display: flex; justify-content: center">
                                                <div>
                                                    <button style="padding-left: 58px; padding-right: 50px; font-size: large; margin-right: 20px;" type="submit" class="btn btn-primary waves-effect waves-light">Submit</button>
                                                    <a style="padding-left: 58px; padding-right: 50px; font-size: large;" href="{{ route('admin.blog.category.index') }}" type="reset" class="btn btn-default waves-effect m-l-5">Cancel</a>
                                                </div>
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
