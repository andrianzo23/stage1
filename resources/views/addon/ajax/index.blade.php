<div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card m-2">
                    <div class="card-header">
                       
                            <span class="h1 card-title">@translate(Addons Manager)</span>

                            <a class="btn btn-primary ml-3" href="{{ route("addons.manager.installui") }}" title="@translate(Install new addon)">
                                <i class="fa fa-plus-circle"></i> @translate(Install Addon)
                            </a>

                    </div>

                    <div class="card-header">
                       
                        @if (env('ADDONS_MANAGER') == 'YES')
                            <h4><strong>@translate(Installed Addon)(s) ( {{ App\Addon::Active()->count() }} )</strong></h4>
                        @else
                            <h4><strong>@translate(Installed Addon)(s) ( 0 )</strong></h4>
                        @endif

                    </div>

                    
                    <div class="card-body t-div">
                         <div class="row mt-5">
                                @forelse ($addons as $addon)
                                    <div class="col-4">
                                        <div class="news">
                                            <figure class="article">
                                                <a href="javscript:void()" onclick="forModal('{{ route('addon.preview', $addon->name) }}', '{{ strtoupper($addon->name) }}')">
                                                    <img src="{{ filePath($addon->image) }}" class="w-100 img-fluid rounded" alt="#{{ $addon->name }}" >
                                                </a>
                                            </figure>
                                                <a href="{{ route('addon.status', $addon->name) }}" class="btn btn-{{ $addon->activated == 0 ? 'success' : 'danger' }} w-100">{{ $addon->activated == 0 ? 'Activate' : 'Deactivate' }}</a>
                                        </div>
                                    </div>
                                    @empty
                                    <div class="col-12">
                                            <img src="{{ filePath('no-addon-found.jpg') }}" class="w-100" alt="#No Addons Found">
                                    </div>
                                @endforelse
                        </div>
                    </div>



                     {{-- Installed Addon::END --}}
                    <hr>
                    {{-- Available Addon --}}

                    <div class="card-header">
                       
                            <h4><strong>@translate(Available Addon)(s) ( <span id="addon_count"></span> )</strong></h4>

                        <input type="hidden" id="sk_loading" value="{{ filePath('sk-loading.gif') }}">

                        <div id="no-addons" class="text-center"></div>
                        <div id="no-addons-found" class="text-center d-none">
                            <img src="{{ filePath('no-addon-found.jpg') }}" class="w-100" alt="#No Addons Found">
                        </div>
                        
                        <div class="d-flex mt-5" id="available_addons"></div>

                    
                    {{-- Available Addon::END --}}


                </div>
            </div>
        </div>
    </div>

    <script>

$(document).ready(function(){

    var username = 'softtech-it';
    var site = 'codecanyon';
    var code = '0eZScyN9HOoPHzKSJMtWI8U1d7VwkApX';
    var sk_loading = $('#sk_loading').val(); 

    $('#no-addons').html('<img src="'+ sk_loading +'" class="w-75 mt-5" alt="#Loading">');

    $.ajax({
        type: "GET",
        headers: {
            "Authorization": "Bearer " + code
        },
        url:'https://api.envato.com/v1/market/new-files-from-user:'+ username +','+ site +'.json',

        success: function( response) {
            var data = response['new-files-from-user'];
            
            var addons_count = 0;


            $('#no-addons').addClass('d-none');
            $('#no-addons-found').addClass('d-none');

            var addons = '';
        
            data.forEach(element => {

                if (element.tags.match('courselms add-on')) {

                 addons += '<div class="col-4">' +
                                    '<div class="news">'+
                                        '<figure class="article">'+
                                            '<img src='+ element.live_preview_url +' class="w-100 rounded" alt="#'+ element.item +'">'+
                                    ' </figure>'+
                                        '<a href='+ element.url +' class="btn btn-primary w-100" "target=_blank">Buy Now</a>'+
                                    '</div>'+
                            '</div>'

                    addons_count += 1;
                }
            });
            
            if (addons_count > 0) {
                var addons_count = $('#addon_count').html(addons_count);
            } else {
                var addons_count = $('#addon_count').html(0);
                $('#no-addons-found').removeClass('d-none');
            }

            $('#available_addons').html(addons); 
        }
    });
});

</script>