<style>
    @media(max-width:991px){
        .emailfoot{
            display: block;
            margin-left: 0px !important;
        }
    }
</style>







<footer class="tg-footer-bg pt-100 position-relative" style="padding: 30px;">
    <!-- <img class="position-absolute footer__shape-bg" src="assets/img/pattern/map.png" alt> -->
    <div class="tg-footer-main pb-70">
        <div class="container custom-container">
            <div class="row">
                <div class="col-xl-6 col-lg-6 col-md-6">
                    <div class="tg-footer-widget footer-col-1 mb-30">
                        <div class="tg-footer-widget-logo pb-15">
                            <a href="{{ route('frontend.home') }}"><img
                                    src="{{ asset('frontend/img/logo/lablum_logo.png') }}" alt="Logo"
                                    style="width: 121px;"></a>
                        </div>
                        <div class="tg-footer-widget-content">
                            <p>LabLum has sheer belief in the dynamic power of short videos as they help entertain,
                                motivate, and connect people from across the world. Our platform has been designed for
                                an uninterrupted seamless affair for our creators as well as viewers. </p>

                                

                                <p class="footer__copyright" style="border-top: 1px solid #ca55a2;border-bottom:1px solid #ca55a2;padding:8px" >
                                    <a href="{{ route('frontend.home') }}">LabLum(LabLum Entertainment Limited) Subsidiary Company of <a href="https://unitarycorporategroup.com/"><span style="color:#0d6efd;cursor:pointer">Unitary Corporate Group</span></a></a> 
                                    </p>
                        </div>
                        <div class="tg-footer-widget-social">
                            <a href="#"><i style="color: black;" class="fa-brands fa-facebook-f"></i></a>
                            <a href="#"><i style="color: black;" class="fa-brands fa-instagram"></i></a>
                            <a href="#"><i style="color: black;" class="fa-brands fa-twitter"></i></a>
                            <a href="#"><i style="color: black;" class="fa-brands fa-linkedin"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
                    <div class="tg-footer-widget footer-col-2 mb-30">
                        <h4 class="tg-footer-widget-title mb-25">Our Company</h4>
                        <div class="tg-footer-widget-link">
                            <ul>
                                <li><a href="{{ route('frontend.home') }}"><i class="fas fa-home"></i> Home</a></li>

                                <!-- <li><a href="price.html">Careers</a></li> -->
                                <li><a href="{{ route('frontend.about') }}"><i class="fas fa-info-circle"></i> About
                                        Us</a></li>
                                <li><a href="{{ route('frontend.blog') }}"><i class="fas fa-newspaper"></i> Our Blog</a>
                                </li>
                                <li><a href="{{ route('frontend.contact') }}"><i class="fas fa-envelope"></i> Contact
                                        Us</a></li>

                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-5 col-sm-6">
                    <div class="tg-footer-widget footer-col-3 mb-30">
                        <h4 class="tg-footer-widget-title mb-25">Services</h4>
                        <div class="tg-footer-widget-link">
                            <ul>
                                <li><a href="{{ route('our-terms') }}"><i class="fas fa-chart-line"></i> Terms and
                                        Condition</a></li>

                                <li><a href="{{ route('our-add-policies') }}"><i class="fas fa-chart-bar"></i>
                                        Advertisment Policies</a></li>

                                <li><a href="{{ route('our-official-policies') }}"><i class="fas fa-chart-line"></i>&nbsp;Official Account Verification
                                        Policies</a></li>
                                <li><a href="{{ route('our-privacy-policies') }}"><i class="fas fa-chart-line"></i>&nbsp;Our Privacy Policies</a></li>
                                <li><a href="{{ route('our-content-writer-policies') }}"><i class="fas fa-chart-line"></i>&nbsp;Our Content Creator
                                        Policies</a>
                                </li>
                                <li><a href="{{ route('our-content-viewer-policies') }}"><i class="fas fa-chart-line"></i>&nbsp;Our Content Viewer
                                        Policies</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                {{-- <div class="col-xl-5 col-lg-4 col-md-7">
                    <div class="tg-footer-widget footer-col-4 mb-30">
                        <h2 class="tg-footer-widget-submit-title" style="margin-top:45px">Get Latest Updates <br> and big deals</h2>
                        <div class="tg-footer-widget-submit-wrap">
                            <form action="#">
                                <div class="tg-footer-widget-newsletter-wrapper position-relative">
                                    <div class="tg-footer-widget-newsletter-input">
                                        <input type="email" placeholder="Get News & Updates">
                                    </div>
                                    <div class="tg-footer-widget-newsletter-submit">
                                        <button><i class="fa-regular fa-paper-plane"></i></button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="tg-footer-widget-content">
                            <p>Get Latest news and updates about our website as well as app so that you will be updated about us </p>
                        </div>




                        <div class="tg-footer-widget-content" >
                            <h3 style="border-bottom: 1px solid #ca55a2;padding-bottom: 12px;">Address</h3>
                        </div>

                        
                        <div class="tg-footer-widget-content">
                            <p>Lenka House, 2nd floor, Ranital Bazar, Rahanja, Bhadrak-
                                756111, Orissa</p>

                               <span><i class="fa-solid fa-phone"></i> &nbsp; (+91) 8658310023</span>
                               <span class="emailfoot" style="margin-left:21px"><i class="fa-solid fa-envelope"></i>&nbsp; support@lablum.com</span>
                        </div>







                    </div>
                </div> --}}
            </div>
        </div>
    </div>
    <div class="footer__bottom">
        <div class="container custom-container">
            <div class="row">
                <div class="col-12">
                    <div class="footer__wrapper-bottom">
                        <div class="row align-items-center">
                            <div class="col-md-12 mb-15">
                                <p class="footer__copyright" style="text-align: center">
                                <a href="{{ route('frontend.home') }}">LabLum Entertainment Limited @ 2024. All Rights Reserved.</a> 
                                </p>
                            </div>

                           
                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>