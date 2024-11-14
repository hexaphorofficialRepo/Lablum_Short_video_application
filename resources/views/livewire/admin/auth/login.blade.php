<div>
    <div class="loginwrapper">
        <div class="lg-inner-column">
            <div class="right-column relative">
                <div class="inner-content h-full flex flex-col bg-white dark:bg-slate-800">
                    <div class="auth-box h-full flex flex-col justify-center">
                        <div class="mobile-logo text-center mb-6 lg:hidden block">
                            <a href="/">
                                <img src="{{ asset('assets/images/all-img/lablum_logo.png') }}" alt="" class="mb-10 dark_logo">
                                <img src="{{ asset('assets/images/all-img/lablum_logo.png') }}" alt="" class="mb-10 white_logo">
                            </a>
                        </div>
                        <div class="text-center 2xl:mb-10 mb-4">
                            <h4 class="font-medium">Sign in</h4>
                            <div class="text-slate-500 dark:text-slate-400 text-base">
                                Sign in to your account to start using Dashboard
                            </div>
                        </div>
                        <!-- BEGIN: Login Form -->
                        <form class="space-y-4" action="{{route('admin.login')}}" method="POST">
                            @csrf
                            <div class="fromGroup">
                                <label class="block capitalize form-label">email</label>
                                <div class="relative ">
                                    <input type="email" wire:model="email" name="email" class="form-control py-2" placeholder="Enter Email">
                                </div>
                            </div>
                            <div class="fromGroup">
                                <label class="block capitalize form-label">passwrod</label>
                                <div class="relative ">
                                    <input type="password" wire:model="password" name="password" class="form-control py-2" placeholder="Enter Password">
                                </div>
                            </div>
                            <div class="flex justify-between">
                                <div class="checkbox-area">
                                    <label class="inline-flex items-center cursor-pointer">
                                        <input type="checkbox" class="hidden" name="checkbox">
                                        <span class="h-4 w-4 border flex-none border-slate-100 dark:border-slate-800 rounded inline-flex ltr:mr-3 rtl:ml-3 relative transition-all duration-150 bg-slate-100 dark:bg-slate-900">
                                            <img src="{{asset('assets/images/icon/ck-white.svg')}}" alt="" class="h-[10px] w-[10px] block m-auto opacity-0"></span>
                                        <span class="text-slate-500 dark:text-slate-400 text-sm leading-6">Keep me signed in</span>
                                    </label>
                                </div>
                                <a class="text-sm text-slate-800 dark:text-slate-400 leading-6 font-medium" href="forget-password-one.html">Forgot Password?</a>
                            </div>
                            <button class="btn btn-dark block w-full text-center">Sign in</button>
                        </form>
                        <!-- END: Login Form -->
                     
                   
                       
                    </div>
                    <div class="auth-footer text-center">
                        Copyright 2024, Lablum All Rights Reserved.
                    </div>
                </div>
            </div>
            <div class="left-column bg-cover bg-no-repeat bg-center" style="background-image: url('/1assets/images/illustration.png');">
                <div class="flex flex-col h-full justify-center">
                    <div class="flex-1 flex flex-col justify-center items-center">
                        <a href="index-2.html">
                            <img src="{{ asset('assets/images/all-img/lablum_logo.png') }}" alt="" class="mb-10">
                        </a>
                    </div>
                    {{-- <div>
                        <div class="black-500-title max-w-[525px] mx-auto pb-20 text-center">
                            Welcome
                            <span class="text-[#9f1ca3] font-bold">Admin</span>
                        </div>
                        
                    </div> --}}
                </div>
            </div>
        </div>
    </div>
</div>
