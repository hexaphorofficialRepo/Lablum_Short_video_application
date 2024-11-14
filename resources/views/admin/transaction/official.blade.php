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
                        <h4 class="pull-left page-title" style="font-size: 30px;">Blue Tick Verification Payments Details</h4>
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
                                {{-- <button id="downloadBtn" class="btn btn-primary" style="border-radius: 7px;">Download as Excel</button> --}}
                                <button id="filterBtn" class="btn btn-primary" style="border-radius: 7px;">Filter <i class="fas fa-chevron-down" style="margin-left: 5px;"></i></button>
                            </div>
                        </div>
                        
                        <!-- Modal -->
                        <div id="filterModal" class="modal" style="display: none;">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                        <h4 class="modal-title">Filter Options</h4>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>
                                    
                                    <!-- Modal Body -->
                                    <div class="modal-body">
                                        <p><a href="{{ route('official.transaction.today', ['date' => \Carbon\Carbon::today()->toDateString()]) }}">Today's Transactions</a></p>
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
                            // Show modal when filter button is clicked
                            document.getElementById('filterBtn').addEventListener('click', function() {
                                document.getElementById('filterModal').style.display = 'block';
                            });
                        
                            // Hide modal when close button is clicked
                            document.querySelectorAll('.close').forEach(function(el) {
                                el.addEventListener('click', function() {
                                    document.getElementById('filterModal').style.display = 'none';
                                });
                            });
                        
                            // Show date range inputs when "Date Range" link is clicked
                            document.getElementById('dateRangeLink').addEventListener('click', function() {
                                document.getElementById('dateRangeInputs').style.display = 'block';
                            });
                        
                            // Filter by date range when "Filter" button is clicked
                            function filterByDateRange() {
                                var startDate = document.getElementById('startDate').value;
                                var endDate = document.getElementById('endDate').value;
                                window.location.href = "{{ route('admin.advertisment.payment.trns') }}?start_date=" + startDate + "&end_date=" + endDate;
                            }
                        </script>
                        


<!-- Download Modal -->
<div id="downloadModal" class="modal" style="display: none;">
<div class="modal-dialog">
    <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header">
            <h4 class="modal-title">Download Options</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal Body -->
        <div class="modal-body">
            <p><a href="{{ route('download.today') }}">Download Today's Data</a></p>
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

// Show download modal when button is clicked
document.getElementById('downloadBtn').addEventListener('click', function() {
document.getElementById('downloadModal').style.display = 'block';
});

// Hide modal when close button is clicked
document.querySelectorAll('.close').forEach(function(el) {
el.addEventListener('click', function() {
    document.getElementById('downloadModal').style.display = 'none';
});
});

// Show date range inputs when "Date Range" link is clicked
document.getElementById('dateRangeDownloadLink').addEventListener('click', function() {
document.getElementById('dateRangeDownloadInputs').style.display = 'block';
});

// Download by date range when "Download" button is clicked
function downloadByDateRange() {
var startDate = document.getElementById('startDateDownload').value;
var endDate = document.getElementById('endDateDownload').value;
window.location.href = "{{ route('download.by.date') }}?start_date=" + startDate + "&end_date=" + endDate;
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
                                    <th>USER ID</th>
                                    <th>NAME</th>
                                    <th>Email</th>
                                    
                                     <th>MOBILE NUMBER</th>
                                 
                                    
                                 
                                  
                                   
                                    <th>AMOUNT</th>
                                    <th> PAYMENT ID </th>
                                    <th>PAYMENT DATE</th>
                                    <th>VIEW USER </th>
                                    {{-- <th> View Invoice</th> --}}
                                   
                                

                                  
                                  
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($officialpayments as $payment)
                                    <tr>


                                        <td>{{ $loop->iteration }}</td>
                                        <td>{{ $payment->user_id }}</td>
                                        <td>{{ $payment->name }}</td>
                                        <td>{{ $payment->email }}</td>
                                        <td>{{ $payment->phone }}</td>
                                        <td>{{ $payment->amount }}</td>
                                        
                                    
                                        <td>{{ $payment->r_payment_id }}</td>
                                       
                                   
                                        <td>{{ $payment->created_at->format('m/d/Y H:i:s') }}</td>

                                      
                                      
                                        <td>
                                            <a href="{{route('admin.user.details',['user_id' => $payment->user_id])}}" class="btn btn-primary info-btn"
                                                style="background:lightgreen; border-radius: 7px;">
                                                <i class="fas fa-info" style="margin-right: 5px;"></i> User Info
                                            </a>
                                        </td>
                                </td>
                                {{-- <td> <a href="|#"
                                    class="btn btn-primary info-btn"
                                    style="background:lightgreen; border-radius: 7px;">
                                    <i class="fas fa-file-invoice"></i>
                                    Invoice


                                    

                                </a></td> --}}

                                    





                                        
                                      
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





