<div class="topbar">
    <div class="topbar-left">
        <div class="text-center"> <a href="index.html" class="logo"><img src="{{ asset('1assets/images/Group 20.png') }}"
                    height="28"></a> <a href="index.html" class="logo-sm"><img src="{{ asset('1assets/images/Group 20.png') }}"
                    height="36"></a></div>
    </div>
    <div class="navbar navbar-default" role="navigation">
        <div class="container">
            <div class="">
                <div class="pull-left"> <button type="button"
                        class="button-menu-mobile open-left waves-effect waves-light"> <i
                            class="ion-navicon"></i> </button> <span class="clearfix"></span></div>
                <form class="navbar-form pull-left" role="search">
                    <div class="form-group"> <input type="text" class="form-control search-bar"
                            placeholder="Search..."></div> <button type="submit" class="btn btn-search"><i
                            class="fa fa-search"></i></button>
                </form>
                <ul class="nav navbar-nav navbar-right pull-right">
                 
                    <li class="hidden-xs"> <a href="#" id="btn-fullscreen" class="waves-effect waves-light"><i
                                class="fa fa-crosshairs"></i></a></li>
                    <li class="dropdown"> <a href="#" class="dropdown-toggle profile waves-effect waves-light"
                            data-toggle="dropdown" aria-expanded="true"><img
                                src="assets/images/users/avatar-1.jpg" alt="user-img" class="img-circle"> </a>
                        <ul class="dropdown-menu">
                            <li><a href="{{route('add.login.update.profile')}}"> Profile</a></li>
                            {{-- <li><a href="javascript:void(0)"><span
                                        class="badge badge-success pull-right">5</span> Settings </a></li>
                            <li><a href="javascript:void(0)"> Lock screen</a></li> --}}
                            <li class="divider"></li>
                            <li><a href="{{route('logout')}}"> Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>