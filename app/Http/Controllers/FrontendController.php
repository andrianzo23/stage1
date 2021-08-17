<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Traits\Affiliate;
use App\Http\Controllers\Traits\CheckOut;
use App\Http\Controllers\Traits\InstructorTraits;
use App\Http\Controllers\Traits\StudentTraits;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use App\Mail\VerifyMail;
use App\Model\ClassContent;
use App\Model\Enrollment;
use App\Model\Package;
use App\Model\VerifyUser;
use App\Notifications\EnrolmentCourse;
use App\Notifications\StudentRegister;
use App\Notifications\VerifyNotifications;
use App\Page;
use App\NotificationUser;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Session;
use Illuminate\Http\Request;
use App\Model\Student;
use App\Model\CourseComment;
use App\User;
use Hash;
use Carbon\Carbon;
use App\Model\Category;
use App\Model\Course;
use App\Model\Demo;
use App\Model\Language;
use App\Model\Slider;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Captcha;

class FrontendController extends Controller
{

    function __construct()
    {
        $this->middleware(['installed']);
    }

    //this traits use all add to cart , check out, ak wishlist
    use CheckOut;

    /*this all student dashboard method*/
    use StudentTraits,Affiliate;

    /*for all instructor method*/
    use InstructorTraits;


    /*Search the courses*/
    public function searchCourses(Request $request)
    {

        if ($request->key == null) {
            $courses = null;
        } else {
            $courses = Course::Published()->where('title', 'LIKE', "%{$request->key}%")->get();
        }


        $search = collect();


        if ($courses == null) {
            return response(['data' => $search], 200);
        } else {
            if ($courses->count() > 0) {
                foreach ($courses as $item) {
                    $demo = new Demo();
                    $demo->title = Str::limit($item->title, 58);
                    $demo->image = filePath($item->image);
                    $demo->link = route('course.single', $item->slug);
                    $search->push($demo);
                }

            } else {
                $demo = new Demo();
                $demo->title = translate('No Course Found');
                $demo->image = null;
                $demo->link = null;
                $search->push($demo);
            }
        }
        return response(['data' => $search], 200);

    }

    /*filer courses and show all course*/
    public function courseFilter(Request $request)
    {

        $breadcrumb = null;

        $conditions = [];
        /*single instructor*/
        if ($request->input('instructor')) {
            $conditions = array_merge($conditions, ['user_id' => $request->input('instructor')]);
        }
        /*free paid check here*/
        if ($request->input('cost')) {
            $cost = $request->cost;
            if ($cost == 'paid') {
                $conditions = array_merge($conditions, ['is_free' => false]);
            } elseif ($cost == "free") {
                $conditions = array_merge($conditions, ['is_free' => true]);
            } else {

            }

        }
        /*single language*/
        if ($request->input('language')) {
            $conditions = array_merge($conditions, ['language' => $request->input('language')]);
        }

        /*level */

        if ($request->input('level')) {
            if ($request->level == "All Levels") {
                $breadcrumb = translate('All Levels');
            } else {
                $conditions = array_merge($conditions, ['level' => $request->input('level')]);
                $breadcrumb = $request->input('level');
            }


        }
        /*categories*/
        if ($request->input('categories')) {
            $conditions = array_merge($conditions, ['category_id' => $request->input('categories')]);
            $breadcrumb = Category::where('id', $request->input('categories'))->first()->name;

        }
        $courses = Course::Published()->where($conditions)->latest()->paginate(10);
        $languages = Language::all();

        //check the category in parent for chide
        if ($request->slug == null) {
            $categories = Category::where('parent_category_id', 0)->Published()->get();
        } else {
            $cat = Category::where('slug', $request->slug)->Published()->first();

            if ($cat->parent_category_id == 0) {
                //this is parent category
                $categories = Category::where('parent_category_id', $cat->id)->Published()->get();

            } else {
                //this is child category
                $categories = Category::where('parent_category_id', $cat->parent_category_id)->Published()->get();
            }
        }


        return view('frontend.course.course_grid',
            compact('categories', 'courses', 'languages', 'breadcrumb'));

    }

