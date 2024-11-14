<div class="topbar">



    <div class="navbar navbar-default" role="navigation">
        <div class="container">
            <div class="">
                <div class="pull-left"> 
                    <a href="{{ route('admin.dashboard') }}" type="button"
                        class="button-menu-mobile  waves-effect waves-light"> <i class="ion-speedometer"></i>
                         {{-- Dashboard --}}
                </a> 
                <span class="clearfix"></span></div>
                <form class="navbar-form pull-left" role="search">
                    <div class="form-group"> <input type="text" class="form-control search-bar"
                            placeholder="Search..."></div> <button type="submit" class="btn btn-search"><i
                            class="fa fa-search"></i></button>
                </form>
                <ul class="nav navbar-nav navbar-right pull-right">
                    {{-- <li class="dropdown hidden-xs"> <a href="#" data-target="#"
                            class="dropdown-toggle waves-effect waves-light" data-toggle="dropdown"
                            aria-expanded="true"> <i class="fa fa-bell"></i> <span
                                class="badge badge-xs badge-danger">3</span> </a>
                        <ul class="dropdown-menu dropdown-menu-lg">
                            <li class="text-center notifi-title">Notification <span
                                    class="badge badge-xs badge-success">3</span></li>
                            <li class="list-group"> <a href="javascript:void(0);" class="list-group-item">
                                    <div class="media">
                                        <div class="media-heading">Your order is placed</div>
                                        <p class="m-0"> <small>Dummy text of the printing and typesetting
                                                industry.</small></p>
                                    </div>
                                </a> <a href="javascript:void(0);" class="list-group-item">
                                    <div class="media">
                                        <div class="media-body clearfix">
                                            <div class="media-heading">New Message received</div>
                                            <p class="m-0"> <small>You have 87 unread messages</small></p>
                                        </div>
                                    </div>
                                </a> <a href="javascript:void(0);" class="list-group-item">
                                    <div class="media">
                                        <div class="media-body clearfix">
                                            <div class="media-heading">Your item is shipped.</div>
                                            <p class="m-0"> <small>It is a long established fact that a reader
                                                    will</small></p>
                                        </div>
                                    </div>
                                </a> <a href="javascript:void(0);" class="list-group-item"> <small
                                        class="text-primary">See all notifications</small> </a></li>
                        </ul>
                    </li> --}}
                    <li class="hidden-xs"> <a href="#" id="btn-fullscreen" class="waves-effect waves-light"><i
                                class="fa fa-crosshairs"></i></a></li>
                    <li class="dropdown"> <a href="#" class="dropdown-toggle profile waves-effect waves-light"
                            data-toggle="dropdown" aria-expanded="true"><img
                                src="{{ asset('1assets/images/Group 20.png') }}" alt="user-img" class="img-circle"> </a>
                        <ul class="dropdown-menu">
                            <li><a href="{{route('admin.role')}}">Roles & Permissions</a></li>
                            <li><a href="{{route('admin.user')}}">
                                {{-- <span class="badge badge-success pull-right">5</span> --}}
                                    Lablum Staff </a></li>
                            <li><a href="{{route('admin.update.password.view')}}">Update Password</a></li>
                            <li class="divider"></li>
                            <li>
                                <form style="    display: flex; justify-content: center;"
                                    action="{{ route('admin.logout') }}" method="POST">
                                    @csrf


                                    <button class="btn bg-custom-color-gradient text-white mr-2" type="submit">
                                        <i class="fas fa-sign-out-alt mr-1"></i> Logout
                                    </button>

                                </form>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <style>
        .bg-custom-color-gradient {
            background: #03a9f4;

        }
    </style>
</div>
