<x-add.app-layout>

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
                    <div class="page-header-title">
                        <h4 class="pull-left page-title">Profile</h4>
                        <ol class="breadcrumb pull-right">

                        </ol>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-12">
                    <div class="panel panel-primary">






                        <div class="panel-body"
                            style="background:lightgrey>
                         

                             






                               


                                <h3 class="header-title
                            m-t-0"><small>Show Ad</small></h3>
                            <div class="m-t-20">
                                <form class="" action="{{ route('update-profile') }}"
                                    enctype="multipart/form-data" method="POST">
                                    @csrf
                                    <div class="row">
                                        <div class="col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Advertisment Partner's Name</label>
                                                <input type="text" class="form-control" id="name" name="fullname"
                                                    value="{{ $advertiser->name }}"
                                                    placeholder="Advertisment Partner Name" required>
                                                <div class="error-message" id="nameError" style="color: red;"></div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Advertisment Partner's Email</label>
                                                <input type="email" name="email" id="email" class="form-control"
                                                    value="{{ $advertiser->email }}"
                                                    placeholder="Advertisment Partner Email" required>
                                                <div class="error-message" id="emailError" style="color: red;"></div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Advertisment Partner's Mobile Number</label>
                                                <div class="input-group">
                                                    <span class="input-group-addon">
                                                        <img src="{{ asset('assets\images\india-flag-icon.svg') }}"
                                                            alt="India Flag" style="height: 20px; width: auto;">
                                                    </span>
                                                    <input type="text" value="{{ $advertiser->mobile }}"
                                                        name="mobile" id="mobile" class="form-control"
                                                        placeholder="Enter your mobile number" required>
                                                </div>
                                                <div class="error-message" id="mobileError" style="color: red;"></div>
                                            </div>
                                        </div>


                                      











                                        <div class="col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Advertisment Business Type</label>
                                                <select type="text" name="business_type" class="form-control custom-input" id="input4">
                                                    <option value="">Select Business Type</option>
                                                    @foreach ($addcategories as $category)
                                                        <option value="{{$category->id}}" @if($category->id == $advertiser->business_type) selected @endif>{{$category->title}}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                            <div class="error-message" id="business_typeError" style="color: red;">
                                            </div>
                                        </div>
                                        <div class="col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Advertisment Business Name</label>
                                                <input type="text" name="business_name" id="business_name"
                                                    value="{{ $advertiser->business_name }}" class="form-control"
                                                    placeholder="Advertisment Business Name" required />
                                            </div>
                                            <div class="error-message" id="business_nameError" style="color: red;">
                                            </div>
                                        </div>
                                        <div class="col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Advertisment Business Webiste Link</label>
                                                <input type="text" value="{{ $advertiser->url }}" name="url"
                                                    id="url" class="form-control"
                                                    placeholder="Advertisment Partner Website Url" required />
                                            </div>
                                        </div>
                                        <div class="col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Advertisment Partners's Area/Market/Colony</label>
                                                <input type="text" value="{{ $advertiser->area }}" name="area"
                                                    id="area" class="form-control"
                                                    placeholder="Advertisment Partner Locality" required />
                                            </div>
                                            <div class="error-message" id="areaError" style="color: red;"></div>
                                        </div>
                                        <div class="col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Advertisment Partner's City</label>
                                                <input type="text" value="{{ $advertiser->city }}" name="city"
                                                    id="city" class="form-control"
                                                    placeholder="Advertisment Partner city" required />
                                            </div>
                                            <div class="error-message" id="areaCity" style="color: red;"></div>
                                        </div>
                                        <div class="col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Advertisment Partner's State</label>
                                                <input type="text" value="{{ $advertiser->state }}" name="state"
                                                    id="city" class="form-control"
                                                    placeholder="Advertisment Partner State" required />
                                            </div>
                                            <div class="error-message" id="stateCity" style="color: red;"></div>
                                        </div>




                                        <div class="col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Locality Zipcode</label>
                                                <input type="text" value="{{ $advertiser->zipcode }}"
                                                    name="zipcode" id="zipcode" class="form-control"
                                                    placeholder="Advertisment Partner zipcode" required/>
                                            </div>
                                            <div class="error-message" id="zipcodeError" style="color: red;"></div>
                                        </div>





















                                        <div class="col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label for="business_document">Business Document Proof</label>
                                                <input type="file" name="business_document[]" id="business_document" class="form-control" placeholder="Advertisement Partner Business Document" multiple  />
                                            </div>
                                            <hr>
                                            @if($advertiser->business_document)
                                            <div>
                                                
                                                @foreach(explode(',', $advertiser->business_document) as $document)
                                                    <img style="max-width: 200px;
                                                    max-height: 200px;
                                                    border-radius: 10px; padding: 5px;" src="{{ asset('storage/' . $document) }}" alt="Business Document">
                                                @endforeach
                                            </div>
                                            @endif
                                            <hr>
                                        </div>
                                        
                                    
                                        <!-- Personal Documents -->
                                        <div class="col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label for="personal_documents">Personal Documents</label>
                                                <input type="file" name="personal_documents[]" id="personal_documents" class="form-control" placeholder="Advertisement Partner Personal Documents" multiple  />
                                            </div>
                                            <hr>
                                            @if($advertiser->personel_documents)
                                            <div>
                                                
                                                @foreach(explode(',', $advertiser->personel_documents) as $document)
                                                    <img style="max-width: 200px;
                                                    max-height: 200px;
                                                    border-radius: 10px; padding: 5px;" src="{{ asset('storage/' . $document) }}" alt="Personel Documents ">
                                                @endforeach
                                            </div>
                                            @endif
                                            <hr>
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
                                                class="btn btn-primary waves-effect waves-light">Submit</button>
                                            <a style="    padding-left: 58px;
                                                padding-right: 50px;
                                                font-size: large;
                                            }"
                                                href="{{ route('add.dashboard') }}" type="reset"
                                                class="btn btn-default waves-effect m-l-5">Cancel</a>
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




</x-add.app-layout>
