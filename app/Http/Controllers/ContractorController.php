<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Contractor;

class ContractorController extends Controller
{
    public $title = "Контрагент";

    protected $message_create = "Добавлено!";
    protected $message_delete = "Пункт удален!";
    protected $message_update = "Пункт обновлен!";
    protected $paginated = 10;

    public function index() 
    {
        $items = Contractor::orderBy('id')->paginate($this->paginated);
        
        return view('admin.contractor.index', [
            'items' => $items,  
            'title' => $this->title,
        ]);
    }

    public function store(Request $request) {
        if ($request->isMethod('post')) {
            if (!empty($request->contractor_new)) {
                $contractor = Contractor::where('name', $request->contractor_new)->first();   
                if (empty($contractor)) {
                $contractor = new Contractor;
                $contractor->name = $request->contractor_new;
                $contractor->save();
                }
            }
            flash($this->message_create)->success();
            return redirect()->route('contractor');
        }
    }

    public function destroy($id)
    {        
        $item = Contractor::where('id',$id)->first();
        if (!empty($item)) {
            $item->delete();
            flash($this->message_delete)->success();
        }
        return redirect()->route('contractor');
    }
}
