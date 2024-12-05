<x-frontend.app-layout>
    <section class="breadcrumb-area">
        <div class="tg-breadcrumb-bg" data-bg-image="{{ asset('frontend/img/others/inner-page-breadcumb.jpg') }}">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-12">
                        <div class="tg-breadcrumb">
                            <h2 class="tg-breadcrumb-title">Forget Password Enter Email</h2>
                            <div class="tg-breadcrumb-link">
                                <span class="tg-breadcrumb-active"><a href="frontend.home">Home</a></span>
                                <span>Forget Password</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div class="about pt-100" style="margin: 45px 0">
        <div class="container custom-container">
            <div class="row" style="justify-content: center;">
                <div class="col-6">

                    <!-- Your login form goes here -->
                    <form action="{{route('password.send-reset-link')}}" method="POST"
                        style="padding: 15px;border-radius: 20px;box-shadow: 0px 0px 17px 4px #af54cd2e;">
                        @csrf
                        <h3 class="text-center mb-3">Forget Password</h3>

                        <div class="form-group">
                            <label for="email">Registered Email:</label>
                            <input type="text" id="email" name="email"
                                placeholder="Enter your Registered Email">
                            <span id="emailError" class="text-danger" style="display: none; font-size: 0.9rem;"></span>
                        </div>

                        <div class="form-group" style="text-align: center;">
                            <button type="submit" id="resetButton" class="btn" style="display: none;">Send Reset
                                Link</button>
                        </div>
                    </form>

                    <script>
                        const advertisers = @json($advertisers->pluck('email')); // Pass emails from backend
                        const emailInput = document.getElementById('email');
                        const emailError = document.getElementById('emailError');
                        const resetButton = document.getElementById('resetButton');
                    
                        emailInput.addEventListener('input', () => {
                            const email = emailInput.value.trim();
                    
                            // Clear previous error message
                            emailError.style.display = 'none';
                            resetButton.style.display = 'none';
                    
                            if (email) {
                                if (advertisers.includes(email)) {
                                    resetButton.style.display = 'inline-block'; // Show the button if email exists
                                } else {
                                    emailError.textContent = 'The entered email does not exist.';
                                    emailError.style.display = 'block'; // Show the error message
                                }
                            }
                        });
                    
                        // Add event listener for the form submit
                       
                    </script>


                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    @if(session('success'))
    <script>
        Swal.fire({
            title: 'Success!',
            text: '{{ session('success') }}',
            icon: 'success',
            confirmButtonText: 'OK'
        });
    </script>
@endif

@if(session('error'))
    <script>
        Swal.fire({
            title: 'Error!',
            text: '{{ session('error') }}',
            icon: 'error',
            confirmButtonText: 'OK'
        });
    </script>
@endif
</x-frontend.app-layout>
