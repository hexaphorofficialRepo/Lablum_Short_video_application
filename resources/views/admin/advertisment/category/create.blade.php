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
                        <h3 class="panel-title">Add Advertisement Category</h3>
                    </div>
                    <div class="panel-body">
                        <h3 class="header-title m-t-0"><small>Add Advertisement Category </small></h3>
                        <div class="m-t-20">
                            <form class="" action="{{route('admin.store.add.category')}}" enctype="multipart/form-data" method="POST">
                                @csrf
                                <div class="row">
                                    <div class="col-sm-6 col-xs-12">
                                        <div class="form-group">
                                            <label>Advertisement Partners Category Title</label>
                                            <input type="text" class="form-control" id="title" name="title" placeholder="Advertisment Category ">
                                            <div class="error-message" id="nameError" style="color: red;"></div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-xs-12">
                                        <div class="form-group">
                                            <label for="slug">Slug</label>
                                            <input type="text" class="form-control" id="slug" name="slug" placeholder="Slug" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group" style="display: flex; justify-content: center">
                                    <div>
                                        <button style="padding-left: 58px; padding-right: 50px; font-size: large; margin-right: 20px;" type="submit" class="btn btn-primary waves-effect waves-light">Submit</button>
                                        <a style="padding-left: 58px; padding-right: 50px; font-size: large;" href="{{ route('admin.blog.category.index') }}" type="reset" class="btn btn-default waves-effect m-l-5">Cancel</a>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        $('#title').on('keyup', function() {
            var title = $(this).val();
            var slug = title.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/^-+|-+$/g, '');
            $('#slug').val(slug);
        });
    });
</script>



</x-backend.app-layout>
