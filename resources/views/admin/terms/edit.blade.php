<x-backend.app-layout>

    <div class="content">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Update {{$term->type}} Policies </h3>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <h3 class="header-title m-t-0"><small>Update {{$term->type}} Policies Here </small></h3>
                                    <div class="m-t-20">
                                        <form class="" action="{{route('admin.update.terms',$term)}}"  enctype="multipart/form-data" method="POST">
                                            @csrf
                                           
                                        
                                            <div class="col-sm-12 col-xs-12">
                                                <div class="form-group">
                                                    <label>Policies Type</label>
                                                    <select type="text" name="type" id="typew" class="form-control" required>
                                                        <option value="">Select Policy Type</option>
                                                        <option value="terms" {{ $term && $term->type == 'terms' ? 'selected' : '' }}>Terms and Condition</option>
                                                        <option value="privacy" {{ $term && $term->type == 'privacy' ? 'selected' : '' }}>Privacy Policies</option>
                                                        <option value="creator" {{ $term && $term->type == 'creator' ? 'selected' : '' }}>Content Creator Policies</option>
                                                        <option value="viewer" {{ $term && $term->type == 'viewer' ? 'selected' : '' }}>Content Viewer Policies</option>
                                                        <option value="advertisment" {{ $term && $term->type == 'advertisment' ? 'selected' : '' }}>Advertisement Policies</option>
                                                        <option value="official" {{ $term && $term->type == 'official' ? 'selected' : '' }}>Official Verification Policies</option>
                                                    </select>
                                                    @error('type')
                                                        <div class="error-message" style="color: red;">{{ $message }}</div>
                                                    @enderror
                                                </div>
                                            </div>
                                        
                                            <div class="form-group">
                                                <label for="terms">Terms And Condition</label>
                                                <textarea name="terms" id="terms" rows="50" class="form-control" placeholder="Enter Terms and Conditions">{{ $term ? $term->terms : '' }}</textarea>
                                                @error('terms')
                                                    <div class="error-message" style="color: red;">{{ $message }}</div>
                                                @enderror
                                            </div>
                                        
                                            <div class="form-group">
                                                <div>
                                                    <button type="submit" class="btn btn-primary waves-effect waves-light">Submit</button>
                                                    <a href="{{ route('admin.category.index') }}" type="reset" class="btn btn-default waves-effect m-l-5">Cancel</a>
                                                </div>
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