<?php

namespace App\Http\Middleware;

use Closure;
use DB;

class Installed
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        try {
            if (!\Illuminate\Support\Facades\DB::connection()->getPdo() || env('APP_INSTALL') == 'NO' ){
                return redirect()->route('install');
            }
            return $next($request);
        }catch (\Exception $exception){
            return redirect()->route('install');
        }
    }
}
