<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Contract;
use App\Models\Institution;
use App\Models\Contract_type;
use App\Models\Basis;
use App\Models\Contractor;
use App\Models\Kosgu;
use App\Models\Finance;
use App\Models\Executor;
use App\Models\User_contract;
use App\Models\File;
use App\Models\Remark;
use App\Models\User;

class AdminController extends Controller
{


    protected $message_create = "Добавлено!";
    protected $message_delete = "Пункт удален!";


    public function index() 
    {
    }

    /**
     * страница списки
     * 
     */   
    public function lists() {
        $institutions = Institution::orderBy('id')->get();
        $type_contracts = Contract_type::orderBy('id')->get();
        $bases = Basis::orderBy('id')->get();
        $contractors = Contractor::orderBy('id')->get();
        $kosgus = Kosgu::orderBy('id')->get();
        $finances = Finance::orderBy('id')->get();
        $responsible_executors = Executor::orderBy('id')->get();


           return view('admin.lists', [
            'institutions' => $institutions,
            'type_contracts' => $type_contracts,   
            'bases' => $bases,
            'contractors' => $contractors,
            'kosgus' => $kosgus,
            'finances' => $finances,
            'responsible_executors' => $responsible_executors,
  
        ]);
    }




    public function lists_delete_type_contract($id)
    {        
        $item = Contract_type::where('id',$id)->first();
        if (!empty($item)) {
            $item->delete();
            flash($this->message_delete)->success();
        }
        return redirect()->route('contracts_lists');
    }


    public function lists_delete_basis($id)
    {        
        $item = Basis::where('id',$id)->first();
        if (!empty($item)) {
            $item->delete();
            flash($this->message_delete)->success();
        }
        return redirect()->route('contracts_lists');
    }

    public function lists_delete_kosgu($id)
    {        
        $item = Kosgu::where('id',$id)->first();
        if (!empty($item)) {
            $item->delete();
            flash($this->message_delete)->success();
        }
        return redirect()->route('contracts_lists');
    }


    public function lists_delete_finance($id)
    {        
        $item = Finance::where('id',$id)->first();
        if (!empty($item)) {
            $item->delete();
            flash($this->message_delete)->success();
        }
        return redirect()->route('contracts_lists');
    }

    public function lists_delete_executor($id)
    {        
        $item = Executor::where('id',$id)->first();
        if (!empty($item)) {
            $item->delete();
            flash($this->message_delete)->success();
        }
        return redirect()->route('contracts_lists');
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

            //вид договора        
            if (!empty($request->type_contract_new)) {
                
                $type_contract = Contract_type::where('name', $request->type_contract_new)->first();         
                if (empty($type_contract)) {
                $type_contract = new Contract_type;
                $type_contract->name = $request->type_contract_new;
                $type_contract->save();
                }
            }


            //основание для заключения
            if (!empty($request->basis_new)) {               
                $contract_basis = Basis::where('name', $request->basis_new)->first();         
                if (empty($contract_basis)) {
                $contract_basis = new Basis;
                $contract_basis->name = $request->basis_new;
                $contract_basis->save();
                }
            }

            //контрагент
            if (!empty($request->contractor_new)) {
                $contractor = Contractor::where('name', $request->contractor_new)->first();   
                if (empty($contractor)) {
                $contractor = new Contractor;
                $contractor->name = $request->contractor_new;
                $contractor->save();
                }
            }
       

            //kosgu
            if (!empty($request->kosgu_new)) {
                $request->kosgu = $request->kosgu_new;
                $kosgu = Kosgu::where('name', $request->kosgu_new)->first();   
                if (empty($kosgu)) {
                $kosgu = new Kosgu;
                $kosgu->name = $request->kosgu_new;
                $kosgu->save();
                }
            }

            //Источник финансирования
            if (!empty($request->finance_new)) {
                $finances = Finance::where('name', $request->finance_new)->first();   
                if (empty($finances)) {
                $finances = new Finance;
                $finances->name = $request->finance_new;
                $finances->save();
                }
            }


            //Ответственнный исполнитель
            if (!empty($request->responsible_executor_new)) {
                $responsible_executor = Executor::where('name', $request->responsible_executor_new)->first();  
                if (empty($responsible_executor)) {
                $responsible_executor = new Executor;
                $responsible_executor->name = $request->responsible_executor_new;
                $responsible_executor->save();
                }
            }

            flash($this->message_create)->success();

            return redirect()->route('contracts_lists');
        }  
    }


}