    /*this is the home page*/
    public function homepage()
    {
        //js an css importation

        $js = array();
            $js[] = 'js/app.js';
            $js[] = 'frontend/js/tooltipster.bundle.js';
            $js[] = 'js/notify.js';
            $js[] = 'frontend/js/isotope.js';
            $js[] = 'frontend/js/waypoint.js';
            $js[] = 'frontend/js/jquery.counterup.js';
            $js[] = 'frontend/js/particles.js';
            $js[] = 'frontend/js/particlesRun.js';
            $js[] = 'frontend/js/fancybox.js';
            $js[] = 'frontend/js/wow.js';
            $js[] = 'frontend/js/date-time-picker.js';
            $js[] = 'frontend/js/jquery.filer.js';
            $js[] = 'frontend/js/emojionearea.js';
        $css = array();



        //check DB table for migration and Update Column
                    if (Schema::hasTable('class_contents') && Schema::hasColumn('class_contents','provider')) {
                        DB::statement("ALTER TABLE `class_contents` CHANGE provider provider ENUM('Youtube','HTML5','Vimeo','File')");
                    }


        //slider
        $sliders = Slider::where('is_published', 1)->get();

        //Popular Categories
        $popular_cat = Category::Published()->where('is_popular', 1)->get();


        //top courses it's depend op enroll courses
        $enroll_courser_count = DB::table('enrollments')->select('enrollments.course_id',
            DB::raw('count(enrollments.course_id) as total_course'))
            ->orderByDesc('total_course')
            ->groupBy('course_id')->get();

        $courses = collect();
        foreach ($enroll_courser_count as $e) {
            $co = Course::Published()->find($e->course_id);
            $courses->push($co);
        }
        $top_courses = $courses->take(6);


        //here the calculation for top category with top courses
        $course = collect();
        $cat = collect();
        $course->push($top_courses->take(6));
        $cat->push('Best Selling');

        foreach (Category::Published()->where('top', 1)->get() as $item) {
            $cat->push($item->name);
            $course->push($courses->where('category_id', $item->id)->take(6));

        }

        //trading course week
        $start = Carbon::today()->toDateTimeString();
        $end = Carbon::today()->subDays(7)->toDateTimeString();
        $trading_courses = $courses->whereBetween('created_at', [$end, $start])->skip(6)->take(12);

        //if trading_course is 0
        if ($trading_courses->count() == 0) {
            $trading_courses = $courses->shuffle()->take(12);
        }


        $packages = Package::where('is_published', true)->get();


        $latestCourses = Course::Published()->with('relationBetweenInstructorUser')->latest()->take(10)->get();


        return view('frontend.homepage.index', compact('latestCourses', 'packages', 'sliders', 'popular_cat', 'course', 'cat', 'trading_courses', 'enroll_courser_count','js','css'));
    }


    /*Show category ways course*/
    public function courseCat(Request $request)
    {
        $js = array();
            $js[] = 'js/app.js';
        $css = array();

        $breadcrumb = null;
        //check the category in parent for chide
        $cat = Category::where('slug', $request->slug)->first();
        $catId = array();
        $catId = array_merge($catId, [$cat->id]);
        if ($cat->parent_category_id == 0) {
            //this is parent category
            $categories = Category::where('parent_category_id', $cat->id)->Published()->get();
            //all child category id
            foreach ($categories as $item) {
                $catId = array_merge($catId, [$item->id]);
            }

        } else {
            //this is child category
            $categories = Category::where('parent_category_id', $cat->parent_category_id)->Published()->get();
            $catId = array_merge($catId, [$cat->id]);
        }

        //category ways course
        $courses = Course::Published()->whereIn('category_id', $catId)->latest()->paginate(10);

        $languages = Language::all();

        //rating collect
        $rating = collect();
        for ($i = 1; $i <= 5; $i++) {
            $demo = new Demo();
            $demo->index = $i;
            $demo->total_course = $courses->where('rating', $i)->count();
            $rating->push($demo);
        }

        $insId = array();
        //instructors
        foreach ($courses as $c) {
            $insId = array_merge($insId, [$c->user_id]);
        }


        return view('frontend.course.course_grid',
            compact('categories', 'courses', 'languages', 'rating', 'breadcrumb','js','css'));
    }

    /*Single course details*/
    public function singleCourse($slug)
    {
        $js = array();
        $css = array();

        $l_courses = Course::Published()->latest()->take(3)->get(); // single course details
        $sug_courses = Course::Published()->take(8)->get()->shuffle(); // suggession courses
        $s_course = Course::Published()->where('slug', $slug)->with('classes')->first(); // single course details

        return view('frontend.course.course_details', compact( 's_course',  'l_courses', 'sug_courses','js','css'));

    }

    /*Content preview*/
    public function contentPreview($id)
    {

        $js = array();
        $css = array();

        $content = ClassContent::findOrFail($id);
        return view('frontend.course.preview', compact('content','css','js'));
    }


    /*currencies change*/
    public function currenciesChange(Request $request)
    {
        session(['currency' => $request->id]);
        Artisan::call('optimize:clear');
        return back();
    }

    /*languages change*/
    public function languagesChange(Request $request)
    {

        session(['locale' => $request->code]);
        Artisan::call('optimize:clear');
        return back();
    }


    //lesson_details
    public function lesson_details($slug)
    {
        $js = array();
        $css = array();

        $s_course = Course::Published()->where('slug', $slug)->with('classes')->first(); // single course details
        /*check enroll this course*/
        $enroll = Enrollment::where('course_id', $s_course->id)->where('user_id', \Illuminate\Support\Facades\Auth::id())->get();
        if ($enroll->count() == 0) {
            return back();
        }
        $comments = CourseComment::latest()->with('user')->get();
        return view('frontend.course.lesson.lesson_details', compact('s_course', 'comments','js','css'));
    }


