<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Finance;

class FinanceController extends Controller
{
    public $title = "Источник финансирования";

    protected $message_create = "Добавлено!";
    protected $message_delete = "Пункт удален!";
    protected $message_update = "Пункт обновлен!";
    protected $paginated = 10;

    public function index() 
    {
        $items = Finance::orderBy('id')->paginate($this->paginated);
        
        return view('admin.finance.index', [
            'items' => $items,  
            'title' => $this->title,
        ]);
    }

    public function store(Request $request) {
        if ($request->isMethod('post')) {
            if (!empty($request->finance_new)) {
                $finances = Finance::where('name', $request->finance_new)->first();   
                if (empty($finances)) {
                $finances = new Finance;
                $finances->name = $request->finance_new;
                $finances->save();
                }
            }
            flash($this->message_create)->success();
            return redirect()->route('finance');
        }
    }

    public function destroy($id)
    {        
        $item = Finance::where('id',$id)->first();
        if (!empty($item)) {
            $item->delete();
            flash($this->message_delete)->success();
        }
        return redirect()->route('finance');
    }
}
