<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Jenssegers\Agent\Agent;
use App\Models\TokenNumber;
use App\Models\Fine;
use App\User;

class AdminController extends Controller
{
    public function index(){
        if (Auth::check()){
            $user = Auth::user();
            $tokens = TokenNumber::all();
            $cards = Fine::getAll();
            $users = User::all();
            $count_archives = Fine::where('archive', '1')->count();
            $user_info = ['id' => $user->id, 'role' => $user->role, 'full_name' => $user->full_name];
            $agent = new Agent();
            $mobile = preg_match('/(m\.)[a-zA-Z0-9]/', $_SERVER['HTTP_HOST']);
            $platform = ($agent->isMobile() || $agent->isTablet() || $mobile) ? 'mobile' : 'desktop';
            return view('admin', ['data' => json_encode([
                'platform' => $platform,
                'user' => $user_info,
                'state' => [
                    'token_numbers' => $tokens,
                    'cards' =>  $cards,
                    'count_archives' => $count_archives,
                    'users' => $users
                ]
            ])]);
        }else{
            return view('auth.login');
        }
    }

    public function logout(){
        Auth::logout();
        return redirect()->route('adminka');
    }

    public function login(Request $request){
        $form = $request->all();
        $login = $form['login'];
        $password = $form['password'];
        if (array_key_exists('remember', $form)){
            $remember = $form['remember'];
        }else{
            $remember = "off";
        }
        if (Auth::attempt(['login' => $login, 'password' => $password], $remember)){
            return redirect()->route('adminka');
        }
        return view('auth.login');
    }
}
