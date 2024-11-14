<x-frontend.app-layout :canonicalUrl="url('https://lablum.com/about-us')">

     <!-- breadcrumb -->
     <section class="breadcrumb-area">
        <div class="tg-breadcrumb-bg" data-bg-image="assets/img/others/inner-page-breadcumb.jpg">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-12">
                        <div class="tg-breadcrumb">
                            <h2 class="tg-breadcrumb-title">Update Info</h2>
                            <div class="tg-breadcrumb-link">
                                <span class="tg-breadcrumb-active"><a href="index.html">Home</a></span>
                                <span>Update Info</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb-end -->

    <section class="pb-96">
        <div class="container">
            <section>
                <form action="{{route('update-profile')}}" method="POST"  enctype="multipart/form-data"
                    style="padding: 71px;box-shadow: 4px 1px 10px grey;margin-top:30px;border-radius: 13px;background-color: #d199b636;">
                    @csrf
                    <div class="row">

                        <div class="col-md-12" style="margin-bottom: 15px;">
                            <h3 style="color: #AF54CD;">Update Info</h3>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="input1">Name</label>
                                <input type="text" class="form-control custom-input" name="fullname" id="input1" value="{{$advertiser->name}}" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="input2">Email</label>
                                <input type="email" name="email" class="form-control custom-input" value="{{$advertiser->email}}" id="input2" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="input3">Phone</label>
                                <input type="text" name="mobile" value="{{$advertiser->mobile}}" class="form-control custom-input" id="input3" readonly>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="input4">Business Type</label>
                                <select type="text" name="business_type" class="form-control custom-input" id="input4">
                                    <option value="">Select Business Type</option>
                                    @foreach ($addcategories as $category)
                                        <option value="{{$category->id}}" @if($category->id == $advertiser->business_type) selected @endif>{{$category->title}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="input5">Business Name</label>
                                <input type="text" name="business_name" value="{{$advertiser->business_name}}" class="form-control custom-input" id="input5" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="input6">Website URL</label>
                                <input type="text" name="url" value="{{$advertiser->url}}" class="form-control custom-input" id="input6" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="input7">State</label>
                                <input type="text" name="state" value="{{$advertiser->state}}"  class="form-control custom-input" id="input7" placeholder="" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="input8">City</label>
                                <input type="text" name="city" value="{{$advertiser->city}}" class="form-control custom-input" id="input8" required>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="input8">Area/Village</label>
                                <input type="text" value="{{$advertiser->area}}" name="area" class="form-control custom-input" id="input8" required>
                            </div>
                        </div>


                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="input8">Zipcode</label>
                                <input type="text" name="zipcode" value="{{$advertiser->zipcode}}" class="form-control custom-input" id="input8" required>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group" style="margin-top: 22px;">
                                <label for="input8">Company Documents</label>
                                <input type="file" name="business_document[]" class="form-control custom-input" id="input8" accept="image/*" multiple  required>
                                <div id="document-preview"></div>
                            </div>
                        </div>
                        
                        
                        

                      
                                <div class="col-md-6">
                                    <div class="form-group" style="margin-top: 22px;">
                                        <label for="input8">Personal Documents</label>
                                        <input type="file" name="personel_documents[]" class="form-control custom-input" id="input8" multiple  required>
                                    </div>
                                    <div class="row" id="imagePreview"></div>
                                </div>
                         
                        
                        <!-- jQuery -->
                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                        
                        <script>
                        $(document).ready(function(){
                            $('#input8').on('change', function(e){
                                var files = e.target.files;
                                $('#imagePreview').empty(); // Clear existing previews
                                for(var i=0; i<files.length; i++){
                                    var file = files[i];
                                    var reader = new FileReader();
                                    reader.onload = function(e){
                                        var imgSrc = e.target.result;
                                        var img = '<div class="col-md-3"><img src="'+imgSrc+'" class="img-fluid"></div>';
                                        $('#imagePreview').append(img);
                                    }
                                    reader.readAsDataURL(file);
                                }
                            });
                        });
                        </script>
                    </div>

                    <div class="col-lg-12" style="display: flex; justify-content: center; margin-top: 25px;">
                    
                            <button type="submit" class="btn btn-primary" style="width:200px">Submit</button>
        
                    </div>


                </form>
            </section>
        </div>
    </section>

</x-frontend.app-layout>