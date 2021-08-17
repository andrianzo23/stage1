<?php


namespace App\Http\Controllers\Traits;

use Illuminate\Http\Request;
use App\NotificationUser;


trait NotifyUser
{

  // User get notification
  function userNotify($user_id,$details)
  {
    $notify = new NotificationUser;
    $notify->user_id = $user_id;
    $notify->data = $details;
    $notify->save();
  }

}
