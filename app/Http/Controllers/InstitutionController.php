<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Contract;
use App\Models\Institution;
use App\Models\User_contract;
use App\Models\User;
use App\Models\user_institution;

class InstitutionController extends Controller
{
    public $title = "Учреждения";

    protected $message_create = "Добавлено!";
    protected $message_delete = "Пункт удален!";
    protected $message_update = "Пункт обновлен!";
    protected $message_s = "Согласующий добавлен!";
    protected $message_u = "Согласующий уже существует.";
    protected $message_r = "Ответственный исполнитель добавлен!";
    protected $message_d = "Согласующий удален!";

    protected $paginated = 10;

    public function index() 
    {
        $items = Institution::orderBy('id')->paginate($this->paginated);
        
        return view('admin.institutions.index', [
            'items' => $items,  
            'title' => $this->title,
        ]);
    }

    public function store(Request $request) {
        if ($request->isMethod('post')) {
            //Учреждение
            if (!empty($request->institution_new)) {
                $institution = Institution::where('name', $request->institution_new)->first();            
                if (empty($institution)) {
                   $institution = new Institution;
                   $institution->name = $request->institution_new;
                   $institution->save();             
                }
            }
            flash($this->message_create)->success();
            return redirect()->route('institutions');
        }
    }

    public function destroy($id)
    {        
        $item = Institution::where('id',$id)->first();
        if (!empty($item)) {
            $item->delete();
            flash($this->message_delete)->success();
        }
        return redirect()->route('institutions');
    }

    /**
     * страница согласующие и исполнитель для учреждения
     * 
     */
    public function edit($id)
    {        
        $institution = Institution::where('id',$id)->first();

        $users_operators =  User::where('is_operator',1)->get();
        $users_coordinators = User::where('is_coordinator',1)->get();


        if (!empty($institution)) {
            return view('admin.institutions.edit',[
                'institution' => $institution,
                'users_operators' => $users_operators,
                'users_coordinators' => $users_coordinators,
                'title' => $institution->name,
            ]);
         }
    }

    public function update(Request $request, $id)
    {        
        $id = intval($id);  
        $institution = Institution::where('id',$id)->first();
        if (!empty($institution)) {


            // добавление ответственного
            if (!empty($request->responsible)) {
                $responsible_id = intval($request->responsible);   
                $institution->user_id = $responsible_id;
                $institution->save();
                flash($this->message_r)->success();
            }

            // добавление согласующего
            if (!empty($request->coordinator)) {
                $coordinator_id = intval($request->coordinator); 
                    $user_institution = User_institution::where('institution_id',$id)->where('user_id', $coordinator_id)->first();
                    // если согласующего не было
                    if (empty($user_institution)) {
                        $user_institution = new user_institution;
                        $user_institution->institution_id = $id;
                        $user_institution->user_id = $coordinator_id;
                        $user_institution->save();   
                        flash($this->message_s)->success();
                    }  else {
                        flash($this->message_u)->warning();
                    }
            }
            
            
        }
        return redirect()->route('institution_edit', [$id]);
    }


    public function delete_user($id) {
        $user_institution = User_institution::where('id',$id)->first();          
            if (!empty($user_institution)) {
                $user_institution->delete();
                flash($this->message_d)->success();
        }
        return redirect()->route('institutions');
    }


}
