<x-add.app-layout>





        <style>
            .password-toggle-icon {
                position: absolute;
                right: 10px;
                top: 50%;
                transform: translateY(-50%);
                cursor: pointer;
                z-index: 1;
            }

            .password-input {
                padding-right: 30px;
            }
        </style>

        <div class="content">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="page-header-title">
                            <h4 class="pull-left page-title">Add Advertisement Video</h4>
                            <ol class="breadcrumb pull-right">

                            </ol>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-12">
                        <div class="panel panel-primary">






                            <div class="panel-body"
                                style="background:lightgrey">
                                        <h3 class="header-title m-t-0"><small>Add Advertisment Vido</small></h3>
                                <div class="m-t-20">


                                    <form id="videoForm" action="{{ route('add.video.store') }}" method="POST" enctype="multipart/form-data">
                                        @csrf
                                        <div class="row">
                                            <input name="adevrtiser_id" value="{{ $advertiser->id }}" hidden>
                                            {{-- <input name="addplan_id" value="{{ $plan->id }}" hidden> --}}
                                    
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label for="addplan_">Advertisment Plan</label>
                                                    <select type="text" name="addplan_id" class="form-control"> 
                                                        <option value="">Select Plan</option>

                                                        @foreach($plan as $p)
                                                        <?php
                                                        // Convert created_at to American date format
                                                        $formattedDate = date('m/d/Y', strtotime($p->created_at));
                                                        ?>
                                                        <option value="{{$p->id}}">{{$p->add_count}} Video for {{$p->days_count}} Activation Date {{$formattedDate}}</option>

                                                        @endforeach
                                                    </select>





                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label for="website">Website URL</label>
                                                    <input type="text" name="web_link" class="form-control" id="website" placeholder="Enter website URL">
                                                </div>
                                            </div>
                                    
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label for="facebook">Facebook URL</label>
                                                    <input type="text" name="fb_link" class="form-control" id="facebook" placeholder="Enter Facebook URL">
                                                </div>
                                            </div>
                                    
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label for="Instagram">Instagram URL</label>
                                                    <input type="text" name="insta_link" class="form-control" id="instagram" placeholder="Enter Instagram URL">
                                                </div>
                                            </div>
                                    
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label for="Twitter">Video</label>
                                                    <input type="file" name="video" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label for="type">Advertisement Type</label>
                                                    <select type="text" name="video_type" class="form-control" id="video_type" >
                                                        <option> Select Video Type</option>
                                                        <option value="Sponsor">Sponsor</option>
                                                        <option value="Adds">Adds</option>
                                                        {{-- <option value="Shopping">Shopping</option> --}}
                                                    </select>
                                                </div>
                                            </div>
                                    
                                        <div class="form-group" style="display: flex; justify-content: center">
                                            <div>
                                                <button style="padding-left: 58px; padding-right: 50px; font-size: large; margin-right: 20px;" type="submit" class="btn btn-primary waves-effect waves-light">Submit</button>
                                                <a style="padding-left: 58px; padding-right: 50px; font-size: large;" href="{{ route('add.dashboard') }}" type="reset" class="btn btn-default waves-effect m-l-5">Cancel</a>
                                            </div>
                                        </div>
                                    </form>
                                    
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>


       

    
        
        


    </x-add.app-layout>











