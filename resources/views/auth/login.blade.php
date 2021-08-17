@extends('frontend.appAuth')

@section('content')
  <!-- ================================
         START LOGIN AREA
  ================================= -->
  <section class="login-area section--padding">
      <div class="container">
          <div class="row">
              <div class="col-lg-7 mx-auto">
                  <div class="card-box-shared">
                      <div class="card-box-shared-title text-center">
                          <h3 class="widget-title font-size-35">@translate(Login to Your Account)!</h3>
                      </div>

                      {{-- Flash message after successful registration --}}
                      @if (Session::has('message'))
                         <div class="alert alert-info text-center">{{ Session::get('message') }}</div>
                      @endif



                      {{-- Login form --}}
                      <div class="card-box-shared-body">
                          <div class="contact-form-action">
                              <form method="post" action="{{ route('login') }}">
                                @csrf
                                  <div class="row">
                                      @if(env('GOOGLE_APP_ID') != "")
                                      <div class="col-12">
                                          <div class="form-group">
                                              <a class="theme-btn w-100 text-center" href="{{ url('/auth/redirect/google') }}">
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
                                      <div class="col-lg-12">
                                          <div class="input-box">
                                              <label class="label-text">@translate(Email)<span class="primary-color-2 ml-1">*</span></label>
                                              <div class="form-group">
                                                  <input class="form-control @error('email') is-invalid @enderror" type="email" name="email" placeholder="@translate(Email)" required value="{{ old('email') }}">
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
                                              <label class="label-text">@translate(Password)<span class="primary-color-2 ml-1">*</span></label>
                                              <div class="form-group">
                                                  <input class="form-control @error('password') is-invalid @enderror" type="password" name="password" placeholder="@translate(Password)" required>
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
                                          <div class="form-group">
                                              <div class="custom-checkbox d-flex justify-content-between">
                                                  <input type="checkbox" id="chb1" name="remember" {{ old('remember') ? 'checked' : '' }}>
                                                  <label for="chb1">@translate(Remember Me)</label>
                                                  <a href="{{route('student.password.reset')}}" class="primary-color-2"> @translate(Forgot my password)?</a>
                                              </div>
                                          </div>
                                      </div><!-- end col-md-12 -->
                                      <div class="col-lg-12 ">
                                          <div class="btn-box">
                                              <button class="theme-btn" type="submit">@translate(login account)</button>
                                          </div>
                                      </div><!-- end col-md-12 -->
                                      <div class="col-lg-12">
                                          <p class="mt-4">@translate(Don't have an account)? <a href="{{ route('student.register') }}" class="primary-color-2">@translate(Register)</a></p>
                                      </div><!-- end col-md-12 -->
                                  </div><!-- end row -->
                              </form>
                          </div><!-- end contact-form -->
                      </div>
                  </div>
              </div><!-- end col-lg-7 -->
          </div><!-- end row -->
      </div><!-- end container -->
  </section><!-- end login-area -->
  <!-- ================================
         START LOGIN AREA
  ================================= -->
@endsection
