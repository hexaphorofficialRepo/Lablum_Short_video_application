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
                            <h3 class="panel-title">Add Here Earning Points Variations</h3>
                        </div>
                        <div class="panel-body">

                            <h3 class="header-title m-t-0"><small>Add Earning Points Here </small></h3>
                            <div class="m-t-20">
                                <form class="" action="{{route('admin.add.pricing.store')}}"
                                    enctype="multipart/form-data" method="POST">
                                    @csrf
                                    <div class="row">
                                        <div class="col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Video/Banner Count  <span
                                                        style="color: red">*</span></label>
                                                <input type="number" value="1" class="form-control" id="form" name="video_count"
                                                    placeholder="Advertisment Video Count" readonly>
                                                    @error('video_count')
                                                    <div class="invalid-feedback">{{ $message }}</div>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Days Count  <span
                                                        style="color: red">*</span></label>
                                                <input type="number" value="1" class="form-control" id="to" name="days_count"
                                                    placeholder="Duration To in Seconds" readonly>
                                                    @error('days_count')
                                                    <div class="invalid-feedback">{{ $message }}</div>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Types Of Advertisment  <span
                                                        style="color: red">*</span></label>
                                                <select type="number" value="1" class="form-control" id="to" name="category">
                                                    <option value=""> Select Add Type </option>
                                                    @foreach($addcategories as $category)
                                                    <option value="{{$category->id}}"> {{$category->title}}</option>
                                                    @endforeach
                                                </select>
                                                    @error('category')
                                                    <div class="invalid-feedback">{{ $message }}</div>
                                                @enderror
                                            </div>
                                        </div>








                                       
                                        
                                        <div class="col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Amount For Streaming</label>
                                                <div class="input-group">
                                                    <span class="input-group-addon">
                                                        <!-- Replace the flag icon with Font Awesome rupee icon -->
                                                        <i class="fas fa-rupee-sign"></i>
                                                    </span>
                                                    <input type="text" name="price" id="viewer_points" class="form-control @error('price') is-invalid @enderror" placeholder="Pricing For Add Video" value="{{ old('price') }}" required>
                                                </div>
                                                @error('price')
                                                <div class="invalid-feedback">{{ $message }}</div>
                                                @enderror
                                            </div>
                                        </div>
                                        
                                        


                                    </div>















                                    <div class="form-group" style="display: flex; justify-content: center">
                                        <div>
                                            <button
                                                style="    padding-left: 58px;
                                                    padding-right: 50px;
                                                    font-size: large; margin-right: 20px;
                                                }"
                                                type="submit"
                                                class="btn btn-primary waves-effect waves-light">Submit</button>
                                            <a style="    padding-left: 58px;
                                                    padding-right: 50px;
                                                    font-size: large;
                                                }"
                                                href="{{ route('admin.earning.list') }}" type="reset"
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
