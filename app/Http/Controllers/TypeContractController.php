<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Contract_type;

class TypeContractController extends Controller
{
    public $title = "Вид договора";

    protected $message_create = "Добавлено!";
    protected $message_delete = "Пункт удален!";
    protected $message_update = "Пункт обновлен!";
    protected $paginated = 10;

    public function index() 
    {
        $items = Contract_type::orderBy('id')->paginate($this->paginated);
        
        return view('admin.type_contract.index', [
            'items' => $items,  
            'title' => $this->title,
        ]);
    }

    public function store(Request $request) {
        if ($request->isMethod('post')) {
            if (!empty($request->type_contract_new)) {
                
                $type_contract = Contract_type::where('name', $request->type_contract_new)->first();         
                if (empty($type_contract)) {
                $type_contract = new Contract_type;
                $type_contract->name = $request->type_contract_new;
                $type_contract->save();
                }
            }
            flash($this->message_create)->success();
            return redirect()->route('type_contract');
        }
    }

    public function destroy($id)
    {        
        $item = Contract_type::where('id',$id)->first();
        if (!empty($item)) {
            $item->delete();
            flash($this->message_delete)->success();
        }
        return redirect()->route('type_contract');
    }
}
