<div class="leftbar">
    <!-- Start Sidebar -->
    <div class="sidebar">
        <!-- Start Navigationbar -->
        <div class="navigationbar">

            <div class="vertical-menu-detail">
                <div class="logobar">
                    <a href="{{route('dashboard')}}" class="logo"><img
                            src="{{filePath(getSystemSetting('type_logo')->value)}}" class="img-fluid" alt="logo"></a>
                </div>
                <div class="tab-content" id="v-pills-tabContent">
                    <div class="tab-pane fade show active" id="v-pills-crm" role="tabpanel"
                         aria-labelledby="v-pills-crm-tab">
                        <ul class="vertical-menu">
                            <li><a href="{{route('dashboard')}}">
                                    <i class="fa fa-tachometer" aria-hidden="true"></i><span> @translate(Dashboard)</span></a>
                            </li>

                            {{-- Admin's Nav --}}
                            @if(\Illuminate\Support\Facades\Auth::user()->user_type == "Admin")
                                <li class="{{request()->is('dashboard/user*')
                                   || request()->is('dashboard/student*')
                                   || request()->is('dashboard/instructor*')
                                    ? 'active' : null}}">
                                    <a href="javaScript:void();">
                                        <i class="fa fa-users"></i>
                                        <span>@translate(User Management)</span><i
                                            class="feather icon-chevron-right"></i>
                                    </a>
                                    <ul class="vertical-submenu">
                                        <li><a href="{{route('users.index')}}"
                                               class="{{request()->is('dashboard/user*')  ?'active':null}}">@translate(Admins)</a></li>

                                        <li><a href="{{route('instructors.index')}}"
                                               class="{{request()->is('dashboard/instructor*') ?'active':null}}">@translate(Instructors)</a>
                                        </li>
                                        <li><a href="{{route('students.index')}}"
                                               class="{{request()->is('dashboard/student*')  ?'active':null}}">@translate(Students)</a>
                                        </li>

                                    </ul>
                                </li>
                            @endif


                             <li class="{{request()->is('dashboard/media/manager*')
                                    ? 'active' : null}}">
                                    <a href="javaScript:void();">
                                        <i class="fa fa-picture-o"></i>
                                        <span>@translate(Media Manager)</span><i
                                            class="feather icon-chevron-right"></i>
                                    </a>
                                    <ul class="vertical-submenu">
                                        <li>
                                            <a href="{{route('media.index')}}" 
                                                class="{{request()->is('dashboard/media/manager*') 
                                                ?'active':null}}">
                                                @translate(Add Media)
                                            </a>
                                        </li>
                                    </ul>
                                </li>

                            <li class="{{request()->is('dashboard/course*')
                                   ||request()->is('dashboard/category*')
                                   || request()->is('dashboard/category*') ? 'active' : null}}">
                                <a href="javaScript:void();">
                                    <i class="fa fa-book"></i>
                                    <span>@translate(Courses) @if(\Illuminate\Support\Facades\Auth::user()->user_type == "Admin")
                                            <sup
                                                class="badge badge-info">{{\App\Model\Course::where('is_published',false)->count() > 0 ? "@translate(Unpublished)":null}}</sup>
                                        @endif</span>

                                    <i class="feather icon-chevron-right"></i>

                                </a>
                                <ul class="vertical-submenu">
                                    @if(\Illuminate\Support\Facades\Auth::user()->user_type != "Admin")
                                        {{-- instructor's Nav --}}
                                        <li><a href="{{route('course.create')}}"
                                               class="{{request()->is('dashboard/course/create*') ?'active':null}}">@translate(Start New Course)</a></li>
                                    @else
                                        {{-- admin's Nav --}}
                                        <li><a href="{{route('categories.index')}}"
                                               class="{{request()->is('dashboard/category*') ?'active':null}}">@translate(Categories)</a>
                                        </li>
                                    @endif

                                    <li><a href="{{route('course.index')}}"
                                           class="{{request()->is('dashboard/course/index*') ?'active':null}}">@translate(All Courses) @if(\Illuminate\Support\Facades\Auth::user()->user_type == "Admin")
                                                <sup
                                                    class="badge badge-info">{{\App\Model\Course::where('is_published',false)->count() > 0 ? \App\Model\Course::where('is_published',false)->count():null}}</sup>
                                            @endif</a> </li>

                                </ul>
                            </li>



                            @if(\Illuminate\Support\Facades\Auth::user()->user_type == "Admin")
                                {{-- Package area --}}
                                <li><a href="{{route('packages.index')}}"
                                       class="{{request()->is('dashboard/package*') ?'active':null}}">
                                        <i class="fa fa-briefcase"></i> <span>@translate(Instructor Package)</span></a>
                                </li>

                                <li><a href="{{route('payments.index')}}"
                                       class="{{request()->is('dashboard/payment*') ?'active':null}}">
                                        <i class="fa fa-money"></i>
                                        <span>@translate(Instructor's Payment)
                                            @if(\App\Model\Payment::where('status','Request')->count() > 0)
                                                <sup
                                                    class="badge badge-info">{{\App\Model\Payment::where('status','Request')->count()}}
                                                </sup>

                                            @endif
                                        </span>
                                    </a>
                                </li>

                            @endif


                            @if(\Illuminate\Support\Facades\Auth::user()->user_type == "Instructor")

                                <li><a href="{{route('students.index')}}"
                                       class="{{request()->is('dashboard/students*')  || request()->is('student*')?'active':null}}">
                                        <i class="fa fa-users"></i> <span>@translate(Students)</span></a>
                                </li>
                                {{-- Message with student --}}
                                <li><a href="{{route('messages.index')}}"
                                       class="{{request()->is('dashboard/message*') ?'active':null}}">
                                        <i class="fa fa-envelope-o"></i> <span>@translate(Messages)</span>
                                    </a>
                                </li>
                                {{-- Comment in Course --}}
                                <li><a href="{{route('comments.index')}}"
                                       class="{{request()->is('dashboard/comments*') ?'active':null}}">
                                        <i class="fa fa-comments-o"></i> <span>@translate(Comments)</span>
                                    </a>
                                </li>
                                {{-- Payment request area --}}
                                <li><a href="{{route('payments.index')}}"
                                       class="{{request()->is('dashboard/payment*') ?'active':null}}">
                                        <i class="fa fa-money"></i> <span>@translate(Request Payment)</span>

                                        @if(\Illuminate\Support\Facades\Auth::user()->user_type == "Admin")
                                            <sup
                                                class="badge badge-info">{{\App\Model\Payment::where('status','Request')->count()}}</sup>
                                        @endif
                                    </a>
                                </li>

                                {{-- Instructor Earning area --}}
                                <li><a href="{{route('instructor.earning')}}"
                                       class="{{request()->is('dashboard/instructor*') ?'active':null}}">
                                        <i class="fa fa-history"></i> <span>@translate(Earning History)</span>
                                    </a>
                                </li>

                            @endif


                            {{--affiliate--}}
                            @if(affiliateStatus() && \Illuminate\Support\Facades\Auth::user()->user_type == 'Admin')
                            <li class="{{request()->is('dashboard/affiliate*') ? 'active' : null}}">
                                <a href="javaScript:void();">
                                    <i class="la la-adn"></i>
                                    <span>@translate(Affiliate Area)</span>
                                    @if(\App\Model\Affiliate::where('is_confirm',false)->where('is_cancel',false)->count() >0 || \App\Model\AffiliatePayment::where('status','Request')->count() > 0)
                                        <sup
                                            class="badge badge-info">{{(int)\App\Model\Affiliate::where('is_confirm',false)->where('is_cancel',false)->count() + (int)\App\Model\AffiliatePayment::where('status','Request')->count()}}</sup>
                                    @endif
                                </a>
                                <ul class="vertical-submenu">
                                        {{--settings --}}
                                        <li><a href="{{route('affiliate.setting.create')}}"
                                               class="{{request()->is('dashboard/affiliate/setting*') ?'active':null}}">@translate(Settings)</a></li>


                                        <li><a href="{{route('affiliate.request.list')}}"
                                               class="{{request()->is('dashboard/affiliate/index') ?'active':null}}">@translate(Requests)
                                                @if(\App\Model\Affiliate::where('is_confirm',false)->where('is_cancel',false)->count() >0)
                                                    <sup
                                                        class="badge badge-info">{{\App\Model\Affiliate::where('is_confirm',false)->where('is_cancel',false)->count()}}</sup>
                                                @endif
                                            </a>
                                        </li>


                                    <li><a href="{{route('affiliate.payment.request')}}"
                                           class="{{request()->is('dashboard/affiliate/payment*') ?'active':null}}">@translate(Payment request)
                                        @if(\App\Model\AffiliatePayment::where('status','Request')->count() > 0)
                                            <sup
                                                class="badge badge-info">{{\App\Model\AffiliatePayment::where('status','Request')->count()}}</sup>
                                        @endif
                                        </a>
                                    </li>

                                </ul>
                            </li>
                            @endif


                            @if(\Illuminate\Support\Facades\Auth::user()->user_type == "Admin")
                                {{-- Admin Earning area --}}
                                <li><a href="{{route('admin.earning.index')}}"
                                       class="{{request()->is('dashboard/admin*') ?'active':null}}">
                                        <i class="fa fa-history"></i> <span>@translate(Admin's Earning)</span>
                                    </a>
                                </li>
                            @endif

                            {{-- Support Ticket --}}
                            <li><a href="{{route('tickets.index')}}"
                                   class="{{request()->is('dashboard/ticket*') ?'active':null}}">
                                    <i class="fa fa-envelope-open-o"></i> <span>@translate(Support Ticket)</span>
                                </a>
                            </li>


                                {{-- Settings Area --}}
                                <li class="{{request()->is('dashboard/smtp*')
                                   || request()->is('dashboard/language*')
                                   || request()->is('dashboard/slider*')
                                   || request()->is('dashboard/site*')
                                   || request()->is('dashboard/pages*')
                                   || request()->is('dashboard/app*')
                                   || request()->is('dashboard/themes*')
                                   || request()->is('dashboard/currencies*') ? 'active' : null}}">
                                    <a href="javaScript:void();">
                                        <i class="fa fa-gear"></i>
                                        <span>@translate(Settings)</span><i class="feather icon-chevron-right"></i>
                                    </a>
                                    <ul class="vertical-submenu">
                                        @if(\Illuminate\Support\Facades\Auth::user()->user_type == "Admin")
                                        <li><a href="{{route('app.setting')}}"
                                               class="{{request()->is('dashboard/app*') ?'active':null}}">@translate(Payment Settings)</a></li>
                                        <li><a href="{{route('currencies.index')}}"
                                               class="{{request()->is('dashboard/currency*') ?'active':null}}">@translate(Currency Settings)</a>
                                        </li>
                                        <li><a href="{{route('language.index')}}"
                                               class="{{request()->is('dashboard/language*') ?'active':null}}">@translate(Language Settings)</a></li>
                                        <li><a href="{{route('smtp.create')}}"
                                               class="{{request()->is('dashboard/smtp*') ?'active':null}}">@translate(SMTP Settings)</a></li>

                                        <li><a href="{{route('sliders.index')}}"
                                               class="{{request()->is('dashboard/slider*') ?'active':null}}">@translate(Slider Settings)</a></li>

                                        <li><a href="{{route('pages.index')}}"
                                               class="{{request()->is('dashboard/pages*') ?'active':null}}">@translate(Pages)</a></li>


                                        <li><a href="{{route('site.setting')}}"
                                               class="{{request()->is('dashboard/site*') ?'active':null}}">@translate(Organization Settings)</a></li>


                                        @else
                                            {{-- Instructor Earning area --}}
                                            <li><a href="{{route('account.create')}}"
                                                   class="{{request()->is('dashboard/account*') ?'active':null}}">@translate(Payment Account Setup)
                                                </a>
                                            </li>
                                        @endif
                                    </ul>
                                </li>

                                @if(env('ADDONS_MANAGER') == "YES")
                                    @if(Auth::user()->user_type === "Admin")
                                {{-- Addons manager --}}
                                    <li><a href="{{route('addons.manager.index')}}"
                                        class="{{request()->is('dashboard/addon*') ?'active':null}}">
                                            <i class="fa fa-puzzle-piece"></i> <span>@translate(Addon Manager)</span>
                                        </a>
                                    </li>
                                    @endif
                                @endif

                        </ul>
                    </div>

                </div>

            </div>
        </div>
        <!-- End Navigation bar -->
    </div>
    <!-- End Sidebar -->
</div>
