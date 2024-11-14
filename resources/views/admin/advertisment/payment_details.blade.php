

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
                            <h4 class="pull-left page-title" style="font-size: 30px;"> Payments Details</h4>
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
                                    <a href="" class="btn btn-primary" style="border-radius: 7px;"><i
                                            class=""></i>
                                        Life Time</a>
                                    <a href="#" class="btn btn-primary" style="border-radius: 7px;">Filter <i
                                            class="fas fa-chevron-down" style="margin-left: 5px;"></i></a>
                                </div>
                            </div>
    
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
                                        <th>NAME</th>
                                        <th>Email</th>
                                        
                                         <th>MOBILE NUMBER</th>
                                         <th>ADD PLAN VIDEO COUNT</th>
                                         <th>ADD PLAN DAY COUNT</th>
                                        <th>TRANSACTION ID</th>
                                        <th> ADVERTISMENT COAST </th>
                                        <th> GST CHARGES </th>
                                        <th> ADDITIONAL TEXES </th>
                                        <th>AMOUNT</th>
                                        <th>PAYMENT DATE</th>
                                        <th> View Invoice</th>
                                       
                                    
    
                                      
                                      
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($payments as $payment)
                                        <tr>
    
    
                                            <td>{{ $loop->iteration }}</td>
                                            <td>{{ $payment->prefill_name }}</td>
                                            <td>{{ $payment->prefill_email }}</td>
                                            <td>{{ $payment->prefill_mobile }}</td>
                                            
                                            <td>{{ $payment->addplan->add_count }}</td>
                                            <td>{{ $payment->addplan->days_count }}</td>
                                            <td>{{ $payment->r_payment_id }}</td>
                                            <td>₹{{$payment->advertisment_coast}}</td>
                                            <td>₹{{$payment->gst_amount}}</td>
                                            <td>₹{{$payment->additional_tax_amounts}}</td>
                                            <td>{{ $payment->amount }}</td>
                                            <td>{{ $payment->created_at->format('m/d/Y H:i:s') }}</td>

                                          
                                            <td> <a href="{{route('invoice.show',$payment)}}"
                                                class="btn btn-primary info-btn"
                                                style="background:lightgreen; border-radius: 7px;">
                                                <i class="fas fa-file-invoice"></i>
                                                Invoice


                                                

                                            </a></td>
    
    
                                        
    
    
    
    
    
                                            
                                          
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
    




