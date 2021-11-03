<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Session;
use App\Models\User;
use Hash;
use App\Models\Institution;


class AuthController extends Controller
{

    public function index() 
    {
    	return view('auth.login');
    }


    public function registration() 
    {
        $institutions = Institution::all();

    	return view('auth.register', [
            'institutions' => $institutions,
        ]);
    }


    public function postLogin(Request $request)
    {
    	$request->validate([
    		'email' => 'required',
    		'password' => 'required'
    	]);
    	$credentials = $request->only('email','password');
    	if (Auth::attempt($credentials)) {
    		return redirect('dashboard')->withSuccess('Вы вошли в систему');
    	}
    	return redirect('login')->withSuccess('Неправильный логин или пароль');
    }

    public function postRegistration(Request $request)
    {
    	$request->validate([
    		'name' => 'required|min:3',
    		'email' => 'required|email|unique:users',
    		'password' => 'required|min:6',
            'role' => 'required',
            /*'institution_id' => 'required'*/
    	]);
    	$data = $request->all();              
       //var_dump($data);
    	$check = $this->create($data);
    	return redirect('login')->withSuccess('Необходимо выполнить вход');
    }

    public function dashboard() 
    {
    	if (Auth::check()) {
    		return view('pages.dashboard');
    	}
    	return redirect('login')->withSuccess('Вы не имеете доступа');
    }

    /**
     * создание нового пользователя
     * 
     */   
    public function create(array $data) 
    {
        $is_operator = $data['role'] === "Оператор" ? 1 : 0;   
        $is_coordinator = $data['role'] === "Согласующий" ? 1 : 0;
        $is_admin = $data['role'] === "Администратор" ? 1 : 0;

    	return User::create([
    		'name' => $data['name'],
    		'email' => $data['email'],
    		'password' => Hash::make($data['password']),
            'role' => $data['role'],
            'is_operator' => $is_operator,
            'is_coordinator' => $is_coordinator,
            'is_admin' => $is_admin,
    	]);
    }

    public function logout() {
    	Session::flush();
    	Auth::logout();
    	return redirect('login');
    }


}
