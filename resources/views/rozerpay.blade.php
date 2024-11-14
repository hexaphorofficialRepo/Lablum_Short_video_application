<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>Laravel - Razorpay Payment Gateway Integration</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>





<style>
    ::selection {
        background: #f31544;
        color: #FFF;
    }

    ::moz-selection {
        background: #f31544;
        color: #FFF;
    }

    .clearfix::after {
        content: "";
        clear: both;
        display: table;
    }

    .col-left {
        float: left;
    }

    .col-right {
        float: right;
    }

    h1 {
        font-size: 1.5em;
        color: #444;
    }

    h2 {
        font-size: .9em;
    }

    h3 {
        font-size: 1.2em;
        font-weight: 300;
        line-height: 2em;
    }

    p {
        font-size: .75em;
        color: #666;
        line-height: 1.2em;
    }

    a {
        text-decoration: none;
        color: #00a63f;
    }

    #invoiceholder {
        width: 100%;
        height: 100%;
        padding: 0 0;
    }

    #invoice {
        position: relative;
        margin: 0 auto;

        background: #FFF;
    }

    [id*='invoice-'] {
        /* Targets all id with 'col-' */
        /*  border-bottom: 1px solid #EEE;*/
        padding: 20px;
    }

    #invoice-top {
        border-bottom: 2px solid #00a63f;
    }

    #invoice-mid {
        min-height: 110px;
    }

    #invoice-bot {
        min-height: 240px;
    }

    .logo {
        display: inline-block;
        vertical-align: middle;
        width: 110px;
        overflow: hidden;
    }

    .info {
        display: inline-block;
        vertical-align: middle;
        margin-left: 20px;
    }

    .logo img,
    .clientlogo img {
        width: 100%;
    }

    .clientlogo {
        display: inline-block;
        vertical-align: middle;
        width: 50px;
    }

    .clientinfo {
        display: inline-block;
        vertical-align: middle;
        margin-left: 20px
    }

    .title {
        float: right;
    }

    .title p {
        text-align: right;
    }

    #message {
        margin-bottom: 30px;
        display: block;
    }

    h2 {
        margin-bottom: 5px;
        color: #444;
    }

    .col-right td {
        color: #666;
        padding: 5px 8px;
        border: 0;
        font-size: 0.75em;
        border-bottom: 1px solid #eeeeee;
    }

    .col-right td label {
        margin-left: 5px;
        font-weight: 600;
        color: #444;
    }

    .cta-group a {
        display: inline-block;
        padding: 7px;
        border-radius: 4px;
        background: rgb(196, 57, 10);
        margin-right: 10px;
        min-width: 100px;
        text-align: center;
        color: #fff;
        font-size: 0.75em;
    }

    .cta-group .btn-primary {
        background: #00a63f;
    }

    .cta-group.mobile-btn-group {
        display: none;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    td {
        padding: 10px;
        border-bottom: 1px solid #cccaca;
        font-size: 0.90em;
        text-align: left;
    }

    .tabletitle th {
        border-bottom: 2px solid #ddd;
        text-align: right;
    }

    .tabletitle th:nth-child(2) {
        text-align: left;
    }

    th {
        font-size: 0.8em;
        text-align: left;
        padding: 5px 10px;
    }

    .item {
        width: 50%;
    }

    .list-item td {
        text-align: right;
    }

    .list-item td:nth-child(2) {
        text-align: left;
    }

    .total-row th,
    .total-row td {
        text-align: right;
        font-weight: 700;
        font-size: .75em;
        border: 0 none;
    }

    .table-main {}

    footer {
        border-top: 1px solid #eeeeee;
        ;
        padding: 15px 20px;
    }

    .effect2 {
        position: relative;
    }

    .effect2:before,
    .effect2:after {
        z-index: -1;
        position: absolute;
        content: "";
        bottom: 15px;
        left: 10px;
        width: 50%;
        top: 80%;
        max-width: 300px;
        background: #777;
        -webkit-box-shadow: 0 15px 10px #777;
        -moz-box-shadow: 0 15px 10px #777;
        box-shadow: 0 15px 10px #777;
        -webkit-transform: rotate(-3deg);
        -moz-transform: rotate(-3deg);
        -o-transform: rotate(-3deg);
        -ms-transform: rotate(-3deg);
        transform: rotate(-3deg);
    }

    .effect2:after {
        -webkit-transform: rotate(3deg);
        -moz-transform: rotate(3deg);
        -o-transform: rotate(3deg);
        -ms-transform: rotate(3deg);
        transform: rotate(3deg);
        right: 10px;
        left: auto;
    }

    @media screen and (max-width: 991px) {
        h1 {
            font-size: .9em;
        }

        #invoice {
            width: 100%;
        }

        #message {
            margin-bottom: 20px;
        }

        [id*='invoice-'] {
            padding: 20px 10px;
        }

        .logo {
            width: 140px;
        }

        .title {
            float: none;
            display: inline-block;
            vertical-align: middle;
            margin-left: 40px;
        }

        .title p {
            text-align: left;
        }

        .col-left,
        .col-right {
            width: 100%;
        }

        .table {
            margin-top: 20px;
        }

        #table {
            white-space: nowrap;
            overflow: auto;
        }

        td {
            white-space: normal;
        }

        .cta-group {
            text-align: center;
        }

        .cta-group.mobile-btn-group {
            display: block;
            margin-bottom: 20px;
        }

        /====================Table====================/ .table-main {
            border: 0 none;
        }

        .table-main thead {
            border: none;
            clip: rect(0 0 0 0);
            height: 1px;
            margin: -1px;
            overflow: hidden;
            padding: 0;
            position: absolute;
            width: 1px;
        }

        .table-main tr {
            border-bottom: 2px solid #eee;
            display: block;
            margin-bottom: 20px;
        }

        .table-main td {
            font-weight: 700;
            display: block;
            padding-left: 40%;
            max-width: none;
            position: relative;
            border: 1px solid #cccaca;
            text-align: left;
        }

        .table-main td:before {
            /*
        * aria-label has no advantage, it won't be read inside a table
        content: attr(aria-label);
        */
            content: attr(data-label);
            position: absolute;
            left: 10px;
            font-weight: normal;
            text-transform: uppercase;
        }

        .total-row th {
            display: none;
        }

        .total-row td {
            text-align: left;
        }

        footer {
            text-align: center;
        }
    }
