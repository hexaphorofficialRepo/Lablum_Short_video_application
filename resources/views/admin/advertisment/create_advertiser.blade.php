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
                            <h3 class="panel-title">Add Advertismnet Partners</h3>
                        </div>
                        <div class="panel-body">
                           
                                    <h3 class="header-title m-t-0"><small>Add Advertisment Partners Here </small></h3>
                                    <div class="m-t-20">
                                        <form class="" action="{{route('admin.store.advertiser')}}" enctype="multipart/form-data" method="POST">
                                            @csrf
                                            <div class="row">
                                                <div class="col-sm-6 col-xs-12">
                                                    <div class="form-group">
                                                        <label>Advertisment Partner's Name</label>
                                                        <input type="text" class="form-control" id="name" name="name"  placeholder="Advertisment Partner Name">
                                                        <div class="error-message" id="nameError" style="color: red;"></div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 col-xs-12">
                                                    <div class="form-group">
                                                        <label>Advertisment Partner's Email</label>
                                                        <input type="email" name="email" id="email" class="form-control" placeholder="Advertisment Partner Email" required>
                                                        <div class="error-message" id="emailError" style="color: red;"></div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 col-xs-12">
                                                    <div class="form-group">
                                                        <label>Advertisment Partner's Mobile Number</label>
                                                        <div class="input-group">
                                                            <span class="input-group-addon">
                                                                <img src="{{asset('assets\images\india-flag-icon.svg')}}" alt="India Flag" style="height: 20px; width: auto;">
                                                            </span>
                                                            <input type="text" name="mobile" id="mobile" class="form-control" placeholder="Enter your mobile number" required>
                                                        </div>
                                                        <div class="error-message" id="mobileError" style="color: red;"></div>
                                                    </div>
                                                </div>
                                                
                                                <div class="col-sm-6 col-xs-12">
                                                    <div class="form-group">
                                                        <label>Advertisment Business Type</label>
                                                        <input type="text" name="business_type"
                                                            id="business_type" class="form-control"
                                                            placeholder="Advertising Business Type " />
                                                    </div>
                                                    <div class="error-message" id="business_typeError" style="color: red;"></div>
                                                </div>
                                                <div class="col-sm-6 col-xs-12">
                                                    <div class="form-group">
                                                        <label>Advertisment Business Name</label>
                                                        <input type="text" name="business_name"
                                                            id="business_name" class="form-control"
                                                            placeholder="Advertisment Business Name" />
                                                    </div>
                                                    <div class="error-message" id="business_nameError" style="color: red;"></div>
                                                </div>
                                                <div class="col-sm-6 col-xs-12">
                                                    <div class="form-group">
                                                        <label>Advertisment Business Webiste Link</label>
                                                        <input type="text" name="url"
                                                            id="url" class="form-control"
                                                            placeholder="Advertisment Partner Website Url" />
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 col-xs-12">
                                                    <div class="form-group">
                                                        <label>Advertisment Partners's Area/Market/Colony</label>
                                                        <input type="text" name="area"
                                                            id="area" class="form-control"
                                                            placeholder="Advertisment Partner Locality" />
                                                    </div>
                                                    <div class="error-message" id="areaError" style="color: red;"></div>
                                                </div>
                                                <div class="col-sm-6 col-xs-12">
                                                    <div class="form-group">
                                                        <label>Advertisment Partner's City</label>
                                                        <input type="text" name="city"
                                                            id="city" class="form-control"
                                                            placeholder="Advertisment Partner city" />
                                                    </div>
                                                    <div class="error-message" id="areaCity" style="color: red;"></div>
                                                </div>
                                                <div class="col-sm-6 col-xs-12">
                                                    <div class="form-group">
                                                        <label>Advertisment Partner's State</label>
                                                        <select type="text" name="state"
                                                            id="state" class="form-control"
                                                            placeholder="Advertisment Partner state" >
                                                            <option value=""> Select State</option>
                                                            @foreach($states as $state)
                                                            <option value="{{$state->name}}"> {{$state->name}}</option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                    <div class="error-message" id="areaState" style="color: red;"></div>
                                                </div>



                                                <div class="col-sm-6 col-xs-12">
                                                    <div class="form-group">
                                                        <label>Locality Zipcode</label>
                                                        <input type="text" name="zipcode"
                                                            id="zipcode" class="form-control"
                                                            placeholder="Advertisment Partner zipcode" />
                                                    </div>
                                                    <div class="error-message" id="zipcodeError" style="color: red;"></div>
                                                </div>


                                                <div class="col-sm-6 col-xs-12">
                                                    <div class="form-group">
                                                        <label class="mb-1">Password <span style="color: red;">*</span></label>
                                                        <div class="position-relative">
                                                            <input type="password" name="password" id="password" class="form-control rounded password-input"
                                                                placeholder="Password*" aria-describedby="password-toggle">
                                                            <i class="fa fa-eye-slash password-toggle-icon" aria-hidden="true" onclick="togglePassword('password')"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 col-xs-12">
                                                    <div class="form-group">
                                                        <label class="mb-1">Confirm Password <span style="color: red;">*</span></label>
                                                        <div class="position-relative">
                                                            <input type="password" name="password_confirmation" id="password_confirmation" class="form-control rounded password-input"
                                                                placeholder="Confirm Password" onkeyup="checkPasswordMatch()">
                                                            <i class="fa fa-eye-slash password-toggle-icon" aria-hidden="true" onclick="togglePassword('password_confirmation')"></i>
                                                        </div>
                                                        <div class="error-message" id="password-match-error" style="color: red; display: none;">Passwords do not match.</div>
                                                    </div>
                                                </div>
                                                
                                                <script>
                                                    function togglePassword(fieldId) {
                                                        var x = document.getElementById(fieldId);
                                                        if (x.type === "password") {
                                                            x.type = "text";
                                                            document.querySelector(`#${fieldId} + .fa-eye-slash`).classList.remove('fa-eye-slash');
                                                            document.querySelector(`#${fieldId} + .fa`).classList.add('fa-eye');
                                                        } else {
                                                            x.type = "password";
                                                            document.querySelector(`#${fieldId} + .fa-eye`).classList.remove('fa-eye');
                                                            document.querySelector(`#${fieldId} + .fa`).classList.add('fa-eye-slash');
                                                        }
                                                    }
                                                
                                                    function checkPasswordMatch() {
                                                        var password = document.getElementById("password").value;
                                                        var confirmPassword = document.getElementById("password_confirmation").value;
                                                        var errorDiv = document.getElementById("password-match-error");
                                                
                                                        if (password !== confirmPassword) {
                                                            errorDiv.style.display = "block";
                                                        } else {
                                                            errorDiv.style.display = "none";
                                                        }
                                                    }
                                                </script>
                                                














                                                <div class="col-sm-6 col-xs-12">
                                                    <div class="form-group">
                                                        <label for="business_document">Business Document Proof</label>
                                                        <input type="file" name="business_document[]" id="business_document" class="form-control" placeholder="Advertisement Partner Business Document" required multiple onchange="previewBusinessDocuments(event)" />
                                                    </div>
                                                    <!-- Preview Business Document Images -->
                                                    <hr>
                                                    <div id="businessDocumentPreview"></div>
                                                    <hr>
                                                </div>
                                                
                                                <div class="col-sm-6 col-xs-12">
                                                    <div class="form-group">
                                                        <label for="personel_documents">Personal Documents</label>
                                                        <input type="file" name="personal_documents[]" id="personal_documents" class="form-control" placeholder="Advertisement Partner Personal Documents" required multiple onchange="previewPersonalDocuments(event)" />
                                                    </div>
                                                    <!-- Preview Personal Document Images -->
                                                    <hr>
                                                    <div id="personalDocumentPreview"></div>
                                                    <hr>
                                                </div>
                                                
                                                <script>
                                                    function previewBusinessDocuments(event) {
                                                        const files = event.target.files;
                                                        const previewContainer = document.getElementById('businessDocumentPreview');
                                                        previewContainer.innerHTML = ''; // Clear previous previews
                                                        for (const file of files) {
                                                            const reader = new FileReader();
                                                            reader.onload = function (e) {
                                                                const image = document.createElement('img');
                                                                image.src = e.target.result;
                                                                image.style.maxWidth = '150px'; // Adjust as needed
                                                                image.style.maxHeight = '130px'; // Adjust as needed
                                                                image.style.padding = '7px'; // Adjust as needed
                                                                image.style.borderRadius = '20px'; // Corrected property name
                                                                previewContainer.appendChild(image);
                                                            }
                                                            reader.readAsDataURL(file);
                                                        }
                                                    }
                                                
                                                    function previewPersonalDocuments(event) {
                                                        const files = event.target.files;
                                                        const previewContainer = document.getElementById('personalDocumentPreview');
                                                        previewContainer.innerHTML = ''; // Clear previous previews
                                                        for (const file of files) {
                                                            const reader = new FileReader();
                                                            reader.onload = function (e) {
                                                                const image = document.createElement('img');
                                                                image.src = e.target.result;
                                                                image.style.maxWidth = '150px'; // Adjust as needed
                                                                image.style.maxHeight = '130px'; // Adjust as needed
                                                                image.style.padding = '7px'; // Adjust as needed
                                                                image.style.borderRadius = '20px'; // Corrected property name
                                                                previewContainer.appendChild(image);
                                                            }
                                                            reader.readAsDataURL(file);
                                                        }
                                                    }
                                                </script>
                                                
                                                
                                            </div>















                                            <div class="form-group" style="display: flex; justify-content: center">
                                                <div>
                                                    <button style="    padding-left: 58px;
                                                    padding-right: 50px;
                                                    font-size: large; margin-right: 20px;
                                                }" type="submit"
                                                        class="btn btn-primary waves-effect waves-light">Submit</button>
                                                    <a style="    padding-left: 58px;
                                                    padding-right: 50px;
                                                    font-size: large;
                                                }" href="{{ route('admin.advertiser.list') }}" type="reset"
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
