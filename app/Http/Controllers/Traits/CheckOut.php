<?php

namespace App\Http\Controllers\Traits;

use App\Http\Resources\CartResource;
use App\Model\AdminEarning;
use App\Model\Affiliate;
use App\Model\AffiliateHistory;
use App\Model\Cart;
use App\Model\Course;
use App\Model\CoursePurchaseHistory;
use App\Model\Demo;
use App\Model\Enrollment;
use App\Model\Instructor;
use App\Model\InstructorEarning;
use App\Model\Package;
use App\Model\Wishlist;
use App\Notifications\AffiliateCommission;
use App\Notifications\EnrolmentCourse;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Session;

trait CheckOut
{
    /*all enrollCourses*/

    use NotifyUser;

    public function enrollCourses()
    {
        if (Auth::user()->user_type != "Student") {
            \auth()->logout();
            return response('Your credentials does not match.', 403);
        }

        $enrollCollection = collect();
        $enrolls = Enrollment::where('user_id', Auth::id())->get();
        foreach ($enrolls as $item) {
            $demo = new Demo();
            $demo->course_id = $item->course_id;
            $demo->id = $item->id;
            $demo->link = route('lesson_details', Course::find($item->course_id)->slug);
            $demo->message = translate('Go to Lesson');
            $enrollCollection->push($demo);
        }
        return response(['data' => $enrollCollection], 200);
    }

    /*all wishlist*/
    public function wishList()
    {
        if (Auth::user()->user_type != "Student") {
            \auth()->logout();
            return response('Your credentials does not match.', 403);
        }
        $items = Wishlist::with('course')->where('user_id', Auth::id())->get();

        //there are create wish  list
        $wishList = collect();
        foreach ($items as $item) {
            $carts = new Demo();
            $carts->id = $item->id;
            $carts->course_id = $item->course->id;
            $carts->title = Str::limit($item->course->title, 30);
            if ($item->course->is_free == true) {
                $carts->price = formatPrice(0);
            } else {
                if ($item->course->is_discount == true) {
                    $carts->price = formatPrice($item->course->discount_price);
                } else {
                    $carts->price = formatPrice($item->course->price == null ? 0 : $item->course->price);
                }
            }
            $carts->image = filePath($item->course->image);
            $carts->link = route('course.single', $item->course->slug);
            $wishList->push($carts);
        }
        $link = route('my.courses');
        $message = translate('Add to Cart');
        return response(['data' => $wishList, 'link' => $link, 'message' => $message], 200);
    }

    /*add to wishlist*/
    public function addToWishlist(Request $request)
    {
        $wishlist = Wishlist::where('user_id', Auth::id())->where('course_id', $request->cart)->first();
        if ($wishlist != null) {
            /*remove wishlist*/
            $wishlist->delete();
            $delete = $request->cart;
        } else {
            $wishlist = new Wishlist();
            $wishlist->user_id = Auth::id();
            $wishlist->course_id = $request->cart;
            $wishlist->save();
            $delete = null;
        }
        /*remove from cart*/
        $cart = Cart::where('user_id', $wishlist->user_id)->where('course_id', $wishlist->course_id)->first();
        if ($cart != null) {
            $cart->delete();
        }
        return response(['id_is' => $delete], 200);
    }

    /*all cart list*/
    public function cartList()
    {
        if (Auth::user()->user_type != "Student") {
            \auth()->logout();
            return response('Your credentials does not match.', 403);
        }

        //there are create cart  list
        $cartList = collect();
        $items = Cart::with('course')->where('user_id', Auth::id())->get();
        foreach ($items as $cart) {
            $carts = new Demo();
            $carts->id = $cart->id;
            $carts->course_id = $cart->course->id;
            $carts->title = Str::limit($cart->course->title, 30);
            if ($cart->course->is_free == true) {
                $carts->price = formatPrice(0);
            } else {
                if ($cart->course->is_discount == true) {
                    $carts->price = formatPrice($cart->course->discount_price);
                } else {
                    $carts->price = formatPrice($cart->course->price == null ? 0 : $cart->course->price);
                }

            }
            $carts->image = filePath($cart->course->image);
            $carts->link = route('course.single', $cart->course->slug);
            $cartList->push($carts);
        }
        $message = @translate('Go to Checkout');
        $link = route('shopping.cart');

        return response(['data' => $cartList, 'message' => $message, 'link' => $link], 200);
    }

    /*cart the course*/
    public function addToCart(Request $request)
    {
        if (Auth::user()->user_type != "Student") {
            \auth()->logout();
            return response('Your credentials does not match.', 403);
        }
        //get course details
        $course = Course::where('id', $request->cart)->first();

        /*check this have in cart*/
        $p = Cart::where('user_id', Auth::id())->where('course_id', $course->id)->first();

        if ($p != null) {
            /*nothing is save*/
        } else {
            //add to cart
            $cart = new Cart();
            $cart->user_id = \Illuminate\Support\Facades\Auth::id();
            $cart->course_id = $course->id;
            if ($course->is_free == true) {
                $cart->course_price = 0;
            } else {
                if ($course->is_discount == true) {
                    $cart->course_price = $course->discount_price;
                } else {
                    $cart->course_price = $course->price == null ? 0 : $course->price;
                }

            }
            $cart->save();
        }
        /*remove from wishlist*/
        $wishlist = Wishlist::where('user_id', Auth::id())->where('course_id', $course->id)->first();
        if ($wishlist != null) {
            $wishlist->delete();
        }
        return $cart;
    }

