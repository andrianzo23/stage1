<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Http;
use ZipArchive;
use App\Addon;
use File;
use Alert;
use Auth;
use DB;

class AddonController extends Controller
{
    
    // addons_manager

    public function addons_manager()
    {

        try {
            //check DB table for migration
            if (!Schema::hasTable('addons')) {
                \Artisan::call('make:model Addon');

                Schema::create('addons', function (Blueprint $table) {
                    $table->id();
                    $table->string('name')->nullable();
                    $table->string('unique_identifier')->nullable();
                    $table->string('version')->nullable();
                    $table->boolean('activated')->default(true);
                    $table->longText('image')->nullable();
                    $table->timestamps();
                });

                \Artisan::call('optimize:clear');
            }

            // view
            // $addons = Addon::all();
            return view('addon.index');

        } catch (\Throwable $th) {
            Alert::toast(translate('Something went wrong'), translate('error'));
            return back();
        }

    }


    
    // Addons UI
    public function installui()
    {
        return view('addon.install');
    }


    // -----------------------------------GET MAIN PAGE-----------------------------------------------------------------
    public function get_index_page()
    {
        $addons = Addon::all();
         return view('addon.ajax.index', compact('addons'));
    }

    // get_install_page
    public function get_install_page()
    {
        return view('addon.ajax.install');
    }
    // -----------------------------------GET MAIN PAGE:END--------------------------------------------------------------


    
    // addon_preview
    public function addon_preview($addon)
    {
        $preview_addon = Addon::where('name', $addon)->first();
        return view('addon.preview_modal', compact('preview_addon'));
    }

    // addon_status
    public function addon_status($addon)
    {
        // Store to DB
            $status = Addon::where('name', $addon)->first();

            try {
                if ($status->activated == 0) {
                $status->activated = 1;
                // paytm
                if ($status->name == 'paytm') {
                    overWriteEnvFile('PAYTM_ACTIVE', 'YES');
                }
              
            }else{
                $status->activated = 0;
                // paytm
                if ($status->name == 'paytm') {
                    overWriteEnvFile('PAYTM_ACTIVE', 'NO');
                }
            
            }

            $status->save();
            // Store to DB:END

            notify()->success(translate('Status changed.'));
            return back();
            } catch (\Throwable $th) {
                notify()->error(translate('Something went wrong.'));
                return back();
            }

            
    }



    // addon_setup
    public function addon_setup($addon)
    {

        try {
            // paytm
                if ($addon == 'paytm') {
                    // return view('addon.setup.paytm.index', compact('addon'));

                    $addon_name = $addon;
                    $purchase_code = null;
                    return view('addon.setup.paytm.paytm_account', compact('addon_name','purchase_code'));
                }
            // paytm::END
        } catch (\Throwable $th) {
                notify()->error(translate('Something went wrong.'));
                return back();
        }

    }


    // purchase_code_verify
    
    public function purchase_code_verify(Request $request, $addon)
    {
        $addon_name = $request->addon_name;
        $purchase_code = $request->purchase_code;

        /**
         * PAYTM
         */
        try {
            if ($addon == 'paytm') {
            return view('addon.setup.paytm.paytm_account', compact('addon_name', 'purchase_code'));
            }
        } catch (\Throwable $th) {
            notify()->error(translate('Something went wrong.'));
            return back();
        }
    }

    // paytm_account_setup

      public function paytm_account_setup(Request $request)
    {

        try {
            $addon_name = $request->addon_name;
            $purchase_code = $request->purchase_code ?? 'N/A';
            $paytm_environment = $request->paytm_environment;
            $paytm_merchant_id = $request->paytm_merchant_id;
            $paytm_merchant_key = $request->paytm_merchant_key;
            $paytm_merchant_website = $request->paytm_merchant_website;
            $paytm_channel = $request->paytm_channel;
            $paytm_industry_type = $request->paytm_industry_type;

            return $this->paytmFileUpload(
                $addon_name,
                $purchase_code,
                $paytm_environment,
                $paytm_merchant_id,
                $paytm_merchant_key,
                $paytm_merchant_website,
                $paytm_channel,
                $paytm_industry_type
            );
        } catch (\Throwable $th) {
            notify()->error(translate('Something went wrong.'));
            return back();
        }
    }


    // paytmFileUpload

     public function paytmFileUpload(
        $addon_name,
        $purchase_code,
        $paytm_environment,
        $paytm_merchant_id,
        $paytm_merchant_key,
        $paytm_merchant_website,
        $paytm_channel,
        $paytm_industry_type
        )
    {

        try {
            return view('addon.setup.paytm.paytm_upload', compact(
            'addon_name',
            'purchase_code',
            'paytm_environment',
            'paytm_merchant_id',
            'paytm_merchant_key',
            'paytm_merchant_website',
            'paytm_channel',
            'paytm_industry_type'
            ));
        } catch (\Throwable $th) {
            notify()->error(translate('Something went wrong.'));
            return back();
        }
        
    }


