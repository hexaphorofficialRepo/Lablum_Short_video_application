<x-backend.app-layout>
    <style>
        .user-image {
            display: flex;
            justify-content: center;
        }

        .user-img {
            height: 250px;
            width: 250px;
            border-radius: 50%;
        }

        .user-prof {
            display: flex;
            justify-content: center;
        }

        .user-card {
            padding: 20px;
            background: #f3eeee;
            border-radius: 12px;
        }

        .user-num {
            padding: 10px 25px;
        }

        .user-num i {
            margin-right: 5px;
        }

        .user-add {
            padding: 10px;
        }

        .pad {
            padding: 10px 0
        }

        .btn-user {
            color: white;
            padding: 7px 13px;
            background: blueviolet;
            border-radius: 5px;
            float: right;
            margin: 10px;
        }
    </style>

    <div class="content">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="page-header-title">
                        <h4 class="pull-left page-title" style="font-size: 30px;"> User Complete Details </h4>
                        <ol class="breadcrumb pull-right">

                        </ol>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>



        <div class="row user-prof">
            <div class="col-md-9 user-card">


                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title" style="font-size: 2.125rem;">My Profile</h4>

                        <div class="row">
                            <div class="col-xl-4 col-sm-6 col-lg-4">
                                <div class="wsus__dash_info_img user-image">
                                    <img src="{{ asset('storage/profile_pic/' . $user->user_id . '/' . $user->user_dp) }}"
                                        alt="my images" class="img-fluid w-100 user-img">
                                </div>
                            </div>
                            <div class="col-xl-8 col-sm-6 col-lg-8" style="display: flex;">
                                <div class="wsus__dash_info_text">
                                    <h3><i class="fas fa-user" aria-hidden="true"></i> {{$user->fname}} {{$user->lname}}
                                    </h3>
                                    <a href="" class="user-num text-dark">{{$user->username}}</a>
                                    {{-- <div class="pad">

                                        <a href=""class="user-num text-dark">Mother:<span></span></a>



                                        <a href="" class="user-num text-dark">Gender: <span>
                                            @if($user->gender == 'm')
                                                Male
                                            @elseif($user->gender == 'f')
                                                Female
                                            @else
                                                Others
                                            @endif
                                        </span></a>
                                        
                                        <a href="" class="user-num text-dark">
                                            Father: 
                                            @if(isset($user->userdata->father_name) && !empty($user->userdata->father_name))
                                                {{$user->userdata->father_name}}
                                            @else
                                                NAN
                                            @endif
                                            <span></span>
                                        </a>
                                        
                                        <a href=""class="user-num text-dark">Mother:<span></span></a>
                                        <a href=""></a>
                                    </div> --}}

                                    <div class="pad">

                                        <a href="callto:112-223-443" class="user-num text-dark">
                                            @if($user->gender == 'm')
                                                <i class="fas fa-mars" aria-hidden="true"></i> <!-- Male Icon -->
                                            @elseif($user->gender == 'f')
                                                <i class="fas fa-venus" aria-hidden="true"></i> <!-- Female Icon -->
                                            @else
                                                <i class="fas fa-transgender-alt" aria-hidden="true"></i> <!-- Other Icon -->
                                            @endif
                                            @if($user->gender == 'm')
                                                Male
                                            @elseif($user->gender == 'f')
                                                Female
                                            @else
                                                Others
                                            @endif
                                        </a>
                                        
                                        <a class="user-num text-dark">
                                            <!-- Icon before Father: -->
                                            <i class="fas fa-male" aria-hidden="true"></i> <!-- Adjust this to the appropriate icon -->
                                        
                                            Father: 
                                        
                                            @if(isset($user->userdata->father_name) && !empty($user->userdata->father_name))
                                                <!-- Icon for Father's Name -->
                                                {{$user->userdata->father_name}}
                                            @else
                                                <i class="fas fa-question" aria-hidden="true"></i> <!-- Icon for NAN -->
                                               
                                            @endif
                                        </a>
                                        
                                        
                                        

                                        <a target="_blank" class="user-num text-dark">
                                            <!-- Icon for Date of Birth: -->
                                            <i class="far fa-calendar-alt" aria-hidden="true"></i> Date Of Birth : 
                                            {{-- Format date to MM/DD/YYYY format --}}
                                            {{ date('m/d/Y', strtotime($user->dob)) }}
                                        </a>
                                        
                                        
                                    </div>
                                    <div class="pad">

                                        <a  class="user-num text-dark"><i
                                                class="fas fa-phone-alt" aria-hidden="true"></i>
                                            {{$user->mobile}}</a>

                                        <a class="user-num text-dark"><i
                                                class="fas fa-envelope-open" aria-hidden="true"></i>
                                            {{$user->email}}</a>

                                        {{-- <a href="https://test.com/" target="_blank" class="user-num text-dark"><i
                                                class="fas fa-globe" aria-hidden="true"></i>https://test.com/</a> --}}
                                    </div>
                                    <div class="pad">

                                        <a class="user-num text-dark">
                                            <!-- Icon for Adhar Number: -->
                                            <i class="fas fa-id-card" aria-hidden="true"></i> Adhar Number :
                                            @if(isset($user->document_id1) && !empty($user->document_id1)) 
                                            {{$user->document_id1}}
                                            @else
                                            <i class="fas fa-question" aria-hidden="true"></i>
                                            @endif

                                        </a>
                                        
                                        <a class="user-num text-dark">
                                            <!-- Icon for Pan Number: -->
                                           


                                            <i class="fas fa-id-card" aria-hidden="true"></i> Adhar Number :
                                            @if(isset($user->document_id2) && !empty($user->document_id2)) 
                                            {{$user->document_id2}}
                                            @else
                                            <i class="fas fa-question" aria-hidden="true"></i>
                                            @endif
                                        </a>
                                        

                                        {{-- <a href="https://test.com/" target="_blank" class="user-num text-dark"><i
                                                class="fas fa-globe" aria-hidden="true"></i>https://test.com/</a> --}}
                                    </div>

                                   
                                    <p class="user-num">
                                        <!-- Icon for Bio: -->
                                        <i class="fas fa-address-card" aria-hidden="true"></i>
                                    
                                        @if(isset($user->bio) && !empty($user->bio))
                                            {{$user->bio}}
                                        @else
                                            <span style="color: red;">No bio available</span>
                                        @endif
                                    </p>
                                    
                                    <div>
                                        @if ($user->bank)
                                            <a href="{{ route('admin.user.bank.details', ['user_id' => $user->user_id]) }}" class="btn-user">User Bank Details</a>
                                        @else
                                            <button class="btn-user" disabled>No Bank Details Available</button>
                                        @endif
                                    </div>
                                    
                                    
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</x-backend.app-layout>