</style>




<body>
    <div id="app">
        <main class="py-4" style="height:100vh;background:url(/addasset/images/pexels-madison-inouye-1831234.jpg)">
            <div class="container" style="height: 90vh">
                <div class="row" style="display: flex;justify-content:center;align-items:center;height:90vh">
                    <div class="col-md-8 col-lg-8 col-sm-8 ">
                        @if (session('error'))
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                {{ session('error') }}
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        @endif

                        @if (session('success'))
                            <script>
                                Swal.fire({
                                    icon: 'success',
                                    title: 'Success!',
                                    text: "{{ session('success') }}",
                                    showConfirmButton: false,
                                    timer: 3000 // Close alert after 3 seconds
                                });
                            </script>
                        @endif

                        <div class="card card-default">
                            <div class="card-header" style="background-color: #af54cd;">
                                <h3 style="color: white;
                                font-weight: 500;">Lablum
                                    Entertainment Private limited</h3>
                            </div>

                            <div class="card-body text-center">
                                <form id="payment-form" action="{{ route('razorpay.payment.store') }}" method="POST">
                                    @csrf
                                    <input type="hidden" name="advertiser_id" value="{{ $advertiser->id }}">
                                    <input type="hidden" name="addplan_id" value="{{ $addplan_id }}">
                                    <input type="hidden" name="prefill_name" value="{{ $advertiser->name }}">
                                    <input type="hidden" name="prefill_email" value="{{ $advertiser->email }}">
                                    <input type="hidden" name="prefill_mobile" value="{{ $advertiser->mobile }}">
                                    <input type="hidden" name="gst_amount" value="{{ $gst_amount }}">
                                    <input type="hidden" name="additional_tax_amounts" value="{{ $additional_tax_amounts }}">
                                    <input type="hidden" name="advertisment_coast" value="{{ $advertisment_coast }}">
                                    <input type="hidden" name="currency" value="INR">
                                    <input type="hidden" name="method" value="razor_pay_online" value="">
                                    <input type="hidden" name="razorpay_payment_id" id="razorpay_payment_id"
                                        value="">
                                    <input type="hidden" name="payment_amount" id="razorpay_payment_amount"
                                        value="₹{{ $show_amount }}">





                                    <table class="table">


                                        <tbody>
                                            <tr>
                                                <th scope="row">Advertisement Cost</th>
                                                <td>₹{{ $payment_amount }}</td>

                                            </tr>
                                          
                                            @foreach ($additional_tax_details as $tax_type => $tax_amount)
                                                <tr>
                                                    <th scope="row">{{ $tax_type }}</th>
                                                    <td>₹{{ $tax_amount }}</td>
                                                </tr>
                                            @endforeach

                                            <tr>
                                                <th scope="row">GST</th>
                                                <td>₹{{ $gst_amount }}</td>

                                            </tr>

                                            <tr>
                                                <th scope="row">Total Amount</th>
                                                <td>₹{{ $show_amount }}</td>

                                            </tr>
                                        </tbody>
                                    </table>







                                    <button type="button" id="rzp-button" class="btn"
                                        style="background-color: #af54cd;color:white">Pay Now
                                        ₹{{ $show_amount }}</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <!-- Script to handle Razorpay payment -->
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <script>
        document.getElementById('rzp-button').addEventListener('click', function(e) {
            var options = {
                key: "{{ env('RAZORPAY_KEY') }}",
                amount: "{{ $total_amount }}",
                currency: "INR",
                name: "Lablum Entertainment",
                description: "Rozerpay",
                image: "https://lablum.quickstaffpro.in/frontend/img/icons/fav_icon_new (2).png",
                prefill: {
                    name: "{{ $advertiser->name }}",
                    email: "{{ $advertiser->email }}",
                    contact: "{{ $advertiser->mobile }}"
                },
                theme: {
                    color: "#AF54CD"
                },
                handler: function(response) {
                    // Set the payment ID in the hidden input field
                    document.getElementById('razorpay_payment_id').value = response.razorpay_payment_id;
                    // Now submit the form
                    document.getElementById('payment-form').submit();
                }
            };

            var rzp = new Razorpay(options);
            rzp.open();
        });
    </script>
</body>

</html>
