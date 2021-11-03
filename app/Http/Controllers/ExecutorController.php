<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Executor;

class ExecutorController extends Controller
{
    public $title = "Ответственнный исполнитель";

    protected $message_create = "Добавлено!";
    protected $message_delete = "Пункт удален!";
    protected $message_update = "Пункт обновлен!";
    protected $paginated = 10;

    public function index() 
    {
        $items = Executor::orderBy('id')->paginate($this->paginated);
        
        return view('admin.responsible_executor.index', [
            'items' => $items,  
            'title' => $this->title,
        ]);
    }

    public function store(Request $request) {
        if ($request->isMethod('post')) {
           if (!empty($request->responsible_executor_new)) {
                $responsible_executor = Executor::where('name', $request->responsible_executor_new)->first();  
                if (empty($responsible_executor)) {
                $responsible_executor = new Executor;
                $responsible_executor->name = $request->responsible_executor_new;
                $responsible_executor->save();
                }
            }
            flash($this->message_create)->success();
            return redirect()->route('responsible_executor');
        }
    }

    public function destroy($id)
    {        
        $item = Executor::where('id',$id)->first();
        if (!empty($item)) {
            $item->delete();
            flash($this->message_delete)->success();
        }
        return redirect()->route('responsible_executor');
    }
}
