@extends('frontend.app')
@section('content')

    <!-- Start Containerbar -->
    <section class="login-area section--padding">
        <div class="container">
            <!-- Start row -->
            <div class="row">
                <!-- Start col -->
                <div class="col-lg-6 offset-3">
                    <!-- Start Auth Box -->
                    <div class="auth-box-right">
                        <div class="card-box-shared">
                            <div class="card-box-shared-title text-center">@translate(Reset Password)</div>

                            <div class="card-box-shared-body contact-form-action">
                                <form method="POST" action="{{ route('password.update') }}">
                                    @csrf

                                    <input type="hidden" name="token" value="{{ $token }}">

                                    <div class="form-group">
                                        <label for="email" class="col-form-label text-md-right">@translate(E-Mail
                                            Address)</label>

                                        <div class="">
                                            <input id="email" type="email"
                                                   class="form-control @error('email') is-invalid @enderror"
                                                   name="email" value="{{ $email ?? old('email') }}" required
                                                   autocomplete="email" autofocus>

                                            @error('email')
                                            <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="form-group ">
                                        <label for="password" class="col-form-label text-md-right">@translate(Password)</label>

                                        <div class="">
                                            <input id="password" type="password"
                                                   class="form-control @error('password') is-invalid @enderror"
                                                   name="password" required autocomplete="new-password">

                                            @error('password')
                                            <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="password-confirm" class="col-form-label text-md-right">@translate(Confirm
                                            Password)</label>

                                        <div class="">
                                            <input id="password-confirm" type="password" class="form-control"
                                                   name="password_confirmation" required
                                                   autocomplete="new-password">
                                        </div>
                                    </div>

                                    <div class="form-group mb-0">
                                        <div class="">
                                            <button type="submit" class="btn btn-success">
                                                @translate(Reset Password)
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
            <!-- End Auth Box -->
        </div>

        <!-- End col -->
    </section>

@endsection
