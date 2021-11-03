<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Kosgu;

class KosguController extends Controller
{
    public $title = "КОСГУ";

    protected $message_create = "Добавлено!";
    protected $message_delete = "Пункт удален!";
    protected $message_update = "Пункт обновлен!";
    protected $paginated = 10;

    public function index() 
    {
        $items = Kosgu::orderBy('id')->paginate($this->paginated);
        
        return view('admin.kosgu.index', [
            'items' => $items,  
            'title' => $this->title,
        ]);
    }

    public function store(Request $request) {
        if ($request->isMethod('post')) {
            if (!empty($request->kosgu_new)) {
                $request->kosgu = $request->kosgu_new;
                $kosgu = Kosgu::where('name', $request->kosgu_new)->first();   
                if (empty($kosgu)) {
                $kosgu = new Kosgu;
                $kosgu->name = $request->kosgu_new;
                $kosgu->save();
                }
            }
            flash($this->message_create)->success();
            return redirect()->route('kosgu');
        }
    }

    public function destroy($id)
    {        
        $item = Kosgu::where('id',$id)->first();
        if (!empty($item)) {
            $item->delete();
            flash($this->message_delete)->success();
        }
        return redirect()->route('kosgu');
    }
}
