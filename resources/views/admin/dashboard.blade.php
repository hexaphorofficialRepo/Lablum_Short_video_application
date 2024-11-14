<x-backend.app-layout>


    {{-- <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"> --}}
    <!-- Chart.js CDN -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
    <style>
        @media (max-width: 767px) {
            .card {
                width: 100%;
                margin-bottom: 20px;
                /* Add margin between cards */
            }
        }

        .card.shadow.pt-3.align-self-stretch {
            height: 245px;

        }

        .card.shadow.pt-3.align-self-stretch {
            background: #a1d2fa !important;
        }
        .chart-container {
            position: relative;
            height: 400px;
        }
    </style>


    <div class="content">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="page-header-title">
                        <h4 class="pull-left page-title">Dashboard</h4>
                        <ol class="breadcrumb pull-right">
                        </ol>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>

        </div>


        <div>
            <section class="container py-5 text-center bg-dark">
                <div class="row justify-content-around">

                    




                  
                     
                    
                    <div class="col-12 col-lg-6 mb-4">
                               
                                
                                    <div class="card shadow pt-3 align-self-stretch"
                                    style="border-radius: 9px;
                                    background: linear-gradient(285deg, #df5785, #AF54CD);
                                    padding: 16px;
                                    box-shadow: 1px 3px 7px 3px;
                                    height: 400px;
                                    margin-bottom: 8px;">
                                    <div class="card-header text-center">
                                        Post Status Overview
                                    </div>
                                    <div class="col text-center">
                                        <button class="btn btn-primary" onclick="fetchPostStats('today')">Today</button>
                                        <button class="btn btn-secondary" onclick="fetchPostStats('weekly')">Weekly</button>
                                        <button class="btn btn-info" onclick="fetchPostStats('monthly')">Monthly</button>
                                    </div>
                                    <div class="card">
                                        <div class="chart-container" style="height: 300px;">
                                            <canvas id="postPieChart"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-lg-6 mb-4">
                             
                                <div class="card shadow pt-3 align-self-stretch"
                                    style="border-radius: 9px;
                                    background: linear-gradient(285deg, #df5785, #AF54CD);
                                    padding: 16px;
                                    box-shadow: 1px 3px 7px 3px;
                                    height: 400px;
                                    margin-bottom: 8px;">
                                    <div class="card-header text-center">
                                        User Status Overview
                                    </div>
                                    <div class="col text-center">
                                        <button class="btn btn-primary" onclick="fetchUserStats('today')">Today</button>
                                        <button class="btn btn-secondary" onclick="fetchUserStats('weekly')">Weekly</button>
                                        <button class="btn btn-info" onclick="fetchUserStats('monthly')">Monthly</button>
                                    </div>
                                    <div class="card">
                                        <div class="chart-container" style="height: 300px;">
                                            <canvas id="userPieChart"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                 
                 
                    
                    <script>
                        document.addEventListener('DOMContentLoaded', function() {
                            fetchPostStats(); // Default to all data on load
                            fetchUserStats(); // Default to all data on load
                        });
                
                        let postChart;
                        let userChart;
                
                        async function fetchPostStats(period = '') {
                            const response = await fetch(`/post-stats/${period}`);
                            const data = await response.json();
                
                            const ctx = document.getElementById('postPieChart').getContext('2d');
                            if (postChart) {
                                postChart.destroy();
                            }
                
                            postChart = new Chart(ctx, {
                                type: 'pie',
                                data: {
                                    labels: ['Active Posts', 'Blocked Posts'],
                                    datasets: [{
                                        data: [data.active, data.blocked],
                                        backgroundColor: ['#28a745', '#dc3545'],
                                    }]
                                },
                                options: {
                                    responsive: true,
                                    maintainAspectRatio: false
                                }
                            });
                        }
                
                        async function fetchUserStats(period = '') {
                            const response = await fetch(`/user-stats/${period}`);
                            const data = await response.json();
                
                            const ctx = document.getElementById('userPieChart').getContext('2d');
                            if (userChart) {
                                userChart.destroy();
                            }
                
                            userChart = new Chart(ctx, {
                                type: 'pie',
                                data: {
                                    labels: ['Active Users', 'Blocked Users'],
                                    datasets: [{
                                        data: [data.active, data.blocked],
                                        backgroundColor: ['#007bff', '#ff6384'],
                                    }]
                                },
                                options: {
                                    responsive: true,
                                    maintainAspectRatio: false
                                }
                            });
                        }
                    </script>
                    <!-- Bootstrap JS and dependencies -->
                    {{-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> --}}
                </body>




                    
                    <a>
                        <div class="col-12 col-lg-3 mb-4">
                            <div class="card shadow pt-3 align-self-stretch"
                                style="border-radius: 9px;
                                background: linear-gradient(285deg, #df5785, #AF54CD);
                                padding: 16px;
                                box-shadow: 1px 3px 7px 3px;
                                height: 235px;
                                margin-bottom: 8px;">
                                <i class="card-img-top d-block fas fa-user-cog fa-5x py-3 text-dark"></i>


                                <div class="card-body">
                                    <h5 class="card-title"><strong>Roles </strong> Permissions</h5>

                                    <p class="card-text" style="color:black;">
                                        Total Roles and Permissions
                                    </p>
                                    <a href="{{ route('admin.role') }}" class="btn btn-primary"
                                        style="width:100%;top:3rem"> <i class="fas fa-eye"></i>View
                                        More</a>
                                </div>
                            </div>
                        </div>
                    </a>









                    <a>
                        <div class="col-12 col-lg-3 mb-4">
                            <div class="card shadow pt-3 align-self-stretch"
                                style="border-radius: 9px;
                                    background: linear-gradient(285deg, #df5785, #AF54CD);
                                    padding: 16px;
                                    box-shadow: 1px 3px 7px 3px;
                                    height: 235px;
                                    margin-bottom: 8px;">
                                <i class="card-img-top d-block fas fa-user-shield fa-5x py-3 text-dark"></i>

                                <div class="card-body">
                                    <h5 class="card-title"><strong>Users </strong>Create</h5>
                                    <h3></h3>
                                    <p class="card-text" style="color:black;">
                                        Total Users
                                    </p>
                                    <a href="{{ route('admin.user') }}" class="btn btn-primary"
                                        style="width:100%;top:3rem"> <i class="fas fa-eye"></i>View
                                        More</a>
                                </div>
                            </div>
                        </div>
                    </a>

                    <a>
                        <div class="col-12 col-lg-3 mb-4">
                            <div class="card shadow pt-3 align-self-stretch"
                                style="border-radius: 9px;
                                        background: linear-gradient(285deg, #df5785, #AF54CD);
                                        padding: 16px;
                                        box-shadow: 1px 3px 7px 3px;
                                        height: 235px;
                                        margin-bottom: 8px;">
                                <i class="card-img-top d-block fas fa-user fa-5x py-3 text-dark"></i>
                                <div class="card-body">
                                    <h5 class="card-title"><strong>Real</strong>Users</h5>
                                    <h3>{{ $activeUserCount }}</h3>
                                    <p class="card-text" style="color:black;">
                                        <strong>{{ $activeUserPercentage }} %</strong>. Total Real or Active User's
                                    </p>
                                    <a href="{{ route('admin.real.user') }}" class="btn btn-primary" style="width:100%">
                                        <i class="fas fa-eye"></i> View
                                        More</a>
                                </div>
                            </div>
                        </div>
                    </a>

                    <a>
                        <div class="col-12 col-lg-3 mb-4">
                            <div class="card shadow pt-3 align-self-stretch"
                                style="border-radius: 9px;
                                    background: linear-gradient(285deg, #df5785, #AF54CD);
                                    padding: 16px;
                                    box-shadow: 1px 3px 7px 3px;
                                    height: 235px;
                                    margin-bottom: 8px;">
                                <i class="card-img-top d-block fas fa-user-lock fa-5x py-3 text-dark"></i>

                                <div class="card-body">
                                    <h5 class="card-title">Blocked <strong>User</strong></h5>
                                    <h3>{{ $fakeUserCount }}</h3>
                                    <p class="card-text" style="color:black;">
                                        <strong>{{ $fakeUserPercentage }} %</strong>. Restricted Or Blocked User's
                                    </p>
                                    <a href="{{ route('admin.fake.user') }}" class="btn btn-primary" style="width:100%">
                                        <i class="fas fa-eye"></i>View More</a>
                                </div>
                            </div>
                        </div>
                    </a>
                    <a>
                        <div class="col-12 col-lg-3 mb-4">
                            <div class="card shadow pt-3 align-self-stretch"
                                style="border-radius: 9px;
                                    background: linear-gradient(285deg, #df5785, #AF54CD);
                                    padding: 16px;
                                    box-shadow: 1px 3px 7px 3px;
                                    height: 235px;
                                    margin-bottom: 5px;">

                                <i class="card-img-top d-block fas fa-video fa-5x py-3 text-dark"></i>

                                <div class="card-body">
                                    <h5 class="card-title"><strong>Real</strong> Posts</h5>
                                    <h3>{{ $realPostCount }}</h3>
                                    <p class="card-text" style="color:black;">

                                        <strong>{{ $realPostPercentage }} %</strong>.Currently Live or Streaming Post.
                                    </p>
                                    <a href="{{ route('admin.real.post') }}" class="btn btn-primary"
                                        style="width:100%">
                                        <i class="fas fa-eye"></i>View More</a>
                                </div>
                            </div>
                        </div>
                    </a>

                    <a>
                        <div class="col-12 col-lg-3 mb-4">
                            <div class="card shadow pt-3 align-self-stretch"
                                style="border-radius: 9px; background: linear-gradient(285deg, #00bcd485, #FFC107);padding:16px;box-shadow: 1px 3px 7px 3px;">
                                <i class="card-img-top d-block fas fa-ban fa-5x py-3 text-dark"></i>

                                <div class="card-body">
                                    <h5 class="card-title"><strong>Fake</strong> Posts</h5>
                                    <h3>{{ $fakePostCount }}</h3>
                                    <p class="card-text" style="color:black;">

                                        <strong>{{ $fakePostPercentage }}% %</strong>. Restricted Or Blocked Post.
                                    </p>
                                    <a href="{{ route('admin.fake.post') }}" class="btn btn-primary"
                                        style="width:100%">
                                        <i class="fas fa-eye"></i>View More</a>
                                </div>
                            </div>
                        </div>
                    </a>
                    <a>
                        <div class="col-12 col-lg-3 mb-4" style="margin: 10px 0">
                            <div class="card shadow pt-3 align-self-stretch"
                                style="border-radius: 9px; background: linear-gradient(285deg, #00bcd485, #FFC107); padding:16px;box-shadow: 1px 3px 7px 3px;">
                                <i class="card-img-top d-block fas fa-wallet fa-5x py-3 text-dark"></i>


                                <div class="card-body">
                                    <h5 class="card-title">User <strong>Wallet Record</strong></h5>
                                    <h3>{{ $WalletCount }}</h3>


                                    <a href="{{ route('admin.user.wallet') }}" class="btn btn-primary"
                                        style="width:100%"> <i class="fas fa-eye"></i>View More</a>
                                </div>
                            </div>
                        </div>
                    </a>
                    <a>
                        <div class="col-12 col-lg-3 mb-4" style="margin: 10px 0">
                            <div class="card shadow pt-3 align-self-stretch"
                                style="border-radius: 9px; background: linear-gradient(285deg, #00bcd485, #FFC107); padding:16px;box-shadow: 1px 3px 7px 3px;">
                                <i class="card-img-top d-block fas fa-user-check fa-5x py-3 text-dark"></i>



                                <div class="card-body">
                                    <h5 class="card-title">Official <strong>Verification</strong></h5>
                                    <h3>{{ $VerificationCount }}</h3>

                                    <a href="{{ route('admin.official.verify') }}" class="btn btn-primary"
                                        style="width:100%"> <i class="fas fa-eye"></i>View More</a>
                                </div>
                            </div>
                        </div>
                    </a>
                    <a>
                        <div class="col-12 col-lg-3 mb-4" style="margin: 10px 0">
                            <div class="card shadow pt-3 align-self-stretch"
                                style="border-radius: 9px; background: linear-gradient(285deg, #00bcd485, #FFC107); padding:16px;box-shadow: 1px 3px 7px 3px;">
                                <i class="card-img-top d-block fas fa-user-check fa-5x py-3 text-dark"></i>



                                <div class="card-body">
                                    <h5 class="card-title">Official <strong>Verification Payment History</strong></h5>
                                    <h3>₹{{ $offcialPaymentAmount }}</h3>

                                    <a href="{{ route('admin.official.payment') }}" class="btn btn-primary"
                                        style="width:100%"> <i class="fas fa-eye"></i>View More</a>
                                </div>
                            </div>
                        </div>
                    </a>























                    <a>
                        <div class="col-12 col-lg-3" style="margin: 10px 0">
                            <div class="card shadow pt-3 align-self-stretch"
                                style="border-radius: 9px; background: linear-gradient(285deg, #00bcd485, #FFC107);padding:16px;box-shadow: 1px 3px 7px 3px;">
                                <i class="card-img-top d-block fas fa-music fa-5x py-3 text-dark"></i>

                                <div class="card-body">
                                    <h5 class="card-title"><strong>Songs</strong> Music</h5>
                                    <h3>{{ $SongCount }}</h3>

                                    <a href="{{ route('admin.song.index') }}" class="btn btn-primary"
                                        style="width:100%"> <i class="fas fa-eye"></i>View More</a>
                                </div>
                            </div>
                        </div>
                    </a>












                    <a>
                        <div class="col-12 col-lg-3" style="margin: 10px 0">
                            <div class="card shadow pt-3 align-self-stretch"
                                style="border-radius: 9px; background: linear-gradient(285deg, #00bcd485, #FFC107);padding:16px;box-shadow: 1px 3px 7px 3px;">
                                <i class="card-img-top d-block fas fa-money-bill-alt fa-5x py-3 text-dark"></i>




                                <div class="card-body">
                                    <h5 class="card-title"><strong> Set User </strong>Earning</h5>
                                    <h3>{{ $EarningCount }}</h3>

                                    <a href="{{ route('admin.earning.list') }}" class="btn btn-primary"
                                        style="width:100%"> <i class="fas fa-eye"></i>View More</a>
                                </div>
                            </div>
                        </div>
                    </a>


                    <a>
                        <div class="col-12 col-lg-3" style="margin: 10px 0">
                            <div class="card shadow pt-3 align-self-stretch"
                                style="border-radius: 9px; background: linear-gradient(285deg, #00bcd485, #FFC107);padding:16px;box-shadow: 1px 3px 7px 3px;">
                                <i class="card-img-top d-block fas fa-bullhorn fa-5x py-3 text-dark"></i>





                                <div class="card-body">
                                    <h5 class="card-title"><strong> Advertisement </strong>Category</h5>
                                    <h3>{{ $AddsCategoryCount }}</h3>

                                    <a href="{{ route('admin.index.add.category') }}" class="btn btn-primary"
                                        style="width:100%"> <i class="fas fa-eye"></i>View More</a>
                                </div>
                            </div>
                        </div>
                    </a>
                    <a>
                        <div class="col-12 col-lg-3" style="margin: 10px 0">
                            <div class="card shadow pt-3 align-self-stretch"
                                style="border-radius: 9px; background: linear-gradient(285deg, #00bcd485, #FFC107);padding:16px;box-shadow: 1px 3px 7px 3px;">
                                <i class="card-img-top d-block fas fa-hand-holding-usd fa-5x py-3 text-dark"></i>






                                <div class="card-body">
                                    <h5 class="card-title"><strong> Advertisement </strong>Pricing Plans</h5>
                                    <h3>{{ $AddsPricingCount }}</h3>

                                    <a href="{{ route('admin.add.pricing.index') }}" class="btn btn-primary"
                                        style="width:100%"> <i class="fas fa-eye"></i>View More</a>
                                </div>
                            </div>
                        </div>
                    </a>
                    <a>
                        <div class="col-12 col-lg-3" style="margin: 10px 0">
                            <div class="card shadow pt-3 align-self-stretch"
                                style="border-radius: 9px; background: linear-gradient(285deg, #00bcd485, #FFC107);padding:16px;box-shadow: 1px 3px 7px 3px;">
                                <i class="card-img-top d-block fas fa-handshake fa-5x py-3 text-dark"></i>






                                <div class="card-body">
                                    <h5 class="card-title"><strong> Advertisement </strong>Partners</h5>
                                    <h3>{{ $AddsPartnersCount }}</h3>

                                    <a href="{{ route('admin.advertiser.list') }}" class="btn btn-primary"
                                        style="width:100%"> <i class="fas fa-eye"></i>View More</a>
                                </div>
                            </div>
                        </div>
                    </a>






                    <a>
                        <div class="col-12 col-lg-3" style="margin: 10px 0">
                            <div class="card shadow pt-3 align-self-stretch"
                                style="border-radius: 9px; background: linear-gradient(285deg, #00bcd485, #FFC107);padding:16px;box-shadow: 1px 3px 7px 3px;">
                                <i class="card-img-top d-block fas fa-image fa-5x py-3 text-dark"></i>






                                <div class="card-body">
                                    <h5 class="card-title"><strong> Banner </strong>Advertisement</h5>
                                    <h3>{{ $addbannerCount }}</h3>

                                    <a href="{{ route('admin.add.banner.index') }}" class="btn btn-primary"
                                        style="width:100%"> <i class="fas fa-eye"></i>View More</a>
                                </div>
                            </div>
                        </div>
                    </a>










                    <a>
                        <div class="col-12 col-lg-3" style="margin: 10px 0">
                            <div class="card shadow pt-3 align-self-stretch"
                                style="border-radius: 9px; background: linear-gradient(285deg, #00bcd485, #FFC107);padding:16px;box-shadow: 1px 3px 7px 3px;">
                                <i class="card-img-top d-block fas fa-percent fa-5x py-3 text-dark"></i>







                                <div class="card-body">
                                    <h5 class="card-title"><strong> GST </strong>Percentage</h5>
                                    <h3>{{ $GstCount }}</h3>

                                    <a href="{{ route('admin.gst.index') }}" class="btn btn-primary"
                                        style="width:100%">
                                        <i class="fas fa-eye"></i>View More</a>
                                </div>
                            </div>
                        </div>
                    </a>













                    <a>
                        <div class="col-12 col-lg-3" style="margin: 10px 0">
                            <div class="card shadow pt-3 align-self-stretch"
                                style="border-radius: 9px; background: linear-gradient(285deg, #00bcd485, #FFC107);padding:16px;box-shadow: 1px 3px 7px 3px;">
                                <i class="card-img-top d-block fas fa-file-invoice-dollar fa-5x py-3 text-dark"></i>







                                <div class="card-body">
                                    <h5 class="card-title"><strong> Taxes </strong>Category/Type</h5>
                                    <h3>{{ $TaxCount }}</h3>

                                    <a href="{{ route('admin.taxes.type.index') }}" class="btn btn-primary"
                                        style="width:100%"> <i class="fas fa-eye"></i>View More</a>
                                </div>
                            </div>
                        </div>
                    </a>










                    <a>
                        <div class="col-12 col-lg-3" style="margin: 10px 0">
                            <div class="card shadow pt-3 align-self-stretch"
                                style="border-radius: 9px; background: linear-gradient(285deg, #00bcd485, #FFC107);padding:16px;box-shadow: 1px 3px 7px 3px;">
                                <i class="card-img-top d-block fas fa-dollar-sign fa-5x py-3 text-dark"></i>








                                <div class="card-body">
                                    <h5 class="card-title"><strong> Taxes </strong>Charges</h5>
                                    <h3>{{ $TaxChargeCount }}</h3>

                                    <a href="{{ route('admin.tax.charges.index') }}" class="btn btn-primary"
                                        style="width:100%"> <i class="fas fa-eye"></i>View More</a>
                                </div>
                            </div>
                        </div>
                    </a>
                    <a>
                        <div class="col-12 col-lg-3" style="margin: 10px 0">
                            <div class="card shadow pt-3 align-self-stretch"
                                style="border-radius: 9px; background: linear-gradient(285deg, #00bcd485, #FFC107);padding:16px;box-shadow: 1px 3px 7px 3px;">
                                <i class="card-img-top d-block fas fa-exchange-alt fa-5x py-3 text-dark"></i>









                                <div class="card-body">
                                    <h5 class="card-title"><strong> Advertisement </strong>Billing</h5>
                                    <h3>{{ $AdvertismentBillingCount }}</h3>

                                    <a href="{{ route('admin.advertisment.payment.trns') }}" class="btn btn-primary"
                                        style="width:100%"> <i class="fas fa-eye"></i>View More</a>
                                </div>
                            </div>
                        </div>
                    </a>
                    <a>
                        <div class="col-12 col-lg-3" style="margin: 10px 0">
                            <div class="card shadow pt-3 align-self-stretch"
                                style="border-radius: 9px; background: linear-gradient(285deg, #00bcd485, #FFC107);padding:16px;box-shadow: 1px 3px 7px 3px;">
                                <i class="card-img-top d-block fas fa-money-bill-wave fa-5x py-3 text-dark"></i>










                                <div class="card-body">
                                    <h5 class="card-title"><strong> Withdrawal </strong>Record and History</h5>
                                    <h3>{{ $WithdrawalCount }}</h3>

                                    <a href="{{ route('admin.user.withdrawal') }}" class="btn btn-primary"
                                        style="width:100%"> <i class="fas fa-eye"></i>View More</a>
                                </div>
                            </div>
                        </div>
                    </a>

                    <a>
                        <div class="col-12 col-lg-3" style="margin: 10px 0">
                            <div class="card shadow pt-3 align-self-stretch"
                                style="border-radius: 9px; background: linear-gradient(285deg, #00bcd485, #FFC107);padding:16px;box-shadow: 1px 3px 7px 3px;">
                                <i class="card-img-top d-block fas fa-hashtag fa-5x py-3 text-dark"></i>


                                <div class="card-body">
                                    <h5 class="card-title"><strong>#</strong>Hashtag</h5>
                                    <h3>{{ $HashtagCount }}</h3>

                                    <a href="{{ route('admin.category.index') }}" class="btn btn-primary"
                                        style="width:100%"> <i class="fas fa-eye"></i>View More</a>
                                </div>
                            </div>
                        </div>
                    </a>

                    <a>
                        <div class="col-12 col-lg-3" style="margin: 10px 0">
                            <div class="card shadow pt-3 align-self-stretch"
                                style="border-radius: 9px; background: linear-gradient(285deg, #00bcd485, #FFC107);padding:16px;box-shadow: 1px 3px 7px 3px;">
                                <i class="card-img-top d-block fas fa-newspaper fa-5x py-3 text-dark"></i>


                                <div class="card-body">
                                    <h5 class="card-title"><strong>News and Blog</strong> Category</h5>
                                    <h3>{{ $BlogCategoryCount }}</h3>

                                    <a href="{{ route('admin.blog.category.index') }}" class="btn btn-primary"
                                        style="width:100%"> <i class="fas fa-eye"></i>View More</a>
                                </div>
                            </div>
                        </div>
                    </a>
                    <a>
                        <div class="col-12 col-lg-3" style="margin: 10px 0">
                            <div class="card shadow pt-3 align-self-stretch"
                                style="border-radius: 9px; background: linear-gradient(285deg, #00bcd485, #FFC107);padding:16px;box-shadow: 1px 3px 7px 3px;">
                                <i class="card-img-top d-block fas fa-book fa-5x py-3 text-dark"></i>



                                <div class="card-body">
                                    <h5 class="card-title"><strong>News and </strong>Blog</h5>
                                    <h3>{{ $BlogCount }}</h3>

                                    <a href="{{ route('admin.blog.index') }}" class="btn btn-primary"
                                        style="width:100%"> <i class="fas fa-eye"></i>View More</a>
                                </div>
                            </div>
                        </div>
                    </a>









                    <a>
                        <div class="col-12 col-lg-3" style="margin: 10px 0">
                            <div class="card shadow pt-3 align-self-stretch"
                                style="border-radius: 9px; background: linear-gradient(285deg, #00bcd485, #FFC107);padding:16px;box-shadow: 1px 3px 7px 3px;">
                                <i class="card-img-top d-block fas fa-file-contract fa-5x py-3 text-dark"></i>











                                <div class="card-body">
                                    <h5 class="card-title"><strong> Terms And </strong>Policies</h5>
                                    <h3>{{ $TermsCount }}</h3>

                                    <a href="{{ route('admin.terms.index') }}" class="btn btn-primary"
                                        style="width:100%"> <i class="fas fa-eye"></i>View More</a>
                                </div>
                            </div>
                        </div>
                    </a>
                    <a>
                        <div class="col-12 col-lg-3" style="margin: 10px 0">
                            <div class="card shadow pt-3 align-self-stretch"
                                style="border-radius: 9px; background: linear-gradient(285deg, #00bcd485, #FFC107);padding:16px;box-shadow: 1px 3px 7px 3px;">
                                <i class="card-img-top d-block fas fa-link fa-5x py-3 text-dark"></i>












                                <div class="card-body">
                                    <h5 class="card-title"><strong> Other Links </strong>Dashboard</h5>
                                    <h3>3rd Party </h3>

                                    <a href="{{ route('admin.other_link.index') }}" class="btn btn-primary"
                                        style="width:100%"> <i class="fas fa-eye"></i>View More</a>
                                </div>
                            </div>
                        </div>
                    </a>

                    <a>
                        <div class="col-12 col-lg-3" style="margin: 10px 0">
                            <div class="card shadow pt-3 align-self-stretch"
                                style="border-radius: 9px; background: linear-gradient(285deg, #00bcd485, #FFC107);padding:16px;box-shadow: 1px 3px 7px 3px;">
                                <i class="card-img-top d-block fas fa-key fa-5x py-3 text-dark"></i>













                                <div class="card-body">
                                    <h5 class="card-title"><strong> Update </strong>Password</h5>
                                    <h3>Update Password</h3>

                                    <a href="{{ route('admin.update.password.view') }}" class="btn btn-primary"
                                        style="width:100%"> <i class="fas fa-eye"></i>View More</a>
                                </div>
                            </div>
                        </div>
                    </a>













                </div>
            </section>
        </div>



    </div>
    <br>


</x-backend.app-layout>
