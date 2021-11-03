<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Basis;


class BasisController extends Controller
{
    public $title = "Основание для заключения";

    protected $message_create = "Добавлено!";
    protected $message_delete = "Пункт удален!";
    protected $message_update = "Пункт обновлен!";
    protected $paginated = 10;

    public function index() 
    {
        $items = Basis::orderBy('id')->paginate($this->paginated);
        
        return view('admin.basis.index', [
            'items' => $items,  
            'title' => $this->title,
        ]);
    }

    public function store(Request $request) {
        if ($request->isMethod('post')) {
            if (!empty($request->basis_new)) {               
                $contract_basis = Basis::where('name', $request->basis_new)->first();         
                if (empty($contract_basis)) {
                $contract_basis = new Basis;
                $contract_basis->name = $request->basis_new;
                $contract_basis->save();
                }
            }
            flash($this->message_create)->success();
            return redirect()->route('basis');
        }
    }

    public function destroy($id)
    {        
        $item = Basis::where('id',$id)->first();
        if (!empty($item)) {
            $item->delete();
            flash($this->message_delete)->success();
        }
        return redirect()->route('basis');
    }

}
