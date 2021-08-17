<?php

namespace App\Http\Controllers\Course;

use App\Http\Controllers\Controller;
use App\Model\ClassContent;
use App\Model\Classes;
use App\Model\Course;
use App\Model\Enrollment;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use App\NotificationUser;
use App\Http\Controllers\Traits\NotifyUser;

class ContentController extends Controller
{

  use NotifyUser;

    public function __construct()
    {
        $this->middleware('auth');
    }

    /*content create*/
    public function create($id)
    {
        /*Check the id is valid*/
        Course::findOrFail($id);
        $classes = Classes::where('course_id', $id)->get();
        return view('course.contents.create', compact('classes'));
    }

    //this function is store the content
    public function store(Request $request)
    {


        /*
        |--------------------------------------------------------------------------
        | Validation
        |--------------------------------------------------------------------------
        */

        $request->validate([
            'title' => 'required',
            'content_type' => 'required',
        ],
            [
                'title.required' => translate('Title is required'),
                'content_type.required' => translate('Content type is required'),
            ]);

        /*
        |--------------------------------------------------------------------------
        | storing value
        |--------------------------------------------------------------------------
        */

        $content = new ClassContent();
        $content->title = $request->title;
        $content->content_type = $request->content_type;
        $content->provider = $request->provider;

        if ($request->hasFile('video_url')) {
            $content->video_url = fileUpload($request->video_url, 'class_contents_files');
        }else{
            $content->video_url = $request->video_url ?? $request->video_raw_url;
            
        }

        $content->description = $request->description;
        $content->is_preview =  false;
        $content->class_id = $request->class_id;
        if ($request->hasFile('file')) {
            $content->file = fileUpload($request->file, 'class_contents');
        }


        if ($request->hasFile('source_code')) {
            $content->source_code = fileUpload($request->source_code, 'class_source_codes');
        }else{
            $content->source_code = $request->source_code_url;
        }



        $content->duration = $request->duration;
        /*save priority*/
        $contentSort = ClassContent::where('class_id',$request->class_id)->count();
        $content->priority = $contentSort+1;
        $content->save();
        
        $details = [
            'body' => translate($content->title . ' new content uploaded by ' . Auth::user()->name),
        ];
        //get course id
        $class = Classes::where('id', $content->class_id)->firstOrFail();
        //get all enroll student
        $enroll = Enrollment::where('course_id', $class->course_id)->with('user')->get();



        /* sending instructor notification */
        $notify = $this->userNotify(Auth::user()->id,$details);

        notify()->success(translate('Class content saved successfully '));
        return back();

    }

    /*
    |--------------------------------------------------------------------------
    | this function is destroy or trash the content
    |--------------------------------------------------------------------------
    */

    /*Delete the content*/
    public function destroy($id)
    {

        $ClassContent = ClassContent::find($id);
        $ClassContent->delete();

        notify()->success(translate('Class content deleted successfully '));
        return back();
    }

    /*
    |--------------------------------------------------------------------------
    | this function is showing content
    |--------------------------------------------------------------------------
    */

    public function show($id)
    {
        /*Check the id is valid*/
        $each_contents = ClassContent::findOrFail($id);
        return view('course.contents.show', compact('id', 'each_contents'));
    }


    public function update(Request $request)
    {

        $i = 1;
        $s = json_encode($request->order);
        foreach (json_decode($s) as $content) {
            $c = ClassContent::findOrFail((int)$content->id);
            $c->priority = (int)$content->position;
            $c->save();
            $i++;
        }
        return response(translate('Updated successfully'), 200);
    }

    /*
    |--------------------------------------------------------------------------
    | this function that download content source code
    |--------------------------------------------------------------------------
    */


    public function code($id)
    {
        try {
            $source_code = ClassContent::findOrFail($id)->source_code;
            $path = public_path($source_code);
            return response()->download($path);
        } catch (\Throwable $th) {
            notify()->warning(translate('No Source Code Found'));
            return back();
        }
        
    }

    //published
    public function published(Request $request)
    {
        // don't use this type of variable naming, use $category instead of $cat1
        $content = ClassContent::where('id', $request->id)->first();
        if ($content->is_published == 1) {
            $content->is_published = 0;
            $content->save();
        } else {
            $content->is_published = 1;
            $content->save();
        }

        return response(['message' => translate('Class content active status is changed')], 200);
    }


    //preview
    public function preview(Request $request)
    {
        // don't use this type of variable naming, use $category instead of $cat1
        $content = ClassContent::where('id', $request->id)->first();
        if ($content->is_preview == 1) {
            $content->is_preview = 0;
            $content->save();
        } else {
            $content->is_preview = 1;
            $content->save();
        }
        return response(['message' => translate('Class content preview status is changed')], 200);
    }

    //END
}
