<div class="left side-menu">
    <div class="sidebar-inner slimscrollleft">
        <div class="user-details">
         
            
        </div>
        <div id="sidebar-menu">
            <ul>
                <li> <a href="{{route('add.dashboard')}}" class="waves-effect"><i class="ti-home"></i><span> Dashboard
                        </span></a></li>

                <li class="has_sub"> <a href="javascript:void(0);" class="waves-effect"><i class="fas fa-clipboard-check"></i> <!-- This is a subscription-related icon -->
                    <span>Subscriber plan</span> <span class="pull-right"><i
                                class="mdi mdi-plus"></i></span></a>

                    <ul class="list-unstyled">
                        <li><a  href="{{route('addplan.show')}}">My Plan</a></li>
                    
                        <li><a href="{{route('add.choose.plan')}}">Choose Plan</a></li>
                     
                      
                       

                    </ul>
                    
                       
                      


                    
                    
                </li>

              
                <li class="has_sub"> <a href="javascript:void(0);" class="waves-effect"><i class="fas fa-video"></i>
                    <!-- This is a subscription-related icon -->
                    <span>Advertisment Video</span> <span class="pull-right"><i
                                class="mdi mdi-plus"></i></span></a>

                    <ul class="list-unstyled">
                     
                        <li><a  href="{{route('advertiser.videos')}}">My Advertisment Video</a></li>
                     
                        <li><a href="{{route('add.add.video')}}">Add Video</a></li>
                      
                       

                    </ul>
                    
                       
                      


                    
                    
                </li>

              



                <li class=""> <a href="{{route('add.login.update.profile')}}" class=""><i class="fas fa-user"></i>
                        </i><span>Profile</span><span class="pull-right"></span></a>

                </li>
                <li class=""> <a href="{{route('logout')}}" class=""><i class="fas fa-sign-out-alt"></i>
                        </i><span>Logout</span><span class="pull-right"></span></a>

                </li>
            </ul>
        </div>
        <div class="clearfix"></div>
    </div>
</div>