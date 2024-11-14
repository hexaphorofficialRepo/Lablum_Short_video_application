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
                        <h3 class="panel-title">Add  Tax Charge Percentage</h3>
                    </div>
                    <div class="panel-body">
                        <h3 class="header-title m-t-0"><small>Add Tax Percentage</small></h3>
                        <div class="m-t-20">
                            <form class="" action="{{route('admin.tax.charges.store')}}" enctype="multipart/form-data" method="POST">
                                @csrf
                                <div class="row">
                                    <div class="col-sm-6 col-xs-12">
                                        <div class="form-group">
                                            <label>Tax Type( Tax Type For Tax Percentage)</label>
                                            <select type="text" class="form-control" id="tax_id" name="tax_id" >
                                                <option value="">Select Tax Type </option>
                                                @foreach ($taxes as $tax)
                                            <option value="{{$tax->id}}">{{$tax->tax_type}} </option>
                                            @endforeach
                                               
                                           



                                            </select>
                                            @error('tax_id')
                                            <div class="error-message" style="color: red;">{{ $message }}</div>
                                        @enderror
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-xs-12">
                                        <div class="form-group">
                                            <label>Payment Type (Getway of Payout)</label>
                                            <select type="text" class="form-control" id="payment_type" name="payment_type" >
                                            <option value="">Select Payment Type </option>
                                            <option value="1">Payment Getway</option>
                                            <option value="2">Pay Out</option>



                                            </select>
                                            @error('tax_percentage')
                                            <div class="error-message" style="color: red;">{{ $message }}</div>
                                        @enderror
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-xs-12">
                                        <div class="form-group">
                                            <label for="slug">Pyament Purpose</label>
                                            <select type="text" class="form-control"  name="payment_for">
                                            <option value="">Select the Payment For Purpose</option>
                                            <option value="1"> Advertisment</option>
                                            <option value="2"> Official Account Verification</option>
                                            <option value="3"> Content Viewer And Writer</option>


                                            </select>
                                        </div>


                                        @error('payment_for')
                                        <div class="error-message" style="color: red;">{{ $message }}</div>
                                    @enderror
                                    </div>



                                    <div class="col-md-6 col-lg-6 col-xs-12">
                                        <div class="form-group ">
                                            <label>Enter Tax Percentage</label>
                                         
                                                <input type="number" class="form-control" name="tax_percentage" placeholder="Tax Percentage">
                                               
                                          
                                                @error('tax_percentage')
                                                <div class="error-message" style="color: red;">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>
                                    




                                </div>
                                <div class="form-group" style="display: flex; justify-content: center">
                                    <div>
                                        <button style="padding-left: 58px; padding-right: 50px; font-size: large; margin-right: 20px;" type="submit" class="btn btn-primary waves-effect waves-light">Submit</button>
                                        <a style="padding-left: 58px; padding-right: 50px; font-size: large;" href="{{route('admin.gst.index')}}" type="reset" class="btn btn-default waves-effect m-l-5">Cancel</a>
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



</x-backend.app-layout>
