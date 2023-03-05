<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use App\Models\Institution;
use Hash;

class UserController extends Controller
{

    protected $paginated = 10;

    public function index() 
    {
        if (Auth::check()) {

           $current_user = Auth::user();
           $is_admin = false;
           $is_operator = false;
           if ($current_user->is_admin==true) {
                $is_admin = true;
            }
            if ($current_user->is_operator==true) {
                $is_operator = true;
            }
            return view('user.index', [
                'current_user' => $current_user,
                'is_admin' => $is_admin,
                'is_operator' => $is_operator,
            ]);          
        }        

        return redirect('login')->withSuccess('Вы не имеете доступа');
    }

    public function users() {

        $users = User::paginate($this->paginated);

        return view('admin.users',[
            'users' => $users
        ]);

    }


    public function edit($id) {

        $user = User::where('id',$id)->first();
        $institutions = Institution::all();
        if (!empty($user)) {
        return view('user.edit',[
                'user' => $user,
                'institutions' => $institutions,
            ]);
         }
    }


    public function update(Request $request, $id) {

        if ($id > 0 && $request->isMethod('post')) {
            $user = User::find($id);

            if (!empty($user)) {

                $user->name = $request->name;

                $user->email = $request->email;

                $user->role = $request->role;

                $is_operator = $request->role === "Оператор" ? 1 : 0;   
                $is_coordinator = $request->role === "Согласующий" ? 1 : 0;
                $is_admin = $request->role === "Администратор" ? 1 : 0;
                $user->is_operator = $is_operator;
                $user->is_coordinator = $is_coordinator;
                $user->is_admin = $is_admin;

                if (!empty($request->password)) {
                    $user->password = Hash::make($request->password);
                }

                $user->save();

                flash('Пользователь обновлен!')->success();

                return redirect()->route('users');
            }
        }

    }

    public function destroy($id) {
        $user = User::where('id',$id)->first();
        if (!empty($user)) {
            $user->delete();
            flash('Пользователь удален!')->success();
        }
        return redirect()->route('users');
    }

}
