@section('meta_title', 'Join Lablum Create & Share Short Videos')
@section('meta_description', 'Laugh, learn & be entertained with Lablums endless stream of short videos! Discover &
    share funny clips, life hacks & more in a vibrant')
@section('meta_keywords', 'Laugh, learn & be entertained with Lablums endless stream of short videos! Discover & share
    funny clips, life hacks & more in a vibrant')






    <x-frontend.app-layout :canonicalUrl="url('https://lablum.com/')">



        <style>
            @media(max-width:767px) {

                .div#carousel {
                    margin-bottom: 0px !important;

                }

                figure#spinner img {
                    width: 69% !important;
                }
            }


            @media(min-width:768px) and (max-width:991px) {

                .div#carousel {
                    margin-bottom: 0px !important;

                }

                figure#spinner img {
                    width: 44% !important;
                }
            }
        </style>


        <!-- hero-area -->
        <section class="hero hero--area hero--padding fix">
            <div class="container custom-container">
                <div class="row align-items-center">
                    <div class="col-xl-6 col-lg-7 mb-30">
                        <div class="hero-content">
                            <h1 class="hero-content__heading mb-25 wow fadeInUp animated" data-wow-duration="500ms"
                                data-wow-delay="200ms">
                                Lablum - Watch, Share, Earn!
                                <img style= "max-width: 12%;" src="{{ asset('frontend/img/icons/pie-icon.webp') }}"
                                    alt="pie_chart">
                            </h1>
                            <p class="hero-content__text mb-45 wow fadeInUp animated" data-wow-duration="500ms"
                                data-wow-delay="400ms"><strong style="color: #AF54CD;">LabLum:</strong> Welcome to Lablum,
                                the best short video sharing app that makes you money just by watching videos! Whether
                                you’re a social media addict or a content creator, Lablum offers a unique opportunity to
                                have fun and make money at the same time.
                            </p>
                            <a href="{{ route('frontend.about') }}" class="btn wow fadeInUp animated"
                                data-wow-duration="500ms" data-wow-delay="600ms">Read More</a>
                        </div>

                        <div class="top-section_socialButtons__oklz5">
                            <a class="top-section_socialButton__29Ay5"
                                href="https://play.google.com/store/games?hl=en&gl=US" target="_blank">
                                <img src="https://media.chingari.io/apipublic/chingari-web-assets/icons/app-store.svg"
                                    alt="app-store" loading="lazy">
                            </a>
                            <a class="top-section_socialButton__29Ay5"
                                href="https://play.google.com/store/games?hl=en&gl=US" target="_blank">
                                <img src="https://media.chingari.io/apipublic/chingari-web-assets/icons/play-store.svg"
                                    alt="play-store" loading="lazy">
                            </a>
                            <!-- <a class="top-section_socialButton__29Ay5" href="/post/latest" target="_blank">
                <img src="https://media.chingari.io/apipublic/chingari-web-assets/icons/browser.svg" alt="browser"
                  loading="lazy">
              </a> -->
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-5 mb-30">
                        <div class="hero-thumb">
                            <div class="hero-thumb__icons">
                                <!-- <img class="hero-thumb__icon1 wow zoomIn animated" data-wow-duration="500ms" data-wow-delay="200ms"
                  src="assets/img/icons/hero-icon-1.svg" alt="icon">
                <img class="hero-thumb__icon2 wow zoomIn animated" data-wow-duration="500ms" data-wow-delay="400ms"
                  src="assets/img/icons/hero-icon-2.svg" alt="icon">
                <img class="hero-thumb__icon3 wow zoomIn animated" data-wow-duration="500ms" data-wow-delay="600ms"
                  src="assets/img/icons/hero-icon-3.svg" alt="icon">
                <img class="hero-thumb__icon4 wow zoomIn animated" data-wow-duration="500ms" data-wow-delay="800ms"
                  src="assets/img/icons/hero-icon-4.svg" alt="icon">
                <img class="hero-thumb__icon5 wow zoomIn animated" data-wow-duration="500ms" data-wow-delay="1000ms"
                  src="assets/img/icons/hero-icon-5.svg" alt="icon">
                <img class="hero-thumb__icon6 wow zoomIn animated" data-wow-duration="500ms" data-wow-delay="1200ms"
                  src="assets/img/icons/hero-icon-6.png" alt="icon"> -->
                            </div>
                            <video class="animated-video"
                                style="max-width: 100%;
          max-height: 100%;
          position: relative;
          bottom: 55px;
          width: 317px;
          position: relative;
          float: right;
          height: 541px;
          "
                                autoplay muted loop>
                                <source src="{{ asset('frontend/img/about/about_lablum.webm') }}" type="video/mp4">
                                Your browser does not support the video tag.
                            </video>
                        </div>
                    </div>

                </div>
            </div>
        </section>
        <!-- hero-area-end -->
        <br></br>





        <section class="facts facts--bg position-relative pt-105 pb-75 fix" data-bg-image="assets/img/bg/facts-bg.jpg"
            style="margin-bottom: 95px;">
            <div class="container custom-container">
                <div class="row">






                    <div class="col-lg-4 wow fadeInRight animated" data-wow-duration="800ms" data-wow-delay="800ms">
                        <div class="facts-block facts-block--yellow mb-30">
                            <div class="facts-block__icon">
                                <img src="/frontend/img/elements/Accounts .1.svg" alt="#">
                            </div>
                            <div class="facts-block__infos">
                                <h2 class="facts-block__number"><span class="odometer" data-count="10"></span>k+
                                </h2>
                                <h3 class="facts-block__title">No. of Accounts</h3>
                            </div>
                        </div>
                    </div>













                    <div class="col-lg-4 wow fadeInLeft animated" data-wow-duration="800ms" data-wow-delay="800ms">
                        <div class="facts-block facts-block--cyan mb-30">
                            <div class="facts-block__icon">
                                <img src="/frontend/img/elements/Vector.svg" alt="#">
                            </div>
                            <div class="facts-block__infos">
                                <h2 class="facts-block__number"><span class="odometer" data-count="5000"></span>+
                                </h2>
                                <h3 class="facts-block__title">App Downloads</h3>
                            </div>
                        </div>
                    </div>





                    <div class="col-lg-4 wow fadeInUp animated" data-wow-duration="800ms" data-wow-delay="800ms">
                        <div class="facts-block facts-block--green mb-30">
                            <div class="facts-block__icon">
                                <img src="/frontend/img/elements/Video 1.svg" alt="#">
                            </div>
                            <div class="facts-block__infos">
                                <h2 class="facts-block__number"><span class="odometer" data-count="1155"></span>+
                                </h2>
                                <h3 class="facts-block__title">No. of videos</h3>
                            </div>
                        </div>
                    </div>






                </div>
            </div>
        </section>





        <section class="about about--area pt-50 pb-20">
            <div class="container custom-container">
                <div class="row align-items-center">
                    <div class="col-lg-6 mb-30">
                        <div class="about__image wow fadeInLeft animated" data-wow-duration="700ms"
                            data-wow-delay="500ms">
                            <img src="{{ asset('frontend/img/others/about_img01.png') }}" alt="img">
                        </div>
                    </div>
                    <div class="col-lg-6 mb-30">
                        <div class="about__content">
                            <div class="section-title animation-style2">
                                <span class="section-title__sub primary-color mb-10">ABOUT US</span>
                                <h2 class="section-title__main">Lablum </h2>
                            </div>
                            <div>
                                <p class="about__text pt-15">
                                    Welcome to Lablum, the best short video sharing app that makes you money just by
                                    watching videos! Whether you’re a social media addict or a content creator, Lablum
                                    offers a unique opportunity to have fun and make money at the same time.
                                </p>
                                <div class="about__features pt-15">
                                    <ul>
                                        <li>
                                            <span>
                                                <img src="{{ asset('frontend/img/icons/check-icon.svg') }}"
                                                    alt="icon">
                                            </span>
                                            How it works:
                                        </li>
                                        <p>Lablum is easy - watch short videos and make money. The more videos you watch,
                                            the more money you can make. With our user-friendly interface and engaging video
                                            content, you’ll never get bored of making some extra cash. </p>
                                        <li>
                                            <span>
                                                <img src="{{ asset('frontend/img/icons/check-icon.svg') }}"
                                                    alt="icon">
                                            </span>
                                            Features:
                                        </li>
                                        <p>Short Videos Galore: Dive into the largest collection of short videos in a
                                            variety of genres, ensuring there’s something for everyone. </p>
                                        <p>Get Rewarded: Get paid for the time you spend watching videos, sharing them with
                                            friends, and getting the chance to earn more. </p>
                                        <p>Connect with the community: Connect with fellow users, share your favorite
                                            videos, and discover new content every day.
                                            At Lablum, we believe in rewarding our users for their time and interest in
                                            short video content. Our mission is to provide a fun and exciting platform while
                                            providing entertainment and financial incentives. Join us today to start
                                            viewing, sharing, and earning on Lablum! Don't miss out on this exciting
                                            opportunity - sign up now and start enjoying Lablum benefits!
                                        </p>
                                        <!-- <li>
                                                <span>
                                                    <img src="{{ asset('frontend/img/icons/check-icon.svg') }}" alt="icon">
                                                </span>
                                                Tellus eget ultrices facilisis vulputate tortor egestas.
                                            </li> -->
                                    </ul>
                                </div>
                                <div class="about__button pt-20">
                                    <a href="{{ route('frontend.about') }}" class="btn">Read More</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>












        <section class="service service--h2 pt-20 pb-20">
            <div class="container custom-container">
                <div class="row align-items-center">
                    <div class="col-lg-7 mx-auto mb-35">
                        <div class="section-title--style2 text-center">
                            <span class="section-title__sub mb-1 primary-color-h2">
                                <!-- Engage and Earn -->
                            </span>
                            <h2 class="section-title__main">
                                Engage and Earn
                            </h2>
                        </div>
                    </div>
                </div>


                <div class="row" style="
    background-color: aliceblue;
    padding: 38px;
    ">
                    <div class="col-lg-6 mx-auto mb-35" style="display: flex;justify-content:center;align-items:center">
                        <!-- Video Player -->
                        <div class="video-container" style="display: flex;justify-content: center;">
                            <!-- Replace the iframe src attribute with your video URL -->
                            <iframe width="560" height="315"
                                src="https://www.youtube.com/embed/MOPBVQ9_Tu0?si=XzWTO7l-001OxI_b"
                                title="YouTube video player" frameborder="0"
                                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                                referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                        </div>
                    </div>

                    <div class="col-lg-6 mx-auto mb-35">
                        <p><strong>Short Videos Galore:</strong> Dive into the largest collection of short videos in a
                            variety of genres,
                            ensuring there’s something for everyone. </p>
                        <p>
                            <strong>Get Rewarded:</strong> Get paid for the time you spend watching videos, sharing them
                            with friends, and getting the chance to earn more.
                        </p>
                        <p> <strong>Connect with the community: </strong>Connect with fellow users, share your favorite
                            videos, and discover new content every day. </p>
                    </div>
                </div>
            </div>
        </section>





        <section class="service service--h2 pt-115 pb-135" style="padding-top:30px;padding-bottom:30px">
            <div class="container custom-container">
                <div class="row align-items-center">
                    <div class="col-lg-7 mx-auto mb-35">
                        <div class="section-title--style2 text-center">
                            <!-- <span class="section-title__sub mb-1 primary-color-h2">
                Our Services
              </span> -->
                            <h2 class="section-title__main">
                                WATCH AND SHARE
                            </h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3">
                        <div class="service-block service-block--style2 text-center"style="height:433px">
                            <span class="service-block__icon icon1">
                                <img src="https://media.chingari.io/apipublic/chingari-web-assets/icons/play-button.svg"
                                    style="width: 85px;" alt="earn-icon" loading="lazy">
                            </span>
                            <h3 class="service-block__title mb-0 pt-30">
                                <a href="service-details.html">WATCH</a>
                                <p style="color: black;">Watch as we unveil the timeless beauty and sophistication of our
                                    Classic Collection.
                                </p>
                            </h3>
                            <div class="about__button pt-20" style="padding-top:47px">
                                <a href="#" class="btn">Find out More</a>
                            </div>
                        </div>
                    </div>




                    <div class="col-lg-3">
                        <div class="service-block service-block--style2 text-center"style="height:433px">
                            <span class="service-block__icon icon4">
                                <img src="{{ asset('frontend/img/bg/Like Icon11.png') }}" style="width: 85px;"
                                    style="width: 85px;" alt="earn-icon" loading="lazy">
                            </span>
                            <h3 class="service-block__title mb-0 pt-30">
                                <a href="service-details.html">Like</a>
                                <p style="color: black; min-height: 84px;">Understand who you're talking to. Know their
                                    interests, preferences, and pain points."
                                </p>
                            </h3>
                            <div class="about__button pt-20" style="padding-top:47px">
                                <a href="#" class="btn">Find out More</a>
                            </div>
                        </div>
                    </div>






                    <div class="col-lg-3">
                        <div class="service-block service-block--style2 text-center"style="height:433px">
                            <span class="service-block__icon icon3">
                                <img src="https://media.chingari.io/apipublic/chingari-web-assets/icons/camera.svg"
                                    style="width: 85px;height:85px" alt="earn-icon" loading="lazy">
                            </span>
                            <h3 class="service-block__title mb-0 pt-30">
                                <a href="service-details.html">Create</a>
                                <p style="color: black;min-height: 84px;">Creating video content involves several steps,
                                    including planning, scripting, filming, editing, and publishing.</p>
                            </h3>
                            <div class="about__button pt-20">
                                <a href="#" class="btn">Find out More</a>
                            </div>
                        </div>
                    </div>




                    <div class="col-lg-3">
                        <div class="service-block service-block--style2 text-center"style="height:433px">
                            <span class="service-block__icon icon2">
                                <img src="https://media.chingari.io/apipublic/chingari-web-assets/icons/share.svg"
                                    style="width: 85px;" alt="earn-icon" loading="lazy">
                            </span>
                            <h3 class="service-block__title mb-0 pt-30">
                                <a href="service-details.html">Share</a>
                                <p style="color: black;min-height: 84px;"> "Focus on creating high-quality content that
                                    resonates with your audience."</p>
                            </h3>
                            <div class="about__button pt-20" style="padding-top:47px">
                                <a href="#" class="btn">Find out More</a>
                            </div>
                        </div>
                    </div>











                    <div class="col-lg-12">
                        <h3 class="service__text text-center mb-0">
                            Bring them together and you overcome the ordinary.
                            <a href="{{ route('frontend.about') }}">See what we do</a>
                        </h3>
                    </div>
                </div>
            </div>
        </section>






        <!-- featured-area -->
        <section class="featured featured--area tg-slide-wrap pb-65">
            <div class="container custom-container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="tg-sliderStyle1 swiper">
                            <div class="featured__wrapper swiper-wrapper">
                                <div class="featured__single swiper-slide">
                                    <div class="row align-items-center">
                                        <div class="col-lg-5 mb-30">
                                            <div class="featured__content">
                                                <div class="section-title animation-style2">
                                                    <span class="section-title__sub primary-color mb-10">
                                                        Featured Case Study
                                                    </span>
                                                    <h2 class="section-title__main">
                                                        Profile
                                                    </h2>
                                                </div>
                                                <p class="featured__text pt-15">
                                                    Simply creating an account with us is only a few taps and clicks away.
                                                    Once registered, our users are halfway done and can easily post their
                                                    short videos, here you can watch videos and earn money.
                                                </p>

                                                <div class="featured__button pt-25">
                                                    <a href="{{ route('frontend.about') }}" class="btn">
                                                        Read Case Study
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-7 mb-30">
                                            <div class="featured__img--right wow fadeInRightBig animated"
                                                data-wow-duration="800ms" data-wow-delay="200ms">
                                                <img src="{{ asset('frontend/img/poster/Profile (1).webp') }}"
                                                    alt="Featured">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="featured__single swiper-slide">
                                    <div class="row align-items-center">
                                        <div class="col-lg-5 mb-30">
                                            <div class="featured__content">
                                                <div class="section-title animation-style2">
                                                    <span class="section-title__sub primary-color mb-10">
                                                        Featured Case Study
                                                    </span>
                                                    <h2 class="section-title__main">
                                                        Categories
                                                    </h2>
                                                </div>
                                                <p class="featured__text pt-15">
                                                    Lablum provides a variety of content genres including comedy, music,
                                                    dance, education, and lifestyle. Our platform isn't restricted to any
                                                    particular genre, so feel free to explore new journeys.
                                                </p>

                                                <div class="featured__button pt-25">
                                                    <a href="#" class="btn">
                                                        Read Case Study
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-7 mb-30">
                                            <div class="featured__img--right">
                                                <img src="{{ asset('frontend/img/poster/Category 1.1 (1) (1).webp') }}"
                                                    alt="Featured">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="featured__single swiper-slide">
                                    <div class="row align-items-center">
                                        <div class="col-lg-5 mb-30">
                                            <div class="featured__content">
                                                <div class="section-title animation-style2">
                                                    <span class="section-title__sub primary-color mb-10">
                                                        Featured Case Study
                                                    </span>
                                                    <h2 class="section-title__main">
                                                        Community
                                                    </h2>
                                                </div>
                                                <p class="featured__text pt-15">
                                                    More than being just a platform, Lablum is a community of like-minded
                                                    people passionate about their work and digital creativity. We encourage
                                                    practices such as collaboration, feedback, and interaction amongst our
                                                    users, thereby instilling a sense of a supportive environment where
                                                    there's space for everyone.
                                                </p>

                                                <div class="featured__button pt-25">
                                                    <a href="#" class="btn">
                                                        Read Case Study
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-7 mb-30">
                                            <div class="featured__img--right">
                                                <img src="{{ asset('frontend/img/poster/Community 1.1.webp') }}"
                                                    alt="Featured">
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <div class="featured__single swiper-slide">
                                    <div class="row align-items-center">
                                        <div class="col-lg-5 mb-30">
                                            <div class="featured__content">
                                                <div class="section-title animation-style2">
                                                    <span class="section-title__sub primary-color mb-10">
                                                        Featured Case Study
                                                    </span>
                                                    <h2 class="section-title__main">
                                                        Earning
                                                    </h2>
                                                </div>
                                                <p class="featured__text pt-15">
                                                    Lablum specifically rewards its users for engaging in their content. You
                                                    can now watch video and earn money. With the help of our distinct
                                                    innovative monetization, users can gather their earnings based on the
                                                    time they spend on the app watching content. It's literally that simple,
                                                    the more you watch, the more you earn!
                                                </p>

                                                <div class="featured__button pt-25">
                                                    <a href="#" class="btn">
                                                        Read Case Study
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-7 mb-30">
                                            <div class="featured__img--right">
                                                <img src="{{ asset('frontend/img/poster/Earning 1.1 (1).webp') }}"
                                                    alt="Featured">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="featured__single swiper-slide">
                                    <div class="row align-items-center">
                                        <div class="col-lg-5 mb-30">
                                            <div class="featured__content">
                                                <div class="section-title animation-style2">
                                                    <span class="section-title__sub primary-color mb-10">
                                                        Featured Case Study
                                                    </span>
                                                    <h2 class="section-title__main">
                                                        Wallet
                                                    </h2>
                                                </div>
                                                <p class="featured__text pt-15">
                                                    Lablum’s digital wallet is a safe and secure way to receive your
                                                    rewards. No matter where you go, your wallet remains safe with us.
                                                </p>

                                                <div class="featured__button pt-25">
                                                    <a href="#" class="btn">
                                                        Read Case Study
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-7 mb-30">
                                            <div class="featured__img--right">
                                                <img src="{{ asset('frontend/img/poster/Wallet (1).0.webp') }}"
                                                    alt="Featured">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="featured__single swiper-slide">
                                    <div class="row align-items-center">
                                        <div class="col-lg-5 mb-30">
                                            <div class="featured__content">
                                                <div class="section-title animation-style2">
                                                    <span class="section-title__sub primary-color mb-10">
                                                        Featured Case Study
                                                    </span>
                                                    <h2 class="section-title__main">
                                                        Verification Badge
                                                    </h2>
                                                </div>
                                                <p class="featured__text pt-15">
                                                    The Verification Badge from Lablum indicates that your profile has gone
                                                    through thorough verification. It ensures authenticity and legitimacy.
                                                    The badge acts as a mark of approval from us about the genuineness of
                                                    your profile.
                                                </p>

                                                <div class="featured__button pt-25">
                                                    <a href="#" class="btn">
                                                        Read Case Study
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-7 mb-30">
                                            <div class="featured__img--right">
                                                <img src="{{ asset('frontend/img/poster/Feature Case Study.11.webp') }}"
                                                    alt="Featured">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tg-pagination1"></div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- featured-area-end -->


        <section class="featured featured--area tg-slide-wrap pb-65">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <h2 class="section-title__sub primary-color mb-10">Verification badge</h2>
                        <p style="text-align: justify">The Verification Badge signifies that Lablum entertainment private
                            limited has undergone a thorough verification process to confirm our identity and legitimacy. It
                            serves as a stamp of approval from reputable third-party organizations, providing our clients
                            and partners with peace of mind when engaging with us.</p>
                    </div>

                    <div class="col-lg-4" style="display: flex;
      justify-content: center;">
                        <img src="{{ asset('/frontend/img/about/Verification Badge.1.png') }}" alt="#"
                            style="border-radius: 12px">
                    </div>
                </div>
            </div>
        </section>





        <section class="partner partner--bg pt-135 pb-110" style="padding: 13px;">
            <div class="container custom-container">
                <div class="row">
                    <div class="col-lg-5 mb-30">
                        <div class="partner__content">
                            <div class="section-title animation-style2">
                                <span class="section-title__sub primary-color mb-10">
                                    Unleash your creativity
                                </span>
                                <h2 class="section-title__main text-white">
                                    Catch the Spark and Grow your world
                                </h2>
                            </div>
                            <p class="partner__text mb-45">
                                Be part of the community and start earning
                            </p>
                            <a href="#" class="btn">Download the App</a>
                        </div>
                    </div>
                    <div class="col-lg-7 mb-30">
                        <div id="carousel" style="margin-bottom: 0px">
                            <figure id="spinner">
                                <img src="{{ asset('/frontend/img/avatar/WhatsApp Image 2024-04-11 at 5.56 1 (1).png') }}"
                                    alt="Lablum Entertainment">
                                <img src="{{ asset('/frontend/img/avatar/WhatsApp Image 2024-04-11 at 5.56 1 (1).png') }}"
                                    alt="Lablum Entertainment">
                                <img src="{{ asset('/frontend/img/avatar/image 38522 (1).png') }}"
                                    alt="Lablum Entertainment">
                                <img src="{{ asset('/frontend/img/avatar/Frame 24.1 (1).png') }}"
                                    alt="Lablum Entertainment">
                                <img src="{{ asset('/frontend/img/avatar/2148161774 1 (2).png') }}"
                                    alt="Lablum Entertainment">
                                <img src="{{ asset('/frontend/img/bg/2149039660 1.png') }}" alt="Lablum Entertainment">
                                <img src="{{ asset('/frontend/img/bg/2150063128 1.png') }}" alt="Lablum Entertainment">
                                <img src="{{ asset('/frontend/img/bg/Frame 25.02.png') }}" alt="Lablum Entertainment">
                            </figure>
                        </div>
                        <!-- <span style="float:left" class="ss-icon" onclick="galleryspin('-')">&lt;</span>
            <span style="float:right" class="ss-icon" onclick="galleryspin('')">&gt;</span> -->
                    </div>
                </div>
            </div>
        </section>











        <!-- client-area -->
        <!-- <section class="client client--area tg-slide-wrap3 pb-95">
                <div class="container custom-container">
                    <div class="row">
                        <div class="col-lg-5 mx-auto">
                            <div class="section-title text-center mb-45 animation-style2">
                                <span class="section-title__sub primary-color mb-10">Client Testimonial</span>
                                <h2 class="section-title__main">What People are Saying!</h2>
                            </div>
                        </div>
                    </div>
                    <div class="tg-sliderStyle3 swiper">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <div class="client-block">
                                    <i class="client-block__icon">
                                        <img src="{{ asset('frontend/img/icons/icon-quote.svg') }}" alt="icon">
                                    </i>
                                    <p class="client-block__text pt-30">
                                        Lorem ipsum dolor sit amet consectetur. Ut tellus spendisse nulla aliquam. Risus
                                        rutrum tellus eget
                                        ultrices pretium nisi as amet facilisis. Augue eu vulate tortor egestas vivamus. The
                                        Commodo dictum
                                        massa phasellus.
                                    </p>
                                    <div class="client-block__author d-flex align-items-center pt-25">
                                        <div class="client-block__author-img">
                                            <img src="{{ asset('frontend/img/avatar/client_01.jpg') }}" alt="Client">
                                        </div>
                                        <div class="client-block__author-infos">
                                            <h3 class="client-block__author-name">
                                                Jenny Wilson
                                            </h3>
                                            <span class="client-block__author-designation">
                                                Managing Director
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="client-block">
                                    <i class="client-block__icon">
                                        <img src="{{ asset('frontend/img/icons/icon-quote.svg') }}" alt="icon">
                                    </i>
                                    <p class="client-block__text pt-30">
                                        Lorem ipsum dolor sit amet consectetur. Ut tellus
                                        spendisse nulla aliquam. Risus rutrum tellus eget
                                        ultrices pretium nisi as amet facilisis. Augue eu vulate
                                        tortor egestas vivamus. The Commodo dictum massa
                                        phasellus.
                                    </p>
                                    <div class="client-block__author d-flex align-items-center pt-25">
                                        <div class="client-block__author-img">
                                            <img src="{{ asset('frontend/img/avatar/client_02.jpg') }}" alt="Client">
                                        </div>
                                        <div class="client-block__author-infos">
                                            <h3 class="client-block__author-name">Jenny Bennett</h3>
                                            <span class="client-block__author-designation">Director of Content</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="client-block">
                                    <i class="client-block__icon">
                                        <img src="{{ asset('frontend/img/icons/icon-quote.svg') }}" alt="icon">
                                    </i>
                                    <p class="client-block__text pt-30">Lorem ipsum dolor sit amet consectetur. Ut tellus
                                        spendisse nulla
                                        aliquam. Risus rutrum tellus eget ultrices pretium nisi as amet facilisis. Augue eu
                                        vulate tortor
                                        egestas vivamus. The Commodo dictum massa phasellus.
                                    </p>
                                    <div class="client-block__author d-flex align-items-center pt-25">
                                        <div class="client-block__author-img">
                                            <img src="{{ asset('frontend/img/avatar/client_01.jpg') }}" alt="Client">
                                        </div>
                                        <div class="client-block__author-infos">
                                            <h3 class="client-block__author-name">Chester</h3>
                                            <span class="client-block__author-designation">Developer</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="client-block">
                                    <i class="client-block__icon">
                                        <img src="{{ asset('frontend/img/icons/icon-quote.svg') }}" alt="icon">
                                    </i>
                                    <p class="client-block__text pt-30">Lorem ipsum dolor sit amet consectetur. Ut tellus
                                        spendisse nulla
                                        aliquam. Risus rutrum tellus eget ultrices pretium nisi as amet facilisis. Augue eu
                                        vulate tortor
                                        egestas vivamus. The Commodo dictum massa phasellus.
                                    </p>
                                    <div class="client-block__author d-flex align-items-center pt-25">
                                        <div class="client-block__author-img">
                                            <img src="{{ asset('frontend/img/avatar/client_02.jpg') }}" alt="Client">
                                        </div>
                                        <div class="client-block__author-infos">
                                            <h3 class="client-block__author-name">Chester</h3>
                                            <span class="client-block__author-designation">Developer</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tg-pagination1 tg-pagination1--style2"></div>
                    </div>
                </div>
            </section> -->
        <!-- client-area-end -->

        <!-- facts-area -->


        <section class="partner  pt-135 pb-110" style="padding-top:50px;padding-bottom:50px">
            <div class="container custom-container">
                <div class="row">
                    <div class="col-lg-5 mb-30">
                        <div class="partner__content">
                            <div class="section-title animation-style2">

                                <h2 class="section-title__main">
                                    Join Lablum for a Rewarding Experience
                                </h2>
                            </div>
                            <p class="partner__text mb-45">
                                Our platform has been designed for an uninterrupted seamless affair for our creators as well
                                as viewers. The platform provides ample opportunities to not just enjoy the versatile
                                content but also make money simultaneously.
                            </p>
                            {{-- <a href="#" class="btn">See All Clients</a> --}}
                        </div>
                    </div>
                    <div class="col-lg-7 mb-30">
                        <div class="row gxy-2">
                            <div class="col-lg-12 col-md-12 wow fadeInUp animated" data-wow-duration="500ms"
                                data-wow-delay="200ms">
                                <div class="partner-block" style="background: none">
                                    <img src="{{ asset('/assets/images/all-img/Join Our Platform.png') }}"
                                        alt="Partner">
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- partner-area-end -->

















        <!-- estimate-area -->
        <div class="estimate estimate--bg">
            {{-- <div class="estimate__elements">
                <img class="estimate_element estimate_element--one" src="{{asset('frontend/img/elements/element1.svg')}}"
                    alt="element">
                <!-- <img class="estimate_element estimate_element--two" src="assets/img/elements/element2.svg" alt="element"> -->
            </div> --}}
            <div class="container custom-container">
                <div class="row">
                    <div class="col-lg-6 mb-30">
                        <div class="estimate__content">
                            <div class="section-title animation-style2">
                                <span class="section-title__sub text-white mb-10">
                                    Let’s Build a Community
                                </span>
                                <h2 class="section-title__main text-white">
                                    Earn Rewards by simply watching short videos on Lablum
                                </h2>
                            </div>
                            <div class="estimate-button pt-30">
                                <a href="{{ route('frontend.about') }}" class="btn btn--white">Download Now </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="estimate__right wow fadeInUp animated" data-wow-duration="800ms"
                            data-wow-delay="200ms">
                            <img src="{{ asset('frontend/img/others/estimate-right.png') }}" alt="Estimate">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- estimate-area-end -->

      







    </x-frontend.app-layout>
