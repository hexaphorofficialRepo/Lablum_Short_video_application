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

        .image-preview {
            margin-top: 20px;
        }

        .image-preview img {
            max-width: 350px;
            max-height: 200px;
            width: auto;
            height: auto;
        }
    </style>

    <div class="content">
        <div class="container">

            <div class="row">
                <div class="col-sm-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Add Advertisement Banner</h3>
                        </div>
                        <div class="panel-body">

                            <h3 class="header-title m-t-0"><small>Add Advertisement Banner</small></h3>
                            <div class="m-t-20">
                                <form action="{{ route('admin.add.banner.store') }}" enctype="multipart/form-data" method="POST">
                                    @csrf
                                    <div class="row">
                                        <div class="col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Advertiser Name <span style="color: red">*</span></label>
                                                <input type="text" name="name" class="form-control" value="{{ old('name') }}" placeholder="Advertiser Name">
                                                @error('name')
                                                    <div class="invalid-feedback" style="color: red">{{ $message }}</div>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Company/Organization Name <span style="color: red">*</span></label>
                                                <input type="text" class="form-control" name="org_name" value="{{ old('org_name') }}" placeholder="Company ">
                                                @error('org_name')
                                                    <div class="invalid-feedback" style="color: red">{{ $message }}</div>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Business Type</label>
                                                <input type="text" name="business_type" class="form-control" value="{{ old('business_type') }}" placeholder="Enter Business Type">
                                                @error('business_type')
                                                    <div class="invalid-feedback" style="color: red">{{ $message }}</div>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Website Url</label>
                                                <input type="text" name="url" class="form-control" value="{{ old('url') }}" placeholder="Enter Redirect Url">
                                                @error('url')
                                                    <div class="invalid-feedback" style="color: red">{{ $message }}</div>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Publish Date</label>
                                                <input type="date" name="active_date" class="form-control" value="{{ old('active_date') }}" placeholder="Publish Date">
                                                @error('active_date')
                                                    <div class="invalid-feedback" style="color: red">{{ $message }}</div>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Expire Date</label>
                                                <input type="date" name="expire_date" class="form-control" value="{{ old('expire_date') }}" placeholder="Publish Date">
                                                @error('expire_date')
                                                    <div class="invalid-feedback" style="color: red">{{ $message }}</div>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Advertisement Banner</label>
                                                <input type="file" name="banner" class="form-control" id="banner">
                                                @error('banner')
                                                    <div class="invalid-feedback" style="color: red">{{ $message }}</div>
                                                @enderror
                                            </div>
                                            <div class="image-preview" id="image-preview">
                                                <!-- Existing image -->
                                                <img src="/path/to/existing/image.jpg" alt="Existing Banner">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group" style="display: flex; justify-content: center">
                                        <div>
                                            <button type="submit" class="btn btn-primary waves-effect waves-light" style="padding-left: 58px; padding-right: 50px; font-size: large; margin-right: 20px;">Submit</button>
                                            <a href="{{ route('admin.earning.list') }}" type="reset" class="btn btn-default waves-effect m-l-5" style="padding-left: 58px; padding-right: 50px; font-size: large;">Cancel</a>
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

    <script>
        document.getElementById('banner').addEventListener('change', function(event) {
            var preview = document.getElementById('image-preview');
            var file = event.target.files[0];
            var reader = new FileReader();

            reader.onload = function(e) {
                var img = document.createElement('img');
                img.src = e.target.result;
                img.alt = 'Banner Preview';

                // Clear any existing images and append the new one
                preview.innerHTML = '';
                preview.appendChild(img);
            };

            reader.readAsDataURL(file);
        });
    </script>
</x-backend.app-layout>
