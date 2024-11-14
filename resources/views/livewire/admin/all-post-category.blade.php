<div class="content-wrapper transition-all duration-150 xl:ltr:ml-[248px] xl:rtl:mr-[248px]" id="content_wrapper">
    <div class="page-content ">
        <div id="content_layout border-solid border-2 border-indigo-600 ">
            <div class="bg-blue p-3 m-2 rounded-md">
                @if (session()->has('message'))
                    <div class="alert alert-success" role="alert">{{ session('message') }}</div>
                @endif

                <div class="row">
                    <div class="col-md-6  text-center" style="font-weight: bold; font-size: 20px;">
                        <h3 class="mb-4 text-3xl font-extrabold text-gray-900 dark:text-white md:text-5xl lg:text-4xl">
                            <span class="text-transparent bg-clip-text bg-gradient-to-r to-emerald-600 from-sky-400">All
                                Post Category</span> </h3>
                    </div>




                </div>

                <div class="relative overflow-x-auto shadow-md sm:rounded-lg p-3 ">
                    <div
                        class="flex items-center justify-between flex-column flex-wrap md:flex-row space-y-4 md:space-y-0 pb-4 bg-white dark:bg-gray-900">
                        <div>
                            <div class="col-md-6">
                                <a href="{{ route('admin.addcategory') }}" class="btn btn-success btn-md float-end">

                                    Add New Post Categories
                                </a>
                            </div>
                            <!-- Dropdown menu -->

                        </div>
                        <label for="table-search" class="sr-only">Search</label>
                        <div class="relative">
                            <div
                                class="absolute inset-y-0 rtl:inset-r-0 start-0 flex items-center ps-3 pointer-events-none">
                                <svg class="w-4 h-4 text-gray-500 dark:text-gray-400" aria-hidden="true"
                                    xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20">
                                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
                                        stroke-width="2" d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z" />
                                </svg>
                            </div>
                            <input type="text" id="table-search-users"
                                class="block p-2 ps-10 text-sm text-gray-900 border border-gray-300 rounded-lg w-80 bg-gray-50 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                placeholder="Search for users">
                        </div>
                    </div>
                    <table class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
                        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                            <tr>
                                <th scope="col" class="p-4">
                                    <div class="flex items-center">
                                        <input id="checkbox-all-search" type="checkbox"
                                            class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 dark:focus:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
                                        <label for="checkbox-all-search" class="sr-only">checkbox</label>
                                    </div>
                                </th>
                                <th scope="col" class="px-6 py-3">
                                    Category Title
                                </th>
                                <th scope="col" class="px-6 py-3">
                                    Category Slug
                                </th>
                                <th scope="col" class="px-6 py-3">
                                    Action
                                </th>
                            </tr>
                        </thead>
                        <tbody>

                            @foreach ($categories as $c)
                                <tr
                                    class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
                                    <td class="w-4 p-4">
                                        <div class="flex items-center">
                                            <input id="checkbox-table-search-1" type="checkbox"
                                                class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 dark:focus:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
                                            <label for="checkbox-table-search-1" class="sr-only">checkbox</label>
                                        </div>
                                    </td>
                                    <th scope="row"
                                        class="flex items-center px-6 py-4 text-gray-900 whitespace-nowrap dark:text-white">
                                        <img class="w-10 h-10 rounded-full" src="{{ $c->image }}" alt="Jese image">



                                        <div class="ps-3">
                                            <div class="text-base font-semibold">{{ $c->name }}</div>

                                        </div>
                                    </th>
                                    <td class="px-6 py-4">
                                        {{ $c->slug }}
                                    </td>




                                    <td class="px-6 py-4">
                                        <a href="{{ route('admin.categories.edit', ['category' => $c]) }}"
                                            class="focus:outline-none text-white bg-green-700 hover:bg-green-800 focus:ring-4 focus:ring-green-300 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 dark:bg-green-600 dark:hover:bg-green-700 dark:focus:ring-green-800">Edit</button>
                                    </td>
                                </tr>
                            @endforeach

                        </tbody>
                    </table>
                </div>

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
