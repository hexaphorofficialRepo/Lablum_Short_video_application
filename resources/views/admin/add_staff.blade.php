<x-backend.app-layout>


    <div class="content-wrapper transition-all duration-150 xl:ltr:ml-[248px] xl:rtl:mr-[248px]" id="content_wrapper">
        <div class="page-content">
            <div id="content_layout ">


                <div>
                    <div class="bg-white p-3 m-2 rounded-md">
                        <p class="text-xl font-bold">Add Staff</p>
                        <div class="py-3">

                            <form action="{{ ($staffToEdit) ? route('staff_update', $staffToEdit->id) : route('staff_store') }}" method="post" enctype="multipart/form-data" class="grid grid-cols-12 gap-3">
                                @csrf
                                @if($staffToEdit)
                                @method('PUT')
                                @endif
                                <div class="col-span-12 md:col-span-6 mb-1">
                                    <label>
                                        <span>Name</span>
                                        <input name="name" value="{{ isset( $staffToEdit) ?  $staffToEdit->name : '' }}" type="text" class="w-full px-2 py-2 bg-gray-100 border block mt-1.5 w-full rounded-md">
                                    </label>
                                    @error('name') <span class="text-red-700 text-sm">{{ $message }}</span> @enderror
                                </div>
                                <div class="col-span-12 md:col-span-6 mb-1">
                                    <label>
                                        <span>Image</span>

                                        <!-- Display the current image -->
                                       

                                        <!-- Input for choosing a new image -->
                                        <input name="image" type="file" accept="image/*" class="w-full px-2 py-2 bg-gray-100 border block mt-1.5 w-full rounded-md">
                                        @if(isset($staffToEdit) && $staffToEdit->image)
                                        <hr>
                                        <img src="{{ asset($staffToEdit->image) }}" alt="Current Image" class="mb-1 mt-1 mx-auto my-auto" style="max-width: 70px; max-height: 70px; display: block;">

                                        <hr>
                                       
                                        
                                        @endif
                                    </label>
                                    @error('image') <span class="text-red-700 text-sm">{{ $message }}</span> @enderror
                                </div>

                                <div class="col-span-12 md:col-span-6 mb-1">
                                    <label>
                                        <span>Staff Type</span>
                                        <select name="staff_type" class="w-full px-2 py-2 bg-gray-100 border block mt-1.5 rounded-md">
                                            <!-- Add your options here -->
                                            <option value="" {{ (isset($staffToEdit) && $staffToEdit->staff_type == "") ? 'selected' : '' }}>Select</option>
                                            <option value="p_staff" {{ (isset($staffToEdit) && $staffToEdit->staff_type == "p_staff") ? 'selected' : '' }}>Printing Staff</option>
                                            <option value="receptionist" {{ (isset($staffToEdit) && $staffToEdit->staff_type == "receptionist") ? 'selected' : '' }}>Receptionist</option>
                                            <option value="managingstaff" {{ (isset($staffToEdit) && $staffToEdit->staff_type == "managingstaff") ? 'selected' : '' }}>Managing Staff</option>
                                            <option value="marketingstaff" {{ (isset($staffToEdit) && $staffToEdit->staff_type == "marketingstaff") ? 'selected' : '' }}>Marketing Staff</option>

                                            <!-- Add more options as needed -->
                                        </select>
                                    </label>
                                    @error('staff_type') <span class="text-red-700 text-sm">{{ $message }}</span> @enderror
                                </div>
                                <div class="col-span-12 md:col-span-6 mb-1">
                                    <label>
                                        <span>Email</span>
                                        <input name="email" type="email" value="{{ isset( $staffToEdit) ?  $staffToEdit->email : '' }}" class="w-full px-2 py-2 bg-gray-100 border block mt-1.5 w-full rounded-md">
                                    </label>
                                    @error('email') <span class="text-red-700 text-sm">{{ $message }}</span> @enderror
                                </div>
                                <div class="col-span-12 md:col-span-6 mb-1">
                                    <label>
                                        <span>Phone number</span>
                                        <div class="flex items-center">
                                            <button id="dropdown-phone-button" data-dropdown-toggle="dropdown-phone" class="flex-shrink-0 z-10 inline-flex items-center py-2.5 px-4 text-sm font-medium text-center text-gray-900 bg-gray-100 border border-gray-300 rounded-s-lg hover:bg-gray-200 focus:ring-4 focus:outline-none focus:ring-gray-100 dark:bg-gray-700 dark:hover:bg-gray-600 dark:focus:ring-gray-700 dark:text-white dark:border-gray-600" type="button">
                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 800" width="20" height="15" class="h-4 w-4 me-2">
                                                    <!-- Green Background -->
                                                    <rect width="1200" height="800" fill="#138808" />

                                                    <!-- Saffron Color Stripe -->
                                                    <rect width="1200" height="215.8" fill="#FF9933" />

                                                    <!-- White Color Stripe -->
                                                    <rect width="1200" height="215.8" y="215.8" fill="#FFFFFF" />

                                                    <!-- Dark Green Color Stripe -->
                                                    <rect width="1200" height="215.8" y="431.6" fill="#138808" />

                                                    <!-- Navy Blue Ashoka Chakra -->
                                                    <circle cx="600" cy="431.6" r="91.7" fill="#000080" />

                                                    <!-- 24 Spokes of the Ashoka Chakra -->
                                                    <g stroke="#FFFFFF" stroke-width="8">
                                                        <!-- Spoke 1 to 12 -->
                                                        <line x1="600" y1="431.6" x2="600" y2="340.7" />
                                                        <line x1="600" y1="431.6" x2="659.1" y2="431.6" />
                                                        <line x1="600" y1="431.6" x2="637.5" y2="377.5" />
                                                        <line x1="600" y1="431.6" x2="562.5" y2="377.5" />
                                                        <line x1="600" y1="431.6" x2="600" y2="340.7" />
                                                        <line x1="600" y1="431.6" x2="540.9" y2="431.6" />
                                                        <line x1="600" y1="431.6" x2="562.5" y2="485.7" />
                                                        <line x1="600" y1="431.6" x2="637.5" y2="485.7" />
                                                        <line x1="600" y1="431.6" x2="600" y2="522.4" />
                                                        <line x1="600" y1="431.6" x2="540.9" y2="431.6" />
                                                        <line x1="600" y1="431.6" x2="637.5" y2="377.5" />
                                                        <line x1="600" y1="431.6" x2="562.5" y2="377.5" />

                                                        <!-- Spoke 13 to 24 -->
                                                        <line x1="600" y1="431.6" x2="600" y2="522.4" />
                                                        <line x1="600" y1="431.6" x2="659.1" y2="431.6" />
                                                        <line x1="600" y1="431.6" x2="637.5" y2="485.7" />
                                                        <line x1="600" y1="431.6" x2="562.5" y2="485.7" />
                                                        <line x1="600" y1="431.6" x2="600" y2="522.4" />
                                                        <line x1="600" y1="431.6" x2="540.9" y2="431.6" />
                                                        <line x1="600" y1="431.6" x2="562.5" y2="377.5" />
                                                        <line x1="600" y1="431.6" x2="637.5" y2="377.5" />
                                                        <line x1="600" y1="431.6" x2="600" y2="340.7" />
                                                        <line x1="600" y1="431.6" x2="540.9" y2="431.6" />
                                                        <line x1="600" y1="431.6" x2="637.5" y2="485.7" />
                                                        <line x1="600" y1="431.6" x2="562.5" y2="485.7" />
                                                    </g>
                                                </svg>

                                                +91

                                            </button>


                                            <div class="relative w-full">
                                                <input type="number" name="ph_no" value="{{ isset( $staffToEdit) ?  $staffToEdit->ph_no : '' }}" class="block p-2.5 w-full z-20 text-sm text-gray-900 bg-gray-50 rounded-e-lg border-s-0 border border-gray-300 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-s-gray-700  dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:border-blue-500" pattern="^\+91-[0-9]{10}$" placeholder="+91-1234567890" required>
                                            </div>
                                        </div>
                                    </label>
                                    @error('ph_no') <span class="text-red-700 text-sm">{{ $message }}</span> @enderror
                                </div>
                                <div class="col-span-12 md:col-span-6 mb-1">
                                    <label>
                                        <span>Password</span>
                                        <input name="password" value="{{ isset( $staffToEdit) ?  $staffToEdit->password : '' }}" type="password" class="w-full px-2 py-2 bg-gray-100 border block mt-1.5 w-full rounded-md">
                                    </label>
                                    @error('password') <span class="text-red-700 text-sm">{{ $message }}</span> @enderror
                                </div>
                                <div class="col-span-12 md:col-span-6 mb-1">
                                    <label>
                                        <span>Confirm Password</span>
                                        <input name="cpassword" value="{{ isset( $staffToEdit) ?  $staffToEdit->password : '' }}" type="password" class="w-full px-2 py-2 bg-gray-100 border block mt-1.5 w-full rounded-md">
                                    </label>
                                    @error('cpassword') <span class="text-red-700 text-sm">{{ $message }}</span> @enderror
                                </div>

                                <div class="col-span-12 md:col-span-6 mb-1">
                                    <label>
                                        <span>Address</span>
                                        <input name="address" value="{{ isset( $staffToEdit) ?  $staffToEdit->address : '' }}" type="text" class="w-full px-2 py-2 bg-gray-100 border block mt-1.5 w-full rounded-md">
                                    </label>

                                </div>
                                <div class="col-span-12 md:col-span-6 mb-1">
                                    <label>
                                        <span>Area</span>
                                        <input name="area" value="{{ isset( $staffToEdit) ?  $staffToEdit->area : '' }}" type="text" class="w-full px-2 py-2 bg-gray-100 border block mt-1.5 w-full rounded-md">
                                    </label>

                                </div>
                                <div class="col-span-12 md:col-span-6 mb-1">
                                    <label>
                                        <span>Pincode</span>
                                        <input name="pincode" value="{{ isset( $staffToEdit) ?  $staffToEdit->pincode : '' }}" type="number" class="w-full px-2 py-2 bg-gray-100 border block mt-1.5 w-full rounded-md">
                                    </label>

                                </div>
                                <div class="col-span-12">
                                    <button type="submit" class="bg-green-600 text-white rounded px-4 py-1.5 mt-1.5 shadow-md font-bold">>{{ ($staffToEdit) ? 'Update' : 'Add' }} Staff</button>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
                <div class="relative overflow-x-auto shadow-md sm:rounded-lg">
                    <div class="flex items-center justify-between flex-column flex-wrap md:flex-row space-y-4 md:space-y-0 pb-4 bg-white dark:bg-gray-900">
                        <div>
                            <button id="dropdownActionButton" data-dropdown-toggle="dropdownAction" class="inline-flex items-center text-gray-500 bg-white border border-gray-300 focus:outline-none hover:bg-gray-100 focus:ring-4 focus:ring-gray-200 font-medium rounded-lg text-sm px-3 py-1.5 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:bg-gray-700 dark:hover:border-gray-600 dark:focus:ring-gray-700" type="button">
                                <span class="sr-only">Action button</span>
                                Action
                                <svg class="w-2.5 h-2.5 ms-2.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 6">
                                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 4 4 4-4" />
                                </svg>
                            </button>
                            <!-- Dropdown menu -->
                            <div id="dropdownAction" class="z-10 hidden bg-white divide-y divide-gray-100 rounded-lg shadow w-44 dark:bg-gray-700 dark:divide-gray-600">
                                <ul class="py-1 text-sm text-gray-700 dark:text-gray-200" aria-labelledby="dropdownActionButton" id="dropdownActionButton">
                                    <li>
                                        <a href="#" class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Reward</a>
                                    </li>
                                    <li>
                                        <a href="#" class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Promote</a>
                                    </li>
                                    <li>
                                        <a href="#" class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Activate account</a>
                                    </li>
                                </ul>
                                <div class="py-1">
                                    <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white">Delete User</a>
                                </div>
                            </div>
                        </div>
                        <label for="table-search" class="sr-only">Search</label>
                        <div class="relative">
                            <div class="absolute inset-y-0 rtl:inset-r-0 start-0 flex items-center ps-3 pointer-events-none">
                                <svg class="w-4 h-4 text-gray-500 dark:text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20">
                                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z" />
                                </svg>
                            </div>
                            <input type="text" id="table-search-users" class="block p-2 ps-10 text-sm text-gray-900 border border-gray-300 rounded-lg w-80 bg-gray-50 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Search for users">
                        </div>
                    </div>
                    <table class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
                        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                            <tr>
                                <th scope="col" class="p-4">
                                    <div class="flex items-center">
                                        <input id="checkbox-all-search" type="checkbox" class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 dark:focus:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
                                        <label for="checkbox-all-search" class="sr-only">checkbox</label>
                                    </div>
                                </th>
                                <th scope="col" class="px-6 py-3">
                                    Name
                                </th>
                                <th scope="col" class="px-6 py-3">
                                    Staff Type
                                </th>
                                <th scope="col" class="px-6 py-3">
                                    Address
                                </th>
                                <th scope="col" class="px-6 py-3">
                                    Area
                                </th>
                                <th scope="col" class="px-6 py-3">
                                    Pincode
                                </th>
                                <th scope="col" class="px-6 py-3">
                                    Action
                                </th>
                            </tr>
                        </thead>
                        <tbody>

                            @foreach( $staffRecords as $staffRecord)
                            <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
                                <td class="w-4 p-4">
                                    <div class="flex items-center">
                                        <input id="checkbox-table-search-1" type="checkbox" class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 dark:focus:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
                                        <label for="checkbox-table-search-1" class="sr-only">checkbox</label>
                                    </div>
                                </td>
                                <th scope="row" class="flex items-center px-6 py-4 text-gray-900 whitespace-nowrap dark:text-white">
                                    <img class="w-10 h-10 rounded-full" src="{{ $staffRecord->image}}" alt="Jese image">
                                    <div class="ps-3">
                                        <div class="text-base font-semibold">{{ $staffRecord->name}}</div>
                                        <div class="font-normal text-gray-500">{{ $staffRecord->email}}</div>
                                    </div>
                                </th>
                                <td class="px-6 py-4">
                                    {{ $staffRecord->staff_type}}
                                </td>
                                <td class="px-6 py-4">
                                    {{ $staffRecord->address}}
                                </td>
                                <td class="px-6 py-4">
                                    {{ $staffRecord->area}}
                                </td>
                                <td class="px-6 py-4">
                                    {{ $staffRecord->pincode}}
                                </td>



                                <td class="px-6 py-4">
                                    <a href="{{ route('add_staff', ['id' => $staffRecord->id]) }}" class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Edit</a>
                                    <a href="{{route('delete_staff',['id' => $staffRecord->id])}}" class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Delete</a>
                                </td>
                            </tr>
                            @endforeach

                        </tbody>
                    </table>
                </div>





            </div>
        </div>
    </div>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const dropdownButton = document.getElementById('dropdownActionButton');
            const dropdownMenu = document.getElementById('dropdownAction');

            dropdownButton.addEventListener('click', function() {
                dropdownMenu.classList.toggle('hidden');
            });
        });
    </script>


</x-backend.app-layout>