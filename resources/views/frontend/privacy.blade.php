<x-frontend.app-layout :canonicalUrl="url('https://lablum.com/our-privacy-policies')">
    @if($term)
        <!-- Term content -->
        <div class="container" style="margin-top: 30px;padding:40px;border-radius:40px;border: 6px double #cb55a2;">
            <div class="row">
                <div class="col-lg-12">
                    {!! $term->terms !!}
                </div>
            </div>
         
           
        </div>
    @else
        <!-- If term is not available -->
        <p>No term available</p>
    @endif
</x-frontend.app-layout>