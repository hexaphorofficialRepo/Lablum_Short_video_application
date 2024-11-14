<x-backend.app-layout>

    <style>
        .toggle-switch {
            position: relative;
            display: inline-block;
            width: 60px;
            height: 34px;
        }

        .toggle-switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }

        .toggle-slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            -webkit-transition: .4s;
            transition: .4s;
            border-radius: 34px;
            background: red;
        }

        .toggle-slider:before {
            position: absolute;
            content: "";
            height: 26px;
            width: 26px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            -webkit-transition: .4s;
            transition: .4s;
            border-radius: 50%;
        }

        input:checked+.toggle-slider {
            background-color: #2196F3;
        }

        input:focus+.toggle-slider {
            box-shadow: 0 0 1px #2196F3;
        }

        input:checked+.toggle-slider:before {
            -webkit-transform: translateX(26px);
            -ms-transform: translateX(26px);
            transform: translateX(26px);
        }




        /* .add-new-btn {
        display: flex;
        justify-content: flex-end;
      } */
    </style>

    <div class="content">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="page-header-title">
                        <h4 class="pull-left page-title" style="font-size: 30px;">Withdrawal History</h4>
                        <ol class="breadcrumb pull-right">

                        </ol>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>



        <div class="row">
            <div class="col-md-12">
                <div class="container">
                    <div class="row">

                        <div class="col-md-6">
                            <div class="add-new-btn" style="padding: 16px;">
                                <button id="downloadBtn" class="btn btn-primary" style="border-radius: 7px;">Download as
                                    Excel</button>
                                <button id="filterBtn" class="btn btn-primary" style="border-radius: 7px;">Filter <i
                                        class="fas fa-chevron-down" style="margin-left: 5px;"></i></button>
                            </div>
                        </div>

                      
                        <div id="filterModal" class="modal" style="display: none;">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                 
                                    <div class="modal-header">
                                        <h4 class="modal-title">Filter Options</h4>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>

                                 
                                    <div class="modal-body">
                                        <p><a
                                                href="{{ route('add.transaction.today', ['date' => \Carbon\Carbon::today()->toDateString()]) }}">Today's
                                                Transactions</a></p>
                                        <p><a href="#" id="dateRangeLink">Date Range</a></p>
                                        <div id="dateRangeInputs" style="display: none;">
                                            <input type="date" id="startDate">
                                            <input type="date" id="endDate">
                                            <button onclick="filterByDateRange()">Filter</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <script>
                            
                            document.getElementById('filterBtn').addEventListener('click', function() {
                                document.getElementById('filterModal').style.display = 'block';
                            });

                           
                            document.querySelectorAll('.close').forEach(function(el) {
                                el.addEventListener('click', function() {
                                    document.getElementById('filterModal').style.display = 'none';
                                });
                            });

                        
                            document.getElementById('dateRangeLink').addEventListener('click', function() {
                                document.getElementById('dateRangeInputs').style.display = 'block';
                            });

                            
                            function filterByDateRange() {
                                var startDate = document.getElementById('startDate').value;
                                var endDate = document.getElementById('endDate').value;
                                window.location.href = "{{ route('admin.advertisment.payment.trns') }}?start_date=" + startDate + "&end_date=" +
                                    endDate;
                            }
                        </script>



                   
                        <div id="downloadModal" class="modal" style="display: none;">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                   
                                    <div class="modal-header">
                                        <h4 class="modal-title">Download Options</h4>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>

                                 
                                    <div class="modal-body">
                                        <p><a href="{{ route('download.today.withdrawal') }}">Download Today's Data</a></p>
                                        <p><a href="#" id="dateRangeDownloadLink">Download by Date Range</a></p>
                                        <div id="dateRangeDownloadInputs" style="display: none;">
                                            <input type="date" id="startDateDownload">
                                            <input type="date" id="endDateDownload">
                                            <button onclick="downloadByDateRange()">Download</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <script>
                         
                            document.getElementById('downloadBtn').addEventListener('click', function() {
                                document.getElementById('downloadModal').style.display = 'block';
                            });

                         
                            document.querySelectorAll('.close').forEach(function(el) {
                                el.addEventListener('click', function() {
                                    document.getElementById('downloadModal').style.display = 'none';
                                });
                            });

                          
                            document.getElementById('dateRangeDownloadLink').addEventListener('click', function() {
                                document.getElementById('dateRangeDownloadInputs').style.display = 'block';
                            });

                          
                            function downloadByDateRange() {
                                var startDate = document.getElementById('startDateDownload').value;
                                var endDate = document.getElementById('endDateDownload').value;
                                window.location.href = "{{ route('download.by.date.withdrawal') }}?start_date=" + startDate + "&end_date=" + endDate;
                            }
                        </script>




                        <div class="col-md-6">
                            <div class="input-group" style="margin-top: 16px; float: right;">

                                <input type="text" class="form-control" placeholder="Search...">

                            </div>
                        </div>
                    </div>



                    <div class="table-responsive">
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>SN</th>
                                    <th>USER FULL NAME</th>
                                    <th>Email</th>

                                    <th>MOBILE NUMBER</th>
                                    <th>WITHDRAWAL ID</th>
                                    <th>PREVIOUS WALLET AMOUNT</th>
                                    <th>PREVIOUS NET AMOUNT</th>

                                  
                                    <th>WITHDRAWAL AMOUNT</th>
                                    <th>GST AMOUNT</th>
                                    <th> ADDITIONAL TAX AMOUNT </th>
                                    <th>ADDITIONAL TAX DETAILS</th>
                                    <th>CURRENT WALLET AMOUNT</th>
                                    <th>CURRENT NET AMOUNT</th>
                                    <th>WITHDRAWAL DATE</th>
                                  





                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($withdrawals as $withdrawal)
                                    <tr>


                                        <td>{{ $loop->iteration }}</td>
                                        <td>{{ $withdrawal->user->fname }} {{ $withdrawal->user->lname }}</td>

                                        <td>{{ $withdrawal->user->email }}</td>
                                        <td>{{ $withdrawal->user->mobile }}</td>
                                        <td>{{ $withdrawal->order_id }}</td>
                                        <td>₹ {{ $withdrawal->previous_wallet_amount }}</td>
                                        <td>₹ {{ $withdrawal->previous_net_amount }}</td>
                                      
                                    
                                        <td>₹ {{ $withdrawal->transfer_amount }}</td>
                                        <td>₹ {{ $withdrawal->wallet->gst_amount }}</td>
                                        <td>₹ {{ $withdrawal->wallet->additional_tax_amount }}</td>
                                        <td>
                                            <table class="table table-bordered table-sm">
                                                <thead>
                                                    <tr>
                                                        <th>Tax Name</th>
                                                        <th>Amount (₹)</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    @foreach(json_decode( $withdrawal->wallet->additional_tax_details, true) as $taxDetail)
                                                        <tr>
                                                            <td>{{ $taxDetail['tax_name'] }}</td>
                                                            <td>{{ $taxDetail['tax_amount'] }}</td>
                                                        </tr>
                                                    @endforeach
                                                </tbody>
                                            </table>
                                        </td>
                                        <td>₹ {{ $withdrawal->new_wallet_amount}}</td>
                                        <td>₹ {{ $withdrawal->new_net_amount}}</td>
                                        <td>{{ $withdrawal->created_at->format('d, F Y') }}</td>



                                    </tr>
                                @endforeach

                            </tbody>




                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>


</x-backend.app-layout>
