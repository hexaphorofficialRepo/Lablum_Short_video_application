<div class="left side-menu">
    <div class="sidebar-inner slimscrollleft">
        <div class="user-details">
            <div class="text-center"> <img src="{{ asset('1assets/images/Group 20.png') }}" alt=""
                    class="img-circle">
            </div>
            <div class="user-info">
                <div class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                        aria-expanded="false">Lablum </a>
                    <ul class="dropdown-menu">
                        <li><a href="javascript:void(0)"> Profile</a></li>
                        <li><a href="javascript:void(0)"> Settings</a></li>
                        <li><a href="javascript:void(0)"> Lock screen</a></li>
                        <li class="divider"></li>
                        <li><a href="javascript:void(0)"> Logout</a></li>
                    </ul>
                </div>
                <p class="text-muted m-0"><i class="fa fa-dot-circle-o text-success"></i> Online</p>
            </div>
        </div>
        <div id="sidebar-menu">
            <ul>
                <li> <a href="{{ route('admin.dashboard') }}" class="waves-effect"><i class="ti-home"></i><span>
                            Dashboard
                        </span></a></li>

                <li class="has_sub"> <a href="javascript:void(0);" class="waves-effect"><i class="fas fa-user"></i>
                        <span>User </span> <span class="pull-right"><i class="mdi mdi-plus"></i></span></a>

                    <ul class="list-unstyled">
                        <li><a href="{{ route('admin.real.user') }}">Real User</a></li>
                        <li><a href="{{ route('admin.fake.user') }}">Fake User</a></li>
                        <li><a href="{{ route('admin.user.wallet') }}">User Wallet Record</a></li>
                        <li><a href="{{ route('admin.official.verify') }}">User official Verification</a></li>

                    </ul>
                </li>

                {{-- <li class="has_sub"> <a href="javascript:void(0);" class="waves-effect"><i
                            class="fas fa-ad"></i>
                        </i><span> Advertisement </span><span class="pull-right"><i
                                class="mdi mdi-plus"></i></span></a>
                    <ul class="list-unstyled">

                        <li><a href="googlead.html">Google Ad</a></li>
                        <li><a href="custom_ad.html">Custom Ad</a></li>

                    </ul>
                </li> --}}
                <li class=""> <a href="{{ route('admin.category.index') }}"><i class="fas fa-flag"></i>
                        </i><span> #Hastag </span><span class="pull-right"></span></a>

                </li>
                <li class="has_sub"> <a href="javascript:void(0);" class="waves-effect"><i class="fas fa-film"></i>
                        </i><span> Reel </span><span class="pull-right"><i class="mdi mdi-plus"></i></span></a>
                    <ul class="list-unstyled">
                        <li><a href="{{ route('admin.real.post') }}">Real</a></li>
                        <li><a href="{{ route('admin.fake.post') }}">Fake</a></li>


                    </ul>
                </li>

                {{-- <li class=""> <a href="{{ route('admin.category.index') }}" class=""><i
                            class="fas fa-music"></i>
                        </i><span>Reel Category</span><span class="pull-right"></i></span></a>

                </li> --}}

                <li class=""> <a href="{{ route('admin.song.index') }}" class=""><i
                            class="fas fa-music"></i>
                        </i><span>Song</span><span class="pull-right"></i></span></a>

                </li>
                <li class="has_sub"> <a href="javascript:void(0);" class="waves-effect"><i class="fas fa-newspaper"></i>

                        <span>News And Blog </span> <span class="pull-right"><i class="mdi mdi-plus"></i></span></a>

                    <ul class="list-unstyled">
                        <li><a href="{{ route('admin.blog.category.index') }}">Category</a></li>
                        <li><a href="{{ route('admin.blog.index') }}">News And Blog</a></li>

                    </ul>
                </li>
                <li class="has_sub"> <a href="javascript:void(0);" class="waves-effect"><i
                            class="fas fa-rupee-sign"></i>

                        <span>Set Earning Points </span> <span class="pull-right"><i
                                class="mdi mdi-plus"></i></span></a>

                    <ul class="list-unstyled">

                        <li><a href="{{ route('admin.earning.list') }}">List</a></li>
                        <li><a href="{{ route('admin.create.earning') }}">Create</a></li>

                    </ul>
                </li>












                {{-- <li class=""> <a href="{{route('admin.add.pricing.index')}}" class=""><i class="fas fa-hashtag"></i>
                        </i><span>AddPricing</span><span class="pull-right"></i></span></a>

                </li>

                <li class=""> <a href="{{ route('admin.advertiser.list') }}" class=""><i
                            class="fas fa-ad"></i>

                        </i><span>Advertisement</span><span class="pull-right"></i></span></a>

                </li> --}}





                {{-- <li class=""> <a href="user_report.html" class=""><i
                            class="fas fa-exclamation-triangle"></i>
                        </i><span>Advertisment </span><span class="pull-right"></span></a>

                </li> --}}


                <li class="has_sub"> <a href="javascript:void(0);" class="waves-effect"><i class="fas fa-coins"></i>
                        </i><span>Advertisment</span><span class="pull-right"><i class="mdi mdi-plus"></i></span></a>
                    <ul class="list-unstyled">
                        <li><a href="{{ route('admin.index.add.category') }}"> Advertisment Category</a></li>
                        <li><a href="{{ route('admin.add.pricing.index') }}"> Add Plan Pricing</a></li>
                        <li><a href="{{ route('admin.advertiser.list') }}">Advertsing Partners</a></li>

                    </ul>
                </li>











                <li class="has_sub"> <a href="javascript:void(0);" class="waves-effect"><i
                            class="fas fa-money-bill"></i>
                        <span>Taxes and Gst</span><span class="pull-right"><i class="mdi mdi-plus"></i></span></a>
                    <ul class="list-unstyled">
                        <li><a href="{{ route('admin.taxes.type.index') }}"> Other Taxes Type</a></li>
                        <li><a href="{{ route('admin.gst.index') }}"> GST</a></li>
                        <li><a href="{{ route('admin.tax.charges.index') }}"> Other Tax Charges</a></li>



                    </ul>
                </li>



                <li class="has_sub"> <a href="javascript:void(0);" class="waves-effect"><i
                            class="fas fa-money-bill"></i>
                        <span>Billing and Transactions</span><span class="pull-right"><i
                                class="mdi mdi-plus"></i></span></a>
                    <ul class="list-unstyled">
                        <li><a href="{{ route('admin.advertisment.payment.trns') }}"> Advertisment Transactions</a>
                        </li>
                        <li><a href="{{ route('admin.user.withdrawal') }}">User Withdrawal</a>
                        </li>




                    </ul>
                </li>




                {{-- <li class="has_sub"> <a href="javascript:void(0);" class="waves-effect"><i class="fas fa-cog"></i>
                        </i><span>Setting</span><span class="pull-right"></span></a>

                </li> --}}
                <li class=""> <a href="{{ route('admin.terms.index') }}" class=""><i
                            class="fas fa-file-contract"></i>
                        </i><span>Terms and Policies</span><span class="pull-right"></span></a>

                </li>
                {{-- <li class=""> <a href="logout.html" class=""><i class="fas fa-sign-out-alt"></i>
                        </i><span>Logout</span><span class="pull-right"></span></a>

                </li> --}}

                <li class="has_sub"> <a href="javascript:void(0);" class="waves-effect"><i class="fas fa-cog"></i>

                    <span>Settings</span><span class="pull-right"><i
                        class="mdi mdi-plus"></i></span></a>
            <ul class="list-unstyled">
                <li><a href="{{route('admin.other_link.index')}}">Other Links And Dashboard</a></li>
                <li><a href="{{route('admin.update.password.view')}}">Update Password</a></li>
             
              
              

            </ul>
        </li>








            </ul>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