    /*add to cart remove*/
    public function removeCart($id)
    {
        $carts = Cart::where('user_id', Auth::id())->where('id', $id)->delete();
        return back();
    }

    /*Shopping car View page*/
    public function shoppingCart()
    {
        /*all cart product save in cart table*/
        $carts = Cart::with('course')->where('user_id', \Illuminate\Support\Facades\Auth::id())->get();
        if ($carts->count() > 0) {
            return view('frontend.cart.index', compact('carts'));
        }
        return redirect()->route('my.courses');
    }


    /*remove from wishlist*/
    public function removeWishlist($id)
    {
        Wishlist::destroy($id);
        return response('', 200);
    }

    /*checkout this is common feature*/
    public function checkout(Request $request)
    {
        $amount = 0;
        /*check this have session data, if not user logout*/
        $value = $request->session()->get('payment');
        if ($value != null) {

            /*get data from cart and delete from cart Add in,
                   Enrollment and save purchase history*/
            $carts = Cart::where('user_id', \Illuminate\Support\Facades\Auth::id())->get();
            if ($carts->count() > 0) {
                foreach ($carts as $cart) {

                    /*if this course in wishlist delete it*/
                    Wishlist::where('user_id', Auth::id())->where('course_id', $cart->course_id)->delete();

                    //todo::there are calculate the Instructor balance Calculate the admin or Instructor commission
                    $course = Course::findOrFail($cart->course_id); //get course
                    $instructor = Instructor::where('user_id', $course->user_id)->first(); //get instructor
                    $package = Package::findOrFail($instructor->package_id);//get instructor package commission
                    $admin_get = 0;
                    $instructor_get = 0;
                    if ($cart->course_price != 0 && $cart->course_price != null) {
                        $admin_get = ($cart->course_price * $package->commission) / 100; //$admin commission
                        $instructor_get = ($cart->course_price - $admin_get); //instructor amount
                        /*todo::refer calculate*/
                        $amount += ($cart->course_price * commission()) / 100; //
                    }


                    //admin earning
                    //Todo::Admin Earning calculation
                    $admin = new AdminEarning();
                    $admin->amount = $admin_get;
                    $admin->purposes = "Commission from enrolment";
                    $admin->save();

                    //save in enrolments table
                    $enrollment = new Enrollment();
                    $enrollment->user_id = $cart->user_id; //this is student id
                    $enrollment->course_id = $cart->course_id;
                    $enrollment->save();

                    // student get notification
                    $details = [
                        'body' => translate('You enrolled new course  ' . $course->title),
                    ];
                    $this->userNotify($enrollment->user_id, $details);

                    // instructor get notification
                    $details = [
                        'body' => translate($course->title . ' this course enrolled by ' . Auth::user()->name),
                    ];
                    $this->userNotify($course->user_id, $details);

                    //todo::Instructor Earning history
                    //instructor Earning
                    $instructorEarning = new InstructorEarning();
                    $instructorEarning->enrollment_id = $enrollment->id;
                    $instructorEarning->package_id = $package->id;
                    $instructorEarning->user_id = $instructor->user_id; //instructor user_id
                    $instructorEarning->course_price = $cart->course_price == null ? 0 : $cart->course_price;
                    $instructorEarning->will_get = $instructor_get;
                    $instructorEarning->save();

                    //todo::update the instructor balance
                    $instructor->balance += $instructor_get;
                    $instructor->save();

                    //save in purchase history
                    $history = new CoursePurchaseHistory();
                    $history->enrollment_id = $enrollment->id;
                    $history->amount = $cart->course_price == null ? 0 : $cart->course_price;
                    $history->payment_method = $request->session()->get('payment'); //todo::must be change here
                    $history->save();


                    //todo::mail Admin, Instructor, Student
                    try {
                        //teacher
                        $user = User::find($instructorEarning->user_id);
                        $user->notify(new EnrolmentCourse());
                        //student
                        $user = User::find($enrollment->user_id);
                        $user->notify(new EnrolmentCourse());

                    } catch (\Exception $exception) {
                    }

                    //delete from cart
                   $cart->delete();


                }
                /*todo::affiliate commission calculate*/
                $req = $request->cookie('ref');
                if ($req != null && affiliateStatus()) {
                    $affiliate = Affiliate::where('refer_id', $req)->first();
                    $affiliate->balance += $amount;
                    $affiliate->save();

                    /*save affiliate history*/
                    $history = new AffiliateHistory();
                    $history->affiliate_id = $affiliate->id;
                    $history->user_id = \Illuminate\Support\Facades\Auth::id();
                    $history->refer_id = $req;
                    $history->amount = $amount;
                    $history->save();

                    /*send affiliate commission*/
                    try {
                        $user = User::where('id', $affiliate->user_id)->first();
                        $user->notify(new AffiliateCommission());
                    }catch (\Exception $exception){}
                }
            } else {
                /*empty the session*/
                $request->session()->forget('payment');
                return redirect()->to('/');
            }

            /*empty the session*/
            $request->session()->forget('payment');
        } else {
            \auth()->logout();
        }
        Session::flash('message', translate('Congratulations, Your enrollment is done successfully.'));
        return redirect()->route('my.courses');
    }


// END
}
