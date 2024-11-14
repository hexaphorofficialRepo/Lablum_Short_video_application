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
    <title>Lablum - Short Video Application</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, 
    -scalable=no" />
    <meta content="Admin Dashboard" name="description" />
    <meta content="ThemeDesign" name="author" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="shortcut icon" href="{{asset('1assets/images/Group 20.png')}}">
    <link href="{{asset('1assets/plugins/datatables/jquery.dataTables.min.css')}}" rel="stylesheet" type="text/css" />
    <link href="{{asset('1assets/plugins/datatables/responsive.bootstrap.min.css')}}" rel="stylesheet" type="text/css" />
    <link href="{{asset('1assets/plugins/datatables/dataTables.bootstrap.min.css')}}" rel="stylesheet" type="text/css" />
    <link href="{{asset('1assets/css/bootstrap.min.css')}}" rel="stylesheet" type="text/css">
    <link href="{{asset('1assets/css/icons.css')}}" rel="stylesheet" type="text/css">
    <link href="{{asset('1assets/css/style.css')}}" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


    <script src="https://cdn.ckeditor.com/4.16.2/full/ckeditor.js"></script>
    <!-- Scripts -->
 
    <meta name="csrf-token" content="{{ csrf_token() }}">

 
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
        background: linear-gradient(to right, #8a2be2, #ff69b4);
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
      <x-backend.top-bar />
      {{-- <x-backend.side-bar /> --}}
        <div class="content-page">
          {{$slot}}
            <footer class="footer"> 2024 - 2024 © Lablum. </footer>
        </div>
    </div>

    

    <script>
        CKEDITOR.plugins.addExternal('youtube', './youtube/');
        CKEDITOR.editorConfig = function(config) {
            config.extraPlugins = 'youtube';
        };
        CKEDITOR.replace('terms');
        CKEDITOR.replace('terms');
        </script>
    <script src="{{asset('1assets/js/jquery.min.js')}}"></script>
    <script src="{{asset('1assets/js/bootstrap.min.js')}}"></script>
    <script src="{{asset('1assets/js/modernizr.min.js')}}"></script>
    <script src="{{asset('1assets/js/detect.js')}}"></script>
    <script src="{{asset('1assets/js/fastclick.js')}}"></script>
    <script src="{{asset('1assets/js/jquery.slimscroll.js')}}"></script>
    <script src="{{asset('1assets/js/jquery.blockUI.js')}}"></script>
    <script src="{{asset('1assets/js/waves.js')}}"></script>
    <script src="{{asset('1assets/js/wow.min.js')}}"></script>
    <script src="{{asset('1assets/js/jquery.nicescroll.js')}}"></script>
    <script src="{{asset('1assets/js/jquery.scrollTo.min.js')}}"></script>
    <script src="{{asset('1assets/plugins/jquery-sparkline/jquery.sparkline.min.js')}}"></script>
    <script src="{{asset('1assets/plugins/datatables/jquery.dataTables.min.js')}}"></script>
    <script src="{{asset('1assets/plugins/datatables/dataTables.bootstrap.js')}}"></script>
    <script src="{{asset('1assets/plugins/datatables/dataTables.responsive.min.js')}}"></script>
    <script src="{{asset('1assets/plugins/datatables/responsive.bootstrap.min.js')}}"></script>
    <script src="{{asset('1assets/pages/dashborad.js')}}"></script>
    <script src="{{asset('1assets/js/app.js')}}"></script>
</body>

</html>