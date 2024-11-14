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
                            <h3 class="panel-title">Add Here Earning Points Variations</h3>
                        </div>
                        <div class="panel-body">

                            <h3 class="header-title m-t-0"><small>Add Earning Points Here </small></h3>
                            <div class="m-t-20">
                                <form class="" action="{{route('admin.update.earning',$earning)}}"
                                    enctype="multipart/form-data" method="POST">
                                    @csrf
                                    <div class="row">
                                        <div class="col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Duration From <span>( in seconds)</span> <span
                                                        style="color: red">*</span></label>
                                                <input type="number" class="form-control" id="form" value="{{$earning->from}}" name="from"
                                                    placeholder="Duration From in Seconds">
                                                    @error('from')
                                                    <div class="invalid-feedback">{{ $message }}</div>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Duration To <span>( in seconds)</span> <span
                                                        style="color: red">*</span></label>
                                                <input type="number" class="form-control" id="to" value="{{$earning->to}}" name="to"
                                                    placeholder="Duration To in Seconds">
                                                    @error('to')
                                                    <div class="invalid-feedback">{{ $message }}</div>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Amount Per For Contain Writer</label>
                                                <div class="input-group">
                                                    <span class="input-group-addon">
                                                        <!-- Replace the flag icon with Font Awesome rupee icon -->
                                                        <i class="fas fa-rupee-sign"></i>
                                                    </span>
                                                    <input type="text" name="creator_points" value="{{$earning->creator_points}}" id="creator_points" class="form-control @error('creator_points') is-invalid @enderror" placeholder="Enter Contain writer Amount Per Video" value="{{ old('creator_points') }}" required>
                                                </div>
                                                @error('creator_points')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                                @enderror
                                            </div>
                                        </div>
                                        
                                        <div class="col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Amount Per Video For Viewer</label>
                                                <div class="input-group">
                                                    <span class="input-group-addon">
                                                        <!-- Replace the flag icon with Font Awesome rupee icon -->
                                                        <i class="fas fa-rupee-sign"></i>
                                                    </span>
                                                    <input type="text" name="viewer_points" id="viewer_points" value="{{$earning->viewer_points}}" class="form-control @error('viewer_points') is-invalid @enderror" placeholder="Enter Viewer Amount Per Video" value="{{ old('viewer_points') }}" required>
                                                </div>
                                                @error('viewer_points')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                                @enderror
                                            </div>
                                        </div>
                                        
                                        


                                    </div>















                                    <div class="form-group" style="display: flex; justify-content: center">
                                        <div>
                                            <button
                                                style="    padding-left: 58px;
                                                    padding-right: 50px;
                                                    font-size: large; margin-right: 20px;
                                                }"
                                                type="submit"
                                                class="btn btn-primary waves-effect waves-light">Update</button>
                                            <a style="    padding-left: 58px;
                                                    padding-right: 50px;
                                                    font-size: large;
                                                }"
                                                href="{{ route('admin.earning.list') }}" type="reset"
                                                class="btn btn-default waves-effect m-l-5">Cancel</a>
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
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Include jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script>
        // Validate form fields on input change
        document.addEventListener('input', function(event) {
            if (event.target.tagName.toLowerCase() === 'input' || event.target.tagName.toLowerCase() === 'select') {
                validateField(event.target);
            }
        });

        // Validate individual field
        function validateField(input) {
            let fieldName = input.getAttribute('name');
            let errorMessage = '';

            switch (fieldName) {
                case 'name':
                    errorMessage = validateName(input.value);
                    break;
                case 'email':
                    errorMessage = validateEmail(input.value);
                    break;
                case 'mobile':
                    errorMessage = validateMobile(input.value);
                    break;
                case 'business_type':
                    errorMessage = validateBusiness_type(input.value);
                    break;
                case 'business_name':
                    errorMessage = validateBusiness_name(input.value);
                    break;
                case 'area':
                    errorMessage = validateArea(input.value);
                    break;
                case 'city':
                    errorMessage = validateCity(input.value);
                    break;
                case 'state':
                    errorMessage = validateState(input.value);
                    break;
                case 'zipcode':
                    errorMessage = validateZipcode(input.value);
                    break;


                default:
                    errorMessage = '';
            }

            let errorDiv = document.getElementById(`${fieldName}Error`);
            if (errorMessage) {
                errorDiv.innerText = errorMessage;
            } else {
                errorDiv.innerText = '';
            }
        }

        // Validation functions for each field
        function validateName(name) {
            if (!name.trim()) {
                return 'Name is required.';
            }
            return '';
        }

        function validateEmail(email) {
            if (!email.trim()) {
                return 'Email is required.';
            }
            if (!/^\S+@\S+\.\S+$/.test(email)) {
                return 'Invalid email address.';
            }
            return '';
        }

        function validateMobile(mobile) {
            if (!mobile.trim()) {
                return 'Mobile number is required.';
            }

            return '';
        }

        function validateBusiness_type(business_type) {
            if (!business_type.trim()) {
                return 'Business Type is Required!!.';
            }

            return '';
        }

        function validateBusiness_name(business_name) {
            if (!business_type.trim()) {
                return 'Business Name is Required!!.';
            }

            return '';
        }

        function validateArea(area) {
            if (!area.trim()) {
                return 'Business Area/location is Required!!.';
            }

            return '';
        }

        function validateCity(city) {
            if (!city.trim()) {
                return 'Business in City is Required!!.';
            }

            return '';
        }

        function validateState(state) {
            if (!state.trim()) {
                return 'Business in  State/location is Required!!.';
            }

            return '';
        }

        function validateZipcode(zipcode) {
            if (!zipcode.trim()) {
                return 'Business Zipcode/location is Required!!.';
            }

            return '';
        }

        // Add similar validation functions for other fields if needed
    </script>



</x-backend.app-layout>
