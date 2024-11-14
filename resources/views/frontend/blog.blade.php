@section('meta_title', 'Lablum Blogs')




<x-frontend.app-layout :canonicalUrl="url('https://lablum.com/blog')">
   


 <!-- breadcrumb -->
 <section class="breadcrumb-area">
    <div class="tg-breadcrumb-bg" data-bg-image="assets/img/others/inner-page-breadcumb.jpg">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-12">
            <div class="tg-breadcrumb">
              <h2 class="tg-breadcrumb-title">Blog Modern</h2>
              <div class="tg-breadcrumb-link">
                <span class="tg-breadcrumb-active"><a href="{{ route('frontend.home') }}">Home</a></span>
                <span>Blog Modern</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- breadcrumb-end -->

  <section class="blog pt-120 pb-110">
    <div class="container custom-container">
      <div class="row">
  
        @foreach($blogs as $blog)
        <div class="col-lg-4 col-md-6 mb-25">
          <div class="blog-block blog-block--style4">
            <div class="blog-block__img">
              <a class="blog-block__img__link" href="{{route('blog.details',['slug' => $blog->slug])}}">
                <img src="{{ asset('storage/' . $blog->thumbnail) }}" alt="Blog">
              </a>
            </div>
            <div class="blog-block__content pt-20">
              
                

              <h3 class="blog-block__heading pt-10 mb-0">
                <a href="{{route('blog.details',['slug' => $blog->slug])}}">
                {{$blog->title}}
                </a>
              </h3>
            </div>
          </div>
        </div>
        @endforeach
        
      </div>
    </div>
  </section>

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