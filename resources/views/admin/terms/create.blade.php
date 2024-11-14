<x-backend.app-layout>

    <div class="content">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title">Add Terms And Condition </h3>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <h3 class="header-title m-t-0"><small>Create Terms and Condition Here </small></h3>
                                    <div class="m-t-20">
                                        <form class="" action="{{route('admin.store.terms')}}" enctype="multipart/form-data" method="POST">
                                            @csrf


                                            <div class="col-sm-12 col-xs-12">
                                                <div class="form-group">
                                                    <label>Policies Type</label>
                                                    <select type="text" name="type" id="typew"
                                                        class="form-control"  required>
                                                        <option value=""> Select Policy Type</option>
                                                        <option value="terms"> Terms and Condition</option>
                                                        <option value="privacy"> Privacy Policies</option>
                                                        <option value="creator"> Content Creator Policies.</option>
                                                        <option value="viewer"> Content Viewer Policies.</option>
                                                        <option value="advertisment"> Advertisement Policies.</option>
                                                        <option value="official"> Official Verification Policies.</option>
                                                      
                                                    </select>
                                                    @error('category_id')
                                                        <div class="error-message" style="color: red;">{{ $message }}</div>
                                                    @enderror
                                                </div>
                                            </div>




                                            <div class="form-group">
                                                <label for="terms">Terms And Condition</label>
                                                <textarea name="terms" id="terms" rows="50" class="form-control" placeholder="Enter Terms and Conditions"></textarea>
                                            </div>

                                            <div class="form-group">
                                                <div>
                                                    <button type="submit" class="btn btn-primary waves-effect waves-light">Submit</button>


                                                    <a href="{{ route('admin.terms.index') }}" type="reset" class="btn btn-default waves-effect m-l-5">Cancel</a>
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
    </div>


</x-backend.app-layout>
