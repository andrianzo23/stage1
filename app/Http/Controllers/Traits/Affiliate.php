<?php


namespace App\Http\Controllers\Traits;


use App\InstructorAccount;
use App\Model\AffiliateHistory;
use App\Model\AffiliatePayment;
use App\Model\Instructor;
use App\Model\Payment;
use App\Model\Student;
use App\Model\StudentAccount;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use RealRashid\SweetAlert\Facades\Alert;

trait Affiliate
{

    /*affiliate page view*/
    public function affiliateCreate(){
        /*here show affiliate history table*/
        $history =null;
        $payment =null;
        $affiliate= \App\Model\Affiliate::where('user_id',Auth::id())->first();
        if ($affiliate){
            $history = AffiliateHistory::where('refer_id',$affiliate->refer_id)->with('user')->paginate(5);//there student id is user id
            $payment =AffiliatePayment::where('status','Confirm')->where('user_id',Auth::id())->paginate(5);
        }
        return view('frontend.homepage.affiliate.index',compact('affiliate','history','payment'));
    }

    /*affiliate request modal screen*/
    public function affiliateRequest(){
        $account = StudentAccount::where('user_id', Auth::id())->first();
        if ($account == null) {
            return view('frontend.homepage.affiliate.request', compact('account'));
        }
        return view('frontend.homepage.affiliate.request', compact('account'));
    }

    /*account save */
    public function affiliateStore(Request $request){
        if ($request->has('id')) {
            $account = StudentAccount::where('id', $request->id)->where('user_id', Auth::id())->first();
            $account->bank_name = $request->bank_name;
            $account->account_name = $request->account_name;
            $account->account_number = $request->account_number;
            $account->routing_number = $request->routing_number;
            $account->paypal_acc_name = $request->paypal_acc_name;
            $account->paypal_acc_email = $request->paypal_acc_email;
            $account->stripe_acc_name = $request->stripe_acc_name;
            $account->stripe_acc_email = $request->stripe_acc_email;
            $account->stripe_card_holder_name = $request->stripe_card_holder_name;
            $account->stripe_card_number = $request->stripe_card_number;
            $account->save();

        } else {
            $account = new StudentAccount();
            $account->bank_name = $request->bank_name;
            $account->account_name = $request->account_name;
            $account->account_number = $request->account_number;
            $account->routing_number = $request->routing_number;
            $account->paypal_acc_name = $request->paypal_acc_name;
            $account->paypal_acc_email = $request->paypal_acc_email;
            $account->stripe_acc_name = $request->stripe_acc_name;
            $account->stripe_acc_email = $request->stripe_acc_email;
            $account->stripe_card_holder_name = $request->stripe_card_holder_name;
            $account->stripe_card_number = $request->stripe_card_number;
            $account->user_id = Auth::id();
            $account->save();
            /*create affiliate details*/
            $af = new \App\Model\Affiliate();
            $af->user_id = Auth::id();
            $af->student_account_id = $account->id;
            $af->note = $request->note;
            $af->save();
        }

        alert(translate('Success'),translate('Wait for confirmation'),'success');
        return back();
    }

    /*affiliatePaymentRequest*/
    public function affiliatePaymentRequest(){

        $affiliate = \App\Model\Affiliate::where('user_id', Auth::id())->firstOrFail();
        return view('frontend.homepage.affiliate.create',compact('affiliate'));
    }

    /*affiliate payment store*/
    public function affiliatePaymentStore(Request $request){


        if (!$request->has('amount')){
            alert(translate('warning'),translate('Amount must be required'),'info');
            return back();
        }

        if ($request->amount < withdrawLimit()) {
            alert(translate('warning'),translate('You minimum Withdrawal is').withdrawLimit(),'info');
            return back();
        }

        $account = StudentAccount::where('user_id', Auth::id())->first();
        if ($account == null) {
            alert(translate('warning'),translate('Please Insert the withdrawal method '),'info');
            return back();
        }
        $ins = \App\Model\Affiliate::where('user_id', Auth::id())->first();
        if ($ins->balance < $request->amount) {
            alert(translate('warning'),translate('Please insert the valid withdrawal amount '),'info');
            return back();
        }

        /*minus from */
        $ins->balance -=(int)$request->amount;
        $ins->save();

        $payment = new AffiliatePayment();
        $payment->amount = $request->amount;
        $payment->process = $request->process;
        $payment->description = $request->description;
        $payment->status = $request->status;
        $payment->status_change_date = Carbon::now();
        $payment->user_id = Auth::id();
        $payment->affiliate_id = $ins->id;
        $payment->student_account_id = $account->id;
        $payment->saveOrFail();

        $details = [
            'body' => translate('Your payment request is successfully done.'),
        ];

        /* sending instructor notification */
        $this->userNotify(Auth::id(), $details);
        \alert(translate('success'),translate('Payment request sent successfully'),'success');
        return back();
    }

}
