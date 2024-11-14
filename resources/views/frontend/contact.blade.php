

@section('meta_title', 'Contact Us')
@section('meta_description', 'Reach out to our friendly support team via email or phone . You can also send us a message directly. We are here to help!')



<x-frontend.app-layout :canonicalUrl="url('https://lablum.com/contact-us')">
 

    <!-- breadcrumb -->
    <section class="breadcrumb-area">
        <div class="tg-breadcrumb-bg" data-bg-image="{{ asset('frontend/img/others/inner-page-breadcumb.jpg') }}">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-12">
                        <div class="tg-breadcrumb">
                            <h1 class="tg-breadcrumb-title">Contact Us</h1>
                            <div class="tg-breadcrumb-link">
                                <span class="tg-breadcrumb-active"><a href="{{ route('frontend.home') }}">Home</a></span>
                                <span>Contact Us</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb-end -->

    <!-- Contact -->
    <section class="contact pt-120">
        <div class="container custom-container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="contact-block">
                        <h2 class="h2-40 mb-35">
                            We're Always Eager to Hear From You!
                        </h2>
                        <div class="contact-block__item mb-25">
                            <h3 class="contact-block__title">Address</h3>
                            <p class="contact-block__text">Lenka House, 2nd floor, Ranital Bazar, Rahanja, Bhadrak-
                                756111, Orissa
                            </p>
                        </div>
                        <div class="contact-block__item mb-25">
                            <h3 class="contact-block__title">Email</h3>
                            <a class="contact-block__text" href="mailto:info@example.com">support@lablum.com</a>
                        </div>
                        <div class="contact-block__item mb-25">
                            <h3 class="contact-block__title">Phone</h3>
                            <a class="contact-block__text" href="tel:0123456">(+91) 8658310023</a>
                        </div>
                        <div class="social-block pt-30">
                            <ul>
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
                                        <i class="fa-brands fa-youtube"></i>
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
                <div class="col-lg-6">
                    <div class="contact-right">
                        <form action="{{ route('user.contact.store') }}" method="POST"
                            class="section-form section-form--style4">
                            @csrf
                            <h3 class="section-form__title">Send a Message</h3>
                            <p>
                               Send us message for any inquiry you want , Our team is always there to respond you
                            </p>
                            <div class="section-form__input-box pt-10">
                                <div class="section-form__item">
                                    <input type="text" name="fullname" class="section-form__input-field"
                                        value="{{ old('fullname') }}" placeholder="Name*">

                                    @error('fullname')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="section-form__item">
                                    <input type="email" name="email" value="{{ old('email') }}"
                                        class="section-form__input-field" placeholder="Email*">
                                    @error('email')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="section-form__item">
                                    <input type="text" name="phone" value="{{ old('phone') }}"
                                        class="section-form__input-field" placeholder="Phone">
                                    @error('phone')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="section-form__item">
                                    <input type="text" name="subject" value="{{ old('subject') }}"
                                        class="section-form__input-field" placeholder="Subject">
                                    @error('subject')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="section-form__item">
                                    <textarea class="section-form__input-field textarea @error('message') is-invalid @enderror" name="message"
                                        placeholder="Comment*">{{ old('message') }}</textarea>
                                    @error('message')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>

                                <div class="section-form__item">
                                    <div class="section-form__button">
                                        <button type="submit" class="btn text-uppercase">
                                            Send a Message
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Contact End -->

    <!-- Map -->
    <div class="map-bg">
        <iframe
            src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d193502.96100813415!2d-74.1369342267891!3d40.729379535002856!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sbd!4v1685268313256!5m2!1sen!2sbd"></iframe>
    </div>



    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

    <!-- Script to show SweetAlert message -->
    <script>
        // Check if there is a success message flashed from controller
        let successMessage = '{{ session('success') }}';
        if (successMessage) {
            Swal.fire({
                icon: 'success',
                title: 'Success',
                text: successMessage,
                showConfirmButton: false,
                timer: 2000 // Close alert after 2 seconds
            });
        }
    </script>
    <!-- Map-end -->
</x-frontend.app-layout>