     // Extracting Addons to addons folder

       public function index(Request $request)
    {   

        try {
             if($file = $request->file('addons')){ //-----1

            /**
             * Zip Upload
             */
            
            $name = $file->getClientOriginalName(); // file name  
            $file->move(base_path('addons/'),$name); // storing file
            $fileNameWithoutExtension = explode('.', $name)[0]; // Filename without extension
            
            if (!paytmRouteForBlade()) { //-----2

            // Redirecting to Addons function
          if ($fileNameWithoutExtension === 'paytm') {

                    $addon_name = $request->addon_name;
                    $purchase_code = $request->purchase_code;
                    $paytm_environment = $request->paytm_environment;
                    $paytm_merchant_id = $request->paytm_merchant_id;
                    $paytm_merchant_key = $request->paytm_merchant_key;
                    $paytm_merchant_website = $request->paytm_merchant_website;
                    $paytm_channel = $request->paytm_channel;
                    $paytm_industry_type = $request->paytm_industry_type;

                    // calling payTM()
                    return $this->paytm(
                        $addon_name,
                        $purchase_code,
                        $paytm_environment,
                        $paytm_merchant_id,
                        $paytm_merchant_key,
                        $paytm_merchant_website,
                        $paytm_channel,
                        $paytm_industry_type
                    );
                    // calling payTM():END
                }
            // Redirecting to Addons function::END
            } else{ //-----2
                notify()->warning(translate('Addon Already Installed.'));
                return redirect()->route('addons.manager.index');
            }

        }else{ //------1
            notify()->error(translate('Invalid Addon File.'));
            return redirect()->route('addons.manager.index');
        }

        } catch (\Throwable $th) {
            notify()->error(translate('Something went wrong.'));
            return back();
        }
    }



    
    // paytm::START
    public function paytm(
        $addon_name,
        $purchase_code,
        $paytm_environment,
        $paytm_merchant_id,
        $paytm_merchant_key,
        $paytm_merchant_website,
        $paytm_channel,
        $paytm_industry_type
        )
    {

        try {
            // Store to DB
            $paytm = new Addon();
            $paytm->name = $addon_name;
            $paytm->unique_identifier = $purchase_code;
            $paytm->version = 1.0;
            $paytm->activated = true;
            $paytm->image = 'paytm-banner.jpg';
            $paytm->save();
            // Store to DB:END

            // Overwrite ENV
            
         
            overWriteEnvFile('PAYTM_ENVIRONMENT', $paytm_environment);
            overWriteEnvFile('PAYTM_MERCHANT_ID', $paytm_merchant_id);
            overWriteEnvFile('PAYTM_MERCHANT_KEY', $paytm_merchant_key);
            overWriteEnvFile('PAYTM_MERCHANT_WEBSITE', $paytm_merchant_website);
            overWriteEnvFile('PAYTM_CHANNEL', $paytm_channel);
            overWriteEnvFile('PAYTM_INDUSTRY_TYPE', $paytm_industry_type);
            overWriteEnvFile('PAYTM_ACTIVE', 'YES');
       

            // Overwrite ENV:END

             /**
             * Extract
             */

        $zip = new ZipArchive;

        $public_dir=base_path().'/addons'; //addons path

            $extract_dir=base_path().'/addons'; // extracted addons path

            $zipFileName = 'paytm.zip'; // Uploaded addons name

            $filetopath = $public_dir.'/'.$zipFileName; // find addons file

            if ($zip->open($public_dir . '/' . $zipFileName, ZipArchive::CREATE) === TRUE) {    
                $zip->extractTo($extract_dir); // extracting zip
                $zip->close();

                unlink(base_path().'/addons/'.$zipFileName);
            }
            
            /**
            * Move Files to Folder
            */
            

            /**
             * Controller
             */

            //  /addons/patym/controllers
            $controller_from_path = base_path().'/addons/paytm/Controllers/PaytmController.php'; // From folder path
            $controller_to_path = base_path() . '/app/Http/Controllers/PaytmController.php'; // Coping to folder Path
            
            File::copy($controller_from_path, $controller_to_path);

            /**
             * Controller:END
             */

            /**
            * Route
            */

            //  /addons/paytm/paytm.php
            $route_from_path = base_path().'/addons/paytm/paytm.php'; // From folder path
            $route_to_path = base_path() . '/routes/paytm.php'; // Coping to folder Path
            
            File::copy($route_from_path, $route_to_path);

            /**
            * Route:END
            */

            Alert::toast(translate('success'), translate('Package installed'));
            return redirect()->route('addons.manager.index');

        } catch (\Throwable $th) {
            Alert::toast(translate('Installation Failed'), translate('error'));
            return back();
        }
         
    }

    // paytm::END

    //END
}
