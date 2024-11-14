<!DOCTYPE html>
<html lang="en" dir="ltr">


<!-- Mirrored from dashcode-html.codeshaper.tech/signin-one.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 17 Nov 2023 07:32:00 GMT -->

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <title>Lablum - Short Video Application</title>
    <link rel="icon" type="image/png" href="{{ asset('frontend/img/icons/fav_icon_new (2).png') }}">
    <link rel="preconnect" href="https://fonts.googleapis.com/">
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&amp;display=swap" rel="stylesheet">
    <link rel="stylesheet" href="{{asset('assets/css/rt-plugins.css')}}">
    <link href="{{asset('../unpkg.com/aos%402.3.0/dist/aos.css')}}" rel="stylesheet">
    <link rel="stylesheet" href="{{asset('../unpkg.com/leaflet%401.9.3/dist/leaflet.css')}}" integrity="sha256-kLaT2GOSpHechhsozzB+flnD+zUyjE2LlfWPgU04xyI=" crossorigin="">
    <link rel="stylesheet" href="{{asset('assets/css/app.css')}}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/izitoast/1.4.0/css/iziToast.min.css" integrity="sha512-O03ntXoVqaGUTAeAmvQ2YSzkCvclZEcPQu1eqloPaHfJ5RuNGiS4l+3duaidD801P50J28EHyonCV06CUlTSag==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="{{asset('assets/js/store.js')}}" sync></script>
</head>

<body class=" font-inter skin-default">

    {{$slot}}

    <!-- scripts -->
    <script src="{{asset('assets/js/jquery-3.6.0.min.js')}}"></script>
  <script src="{{asset('assets/js/rt-plugins.js')}}"></script>
  <script src="{{asset('assets/js/app.js')}}"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/izitoast/1.4.0/js/iziToast.min.js" integrity="sha512-Zq9o+E00xhhR/7vJ49mxFNJ0KQw1E1TMWkPTxrWcnpfEFDEXgUiwJHIKit93EW/XxE31HSI5GEOW06G6BF1AtA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    @if(Session::has('success'))
    <script>
        iziToast.success({
            position: 'topRight',
            message: "{{ Session::get('success') }}"
        });
    </script>
    @php
    Session::forget('message');
    @endphp
    @endif
    @if (Session::has('error'))
    <script>
        iziToast.error({
            position: 'topRight',
            message: "{{ Session::get('error') }}"
        });
    </script>
    @php
    Session::forget('error');
    @endphp
    @endif
</body>

</html>
<style>
  body {
        color: #060c;
        font-family: "Montserrat", sans-serif;
        background: url({{asset('assets/images/auth/ils1.png')}});
        background-repeat: no-repeat;
        background-size: cover;
        font-size: 14px;
        font-size: 0.875rem;
        font-weight: 400;
        height: 100%;
        line-height: 1.5;
        margin: 0;
        min-height: 100vh;
        position: relative;
    }

    body:before {
        content: '';
        background: rgba(97, 95, 69, 0.60); /* Adjust the last value (0.75) for opacity */
        height: 100%;
        width: 100%;
        position: fixed;
        top: 0;
        left: 0;
        z-index: -1;
    }
</style>
