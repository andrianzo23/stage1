<?php

namespace App\Http\Middleware;

use Closure;

class InstallCheck
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
        if(env('APP_INSTALL') == 'NO'){
            return $next($request);
        }else{
            return redirect()->to('/');
        }
    }
}
