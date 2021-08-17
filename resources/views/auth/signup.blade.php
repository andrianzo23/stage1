@extends('frontend.appAuth')
@section('content')
    <!-- ================================
         START SIGN UP AREA
  ================================= -->
    <section class="sign-up section--padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-7 mx-auto">
                    <div class="card-box-shared">
                        <div class="card-box-shared-title text-center">
                            <h3 class="widget-title font-size-35">@translate(Create an Account and) <br>
                                @translate(Start Learning)!</h3>
                        </div>
                        <div class="card-box-shared-body">
                            <div class="contact-form-action">
                                <form method="post" action="{{ route('student.create') }}">
                                    @csrf
                                    <div class="row">
                                        @if(env('GOOGLE_APP_ID') != "")
                                            <div class="col-lg-4 offset-md-4 column-td-half">
                                                <div class="form-group">
                                                    <a class="theme-btn w-100 text-center"
                                                       href="{{ url('/auth/redirect/google') }}">
                                                        <i class="fa fa-google mr-2"></i>@translate(Google)
                                                    </a>
                                                </div>
                                            </div><!-- end col-lg-4 -->
                                            <div class="col-lg-12">
                                                <div class="account-assist mt-3 margin-bottom-35px text-center">
                                                    <p class="account__desc">@translate(or)</p>
                                                </div>
                                            </div><!-- end col-md-12 -->
                                        @endif
                                        <div class="col-lg-12 ">
                                            <div class="input-box">
                                                <label class="label-text">@translate(Full Name)<span
                                                        class="primary-color-2 ml-1">*</span></label>
                                                <div class="form-group">
                                                    <input class="form-control @error('name') is-invalid @enderror"
                                                           type="text" name="name" placeholder="@translate(Full name)"
                                                           required value="{{ old('name') }}">
                                                    <span class="la la-user input-icon"></span>

                                                    @error('name')
                                                    <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                  </span>
                                                    @enderror

                                                </div>
                                            </div>
                                        </div><!-- end col-md-12 -->

                                        <div class="col-lg-12">
                                            <div class="input-box">
                                                <label class="label-text">@translate(Email Address)<span
                                                        class="primary-color-2 ml-1">*</span></label>
                                                <div class="form-group">
                                                    <input class="form-control @error('email') is-invalid @enderror"
                                                           type="email" name="email"
                                                           placeholder="@translate(Email address)" required
                                                           value="{{ old('email') }}">
                                                    <span class="la la-envelope input-icon"></span>

                                                    @error('email')
                                                    <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                  </span>
                                                    @enderror

                                                </div>
                                            </div>
                                        </div><!-- end col-md-12 -->
                                        <div class="col-lg-12">
                                            <div class="input-box">
                                                <label class="label-text">@translate(Password)<span
                                                        class="primary-color-2 ml-1">*</span></label>
                                                <div class="form-group">
                                                    <input class="form-control @error('password') is-invalid @enderror"
                                                           type="password" name="password"
                                                           placeholder="@translate(Password)" required>
                                                    <span class="la la-lock input-icon"></span>

                                                    @error('password')
                                                    <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                  </span>
                                                    @enderror

                                                </div>
                                            </div>
                                        </div><!-- end col-md-12 -->

                                        <div class="col-lg-12">
                                            <div class="input-box">
                                                <label class="label-text">@translate(Confirm Password)<span
                                                        class="primary-color-2 ml-1">*</span></label>
                                                <div class="form-group">
                                                    <input class="form-control @error('confirmed') is-invalid @enderror"
                                                           type="password" name="confirmed"
                                                           placeholder="@translate(Confirm password)" required>
                                                    <span class="la la-lock input-icon"></span>

                                                    @error('confirmed')
                                                    <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                  </span>
                                                    @enderror

                                                </div>
                                            </div>
                                        </div><!-- end col-md-12 -->
                                        
                                        <!-- captcha's div -->
                                        <div class="form-group row">
                                            <label for="captcha" class="col-md-4 col-form-label text-md-right">Captcha</label>
                                                <div class="col-md-6">
                                                     <span class="captcha-image">{!! Captcha::img() !!}</span> &nbsp;&nbsp;
                                                   <button type="button" id="idCaptcha" class="btn btn-success refresh-button">refresh</button>

                                                        <input id="captcha" type="text" class="form-control @error('captcha') is-invalid @enderror" name="captcha" required>
                                                    @error('captcha')
                                                    <span class="invalid-feedback" role="alert">
                                                        <strong>{{ $message }}</strong>
                                                    </span>
                                                    @enderror
                                                </div>
                                        </div>
                                        
                                        <div class="col-lg-12 ">
                                            <div class="btn-box">
                                                <button class="theme-btn" type="submit">@translate(Register account)
                                                </button>
                                            </div>
                                        </div><!-- end col-md-12 -->
                                        <div class="col-lg-12">
                                            <p class="mt-4">@translate(Already have an account)? <a
                                                    href="{{ route('login') }}" class="primary-color-2">@translate(Log
                                                    in)</a></p>
                                        </div><!-- end col-md-12 -->
                                    </div><!-- end row -->
                                </form>
                            </div><!-- end contact-form -->
                        </div>
                    </div>
                </div><!-- end col-md-7 -->
            </div><!-- end row -->
        </div><!-- end container -->
    </section><!-- end sign-up -->
    <!-- ================================
           START SIGN UP AREA
    ================================= -->


@endsection
