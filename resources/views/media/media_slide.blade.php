
        {{-- HEADER --}}

        <div class="card shadow-sm mb-3 bg-white rounded">
                    <div class="card-header">Media Library</div>
                </div>
          

        

        {{-- ALl MEDIA --}}
        <div class="card mb-3">

            <!-- masonary -->
                <div class="container-fluid mt-3 mb-3">
                    <div class="row media_row">
                        @forelse ($medias as $media)
                            
                            <div class="col-md-3 col-sm-6 col-xl-3 mb-3 myTable">

                          
                                
                                <a href="javascript:void()" onclick="getImage(this)" data-image="{{ $media->image }}" class="media_select shadow-sm rounded">
                                    <div class="card m-2">
                                         @if ($media->alt == 'image')
                                        <img class="card-img" src="{{ filePath($media->image) }}" alt="{{ $media->alt }}">
                                        @endif
                                        @if ($media->alt == 'pdf')
                                        <img class="card-img w-50 m-auto" src="{{ filePath('pdf.png') }}" alt="{{ $media->alt }}">
                                        @endif
                                        @if ($media->alt == 'zip')
                                        <img class="card-img rounded w-50 m-auto" src="{{ filePath('zip.png') }}" alt="{{ $media->alt }}">
                                        @endif
                                        @if($media->alt == 'video')
                                            <video controls crossorigin playsinline id="player" class="w-100" src="{{ filePath($media->image)  }}"></video>
                                        @endif
                                        <span class="text-center text-dark">{{ $media->title }}</span>
                                    </div>
                                </a>

                                

                            </div>
                            
                        @empty

                            <div class="col-12 text-center">
                                <img src="{{ filePath('media-not-found.jpg') }}" class="img-fluid w-100" alt="#media not found">
                            </div>
                            
                        @endforelse
                    </div>
                </div>
            <!-- masonary:END -->
        </div>
        {{-- ALl MEDIA::END --}}