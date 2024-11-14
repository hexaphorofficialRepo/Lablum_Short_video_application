<x-add.app-layout>

    <div class="content">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="page-header-title">
                        <h4 class="pull-left page-title">My Plans</h4>
                      
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
          
           
           
           
            <div class="row">


              
                <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="add-new-btn" style="padding: 16px;">
                                <!-- Button trigger modal -->
                                <a href="{{route('add.choose.plan')}}"  class="btn btn-primary" style="border-radius: 7px;"
                                    >
                                    <i class=""></i> + Choose New Plan
                            </a>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="table-responsive">
                                        <table class="table table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th>Sl. No.</th>
                                                    <th>Advertisement Video Count</th>
                                                    <th>Active Days Count</th>
                                                    <th>Target Audience</th>
                                                    <th>Target Minimum Age</th>
                                                    <th>Target Maximum Age</th>
                                                    <th>Location Preference</th>
                                                    <th>City Preference</th>
                                                    <th>State Preference</th>
                                                    <th>Zipcode Preference</th>
                                                    <th>Calculate Amount</th>
                                                  
                                                    <th>Activation Date</th>
                                                    <th>Expiring Date</th>
                                                    <th>Advertisement Status</th>

                                                    <th> View Add Video</th>
                                                    
                                                   
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @foreach($addPlans as $addPlan)
                                                <tr>
                                                    <td> {{$loop->iteration}}</td>
                                                    <td>{{$addPlan->add_count}}</td>
                                                    <td>{{$addPlan->days_count}}</td>
                                                    <td>{{$addPlan->target_audiance}}</td>
                                                    <td>{{$addPlan->target_age_min}}</td>
                                                    <td>{{$addPlan->target_age_max}}</td>
                                                    <td>{{$addPlan->location}}</td>
                                                    <td>{{$addPlan->city}}</td>
                                                    <td>{{$addPlan->state}}</td>
                                                    <td>{{$addPlan->zipcode}}</td>
                                                    <td>{{$addPlan->payment_amount}}</td>
                                                   
                                                    <td>{{$addPlan->avtivation_date}}</td>
                                                    <td>{{$addPlan->expire_date}}</td>
                                                    <td class="{{ $addPlan->add_status ? 'text-success' : 'text-danger' }}">
                                                        {{ $addPlan->add_status ? 'This Plan is Active Now' : 'Not activated yet' }}
                                                    </td>
                                           
                                                    <td> <a href="{{route('advertiser.videos')}}"
                                                        class="btn btn-primary info-btn"
                                                        style="background:lightgreen; border-radius: 7px;">
                                                        <i class="fas fa-video"></i>
 View Video
                                                    </a></td>
                                                  
                                                </tr>
                                                @endforeach
                                               
                                            </tbody>
                                            <!-- Repeat similar rows for other entries -->
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
           
        </div>
    </div>





    
</x-add.app-layout>