<x-backend.app-layout>





    <div class="content">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="page-header-title">
                        <h4 class="pull-left page-title" style="font-size: 30px;">Song</h4>
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
                                <a href="{{route('admin.song.create')}}" class="btn btn-primary" style="border-radius: 7px;"><i class=""></i>
                                    + Add</a>

                            </div>
                        </div>
                        {{-- <div class="col-md-6">
                            <div class="input-group" style="margin-top: 16px; float: right;">

                                <input type="text" class="form-control" placeholder="Search...">

                            </div>
                        </div> --}}
                    </div>



                    <div class="table-responsive">
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>SN</th>
                                    <th>Image</th>
                                    <th>TITLE</th>
                                    <th>SINGER</th>
                                    <TH>SONG</TH>
                                    <th>EDIT</th>
                                    {{-- <th>DELETE</th> --}}
                                </tr>
                            </thead>
                            @forEach($songs as $song)
                            <tbody>
                                <tr>
                                    <td>{{ $loop->iteration }}</td>
                                    <td>
                                        <!-- Add the responsive image here -->
                                        <img height="50px" width="50px" alt="app" class="mx-auto" src="{{ asset('storage/song_images/' . $song->image) }}" style="box-shadow: rgba(105, 103, 103, 0) 0px 5px 15px 0px; border: 2px solid rgb(255, 255, 255); border-radius: 10px;">

                                    </td>
                                    <td>{{$song->title}}</td>
                                    <td>{{$song->singer}} </td>
                                    <td>
                                        <audio controls style="height: 42px; color: blue;">
                                            <source src="{{ asset('storage/song/' . $song->music) }}" type="audio/mpeg">
                                            Your browser does not support the audio element.
                                        </audio>
                                    </td>
                                    <td>
                                        <a class="btn btn-primary info-btn" href="{{route('admin.song.edit',$song)}}"
                                            style="background-image: linear-gradient(352deg, #af0888, #131597) !important   t;color:white;"
                                           >
                                            <i class="fas fa-edit"></i>Edit
                                    </a>
                                    </td>
                                    {{-- <td> <button class="btn btn-secondary history-btn"
                                            style="background-image: linear-gradient(352deg,#af0888,#131597)!important;color:white;"
                                            onclick="showHistory()">
                                            <i class="fas fa-trash-alt"></i>Delete
                                        </button>
                                    </td> --}}
                                </tr>
                                <!-- Repeat similar rows for other entries -->
                            </tbody>
                            @endforeach
                           
                            <!-- Repeat similar rows for other entries -->
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            @if(session('success'))
                swal("Success", "{{ session('success') }}", "success");
            @endif
        });
    </script>
    
    
</x-backend.app-layout>