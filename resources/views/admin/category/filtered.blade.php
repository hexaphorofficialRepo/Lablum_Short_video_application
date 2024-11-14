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
                        <h4 class="pull-left page-title" style="font-size: 30px;">#HashTag</h4>
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
                                <a href="{{route('admin.category.create')}}" class="btn btn-primary" style="border-radius: 7px;"><i
                                        class=""></i>
                                    Add #Hashtag</a>
                              

                                        <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Filter <i class="fas fa-chevron-down" style="margin-left: 5px;"></i>
                                        </button>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                            @foreach ($titles as $title)
                                                <a class="dropdown-item" href="{{route('categories.filter',$title)}}">{{ $title }}</a>
                                            @endforeach
                                        </div>


                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="input-group" style="margin-top: 16px; float: right;">

                                <input type="text" class="form-control" placeholder="Search...">

                            </div>
                        </div>
                    </div>



                    <div class="table-responsive" >
                        <table class="table table-bordered table-striped" id="categoryList">
                            <thead>
                                <tr>
                                    <th>SN</th>
                                    <th>#Hashtag Title</th>
                                    <th>#Hashtag</th>
                                 
                                    
                                    <th>Created Date</th>
                                   
                                    <th>EDIT</th>
                                    {{-- <th>DELETE</th> --}}
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($categories as $category)
                                <tr>


                                    <td>{{ $loop->iteration }}</td>
                                  
                                      

                                        <td>{{$category->title}}</td>

                                   
                                    <td>{{$category->name}}</td>
                                 
                                  
                                  
                                 
                                    <td>{{ $category->created_at->diffForHumans() }}</td>
                                  



                                 


                                    
                                    <td>
                                        <a class="btn btn-primary info-btn" href="{{route('admin.category.edit',$category)}}"
                                        style="background-image: linear-gradient(352deg,#08af85,#3bd41d)!important;color:white;"
                                       >
                                        <i class="fas fa-edit"></i>Edit
                                </a>
                            </td>
                        {{-- <td> --}}
                                        {{-- <button class="btn btn-secondary history-btn"
                                            style="background-image: linear-gradient(352deg,#af0888,#131597)!important;color:white;"
                                            onclick="showHistory()">
                                            <i class="fas fa-trash-alt"></i>Delete
                                        </button> --}}
                                    {{-- </td> --}}
                                </tr>
                                @endforeach
                                <!-- Repeat similar rows for other entries -->
                            </tbody>



                            <!-- Repeat similar rows for other entries -->
                        
                            <!-- Repeat similar rows for other entries -->
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

    <!-- Script to show SweetAlert message -->
    <script>
        // Check if there is a success message flashed from controller
        let successMessage = '{{ session('success') }}';
        if (successMessage) {
            Swal.fire({
                icon: 'success',
                title: 'Success',
                text: successMessage,
                showConfirmButton: false,
                timer: 2000 // Close alert after 2 seconds
            });
        }
    </script>
 <!-- Include jQuery and Bootstrap -->
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.6.0/js/bootstrap.min.js"></script>

 {{-- <script>
     function filterCategory(title) {
         // Make an AJAX request to fetch categories based on the selected title
         $.ajax({
             url: "{{ route('categories.filter') }}",
             type: 'GET',
             data: {
                 title: title
             },
             success: function(response) {
                 $('#categoryList').html(response);
             },
             error: function(xhr, status, error) {
                 console.error(xhr.responseText);
             }
         });
     }
 </script> --}}
    


</x-backend.app-layout>
