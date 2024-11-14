<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
   <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <script>
        // Disable right-click context menu
        document.addEventListener('contextmenu', function (e) {
            e.preventDefault();
        });

        // Disable F12 key and Ctrl+Shift+I combinations
        document.onkeydown = function (e) {
            if (
                e.key === 'F12' ||
                (e.ctrlKey && e.shiftKey && e.key === 'I')
            ) {
                return false;
            }
        };
    </script>
    
    
    
  <title>@yield('meta_title')</title>
    <meta name="description" content="@yield('meta_description')" />
    <meta name="keywords" content="@yield('meta_keywords')" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
  @if($canonicalUrl)
        <link rel="canonical" href="{{ $canonicalUrl }}">
    @endif
    <meta property="og:title" content=Join Lablum: Create & Share Short Videos>
<meta property="og:site_name" content=Lablum>
<meta property="og:url" content=https://lablum.com/>
<meta property="og:description" content=Laugh, learn & be entertained with Lablum's endless stream of short videos! Discover & share funny clips, life hacks & more in a vibrant community.>
<meta property="og:type" content=website>
<meta property="og:image" content=https://lablum.com/assets/images/all-img/lablum_logo.png>


<meta name="twitter:card" content="summary">
<meta name="twitter:title" content="Join Lablum: Create & Share Short Videos">
<meta name="twitter:site" content="@Lablumapp">
<meta name="twitter:description" content="Laugh, learn & be entertained with Lablum's endless stream of short videos! Discover & share funny clips, life hacks & more in a vibrant community.">
<meta name="twitter:image" content="https://lablum.com/assets/images/all-img/lablum_logo.png">
<meta name="twitter:image:alt" content="Logo">

    <link rel="shortcut icon" type="image/x-icon" href="{{ asset('frontend/img/icons/fav_icon_new (2).png') }}">
    <!-- Place favicon.ico in the root directory -->

    <!-- CSS here -->
    <link rel="stylesheet" href="{{ asset('frontend/css/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('frontend/css/animate.min.css') }}">
    <link rel="stylesheet" href="{{ asset('frontend/css/magnific-popup.css') }}">
    <link rel="stylesheet" href="{{ asset('frontend/css/fontawesome-all.min.css') }}">
    <link rel="stylesheet" href="{{ asset('frontend/css/default-icons.css') }}">
    <link rel="stylesheet" href="{{ asset('frontend/css/odometer.css') }}">
    <link rel="stylesheet" href="{{ asset('frontend/css/slick.css') }}">
    <link rel="stylesheet" href="{{ asset('frontend/css/swiper-bundle.min.css') }}">
    <link rel="stylesheet" href="{{ asset('frontend/css/spacing.css') }}">
    <link rel="stylesheet" href="{{ asset('frontend/css/main.css') }}">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <meta name="csrf-token" content="{{ csrf_token() }}">
    
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-BD5H6KYKT5"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-BD5H6KYKT5');
</script>
</head>
<style>
    /* CSS */
    .animated-image {

        position: relative;
        animation: jump 5s infinite;
    }

    @keyframes jump {

        0%,
        100% {
            transform: translateY(0);
            /* Start and end position */
        }

        50% {
            transform: translateY(-30px);
            /* Peak of the jump */
        }
    }

    div#carousel {
        perspective: 1200px;
        /* background: #100000;  */
        padding-top: 10%;
        font-size: 0;
        margin-bottom: 3rem;
        overflow: hidden;
        border-radius: 43px;
    }

    figure#spinner {
        transform-style: preserve-3d;
        height: 217px;
        transform-origin: 50% 50% -500px;
        transition: 1s;
    }

    figure#spinner img {
        width: 33%;
        max-width: 425px;
        position: absolute;
        left: 30%;
        transform-origin: 50% 50% -500px;
        outline: 1px solid transparent;
    }

    figure#spinner img:nth-child(1) {
        transform: rotateY(0deg);
    }

    figure#spinner img:nth-child(2) {
        transform: rotateY(-45deg);
    }

    figure#spinner img:nth-child(3) {
        transform: rotateY(-90deg);
    }

    figure#spinner img:nth-child(4) {
        transform: rotateY(-135deg);
    }

    figure#spinner img:nth-child(5) {
        transform: rotateY(-180deg);
    }

    figure#spinner img:nth-child(6) {
        transform: rotateY(-225deg);
    }

    figure#spinner img:nth-child(7) {
        transform: rotateY(-270deg);
    }

    figure#spinner img:nth-child(8) {
        transform: rotateY(-315deg);
    }

    div#carousel~span {
        color: #fff;
        margin: 5%;
        display: inline-block;
        text-decoration: none;
        font-size: 2rem;
        transition: 0.6s color;
        position: relative;
        margin-top: -6rem;
        border-bottom: none;
        line-height: 0;
    }

    div#carousel~span:hover {
        color: #888;
        cursor: pointer;
    }



    #spinner {
        transition: transform 0.5s ease;
    }








    .top-section_socialButtons__oklz5 {
        display: flex;

        /* Align items horizontally */
        gap: 10px;
        /* Adjust the gap between buttons */
        flex-wrap: wrap;
        position: relative;
        top: 28px;

        /* Wrap buttons if they exceed container width */
    }

    .top-section_socialButton__29Ay5 {
        display: flex;
        align-items: center;
        /* Align content vertically */
    }

    .top-section_socialButton__29Ay5 img {
        max-width: 100%;
        /* Ensure images don't exceed container width */
        height: auto;
        /* Maintain aspect ratio */
    }



    #carousel {
        overflow: hidden;
        width: 100%;
        /* Ensure carousel takes full width */
    }

    #spinner {
        display: flex;
        flex-wrap: nowrap;
        transition: transform 0.5s ease;
    }

    #spinner img {
        max-width: 100%;
        /* Ensure images don't exceed container width */
        height: auto;
        /* Maintain aspect ratio */
    }

    @media (max-width: 768px) {
        #spinner {
            flex-wrap: nowrap;
            /* Ensure images don't wrap on smaller screens */
        }
    }

    #carousel {
        overflow: hidden;
        width: 100%;
        /* Ensure carousel takes full width */
    }

    #spinner {
        display: flex;
        flex-wrap: nowrap;
        transition: transform 0.5s ease;
    }

    #spinner img {
        max-width: 100%;
        /* Ensure images don't exceed container width */
        height: auto;
        /* Maintain aspect ratio */
    }

    @media (max-width: 768px) {
        #spinner img {
            width: 100vw;
            /* Set image width to 80% of viewport width */
            max-width: none;
            /* Remove max-width restriction */
        }
    }

    .hover-color:hover {
        color: white;
        /* Define the hover color */
        /* Optionally, you can add other styles for hover state */
        /* For example: text-decoration: underline; */
    }



    .estimate__right {
        position: relative;
        animation: jump 8s ease-in-out infinite;
        /* Adjust the duration and timing function */
    }

    @keyframes jump {

        0%,
        100% {
            transform: translateY(0);
            /* Start and end position */
        }

        50% {
            transform: translateY(-30px);
            /* Peak of the jump */
        }
    }

    .jump {
        animation: jump 1.5s ease-in-out infinite;
        /* Adjust the duration to make it slower */
    }



    .animated-video {
        max-width: 100%;
        height: auto;
        position: relative;
        bottom: 55px;
    }

    @media (min-width: 992px) {
        .animated-video {
            float: right;
            max-width: 317px;
            height: 541px;

        }
    }

    @media (max-width: 991.98px) {
        .animated-video {
            float: none;
            max-width: 100%;
            height: auto;
            margin-bottom: 20px;
            /* Adjust as needed */
        }
    }

    @media (max-width: 768px) {
        .animated-video {
            max-width: 100%;
            max-height: 100%;
            position: relative;
            width: 317px;
            width: 317px;
            position: relative;
            float: right;
            height: 498px;
            top: 14px;
            left: 129px !important;
        }
    }

    @media (max-width: 768px) {
        .animated-video {
            left: 1px;

        }
    }

    @media (max-width: 600px) {
        .animated-video {
            max-width: 100%;
            max-height: 100%;
            position: relative;
            width: 317px;
            width: 317px;
            position: relative;
            float: right;
            height: 498px;
            top: 14px;
            left: 7px !important;
        }
    }



    @media (max-width:768px) {
        .header-btn {
            display: none;
        }

        .verification-btn1 {
            display: none;
        }

    }



    .custom-close {
        display: flex;
        justify-content: end;
        font-size: 26px;
        font-weight: 500;
        cursor: pointer;
    }

    .custom-close1 {
        display: flex;
        justify-content: end;
        font-size: 26px;
        font-weight: 500;
        cursor: pointer;
    }

    .Blue-close1 {
        display: flex;
        justify-content: end;
        font-size: 26px;
        font-weight: 500;
        cursor: pointer;
    }

    .Blue-close {
        display: flex;
        justify-content: end;
        font-size: 26px;
        font-weight: 500;
        cursor: pointer;
    }
