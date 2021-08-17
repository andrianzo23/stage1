<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="author" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{getSystemSetting('type_name')->value}}</title>

    <!-- Favicon -->
    <!-- Favicon -->
    <link rel="icon" sizes="16x16" href="{{ filePath(getSystemSetting('favicon_icon')->value) }}">

    <!-- inject:css -->
    <link rel="stylesheet" href="{{ asset('frontend/css/bootstrap.css') }}">
    <link rel="stylesheet" href="{{ asset('frontend/css/font-awesome.css') }}">
    <link rel="stylesheet" href="{{ asset('frontend/css/line-awesome.css') }}">
    <link rel="stylesheet" href="{{ asset('frontend/css/animate.css') }}">
    <link rel="stylesheet" href="{{ asset('frontend/css/owl.carousel.css') }}">
    <link rel="stylesheet" href="{{ asset('frontend/css/owl.theme.default.css') }}">
    <link rel="stylesheet" href="{{ asset('frontend/css/bootstrap-select.css') }}">
    <link rel="stylesheet" href="{{ asset('frontend/css/magnific-popup.css') }}">
    <link rel="stylesheet" href="{{ asset('frontend/css/fancybox.css') }}">
    <link rel="stylesheet" href="{{ asset('frontend/css/tooltipster.bundle.css') }}">
    <link rel="stylesheet" href="{{ asset('frontend/css/jquery.filer.css') }}">
    <link rel="stylesheet" href="{{ asset('frontend/css/plyr.css') }}">
    <link rel="stylesheet" href="{{ asset('frontend/css/style.css') }}">
    <!-- end inject -->
</head>
<body>

<!-- start cssload-loader -->
<div class="preloader">
    <div class="loader">
        <svg class="spinner" viewBox="0 0 50 50">
            <circle class="path" cx="25" cy="25" r="20" fill="none" stroke-width="5"></circle>
        </svg>
    </div>
</div>
<!-- end cssload-loader -->

@yield('content')


<!-- start scroll top -->
<div id="scroll-top">
    <i class="fa fa-angle-up" title="@translate(Go top)"></i>
</div>
<!-- end scroll top -->

<!-- template js files -->
<script src="{{ asset('frontend/js/jquery.js')}}"></script>
<script src="{{ asset('frontend/js/popper.js')}}"></script>
<script src="{{ asset('frontend/js/bootstrap.js')}}"></script>
<script src="{{ asset('frontend/js/bootstrap-select.js')}}"></script>
<script src="{{ asset('frontend/js/owl.carousel.js')}}"></script>
<script src="{{ asset('frontend/js/magnific-popup.js')}}"></script>
<script src="{{ asset('frontend/js/isotope.js')}}"></script>
<script src="{{ asset('frontend/js/waypoint.js')}}"></script>
<script src="{{ asset('frontend/js/jquery.counterup.js')}}"></script>
<script src="{{ asset('frontend/js/fancybox.js')}}"></script>
<script src="{{ asset('frontend/js/wow.js')}}"></script>
<script src="{{ asset('frontend/js/plyr.js')}}"></script>
<script src="{{ asset('frontend/js/smooth-scrolling.js')}}"></script>
<script src="{{ asset('frontend/js/jquery.filer.js')}}"></script>
<script src="{{ asset('frontend/js/date-time-picker.js')}}"></script>
<script src="{{ asset('frontend/js/emojionearea.js')}}"></script>
<script src="{{ asset('frontend/js/copy-text-script.js')}}"></script>
<script src="{{ asset('frontend/js/tooltipster.bundle.js')}}"></script>
<script src="{{ asset('frontend/js/main.js')}}"></script>
<script src="{{ asset('js/frontend.js')}}"></script>
@include('layouts.modal')

@yield('js')

<script>
    "use strict"
    var player = new Plyr('#player');
</script>
</body>

</html>
