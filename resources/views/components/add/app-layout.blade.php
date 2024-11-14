<!DOCTYPE html>
<html>

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
    <title>Lablum</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, 
    -scalable=no" />
    <meta content="Admin Dashboard" name="description" />
    <meta content="ThemeDesign" name="author" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="shortcut icon"href="{{asset('1assets/images/Group 20.png')}}">
    <link href="{{asset('addasset/plugins/datatables/jquery.dataTables.min.css')}}" rel="stylesheet" type="text/css" />
    <link href="{{asset('addasset/plugins/datatables/responsive.bootstrap.min.css')}}" rel="stylesheet" type="text/css" />
    <link href="{{asset('addasset/plugins/datatables/dataTables.bootstrap.min.css')}}" rel="stylesheet" type="text/css" />
    <link href="{{asset('addasset/css/bootstrap.min.css')}}" rel="stylesheet" type="text/css">
    <link href="{{asset('addasset/css/icons.css')}}" rel="stylesheet" type="text/css">
    <link href="{{asset('addasset/css/style.css')}}" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"
    integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA=="
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  

    <script>(function (i, s, o, g, r, a, m) { i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () { (i[r].q = i[r].q || []).push(arguments) }, i[r].l = 1 * new Date(); a = s.createElement(o), m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m) })(window, document, 'script', '../../www.google-analytics.com/analytics.js', 'ga'); ga('create', 'UA-86308552-1', 'auto'); ga('send', 'pageview');</script>
</head>
<style>
    .button-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: flex-start;
    }

    .button-container button {
        margin-right: 10px;
        /* Adjust spacing between buttons */
        margin-bottom: 10px;
        /* Add margin bottom for spacing */
    }

    /* For mobile view */
    @media (max-width: 576px) {
        .button-container {
            flex-direction: column;
            align-items: flex-start;
        }
    }

    /* Adjust the button color */
    .btn.bg-purple-gradient {
        background: #9551f6c4;
        /* Adjust colors as needed */
        border-color: #8a2be2;
        /* Adjust border color */
    }

    .btn.bg-purple-gradient:hover {
        background: linear-gradient(to right, #ff69b4, #8a2be2);
        /* Adjust hover colors as needed */
        border-color: #8a2be2;
        /* Adjust hover border color */
    }

    .button-container {
        display: flex;
        flex-wrap: wrap;
        align-items: center;
        /* Align items vertically */
        justify-content: flex-start;
    }

    .button-container button {
        margin-right: 10px;
        /* Adjust spacing between buttons */
        margin-bottom: 10px;
        /* Add margin bottom for spacing */
    }

    /* For mobile view */
    @media (max-width: 576px) {
        .button-container {
            flex-direction: column;
            align-items: flex-start;
        }
    }

    /* Adjust the button color */
    .btn.bg-purple-gradient {
        background: linear-gradient(to right, #8a2be2, #ff69b4);
        /* Adjust colors as needed */
        border-color: #8a2be2;
        /* Adjust border color */
        border-radius: 6px;
    }

    .btn.bg-purple-gradient:hover {
        background: linear-gradient(to right, #ff69b4, #8a2be2);
        /* Adjust hover colors as needed */
        border-color: #8a2be2;
        /* Adjust hover border color */
    }

    /* Adjust alignment of the dropdown button arrow */
    button.collapsed.btn::after {
        vertical-align: middle;
        /* Align the arrow vertically */
    }

    .btn {
        position: relative;
        /* Set position to relative */
        padding-right: 25px;
        /* Adjust padding to make space for the arrow */
    }

    .btn svg {
        position: absolute;
        left: 44px;
        top: 50%;
        transform: translateY(-50%);
        fill: white;
    }
</style>

<body class="fixed-left">
    <div id="wrapper">
      
        <x-add.header />
        <x-add.sidebar />



      
        <div class="content-page">
          
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

            <footer class="footer"> 2016 - 2020 © Xadmino. </footer>
        </div>
    </div>
    <script src="{{asset('addasset/js/jquery.min.js')}}"></script>
    <script src="{{asset('addasset/js/bootstrap.min.js')}}"></script>
    <script src="{{asset('addasset/js/modernizr.min.js')}}"></script>
    <script src="{{asset('addasset/js/detect.js')}}"></script>
    <script src="{{asset('addasset/js/fastclick.js')}}"></script>
    <script src="{{asset('addasset/js/jquery.slimscroll.js')}}"></script>
    <script src="{{asset('addasset/js/jquery.blockUI.js')}}"></script>
    <script src="{{asset('addasset/js/waves.js')}}"></script>
    <script src="{{asset('addasset/js/wow.min.js')}}"></script>
    <script src="{{asset('addasset/js/jquery.nicescroll.js')}}"></script>
    <script src="{{asset('addasset/js/jquery.scrollTo.min.js')}}"></script>
    <script src="{{asset('addasset/plugins/jquery-sparkline/jquery.sparkline.min.js')}}"></script>
    <script src="{{asset('addasset/plugins/datatables/jquery.dataTables.min.js')}}"></script>
    <script src="{{asset('addasset/plugins/datatables/dataTables.bootstrap.js')}}"></script>
    <script src="{{asset('addasset/plugins/datatables/dataTables.responsive.min.js')}}"></script>
    <script src="{{asset('addasset/plugins/datatables/responsive.bootstrap.min.js')}}"></script>
    <script src="{{asset('addasset/pages/dashborad.js')}}"></script>
    <script src="{{asset('addasset/js/app.js')}}"></script>
</body>

</html>