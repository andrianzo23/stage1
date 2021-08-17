<?php


namespace App\Http\Controllers\Traits;


use App\Mail\VerifyMail;
use App\Model\AdminEarning;
use App\Model\Instructor;
use App\Model\Package;
use App\Model\PackagePurchaseHistory;
use App\Model\VerifyUser;
use App\Model\Course;
use App\Notifications\InstructorRegister;
use App\Notifications\VerifyNotifications;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;


trait InstructorTraits
{

    // Instructor details
    public function instructorDetails($slug)
    {
        $user = User::where('slug', $slug)->where('user_type', 'Instructor')->first();

        if ($user == null) {
            Session::flash('message', translate('404 Not Found'));
            return back();
        }
        $courses = Course::Published()->where('user_id', $user->id)->paginate(9);
        $instructor = Instructor::where('user_id', $user->id)->first();
        return view('frontend.instructor.index', compact('instructor', 'courses'));
    }

    /*register view*/
    public function registerView()
    {
        $packages = Package::where('is_published', true)->get();
        return view('frontend.instructor.register', compact('packages'));
    }

    /*register create*/
    public function registerCreate(Request $request)
    {

        $request->validate([
            'package_id' => 'required',
            'name' => 'required',
            'email' => ['required', 'unique:users'],
            'password' => ['required', 'min:8'],
            'confirm_password' => 'required|required_with:password|same:password',
        ], [
            'package_id.required' => translate('Please select a package'),
            'name.required' => translate('Name is required'),
            'email.required' => translate('Email is required'),
            'email.unique' => translate('Email is already exist.'),
            'password.required' => translate('Password is required'),
            'password.min' => translate('Password must be minimum 8 characters'),
            'confirm_password.required' => translate('Please confirm your password'),
            'confirm_password.same' => translate('Password did not match'),
        ]);
        /*get package value*/
        $package = Package::where('id', $request->package_id)->firstOrFail();
        //create user for login

        $slug_name = Str::slug($request->name);
        /*check the sulg */
        $users = User::where('slug', $slug_name)->get();
        if ($users->count() > 0) {
            $slug_name = $slug_name.($users->count() + 1);
        }
        $user = new User();
        $user->slug = $slug_name;
        $user->name = $request->name;
        $user->email = $request->email;
        $user->password = Hash::make($request->password);
        $user->user_type = 'Instructor';
        $user->save();

        //save data in instructor
        $instructor = new Instructor();
        $instructor->name = $request->name;
        $instructor->email = $request->email;
        $instructor->package_id = $request->package_id;
        $instructor->user_id = $user->id;
        $instructor->save();

        /*get package payment*/
        if ($package->price > 0) {

            return redirect()->route('instructor.payment', $user->slug);
        } else {
            /**/

            //add purchase history
            $purchase = new PackagePurchaseHistory();
            $purchase->amount = $package->price;
            $purchase->payment_method = $request->payment_method;
            $purchase->package_id = $request->package_id;
            $purchase->user_id = $user->id;
            $purchase->save();


            //todo::admin Earning calculation
            $admin = new AdminEarning();
            $admin->amount = $package->price;
            $admin->purposes = "Sale Package";
            $admin->save();

            try {

                $user->notify(new InstructorRegister());

                VerifyUser::create([
                    'user_id' => $user->id,
                    'token' => sha1(time())
                ]);
                //send verify mail
                $user->notify(new VerifyNotifications($user));
            } catch (\Exception $exception) {

            }
        }

        Session::flash('message', translate("Registration done successfully. Please verify your email before login."));
        return redirect()->route('login');
    }

    /*payment screen view*/
    public function insPayment($slug)
    {
        $userI = User::where('slug', $slug)->where('user_type', 'Instructor')->first();
        if ($userI == null) {
            Session::flash('message', translate('You are wrong user'));
            return back();
        }
        $user = Instructor::with('relationBetweenPackage')->where('user_id', $userI->id)->first();

        //check package payment history
        $history = PackagePurchaseHistory::where('user_id', $user->id)->where('package_id', $user->package_id)->first();
        if ($history != null) {
            return redirect()->route('login');
        } else {
            return view('frontend.instructor.payment', compact('user'));
        }
    }

}
