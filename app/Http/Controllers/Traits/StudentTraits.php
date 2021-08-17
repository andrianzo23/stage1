<?php


namespace App\Http\Controllers\Traits;


use App\Http\Resources\CommentsResource;
use App\Http\Resources\MessageResource;
use App\Model\ClassContent;
use App\Model\Classes;
use App\Model\Course;
use App\Model\CourseComment;
use App\Model\Demo;
use App\Model\Enrollment;
use App\Model\Massage;
use App\Model\SeenContent;
use App\Model\Wishlist;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Mews\Purifier\Facades\Purifier;

trait StudentTraits
{

    public function my_courses()
    {
        //enroll courses
        $enrolls = Enrollment::with('enrollCourse')->where('user_id', Auth::id())->paginate(6);
        return view('frontend.course.my_courses', compact('enrolls'));
    }

    public function my_wishlist(){
        //wishlist courses
        $wishlists = Wishlist::with('course')->where('user_id', Auth::id())->paginate(6);
        return view('frontend.course.wishlist', compact( 'wishlists'));
    }

    /*Calculate the seen course percentage enroll course*/
    public static function seenCourse($id, $course_id)
    {
        $seen_content = SeenContent::where('user_id', Auth::id())->where('enroll_id', $id)->get()->count();
        $course = Course::where('id', $course_id)->with('classes')->first();

        $total_content = 0;
        foreach ($course->classes as $item) {
            $total_content .= $item->contents->count();
        }


        // calculate the % done this enroll course
        if ($seen_content > 0 && $total_content!= 0) {
            $percentage = ($seen_content / $total_content) * 100;
            $percentage = $percentage > 100 ? 100 : $percentage;
        } else {
            $percentage = 0;
        } 

        return number_format($percentage);
    }

    /*Course Commenting authenticated */
    public function comments(Request $request)
    {

        if ($request->comment_id != null) {
            $comment = new CourseComment();
            $comment->course_id = $request->course_id;
            $comment->user_id = Auth::id();
            $comment->comment = $request->comment;
            $comment->replay = $request->comment_id;
            $comment->save();
        } elseif ($request->comment != null) {
            $comment = new CourseComment();
            $comment->course_id = $request->course_id;
            $comment->user_id = Auth::id();
            $comment->comment = $request->comment;
            $comment->save();
        } else {
        }
        $c = CourseComment::where('course_id', $request->course_id)
            ->with('user')->get();

        $comments = collect();
        foreach ($c as $item) {
            $demo = new Demo();
            $demo->name = $item->user->name;
            $demo->image = $item->user->image != null ? filePath($item->user->image) : asset('uploads/user/user.png');
            $demo->comment = $item->comment;
            $demo->time = $item->created_at->diffForHumans();
            $comments->push($demo);
        }
        return response(['data' => $comments], 200);
    }


    /*message modal view this function need enroll id*/
    public function messageCreate($id)
    {
        $enroll = Enrollment::where('course_id', $id)->where('user_id', Auth::id())->first();
        return view('frontend.message.create', compact('enroll'));
    }

    /*Send message to instructor inbox*/
    public function sendMessage(Request $request)
    {
        $message = new Massage();
        $message->enroll_id = $request->enroll_id;
        $message->user_id = Auth::id();
        $message->content = $request->message;
        $message->save();

        return back();
    }

    /*Enroll Course ways messages List*/
    public function inboxMessage()
    {
        $enrolls = Enrollment::where('user_id', Auth::id())->with('messages')->get();
        $ids = array();
        foreach ($enrolls as $item) {
            if ($item->messages->count() > 0) {
                $ids = array_merge($ids, [$item->id]);

            }
        }
        $messages = Enrollment::whereIn('id', $ids)->with('enrollCourse')
            ->with('messages')->get();
        return view('frontend.message.index', compact('messages'));
    }


    /*single content*/
    public function singleContent($id)
    {
        $content = ClassContent::find($id);
        $demo = new Demo();
        if($content->content_type == 'Video'){
            $demo->provider = $content->provider;
            $demo->description = Purifier::clean($content->description);
            if ($content->provider == "Youtube") {
                $demo->url = Str::after($content->video_url, 'https://youtu.be/');
            } elseif ($content->provider == "Vimeo") {
                $demo->url = Str::after($content->video_url, 'https://vimeo.com/');
            } elseif ($content->provider == "File") {
                $demo->url = asset($content->video_url);
            } else{
                $demo->provider = "HTML5";
                $demo->url = $content->video_url;
            }

        }else{
            $demo->provider = $content->content_type;
            $demo->description = Purifier::clean($content->description);
            $demo->item1 = translate('Content document');
            $demo->item2 = translate('Download');
          $demo->url = filePath($content->file);
        }


        $course_id = Classes::where('id', $content->class_id)->first()->course_id;
        $enroll_id = Enrollment::where('course_id', $course_id)->where('user_id', Auth::id())->first()->id;
        $seens = SeenContent::where('class_id', $content->class_id)
            ->where('content_id', $content->id)
            ->where('course_id', $course_id)->where('enroll_id', $enroll_id)->where('user_id', Auth::id())->get();
        if ($seens->count() == 0) {
            $seen = new SeenContent();
            $seen->class_id = $content->class_id;
            $seen->content_id = $content->id;
            $seen->course_id = $course_id;
            $seen->enroll_id = $enroll_id;
            $seen->user_id = Auth::id();
            $seen->saveOrFail();
        }

        return response()->json($demo);
    }


    /*seen list*/
    public function seenList($id){
        $seen = SeenContent::where('course_id',$id)->where('user_id',Auth::id())->get();
        return response()->json($seen);
    }

    /*delete seen by content id*/
    public function seenRemove($id){
        $seen = SeenContent::where('content_id',$id)->where('user_id',Auth::id())->first();
        if ($seen){
            $seen->delete();
        }
        return response('ok done',200);
    }


}
