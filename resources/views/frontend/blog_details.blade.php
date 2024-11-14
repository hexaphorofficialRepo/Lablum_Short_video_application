<x-frontend.app-layout :canonicalUrl="url('https://lablum.com/blog-details/{slug}')">


    <!-- breadcrumb -->
    <section class="breadcrumb-area">
        <div class="tg-breadcrumb-bg" data-bg-image="{{ asset('frontend/img/others/inner-page-breadcumb.jpg') }}">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-12">
                        <div class="tg-breadcrumb">
                            <h2 class="tg-breadcrumb-title">Blog</h2>
                            <div class="tg-breadcrumb-link">
                                <span class="tg-breadcrumb-active"><a href="{{ route('frontend.home') }}">Home</a></span>
                                <span>{{$blog->title}}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb-end -->

    <!-- Blog List -->
    <section class="blog-list pt-120 pb-110">
        <div class="container custom-container">
            <div class="row">
                <div class="col-lg-8 mb-30">
                    <div class="blog-block blog-block--details">
                        <div class="blog-block__content">
                            <?php
                            
                            $updateAt = date('F j, Y', strtotime($blog->update_at));
                            
                            $categoryTitle = $blog->category->title;
                            ?>

                            <!--<span class="blog-block__meta">-->
                            <!--    <?php echo $updateAt; ?> _ <span><?php echo $categoryTitle; ?></span>-->
                            <!--</span>-->
                            <h2 class="blog-block__heading h2-40 pt-10 mb-0">
                                {{ $blog->title }}
                            </h2>
                            <p class="blog-block__text pt-10 mb-35">
                                {{ $blog->meta_description }}
                            </p>
                            <img class="rounded-4 mb-35" src="{{ asset('storage/' . $blog->thumbnail) }}">
                            <p class="blog-block__text pt-10 mb-20">
                                {{ $blog->meta_description }}
                            </p>
                            <p class="blog-block__text pt-10 mb-35">
                                {!! $blog->description !!}
                            </p>
                            
                            <div class="blog-block__bottom pt-20">
                                <div class="row">
                                    <div class="col-md-7 mb-30">
                                        <div class="inside-tags">
                                            <h3 class="inside-tags__title">Tags:</h3>
                                            <ul>
                                                @foreach(explode(',', $blog->tag) as $tag)
                                                    <li>
                                                        <a >{{ $tag }}</a>
                                                    </li>
                                                @endforeach
                                            </ul>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-5 mb-30">
                                        <div class="social-block">
                                            <ul class="justify-content-end">
                                                <li>
                                                    <a class="facebook" href="#">
                                                        <i class="fa-brands fa-facebook-f"></i>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a class="twitter" href="#">
                                                        <i class="fa-brands fa-twitter"></i>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a class="pinterest" href="#">
                                                        <i class="fa-brands fa-pinterest-p"></i>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a class="linkedin" href="#">
                                                        <i class="fa-brands fa-linkedin-in"></i>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a class="instagram" href="#">
                                                        <i class="fa-brands fa-instagram"></i>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                
                    {{-- <div class="row pt-30 mb-40">
                        <div class="col-12">
                            <div class="comments-block">
                                <h4 class="comments-block__title mb-30">Comments (3)</h4>
                                <ul>
                                    <li class="mb-35">
                                        <div class="comments-block__item">
                                            <div class="comments-block__image">
                                                <a href="project-details.html">
                                                    <img src="assets/img/blog/comenter-image.jpg" alt="Comment">
                                                </a>
                                            </div>
                                            <div class="comments-block__content">
                                                <header class="comments-block__header">
                                                    <div class="comments-block__name">
                                                        <h5>David Martin</h5>
                                                        <span>June 30, 2023</span>
                                                    </div>
                                                    <button class="comments-block__button" type="button">
                                                        REPLY
                                                    </button>
                                                </header>
                                                <p class="comments-block__text pt-15">
                                                    Lorem ipsum dolor sit amet consectetur. Ut tellus
                                                    suspendisse nulla aliquam. Risus rutrum tellus
                                                    eget ultrices pretium nisi amet facilisis. Augue
                                                    vulputate tortor egestas cursus vivamus.
                                                </p>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="mb-35">
                                        <div class="comments-block__item comments-block__reply">
                                            <div class="comments-block__image">
                                                <a href="project-details.html">
                                                    <img src="assets/img/blog/comenter-image.jpg" alt="Comment">
                                                </a>
                                            </div>
                                            <div class="comments-block__content">
                                                <header class="comments-block__header">
                                                    <div class="comments-block__name">
                                                        <h5>David Martin</h5>
                                                        <span>June 30, 2023</span>
                                                    </div>
                                                    <button class="comments-block__button" type="button">
                                                        REPLY
                                                    </button>
                                                </header>
                                                <p class="comments-block__text pt-15">
                                                    Lorem ipsum dolor sit amet consectetur suspendisse
                                                    nulla aliquam. Risus rutrum tellus ultrices.
                                                </p>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="comments-block__item">
                                            <div class="comments-block__image">
                                                <a href="project-details.html">
                                                    <img src="assets/img/blog/comenter-image.jpg" alt="Comment">
                                                </a>
                                            </div>
                                            <div class="comments-block__content">
                                                <header class="comments-block__header">
                                                    <div class="comments-block__name">
                                                        <h5>David Martin</h5>
                                                        <span>June 30, 2023</span>
                                                    </div>
                                                    <button class="comments-block__button" type="button">
                                                        REPLY
                                                    </button>
                                                </header>
                                                <p class="comments-block__text pt-15">
                                                    Lorem ipsum dolor sit amet consectetur. Ut tellus
                                                    suspendisse nulla aliquam. Risus rutrum tellus
                                                    eget ultrices pretium nisi amet facilisis. Augue
                                                    vulputate tortor egestas cursus vivamus.
                                                </p>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <form action="#" class="section-form section-form--style3">
                        <h3 class="section-form__title">Leave A Comment</h3>
                        <div class="section-form__input-box pt-25">
                            <input type="text" class="section-form__input-field" placeholder="Name*">
                            <input type="email" class="section-form__input-field" placeholder="Email*">
                            <input type="text" class="section-form__input-field" placeholder="Website*">
                            <textarea class="section-form__input-field textarea" name="message" placeholder="Comment*"></textarea>
                            <div class="section-form__formcheck">
                                <input class="section-form__checkbox-input" type="checkbox" id="defaultCheck1">
                                <label class="section-form__checkbox-name" for="defaultCheck1">
                                    Save my name, email, and website in this browser for the
                                    next time I comment.
                                </label>
                            </div>
                            <div class="section-form__button">
                                <button type="button" class="btn text-uppercase">
                                    Post Comment
                                </button>
                            </div>
                        </div>
                    </form> --}}
                </div>
                <div class="col-lg-4 mb-30">
                    <div class="sidebar">
                        {{-- <form class="sidebar-search sidebar-search--style2 sidebar__block sidebar__block--style2 mb-35"
                            action="#">
                            <div class="position-relative">
                                <input class="sidebar-search__field" type="text"
                                    placeholder="Enter Your Keywords...">
                                <button class="sidebar-search__button" type="submit" tabindex="0">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </button>
                            </div>
                        </form> --}}
                        <div class="sidebar-blog sidebar__block sidebar__block--style2 mb-40">
                            <h3 class="sidebar__title mb-15">Recent post</h3>
                            @foreach($similarBlogs as $blog)
                            <div class="blog-block blog-block--style6 mb-25">
                                <div class="blog-block__img">
                                    <a class="blog-block__img__link" href="{{route('blog.details',['slug' => $blog->slug])}}">
                                        <img class="rounded-2" src="{{ asset('storage/' . $blog->thumbnail) }}"
                                            alt="Blog">
                                    </a>
                                </div>
                                <div class="blog-block__content">
                                    <span class="blog-block__meta">
                                        <i class="fa-regular fa-calendar-days"></i> {{ $blog->updated_at->format('F d, Y') }}
                                    </span>
                                    
                                    <h4 class="blog-block__heading mb-0">
                                        <a href="{{route('blog.details',['slug' => $blog->slug])}}">
                                            {{$blog->title}}
                                        </a>
                                    </h4>
                                </div>
                            </div>
                            @endforeach
                            
                        </div>
                        <div
                            class="sidebar-category sidebar-category--style2 sidebar__block sidebar__block--style2 mb-40">
                            <h3 class="sidebar__title mb-10">Categories</h3>
                            <ul>
                                @foreach($blogCategories as $category)
                                <li>
                                    <a href="{{ route('category.blog', $category->slug) }}">{{$category->title}} <span>({{ $category->blogs()->count() }})</span></a>
                                </li>
                                @endforeach
                             
                            </ul>
                        </div>
                    
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog List End -->

    <!-- estimate-area -->
    <div class="estimate estimate--bg">
        <div class="estimate__elements">
            <img class="estimate__element estimate__element--one" src="{{asset('frontend/img/elements/element1.svg')}}"
                alt="element">
            <!-- <img class="estimate__element estimate__element--two" src="assets/img/elements/element2.svg" alt="element"> -->
        </div>
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
                    <div class="estimate__right wow fadeInUp animated" data-wow-duration="800ms" data-wow-delay="200ms">
                        <img src="{{asset('frontend/img/others/estimate-right.png')}}" alt="Estimate">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- estimate-area-end -->







</x-frontend.app-layout>
