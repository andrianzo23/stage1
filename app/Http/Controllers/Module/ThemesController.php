<?php

namespace App\Http\Controllers\Module;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class ThemesController extends Controller
{
    //

    public function create()
    {
        return view('setting.themes');
    }


    public function store(Request $request){

        foreach ($request->types as $key => $type) {
            overWriteEnvFile($type, $request[$type]);
        }
        notify()->success(translate('Themes settings update'));
        return back();
    }
}
