<header>


    <style>
        .verification-btn1 a {
            pointer-events: none;
        }

        .verification-btn button {
            pointer-events: none;
        }
    </style>
    <div id="sticky-header" class="tg-header__area" style="padding: 1px;">
        <div class="container custom-container">
            <div class="row">
                <div class="col-12">
                    <div class="mobile-nav-toggler">
                        <i class="flaticon-menu-1"></i>
                    </div>
                    <div class="tgmenu__wrap">
                        <nav class="tgmenu__nav">
                            <div class="logo">
                                <a href="{{ route('frontend.home') }}"><img
                                        src="{{ asset('assets/images/all-img/lablum_logo.png') }}" alt="Logo"></a>
                            </div>

                            <div class="tgmenu__navbar-wrap tgmenu__main-menu d-none d-lg-flex">
                                <ul class="navigation">
                                    <li class="">
                                        <a href="{{ route('frontend.home') }}" class="active-menu">
                                            Home
                                        </a>

                                    </li>
                                    <li>
                                        <a href="{{ route('frontend.about') }}">
                                            About
                                        </a>

                                    </li>
                                    <li class="menu-item-has-children">
                                        <a href="{{ route('frontend.blog') }}">Blog </a>
                                        <!-- <ul class="sub-menu">
                        <li>
                          <a href="blog-sidebar.html">
                            Blog Sidebar
                          </a>
                        </li>
                        <li>
                          <a href="blog-modern.html">
                            Blog Modern
                          </a>
                        </li>
                        <li>
                          <a href="blog-modern.html">
                            Blog Modern
                          </a>
                        </li>
                        <li>
                          <a href="blog-list.html">
                            Blog List
                          </a>
                        </li>
                        <li>
                          <a href="blog-details.html">
                            Blog Details
                          </a>
                        </li>
                      </ul> -->
                                    </li>
                                    <!-- <li class="menu-item-has-children">
                      <a href="#"> Projects </a>
                      <ul class="sub-menu">
                        <li>
                          <a href="case-study.html">
                            Case Study
                          </a>
                        </li>
                        <li>
                          <a href="case-masonary.html">
                            Case Masonary
                          </a>
                        </li>
                        <li>
                          <a href="case-metro.html">
                            Case Metro
                          </a>
                        </li>
                        <li>
                          <a href="project-details.html">
                            Case Details
                          </a>
                        </li>
                      </ul>
                    </li> -->

                                    <li>
                                        <a href="{{ route('frontend.contact') }}">
                                            Contact
                                        </a>
                                    </li>



                                </ul>
                            </div>
                            <div class="tgmenu__action  d-md-block">
                                <ul class="list-wrap">
                                    <!-- <li class="header-search">
                      <a href="#" class="search search--button">
                        <img src="assets/img/icons/search-icon.svg" alt="Search">
                      </a>
                    </li> -->
                                    <li class="header-btn">
                                        <a href="#" class="btn Book-Btn" id="openModal">Book your
                                            Advertisement</a>
                                    </li>

                                    <li class="verification-btn1" style="text-align: center;">
                                        <a href="#" class="btn Verification-Btn" id="openVerificationModal"
                                            style="color: aliceblue;
                      font-size: 16px;">Verify <i
                                                class="fas fa-check-circle"></i></a>

                                    </li>

                                    <div id="myModalMobBlue1" class="modal">
                                        <div class="modal-overlay"></div>
                                        <div class="modal-content">
                                            <span class="Blue-close1"
                                                style="display: flex;justify-content: end;">&times;</span>
                                            <!-- Your sign up form goes here -->
                                            <form id="signupFormMob1">


                                                <h4 style="margin-bottom: 20px;text-align: center;">Get your Account
                                                    Verified :</h4>

                                                <div class="row">
                                                    <div class="col-lg-6 col-md-12">
                                                        <div class="form-group">
                                                            <label for="fullname">Name:</label>
                                                            <input type="text" name="fullname" class="form-control"
                                                                placeholder="full name">
                                                        </div>
                                                    </div>




                                                    <div class="col-lg-6 col-md-12">
                                                        <div class="form-group">
                                                            <label for="Name">Username:</label>
                                                            <input type="text" name="Org" class="form-control"
                                                                placeholder="Username">
                                                        </div>
                                                    </div>
                                                </div>


                                                <div class="row">
                                                    <div class="col-lg-6 col-md-12">
                                                        <div class="form-group">
                                                            <label for="type">Mobile Number:</label>
                                                            <input type="text" name="Number" class="form-control"
                                                                placeholder="Mobile Number">
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6 col-md-12">
                                                        <div class="form-group">
                                                            <label for="Email">Email:</label>
                                                            <input type="email" name="Email" class="form-control"
                                                                placeholder="Email">
                                                        </div>
                                                    </div>
                                                </div>


                                                <div class="row" style="margin-bottom: 30px;">
                                                    <div class="col-lg-6">
                                                        <label for="Doc">Documents:</label>
                                                        <input type="file" name="Doc" id="fileUpload"
                                                            class="form-control" placeholder="Documents" multiple
                                                            onchange="displayUploadedFiles()">
                                                    </div>
                                                </div>
                                                <div id="uploadedFiles"></div>

                                                <script>
                                                    function displayUploadedFiles() {
                                                        var files = document.getElementById("fileUpload").files;
                                                        var uploadedFilesDiv = document.getElementById("uploadedFiles");
                                                        uploadedFilesDiv.innerHTML = "";

                                                        for (var i = 0; i < files.length; i++) {
                                                            var file = files[i];
                                                            var fileReader = new FileReader();

                                                            fileReader.onload = function(event) {
                                                                var img = document.createElement("img");
                                                                img.src = event.target.result;
                                                                img.style.maxWidth = "100px"; // Adjust as needed
                                                                img.style.maxHeight = "100px"; // Adjust as needed
                                                                uploadedFilesDiv.appendChild(img);
                                                            };

                                                            fileReader.readAsDataURL(file);
                                                        }
                                                    }
                                                </script>






                                                <div class="form-group" style="text-align: center;">
                                                    <a href="updateInfo.html">
                                                        <button type="button" class="btn btn-primary">Submit</button>
                                                    </a>
                                                </div>


                                            </form>
                                        </div>
                                    </div>


                                    <!-- Modal HTML -->
                                    <div id="myModal" class="modal">
                                        <div class="modal-overlay"></div>
                                        <div class="modal-content Log">
                                            <span class="close"
                                                style="display: flex;justify-content: end;">&times;</span>
                                            <!-- Your login form goes here -->
                                            <form action="{{ route('add.login') }}" method="POST" id="loginForm">
                                                @csrf
                                                <h2>Login</h2>
                                                <div class="form-group">
                                                    <label for="username">Email:</label>
                                                    <input type="text" id="username" name="email"
                                                        placeholder="Enter your username">
                                                </div>
                                                <div class="form-group">
                                                    <label>Password</label>
                                                    <div class="position-relative">
                                                        <input type="password" class="form-control" name="password"
                                                            value="" placeholder="Password"
                                                            id="password-input-Log">
                                                        <span class="eye-icon-box">
                                                            <span class="eye-icon">
                                                                <i class="fas fa-eye" id="toggleCon-passwordLog"></i>
                                                            </span>
                                                        </span>
                                                    </div>
                                                </div>
                                                <div class="form-group" style="text-align: center;">
                                                    <button type="submit" class="btn">Login</button>
                                                </div>
                                                <div class="form-group" style="    display: flex;gap: 10px;text-align: center;flex-wrap: wrap;">
                                                    
                                                    <button type="button" class="signup-btn"
                                                        style="font-size: 14px;">Sign Up</button>
                                                      <div class="forget-btn"> <a href="{{route('email.page.password')}}"style="font-size: 14px; color:#fff;">Forgot
                                                            Password?</a></div> 
                                                </div>
                                            </form>
                                        </div>
                                    </div>









                                </ul>
                            </div>
                        </nav>
                    </div>
                    <!-- Search -->
                    <form action="#" class="search-block">
                        <div class="search-block__container" style="background: #E35681;">
                            <span id="close-search" class="search-block__close">
                                <i class="fa-solid fa-xmark"></i>
                            </span>
                            <div class="search-block__input">
                                <input class="search-block__field-input" type="text"
                                    placeholder="Enter Your Keywords...">
                            </div>
                        </div>
                    </form>
                    <!-- Search End -->

                    <!-- Mobile Menu  -->
                    <div class="tgmobile__menu">
                        <nav class="tgmobile__menu-box">
                            <div class="close-btn"><i class="flaticon-close-1"></i></div>
                            <div class="nav-logo">
                                <a href="{{ route('frontend.home') }}"><img
                                        src="{{ asset('frontend/img/logo/lablum_logo.png') }}" alt="Logo"></a>
                            </div>

                            <div class="tgmobile__menu-outer">
                                <!--Here Menu Will Come Automatically Via Javascript / Same Menu as in Header-->
                            </div>
                            <!-- Insert the "Book Advertisement" button here -->
                            <div class="mobile-book-ad"
                                style="display: flex;justify-content: center;align-items: center;padding: 26px;">
                                <a href="#" class="btn Book-Btn" id="openModalMob">Book your Advertisement</a>
                            </div>


                            <!-- Blue tick verification button -->
                            <div class="verification-btn" style="text-align: center;">
                                <button class="btn Verification-Btn" id="openVerificationModal-Mob">Verify <i
                                        class="fas fa-check-circle"></i></button>
                            </div>














                            <!-- End of "Book Advertisement" button -->
                            <div class="social-links">
                                <ul class="list-wrap">
                                    <li>
                                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                                    </li>
                                    <li>
                                        <a href="#"><i class="fab fa-twitter"></i></a>
                                    </li>
                                    <li>
                                        <a href="#"><i class="fab fa-instagram"></i></a>
                                    </li>
                                    <li>
                                        <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                    </li>
                                    <li>
                                        <a href="#"><i class="fab fa-youtube"></i></a>
                                    </li>
                                </ul>
                            </div>
                        </nav>
                    </div>



                    <!-- Blue tick Modal (Mobile) -->

                  




                    <!-- Modal HTML -->
                    <div id="myModalMob" class="modal">
                        <div class="modal-overlay"></div>
                        <div class="modal-content Log">
                            <span class="close" style="display: flex;justify-content: end;">&times;</span>
                            <!-- Your login form goes here -->
                            <form id="loginForm">
                                <h2>Login</h2>
                                <div class="form-group">
                                    <label for="username">Username:</label>
                                    <input type="text" id="usernameMob" placeholder="Enter your username">
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <div class="position-relative">
                                        <input type="password" class="form-control" name="password" value=""
                                            placeholder="Password" id="password-input-Log-Mob">
                                        <span class="eye-icon-box">
                                            <span class="eye-icon">
                                                <i class="fas fa-eye" id="toggleConMob-passwordLog"></i>
                                            </span>
                                        </span>
                                    </div>
                                </div>
                                <div class="form-group" style="text-align: center;">
                                    <button type="submit" class="btn">Login</button>
                                </div>
                              
                            </form>
                            <div class="form-group">
                                <a href="{{route('email.page.password')}}"  style="font-size: 14px;">Forgot
                                    Password?</a>
                                <button type="button" class="signup-btn siggnup-btn "
                                    style="font-size: 14px;">Sign Up</button>
                            </div>
                        </div>
                    </div>


                  







                    <div class="tgmobile__menu-backdrop"></div>
                    <!-- End Mobile Menu -->

                    <div class="tgmobile__menu-backdrop"></div>
                    <!-- End Mobile Menu -->
                </div>
            </div>
        </div>
    </div>

    <div id="signupModal" class="modal">
        <div class="modal-overlay"></div>
        <div class="modal-content">
            <span class="close" style="display: flex;justify-content: end;">&times;</span>
            <!-- Your sign up form goes here -->
            <form id="signupForm" action="{{ route('frontend.adds.register') }}" method="POST">
                @csrf
                <h2>Sign Up</h2>

                <h4 style="margin-bottom: 20px;text-align: center;">Create your
                    Business Account :</h4>

                <div class="row">
                    <div class="col-lg-6 col-md-12">
                        <div class="form-group">
                            <label for="fullname">Name:</label>
                            <input type="text" id="fullname" name="fullname" class="form-control"
                                placeholder="full name">
                        </div>
                    </div>




                    <div class="col-lg-6 col-md-12">
                        <div class="form-group">
                            <label for="Name">Business Name:</label>
                            <input type="text" id="business_name" name="business_name" class="form-control"
                                placeholder="Business Name">
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-lg-6 col-md-12">
                        <div class="form-group">
                            <label for="type">Business type:</label>
                            <select type="text" id="business_type" name="business_type" class="form-control"
                                placeholder="Business type">
                                <option value=""> Select Business Type</option>
                                @foreach ($addcategories as $category)
                                    <option value="{{ $category->id }}"> {{ $category->title }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12">
                        <div class="form-group">
                            <label for="Email">Email:</label>
                            <input type="email" id="Email" name="email" class="form-control"
                                placeholder="Email">
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-lg-6 col-md-12">
                        <div class="form-group">
                            <label for="Mob">Mobile Number:</label>
                            <input type="text" id="mobile" name="mobile" class="form-control"
                                placeholder=" Mobile Number " style="padding: 10px;">
                        </div>
                    </div>

                    <div class="col-lg-6 col-md-12">
                        <div class="form-group">
                            <label for="Web">Website URL:</label>
                            <input type="text" id="url" name="url" class="form-control"
                                placeholder="Website URL">
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-lg-6 col-md-12">
                        <div class="form-group">
                            <label>Password</label>
                            <div class="position-relative">
                                <input type="password" class="form-control" name="password" value=""
                                    placeholder="Password" id="pass" required>
                                <span class="eye-icon-box">
                                    <span class="eye-icon">
                                        <i class="fas fa-eye" id="toggle-password"></i>
                                    </span>
                                </span>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6 col-md-12">
                        <div class="form-group">
                            <label>Confirm Password</label>
                            <div class="position-relative">
                                <input type="password" class="form-control" name="password_confirmation"
                                    value="" placeholder="Confirm Password" id="password-input-con" required>
                                <span class="eye-icon-box">
                                    <span class="eye-icon">
                                        <i class="fas fa-eye" id="toggleCon-password"></i>
                                    </span>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>





                <div class="form-group" style="text-align: center;">
                    {{-- <a href="updateInfo.html"> --}}
                    <button type="submit" class="btn btn-primary">Signn
                        Up</button>
                    {{-- </a> --}}
                </div>


            </form>









        </div>
    </div>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#signupForm').submit(function(event) {
                var password = $('#pass').val();
                var confirmPassword = $('#password-input-con').val();

                if (password != confirmPassword) {
                    alert("Passwords do not match");
                    event.preventDefault();
                }
            });
        });
    </script>
</header>
