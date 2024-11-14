<x-add.app-layout>




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



          

            <div class="row">


                
                <div class="col-sm-6 col-lg-3">
                    <div class="panel panel-primary text-center">
                        <div class="panel-heading">
                            <h4 class="panel-title">TOTAL ADVERTISMENT PLAN</h4>
                        </div>
                        <div class="panel-body">
                            <h3 class=""><b>{{$addPlanCount}}</b></h3>
                            <p class="text-muted">Total Register Plan</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-3">
                    <div class="panel panel-primary text-center">
                        <div class="panel-heading">
                            <h4 class="panel-title">TOTAL ADVERTISMENT VIDEO</h4>
                        </div>
                        <div class="panel-body">
                            <h3 class=""><b>{{$addVideoCount}}</b></h3>
                            <p class="text-muted">Total Advertisment Video</p>
                        </div>
                    </div>
                </div>
                {{-- <div class="col-sm-6 col-lg-3">
                    <div class="panel panel-primary text-center">
                        <div class="panel-heading">
                            <h4 class="panel-title">TOTAL EARNINGS</h4>
                        </div>
                        <div class="panel-body">
                            <h3 class=""><b>$0</b></h3>
                            <p class="text-muted"><b>65%</b> From Last 24 Hours</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-3">
                    <div class="panel panel-primary text-center">
                        <div class="panel-heading">
                            <h4 class="panel-title">TOTAL WITHDRAWAL</h4>
                        </div>
                        <div class="panel-body">
                            <h3 class=""><b>$2779.7</b></h3>
                            <p class="text-muted"><b>31%</b> From Last 1 month</p>
                        </div>
                    </div>
                </div> --}}
            </div>


        </div>
    </div>
</x-add.app-layout>