</style>

<body class="position-relative">
    <!-- Preloader -->
    {{-- <div id="preloader">
    <div id="loading-center">
      <div class="loader">
        <div class="loader-outter"></div>
        <div class="loader-inner"></div>
      </div>
    </div>
  </div> --}}
    <!-- Preloader End -->
    <div class="element element--1"></div>
    <div class="element element--2"></div>

    <button type="submit" class="scroll__top scroll-to-target" data-target="html">
        <i class="fas fa-angle-up"></i>
    </button>
 
    <div id="header-fixed-height"></div>


    <x-frontend.header />


   
    <main class="main position-relative">
{{$slot}}



@if (Session::has('message'))
<script>
    const message = @json(Session::get('message'));

    Swal.fire({
        position: "center",
        icon: "success",
        title: message,
        showConfirmButton: false,
        timer: 1500
    });
</script>
@elseif (Session::has('error'))
<script>
    const error = @json(Session::get('error'));

    Swal.fire({
        position: "center",
        icon: "error",
        title: error,
        showConfirmButton: false,
        timer: 1500
    });
</script>
@endif
      
    </main>
 






 
    <x-frontend.footer />
  






    <!-- JS here -->
    <script src="{{ asset('frontend/js/vendor/jquery-3.6.0.min.js') }}"></script>
    <script src="{{ asset('frontend/js/bootstrap.min.js') }}"></script>
    <script src="{{ asset('frontend/js/isotope.pkgd.min.js') }}"></script>
    <script src="{{ asset('frontend/js/imagesloaded.pkgd.min.js') }}"></script>
    <script src="{{ asset('frontend/js/jquery.magnific-popup.min.js') }}"></script>
    <script src="{{ asset('frontend/js/jquery.odometer.min.js') }}"></script>
    <script src="{{ asset('frontend/js/jquery.appear.js') }}"></script>
    <script src="{{ asset('frontend/js/gsap.js') }}"></script>
    <script src="{{ asset('frontend/js/ScrollTrigger.js') }}"></script>
    <script src="{{ asset('frontend/js/SplitText.js') }}"></script>
    <script src="{{ asset('frontend/js/gsap-animation.js') }}"></script>
    <script src="{{ asset('frontend/js/slick.min.js') }}"></script>
    <script src="{{ asset('frontend/js/ajax-form.js') }}"></script>
    <script src="{{ asset('frontend/js/parallaxScroll.min.js') }}"></script>
    <script src="{{ asset('frontend/js/swiper-bundle.esm.browser.min.js') }}"></script>
    <script src="{{ asset('frontend/js/wow.min.js') }}"></script>
    <script src="{{ asset('frontend/js/main.js') }}"></script>
</body>
<script>
    var angle = 0;
    var spinner = document.querySelector("#spinner");

    function galleryspin() {
        angle -= 45;
        spinner.style.transform = "rotateY(" + angle + "deg)";
    }

   
    setInterval(function() {
        galleryspin();
    }, 3000);
</script>
<script>
    AOS.init();
</script>

</html>
