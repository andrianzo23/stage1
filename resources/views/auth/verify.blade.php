@extends('frontend.appAuth')
@section('content')
    <div class="vertical-layout">
    <!-- Start Containerbar -->
    <div id="containerbar" class="containerbar authenticate-bg">
        <!-- Start Container -->
        <div class="container">
            <div class="auth-box login-box">
                <!-- Start row -->
                <div class="d-flex justify-content-center no-gutters align-items-center justify-content-center">
                    <!-- Start col -->
                    <div class="col-md-8">
                        <!-- Start Auth Box -->
                        <div class="auth-box-right">

                            <div class="card-box-shared">
                                <div class="card-box-shared-title">@translate(Verify Your Email Address)</div>

                                <div class="card-box-shared-body">
                                    @if (isset($resent))
                                        <div class="alert alert-success" role="alert">
                                            {{$resent}}
                                        </div>
                                    @endif

                                    @translate(Before proceeding, please check your email for a verification link.)
                                    @translate(If you did not receive the email)
                                    <form class="d-inline" method="POST" action="{{ route('send.verify.token') }}">
                                        @csrf

                                        <input type="hidden" name="id" value="{{$id}}">

                                        <button type="submit" class="btn btn-link p-0 m-0 align-baseline">@translate(click here to request another)
                                        </button>

                                    </form>
                                </div>
                            </div>


                        </div>

                    </div>
                </div>
                <!-- End Auth Box -->
            </div>

            <!-- End col -->
        </div>
        <!-- End row -->
    </div>
    <!-- /.login-box -->
    </div>
@endsection