    //cart
    public function cart()
    {
        $js = array();
        $css = array();

        return view('frontend.cart.index', compact('js','css'));
    }

    //dashboard
    public function dashboard()
    {
        $js = array();
        $css =array();

        $notifications = NotificationUser::latest()->where('user_id', Auth::user()->id)->get();
        return view('frontend.dashboard.index', compact('notifications','js','css'));
    }

    //my_profile
    public function my_profile()
    {
        $js = array();
        $css = array();

        $student = User::where('id', Auth::user()->id)->with('student')->first();
        return view('frontend.profile.index', compact('student','js','css'));
    }

    //enrolled_course
    public function enrolled_course()
    {
        $js = array();
        $css = array();

        return view('frontend.enrolled.index', compact('js','css'));
    }


    //purchase_history
    public function purchase_history()
    {
        $js = array();
        $css = array();

        $p_histories = Enrollment::where('user_id', Auth::user()->id)->with('history')->get();
        return view('frontend.purchase_history.index', compact('p_histories','js','css'));

    }


    //login
    public function login()
    {
        $js = array();
        $css = array();

        return view('frontend.auth.login', compact('js','css'));
    }

    //register
    public function signup()
    {
        $js = array();
        $css = array();

        return view('auth.signup', compact('js','css'));
    }

    //register
    public function create(Request $request)
    {

        // registration validation
        $request->validate(
            [
                'name' => 'required',
                'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
                'password' => ['required', 'string', 'min:8'],
                'confirmed' => 'required|required_with:password|same:password',
                'captcha' => 'required|captcha',
            ],
            [
                'name.required' => translate('Name is required'),
                'email.required' => translate('Email is required'),
                'email.unique' => translate('Email is already register'),
                'password.required' => translate('Password is required'),
                'password.min' => translate('Password  must be 8 character '),
                'password.string' => translate('Password is required'),
                'confirmed.required' => translate('Please confirm your password'),
                'confirmed.same' => translate('Password did not match'),
            ]

        );

        //create user for login
        $user = new User();
        $user->name = $request->name;
        $user->slug = Str::slug($request->name);
        $user->email = $request->email;
        $user->password = Hash::make($request->password);
        $user->user_type = 'Student';
        $user->save();

        //create student
        $student = new Student;
        $student->name = $request->name;
        $student->email = $request->email;
        $student->user_id = $user->id;
        $student->save();

        /*here is the student */
        try {
            $user->notify(new StudentRegister());

            VerifyUser::create([
                'user_id' => $user->id,
                'token' => sha1(time())
            ]);
            //send verify mail
            $user->notify(new VerifyNotifications($user));

        } catch (\Exception $exception) {}

        Session::flash('message', translate("Registration done successfully. Please verify your email."));
        return redirect()->route('login');


    }
    //refresh the captcha
    public function refreshCaptcha()
    {
        return response()->json([
            'captcha' => Captcha::img()
        ]);
    }

    /*page with content*/
    public function page($slug)
    {
        $js = array();
        $css = array();

        $page = Page::with('content')->where('slug', $slug)->firstOrFail();
        return view('frontend.page.index', compact('page','js','css'));
    }

    // password reset
    public function password_reset()
    {
        $js = array();
        $css = array();

        return view('frontend.auth.email',compact('js','css'));
    }

    // student_edit
    public function student_edit()
    {
        $js = array();
        $css = array();

        $student = User::where('id', Auth::user()->id)->first();
        return view('frontend.profile.update', compact('student','js','css'));
    }

    // update
    public function update(Request $request, $std_id)
    {

        // registration validation
        $request->validate(
            [
                'name' => 'required',

            ],
            [
                'name.required' => translate('Name is required'),

            ]
        );


        //create student
        $student = Student::where('user_id', Auth::id())->firstOrFail();
        $student->name = $request->name;

        $student->phone = $request->phone;
        $student->address = $request->address;
        $student->fb = $request->fb;
        $student->tw = $request->tw;
        $student->linked = $request->linked;
        $student->about = $request->about;

        if ($request->file('image')) {
            $student->image = fileUpload($request->file('image'), 'student');
        } else {
            $student->image = $request->oldImage;
        }

        $student->save();

        //create user for login
        $user = User::where('id', Auth::id())->firstOrFail();
        $user->name = $request->name;
        $user->image = $student->image;
        $user->save();

        return back();

    }


    // mark_as_all_read
    public function mark_as_all_read()
    {

        $all_read = NotificationUser::where('user_id', Auth::user()->id)->get();

        foreach ($all_read as $read) {
            NotificationUser::where('user_id', Auth::user()->id)->update([
                'is_read' => true
            ]);
        }

        return back();
    }


    // END
}
