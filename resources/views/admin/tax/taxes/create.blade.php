<x-backend.app-layout>
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
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Add New Tax Type</h3>
                        </div>
                        <div class="panel-body">
                           
                                    <h3 class="header-title m-t-0"><small>Add New Tax Type </small></h3>
                                    <div class="m-t-20">
                                        <form class="" action="{{route('admin.taxes.type.store')}}" enctype="multipart/form-data" method="POST">
                                            @csrf
                                            <div class="row">
                                                <div class="col-sm-6 col-xs-12">
                                                    <div class="form-group">
                                                        <label>Tax Type</label>
                                                        <input type="text" class="form-control" id="tax_type" name="tax_type"  placeholder="Tax Type Title" required>
                                                        @error('tax_type')
                                                        <div class="error-message" style="color: red;">{{ $message }}</div>
                                                    @enderror
                                                    </div>
                                                </div>

                                              
                                                
                                                
                                            </div>















                                            <div class="form-group" style="display: flex; justify-content: center">
                                                <div>
                                                    <button style="    padding-left: 58px;
                                                    padding-right: 50px;
                                                    font-size: large; margin-right: 20px;
                                                }" type="submit"
                                                        class="btn btn-primary waves-effect waves-light">Submit</button>
                                                    <a style="    padding-left: 58px;
                                                    padding-right: 50px;
                                                    font-size: large;
                                                }" href="{{ route('admin.taxes.type.index') }}" type="reset"
                                                        class="btn btn-default waves-effect m-l-5">Cancel</a>
                                                </div>
                                            </div>
                                        </form>

                                        <!-- Preview Image -->




                                    </div>
                              
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
 


</x-backend.app-layout>
