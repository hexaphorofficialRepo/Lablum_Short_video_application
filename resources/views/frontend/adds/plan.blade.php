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
                        <h4 class="pull-left page-title">Choose Advertisement Plan</h4>
                        <ol class="breadcrumb pull-right">

                        </ol>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-12">
                    <div class="panel panel-primary">
                        <div class="panel-body" style="background:lightgrey;">
                            <h3 class="header-title m-t-0"><small>Choose Advertisement Plan</small></h3>
                            <div class="m-t-20">
                                <form action="{{ route('store.add.plan') }}" enctype="multipart/form-data" method="POST">
                                    @csrf
                                    <div class="row">
                                        <input type="hidden" name="advertiser_id" value="{{ $advertiser->id }}" />
                                        <div class="col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Enter Video Count For Advertisement</label>
                                                <input type="text" class="form-control" id="video_count" name="video_count" placeholder="Enter The Video Count For Advertisement" required>
                                                <div class="error-message" id="videoCountError" style="color: red;"></div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Enter The Days For Advertisement</label>
                                                <input type="text" class="form-control" id="days_count" name="days_count" placeholder="Enter the Days Count For Advertisement" required>
                                                <div class="error-message" id="daysCountError" style="color: red;"></div>
                                            </div>
                                        </div>

                                        <div class="col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Target Audience </label>
                                                <select type="text" class="form-control" id="target_audience"
                                                    name="target_audience" required>
                                                    <option value="" selected> Select Target Audiaece </option>
                                                    <option value="CollegeStudents" selected> College Students </option>
                                                    <option value="PoliticalPerson" selected> Political Persona
                                                    </option>
                                                    <option value="LadiesOnly" selected> Ladies Only </option>



                                                </select>
                                                <div class="error-message" id="nameError" style="color: red;"></div>
                                            </div>
                                        </div>
                                        <div class="col-sm-3 col-xs-16">
                                            <div class="form-group">
                                                <label>Target Age Group </label>
                                                <input type="text" class="form-control" id="target_age_min"
                                                name="target_age_min"
                                                placeholder="Target Minimum age" required>
                                              
                                                    
                                            </div>
                                           
                                        </div>
                                        <div class="col-sm-3 col-xs-16">
                                            <div class="form-group">
                                                <label>Target Age Group </label>
                                                <input type="text" class="form-control" id="target_age_max"
                                                name="target_age_max"
                                                placeholder="Target Maximum age" required>
                                              
                                            </div>
                                           
                                        </div>
                                        <div class="col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Preferred locatioon area (if Any)</label>
                                                <input type="text" class="form-control" id="days_count"
                                                    name="location" placeholder="Enter Complete Preferred Location"
                                                    required>
                                                <div class="error-message" id="nameError" style="color: red;"></div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Preferred City (if Any)</label>
                                                <input type="text" class="form-control" id="days_count"
                                                    name="city" placeholder="Enter Preferred City"
                                                    required>
                                                <div class="error-message" id="nameError" style="color: red;"></div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Preferred State (if Any)</label>
                                                <input type="text" class="form-control" id="days_count"
                                                    name="state" placeholder="Enter Preferred State"
                                                    required>
                                                <div class="error-message" id="nameError" style="color: red;"></div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Preferred Zipcode (if Any)</label>
                                                <input type="text" class="form-control" id="days_count"
                                                    name="zipcode" placeholder="Enter Preferred Zipcode"
                                                    required>
                                                <div class="error-message" id="nameError" style="color: red;"></div>
                                            </div>
                                        </div>








                                        <div class="col-sm-6 col-xs-12">
                                            <div class="form-group">
                                                <label>Advertisement Costing</label>
                                                <input type="text" class="form-control" id="payment_amount" name="payment_amount" placeholder="Calculated Amount" required readonly>
                                                <div class="error-message" id="paymentAmountError" style="color: red;"></div>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="form-group" style="display: flex; justify-content: center">
                                        <div>
                                            <button type="submit" class="btn btn-primary waves-effect waves-light">Submit</button>
                                            <a href="{{ route('add.dashboard') }}" type="reset" class="btn btn-default waves-effect m-l-5">Cancel</a>
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
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    $(document).ready(function() {
        $('#video_count, #days_count').on('input', function() {
            calculatePaymentAmount();
        });

        function calculatePaymentAmount() {
            var videoCount = $('#video_count').val();
            var daysCount = $('#days_count').val();

            $.ajax({
                url: "{{ route('calculate.payment.amount') }}",
                method: 'POST',
                data: {
                    '_token': '{{ csrf_token() }}',
                    'video_count': videoCount,
                    'days_count': daysCount,
                },
                success: function(response) {
                    $('#payment_amount').val(response.paymentAmount);
                },
                error: function(xhr, status, error) {
                    console.error(error);
                }
            });
        }
    });
</script>

@if(session('success'))
<script>
    Swal.fire({
        icon: 'success',
        title: 'Success!',
        text: '{{ session('success') }}',
        showConfirmButton: false,
        timer: 3000
    });
</script>
@endif

@if(session('error'))
<script>
    Swal.fire({
        icon: 'error',
        title: 'Error!',
        text: '{{ session('error') }}',
        showConfirmButton: false,
        timer: 3000
    });
 </script>
@endif

</x-add.app-layout>
