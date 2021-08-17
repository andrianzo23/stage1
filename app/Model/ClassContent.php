<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\DB;

class ClassContent extends Model
{
    //
    use SoftDeletes;



   public function relationBetweenClass()
    {
      return $this->belongsTo(Classes::class,'class_id','id');
    }

}
