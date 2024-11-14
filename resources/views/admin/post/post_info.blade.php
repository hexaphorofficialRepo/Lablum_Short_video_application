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
            font-weight: 800;
            font-size: medium;
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
            /* float: right; */
            font-size: 13px;
            margin: 10px;
        }
        .btn-user:hover{
            background-color: #fff;
            color: blueviolet;
        }

        .d-flex {
            display: flex;
        }
    </style>

    <div class="content">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="page-header-title">
                        <h4 class="pull-left page-title" style="font-size: 30px;"> POST DETAILS </h4>
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
                        <h4 class="card-title" style="font-size: 2.125rem;">POST DETAILS</h4>

                        <div class="row">
                            <div class="col-xl-4 col-sm-6 col-lg-4">
                                <div class="wsus__dash_info_img user-image">
                                    {{-- <img src="{{ asset('storage/profile_pic/' . $user->user_id . '/' . $user->user_dp) }}"
                                        alt="my images" class="img-fluid w-100 user-img"> --}}

                                    <video id="myVideo" height="200px" width="200px" alt="app" controls=""
                                        class="img-fluid w-100 user-img"
                                        style="box-shadow: rgba(105, 103, 103, 0) 0px 5px 15px 0px; border: 2px solid rgb(255, 255, 255); border-radius: 10px; object-fit: cover; display: block;">
                                        <!-- Add your video source here -->
                                        <source src="{{ Storage::disk('s3')->url($post->video) }}">
                                        Your browser does not support the video tag.
                                    </video>




                                </div>
                            </div>
                            <div class="col-xl-8 col-sm-6 col-lg-8" style="display: flex;">
                                <div class="wsus__dash_info_text">
                                    <h3><i class="fas fa-video" style="margin-right: 5px;" aria-hidden="true"></i>
                                        {{ $post->title }}
                                    </h3>
                                    <p
                                        style="display: flex;
                                    align-items: center;
                                    text-indent:90px;
                                ">
                                        {{ $post->description }}
                                    <p>
                                        <hr>
                                        {{-- <a href="" class="user-num text-dark"><i class="fas fa-user" aria-hidden="true"></i> User Name: {{$post->user->username}}</a>
                                    <div class="pad"> --}}


                                    <div class="pad">

                                        <a href="callto:112-223-443" class="user-num text-dark">
                                            <i class="fas fa-eye" aria-hidden="true"></i>
                                            View Count : <strong>{{ $post->views()->count() }}</strong> Views

                                        </a>

                                        <a class="user-num text-dark">

                                            <i class="fas fa-thumbs-up" aria-hidden="true"></i>
                                            Likes Count : <strong>{{ $post->likes()->count() }}</strong> Likes

                                        </a>







                                    </div>
                                    <div class="pad">

                                        <a target="_blank" class="user-num text-dark">

                                            <i class="far fa-comment" aria-hidden="true"></i>

                                            Comments Count : <strong>{{ $post->comments()->count() }}</strong> Comments
                                        </a>
                                        <a target="_blank" class="user-num text-dark">

                                            <i class="fas fa-share" aria-hidden="true"></i>
                                            Shares Count : <strong>{{ $post->shares()->count() }}</strong> Shares
                                        </a>




                                    </div>
                                    <div class="pad">

                                        <a target="_blank" class="user-num text-dark">

                                            <i class="far fa-calendar-alt" aria-hidden="true"></i>
                                            Created Date : <strong>{{ $post->created_at }}</strong>
                                        </a>





                                    </div>

                                    <div class="d-flex">
                                        <a href="{{ route('admin.like.post', $post) }}" class="btn-user">POST LIKES</a>
                                        <a href="{{ route('admin.comment.post', $post) }}" class="btn-user">POST
                                            Comments</a>
                                        <a href="{{ route('admin.post.watchlist', $post) }}" class="btn-user">POST
                                            Watch List</a>
                                        <a href="{{ route('admin.reported.post', ['post_id' => $post->id]) }}"
                                            class="btn-user">POST Report</a>
                                        <a href="{{ route('admin.user.details', ['user_id' => $post->user->user_id]) }}"
                                            class="btn-user">Post Creator</a>




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
</x-backend.app-layout>
