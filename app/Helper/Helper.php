<?php


use App\Helper\Helper;
use App\Model\Category;


//this function for open Json file to read language json file
function openJSONFile($code)
{
    $jsonString = [];
    if (File::exists(base_path('resources/lang/' . $code . '.json'))) {
        $jsonString = file_get_contents(base_path('resources/lang/' . $code . '.json'));
        $jsonString = json_decode($jsonString, true);
    }
    return $jsonString;
}

//save the new language json file
function saveJSONFile($code, $data)
{
    ksort($data);
    $jsonData = json_encode($data, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
    file_put_contents(base_path('resources/lang/' . $code . '.json'), stripslashes($jsonData));
}

//translate the key with json
function translate($key)
{
    $key = ucfirst(str_replace('_', ' ', $key));
    if (File::exists(base_path('resources/lang/en.json'))) {
        $jsonString = file_get_contents(base_path('resources/lang/en.json'));
        $jsonString = json_decode($jsonString, true);
        if (!isset($jsonString[$key])) {
            $jsonString[$key] = $key;
            saveJSONFile('en', $jsonString);
        }
    }
    return __($key);
}



//scan directory for load flag
function readFlag()
{
    $dir = base_path('public/uploads/lang');
    $file = scandir($dir);
    return $file;
}


//auto Rename Flag
function flagRenameAuto($name)
{
    $nameSubStr = substr($name, 8);
    $nameReplace = ucfirst(str_replace('_', ' ', $nameSubStr));
    $nameReplace2 = ucfirst(str_replace('.png', '', $nameReplace));
    return $nameReplace2;
}


function defaultCurrency(){
    $sc = session('currency');
    if($sc != null){
        $id = $sc;
    }else{
        $id = (int)getSystemSetting('default_currencies')->value;
    }
    $currency = \App\Model\Currency::find($id);
    return $currency->code;
}

//format the Price
function formatPrice($price)
{
    $sc = session('currency');
    if($sc != null){
        $id = $sc;
    }else{
        $id = (int)getSystemSetting('default_currencies')->value;
    }

    $currency = \App\Model\Currency::find($id);
    $p =$price * $currency->rate;
    return $currency->align == 0 ? number_format($p, 2) . $currency->symbol :  $currency->symbol . number_format($p, 2);

}

/*only price for payment*/
function onlyPrice($price)
{
    $sc = session('currency');
    if($sc != null){
        $id = $sc;
    }else{
        $id = (int)getSystemSetting('default_currencies')->value;
    }

    $currency = \App\Model\Currency::find($id);
    $p =$price * $currency->rate;
    return $p;

}

/*Active Currency*/
function activeCurrency(){
    $sc = session('currency');
    if($sc != null){
        $id = $sc;
    }else{
        $id = (int)getSystemSetting('default_currencies')->value;
    }

    $currency = \App\Model\Currency::find($id);
    return $currency->code;
}

//override or add env file or key
function overWriteEnvFile($type, $val)
{
    $path = base_path('.env');
    if (file_exists($path)) {
        $val = '"' . trim($val) . '"';
        if (is_numeric(strpos(file_get_contents($path), $type)) && strpos(file_get_contents($path), $type) >= 0) {
            file_put_contents($path, str_replace($type . '="' . env($type) . '"', $type . '=' . $val, file_get_contents($path)));
        } else {
            file_put_contents($path, file_get_contents($path) . "\r\n" . $type . '=' . $val);
        }
    }
}


//get system setting data
function getSystemSetting($key)
{
    return \App\Model\SystemSetting::where('type', $key)->first();
}

//Get file path
//path is storage/app/
function filePath($file)
{
    return asset($file);
}


function course(){
    return \App\Model\Course::Published()->get();
}
//delete file
function fileDelete($file)
{
    if ($file != null) {
        if (file_exists(public_path($file))) {
            unlink(public_path($file));
        }
    }
}

//uploads file
// uploads/folder
function fileUpload($file, $folder)
{
    return $file->store('uploads/' . $folder);
}



//get instructor
function instructorDetails($id)
{
    return \App\Model\Instructor::where('user_id', $id)->first();
}

function studentDetails($id)
{
    return \App\Model\Student::where('user_id', $id)->first();
}


/*categories*/
function categories(){

  return  Category::where('parent_category_id' ,0)->with('child')->Published()->get();
}


/*duration*/
function duration($value){
    $init = $value;
    $hours = floor($init / 60);
    $minutes = floor($init  % 60);
    $seconds = floor(($init /60) % 60);
    $single_sec =  mb_strlen((string) $seconds);
    $duration = $hours . ':' . $minutes . ':' . ($single_sec===1 ? '0'.$seconds : $seconds);
    return date('H:i:s',strtotime($duration));
}


/*best selling tags*/
function bestSellingTags($id){
    $start = \Carbon\Carbon::parse(date('y-m-d'))
        ->startOfMonth()
        ->toDateTimeString();
    $end = \Carbon\Carbon::parse(date('y-m-d'))
        ->endOfMonth()
        ->toDateTimeString();

     $enroll = \App\Model\Enrollment::where('course_id',$id)->whereBetween('created_at', [$start, $end])->get();

     if($enroll->count() > 5){
         return true;
     }
     return false;
}


/*affiliate status*/
function affiliateStatus(){
    try {
        $affiliate = getSystemSetting('affiliate')->value;
        if ($affiliate == 'Active'){
            return true;
        }else{
            return false;
        }
    }catch (Exception $exception){
        return false;
    }

}

/*affiliate commission*/
function commission(){
    $commission = (int)getSystemSetting('commission')->value;
    return $commission;
}

//cookie time day
function cookiesLimit(){
    $days = (int)getSystemSetting('cookies_limit')->value;
    /*return day*/

    return ($days*1440);
}

/*cashout*/
function withdrawLimit(){
    $amount = (int)getSystemSetting('withdraw_limit')->value;
    return $amount;
}

//CHECK MEDIA MANAGER ACTIVATION
function MediaActive()
{
    if (env('MEDIA_MANAGER') === "YES") {
        return true;
    }else{
        return false;
    }
}


// check Paytm route for Mapping

function paytmRoute()
{
    if (file_exists(base_path('routes/paytm.php'))) {
        return true;
    }else{
        return false;
    }
}

// check Paytm route for blade
function paytmRouteForBlade()
{
    if (file_exists(base_path('routes/paytm.php'))) {
        return true;
    }else{
        return false;
    }
}

// check Paytm route for blade
function paytmActive()
{
    if (env('PAYTM_ACTIVE') == 'YES') {
        return true;
    }
    return false;
}


