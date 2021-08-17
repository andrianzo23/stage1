<?php

namespace App\Model;

use App\User;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Course extends Model
{
    use SoftDeletes;

    protected $guarded = ['id'];



    /*Check the course is published*/
    public function scopePublished($query)
    {
        return $query->where('is_published', true);
    }

    // relationBetweenCategory
    public function relationBetweenCategory()
    {
        return $this->belongsTo(Category::class, 'category_id', 'id');
    }

    // relationBetweenLanguage
    public function relationBetweenLanguage()
    {
        return $this->hasOne(Language::class, 'id', 'language');
    }

    public function relationBetweenInstructorUser()
    {

        return $this->belongsTo(User::class, 'user_id', 'id')->where('user_type', 'Instructor');
    }

    // classes
    public function classes()
    {
        return $this->hasMany(Classes::class)
            ->where('is_published', true)
            ->with('contents');
    }

    public function classesAll()
    {
        return $this->hasMany(Classes::class)
            ->with('contentsAll');
    }

    //enroll
    public function enrollClasses()
    {
        return $this->hasMany(Classes::class)
            ->where('is_published', true)
            ->with('enrollContents');
    }

    // category
    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id', 'id');
    }

    // enrollment
    public function enrollment()
    {
        return $this->belongsTo(Enrollment::class)->where('course_id', 'id');
    }


    //END
}
