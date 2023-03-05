<?php

namespace App\Http\Controllers;


use PhpOffice;

use Illuminate\Support\Facades\Auth;

use Illuminate\Http\Request;
use App\Models\Contract;
use App\Models\Institution;
use App\Models\Contract_type;
use App\Models\Basis;
use App\Models\Contractor;
use App\Models\Kosgu;
use App\Models\Kosgu_contract;
use App\Models\Finance;
use App\Models\Executor;
use App\Models\User_contract;
use App\Models\File;
use App\Models\Remark;
use App\Models\User;
use App\Filters\ContractFilter;


class ContractController extends Controller
{


    protected $paginated = 10;



    /**
     * главная
     * 
     */   
    public function index()
    {
        return view('pages.index');
    }

    
    /**
     * на согласовании
     * 
     */       
    public function approval(ContractFilter $request) {
        if (Auth::check()) {

            $is_admin = false;
            $is_operator = false;
            $is_coordinator = false;
            $current_user = Auth::user();

            if ($current_user->is_admin==true) {
                $is_admin = true;
            }
            if ($current_user->is_operator==true) {
                $is_operator = true;
            }
            if ($current_user->is_coordinator==true) {
                $is_coordinator = true;
            }

            
            $contracts = Contract::filter($request)->orderBy('id', 'DESC')->where('approved', 0)->paginate($this->paginated);   
            $institutions = Institution::orderBy('id')->get();
            $type_contracts = Contract_type::orderBy('id')->get();



            // показывать согласующим только свои договора
            if ($is_coordinator) {
                foreach($contracts as $contract_key => $contract_value) {
                    $can_view = false;
                    foreach($contract_value->user_contracts as $user_contract) {
                             if (($user_contract->user_id ===  $current_user->id)) {
                                $can_view = true;
                                break;
                             }
                    }                    
                    if (!$can_view) $contracts->forget($contract_key);
                }
            }

            // показывать операторам свои учреждения
            if ($is_operator) {
                foreach($contracts as $contract_key => $contract_value) {
                    $can_view = false;
                    if (($contract_value->institution->user_id ===  $current_user->id)) {
                        $can_view = true;                               
                    }                                 
                    if (!$can_view) $contracts->forget($contract_key);
                }
            }


            return view('contracts.approval',[
                'contracts' => $contracts,
                'institutions' => $institutions,
                'type_contracts' => $type_contracts,
                'is_admin' => $is_admin,                            
            ]);
        }
    }


    /**
     * утверждены
     * 
     */    
    public function approved(ContractFilter $request) {
        if (Auth::check()) {

            $is_admin = false;
            $is_operator = false;
            $is_coordinator = false;
            $current_user = Auth::user();

            if ($current_user->is_admin==true) {
                $is_admin = true;
            }
            if ($current_user->is_operator==true) {
                $is_operator = true;
            }
            if ($current_user->is_coordinator==true) {
                $is_coordinator = true;
            }

             $contracts = Contract::filter($request)->orderBy('id', 'DESC')->where('approved', 1)->paginate($this->paginated);   

            $institutions = Institution::orderBy('id')->get();
            $type_contracts = Contract_type::orderBy('id')->get();


            // показывать согласующим только свои договора
            if ($is_coordinator) {
                foreach($contracts as $contract_key => $contract_value) {
                    $can_view = false;
                    foreach($contract_value->user_contracts as $user_contract) {
                             if (($user_contract->user_id ===  $current_user->id)) {
                                $can_view = true;
                                break;
                             }
                    }                    
                    if (!$can_view) $contracts->forget($contract_key);
                }
            }

            // показывать операторам свои учреждения
            if ($is_operator) {
                foreach($contracts as $contract_key => $contract_value) {
                    $can_view = false;
                    if (($contract_value->institution->user_id ===  $current_user->id)) {
                        $can_view = true;                               
                    }                                 
                    if (!$can_view) $contracts->forget($contract_key);
                }
            }

            $contracts = Contract::orderBy('id', 'DESC')->where('approved', 1)->paginate(10);   
            return view('contracts.approved',[
                'contracts' => $contracts,
                'institutions' => $institutions,
                'type_contracts' => $type_contracts, 
            ]);
        }
    }



    /**
     * форма создание договора
     * 
     */
    public function create() {
        if (Auth::check()) {



        $is_admin = false;
        $is_operator = false;
        $is_coordinator = false;
        $current_user = Auth::user();

        if ($current_user->is_admin==true) {
            $is_admin = true;
        }
        if ($current_user->is_operator==true) {
            $is_operator = true;
        }
        if ($current_user->is_coordinator==true) {
            $is_coordinator = true;
        }   


        // во вкладке учреждение было только одно это учреждение где работает оператор
        if ($is_operator) {
            $institutions = Institution::where('user_id',$current_user->id)->get();
        } else {
            $institutions = Institution::all();
        }
        
        $type_contracts = Contract_type::all();
        $bases = Basis::all();
        $contractors = Contractor::all();
        $kosgus = Kosgu::all();
        $finances = Finance::all();
        $responsible_executors = Executor::all();
        $users = User::all();
        $today = date("Y-m-d"); 

        return view('contracts.create',[
            'institutions' => $institutions,
            'type_contracts' => $type_contracts,
            'bases' => $bases,
            'contractors' => $contractors,
            'kosgus' => $kosgus,
            'finances' => $finances,
            'responsible_executors' => $responsible_executors,
            'users' => $users,
            'today' => $today,
        ]);
        }
    }



    /**
     * создание или обновление договора
     * 
     */
    public function createUpdateContract(Request $request, $contract, $goal) {        


        //Учреждение
        if ($goal === "create") {
            if (!empty($request->institution_id))  $contract->institution_id = intval($request->institution_id);
        }

         //вид договора        
        $contract->type_contract = $request->type_contract;

        //основание для заключения
        $contract->contract_basis = $request->contract_basis;

       
        $contract->contract_date = $request->contract_date;
        $contract->number_contract = $request->number_contract;


        //Контрагент
        $contract->contractor = $request->contractor;

        $contract->subject_contract = $request->subject_contract;
        $contract->contract_amount = $request->contract_amount;
        $contract->contract_term_1 = $request->contract_term_1;
        $contract->contract_term_2 = $request->contract_term_2;
        
        //Источник финансирования
         if (!empty($request->finances)) {  $contract->finance = $request->finances; }

        $contract->event_title = $request->event_title;    

        //автор
        if ($goal === "create") {
            $userId = Auth::id();
            $contract->user_id = $userId ?? 1;
        }

        $kosgu = $request->kosgu;

        // доработка выключена
        $contract->revision = 0;

        $contract->save();

        //kosgu
        if (!empty($kosgu)) { 
            $kosgu_array = json_decode($kosgu, true);
            foreach($kosgu_array as $kosgu_item ) {
               if (!empty($kosgu_item[0]) && !empty($kosgu_item[1])) {
                $kosgu_contract = new Kosgu_contract;
                $kosgu_contract->contract_id = $contract->id;
                $kosgu_contract->kosgu_title = $kosgu_item[0];
                $kosgu_contract->kosgu_amount = $kosgu_item[1];                
                $kosgu_contract->save();
                }     
            }            
        }

        return $contract;
    }

    /**
     * обработка загрузки файлов
     * 
     */
    public function uploadFile(Request $request, $contract) 
    {
        $filenamewithext = $request->file('docs')->getClientOriginalName();
        $filename = pathinfo($filenamewithext, PATHINFO_FILENAME);
        $extension = $request->file('docs')->getClientOriginalExtension();
        $filenametostore = $filename.'_'.time().'.'.$extension;
        $filepath = $request->file('docs')->storeAs('uploads',$filenametostore);
        if ($filepath) {
            $current_file = new File;
            $current_file->contract_id = $contract->id;
            $current_file->user_id = 1;
            $current_file->name = $filename;
            $current_file->url = $filepath;
            $current_file->save();    
        }
    }


    public function downloadFile($id) 
    {
        $file = File::where('id', $id)->first();

        if (!empty($file)) return response()->download(storage_path('app/' . $file->url));
    }



    /**
     * обработка данных формы создания договора
     * 
     */
    public function store(Request $request)
    {    
        if ($request->isMethod('post')) {
        $contract = new Contract;

        $contract = $this->createUpdateContract($request, $contract, 'create');
        
        if ($contract->id > 0) {

            //добавлнение файлов
            if($request->hasFile('docs')){
                $this->uploadFile($request,$contract);           
            }


            //добавлнение согласующих при создании договора
            if (!empty($contract->institution->coordinators_users)) {
                foreach($contract->institution->coordinators_users as $coordinators_user) {
                    $user_contract = new User_contract;
                    $user_contract->contract_id = intval($contract->id);
                    $user_contract->user_id = intval($coordinators_user->user_id);
                    $user_contract->save();   
                }
                // отправка емейл первому пользователю
                //$this->sendEmail($contract->institution->coordinators_users[0]->email, $contract->id);  
            }
   

        }


        flash('Договор создан!')->success();

        return redirect()->route('contracts_approval');
        }
    }

    /**
     * страница редактирования договора
     * 
     */
    public function edit($id)
    {
        if (Auth::check()) {
        $institutions = Institution::all();
        $type_contracts = Contract_type::all();
        $bases = Basis::all();
        $contractors = Contractor::all();
        $kosgus = Kosgu::all();
        $finances = Finance::all();
        $responsible_executors = Executor::all();
        $users = User::all();

        $contract = Contract::where('id',$id)->first();
        if (!empty($contract)) {
            if (!empty($contract->finance)) {
                $contract->finance = explode(',', $contract->finance);
            }

            $current_user = Auth::user();
            $is_admin = false;
            $is_operator = false;
            if ($current_user->is_admin==true) {
                $is_admin = true;
            }
            if ($current_user->is_operator==true) {
                $is_operator = true;
            }


            $revision = $contract->revision;
            $today = date("Y-m-d");

            //если может соглосовать
            $can_approve = false;   
            //если может доработку
            $can_remark = false; 
            //если может обновлять
            $can_update = false;   


            if ($is_admin || $is_operator) {
                $can_remark = true; 
                $can_update = true;   
            }
            

            foreach($contract->user_contracts as $user_contract) {
                if (($user_contract->user_id ===  $current_user->id) && ($user_contract->user_approved === 0) ) {
                    $can_approve = true;    
                    $can_update = true;   
                    $can_remark = true;                     
                }
                if (($user_contract->user_id ===  $current_user->id) && ($user_contract->user_approved === 1) ) {
                    $can_approve = false;      
                    $can_remark = false;    
                    $can_update = false;                      
                }
            }


            return view('contracts.edit',[
                    'contract' => $contract,
                    'institutions' => $institutions,
                    'type_contracts' => $type_contracts,
                    'bases' => $bases,
                    'contractors' => $contractors,
                    'kosgus' => $kosgus,
                    'finances' => $finances,
                    'responsible_executors' => $responsible_executors,
                    'users' => $users,
                    'current_user' => $current_user,
                    'revision' => $revision,
                    'today' => $today,
                    'can_approve' => $can_approve,
                    'can_remark' => $can_remark,
                    'can_update' => $can_update,
                ]);
        }
         }
    }

    public function update(Request $request, $id)
    {
        if ($id > 0 && $request->isMethod('post')) {
            $contract = Contract::find($id);

            if (!empty($contract)) {

            if($contract->revision === 1) {
                $contract = $this->createUpdateContract($request, $contract, 'update');
            }


            //добавлнение файлов
            if($request->hasFile('docs')){
                $this->uploadFile($request,$contract); 
            }

                //добавление замечаний
                if (!empty($request->remark_date) && !empty($request->remark_name) && !empty($request->remark_message)) {               
                    $remark = new Remark;
                    $remark->contract_id = $id;
                    $remark->user_id = 1;
                    $remark->remark_date = $request->remark_date;
                    $remark->name = $request->remark_name;
                    $remark->message = $request->remark_message;
                    $remark->save();    
                }    


                flash('Договор обновлен!')->success();

                return redirect()->route('contracts_approval');
            }
        }
    }

    /**
     * страница договора
     * 
     */
    public function show($id)
    {        
        if (Auth::check()) {
        $contract = Contract::where('id',$id)->first();

        if (!empty($contract->finance)) {
            $contract->finance = explode(',', $contract->finance);
        }
        return view('contracts.show',[
                'contract' => $contract,       
        ]);
        }
    }

    /**
     * удаление договора
     * 
     */
    public function destroy($id)
    {        
        if (Auth::check()) {
            $contract = Contract::where('id',$id)->first();
            if (!empty($contract)) {
                $contract->delete();
                flash('Договор удален!')->success();
            }
            return redirect()->route('contracts_approval');
        }
    }

    // действие при кнопке соглосовать
    public function approve($id)
    {
        if (Auth::check()) {
            $contract = Contract::where('id',$id)->first();
            if (!empty($contract)) {

                $current_user = Auth::user();
                $current_user_id = $current_user->id;
                $contract_approved = true;

                $user_contract = User_contract::where('contract_id',$id)->where('user_id', $current_user_id)->first();
                if (!empty($user_contract)) {
                    $user_contract->user_approved = 1;
                    $user_contract->save();
                }


                foreach($contract->user_contracts as $user_contract) {
                    if ($user_contract->user_approved ===  0) {
                        $contract_approved = false;
                    }
                }    

                // обновление договора
                if ($contract_approved) {
                    $contract->approved = 1;
                    $contract->save();
                }

                
                flash('Договор согласован!')->success();
            }
            return redirect()->route('contracts_approval');
        }
    }

    // кнопка отправить на доработку
    public function remark($id)
    {
        if (Auth::check()) {
            $contract = Contract::where('id',$id)->first();
            if (!empty($contract)) {
                

                // обнуление соглосований
                foreach($contract->user_contracts as $user_contract) {
                    $user_contract->user_approved = 0;
                    $user_contract->save();
                }    


                $contract->revision = 1;
                $contract->save();
                flash('Договор отправлен на доработку!')->success();
            }
            return redirect()->route('contracts_approval');
        }
    }





    /**
     * отправка почты
     * 
     */
    public function sendEmail($email, $contract_id) {
        $message = "Договор $contract_id отправлен на согласование";
    }



    /**
     * создание файла документа в формате word
     * 
     */
    public function doc($id) {
        $contract = Contract::where('id',$id)->first();
        if (!empty($contract)) {
           
            $size_title = 15;
            $format_title_header = array('name'=>'Arial','size' => 24,'bold' => true);
            $format_title = array('name'=>'Arial','size' => $size_title,'bold' => true);
            
            $phpWord = new \PhpOffice\PhpWord\PhpWord();
            $section = $phpWord->addSection();
            $text = $section->addText("Договор №" . $contract->id,$format_title_header);
            $text = $section->addText("");
            $text = $section->addText("Учреждение",$format_title);
            $text = $section->addText($contract->institution->name);
            $text = $section->addText("");
            $text = $section->addText("Вид договора",$format_title);
            $text = $section->addText($contract->type_contract);
            $text = $section->addText("");
            $text = $section->addText("Основание для заключения",$format_title);
            $text = $section->addText($contract->contract_basis);
            $text = $section->addText("");
            $text = $section->addText("Дата договора",$format_title);
            $text = $section->addText(date('d.m.Y', strtotime($contract->contract_date)));
            $text = $section->addText("");
            $text = $section->addText("Номер договора",$format_title);
            $text = $section->addText($contract->number_contract);
            $text = $section->addText("");
            $text = $section->addText("Контрагент",$format_title);
            $text = $section->addText($contract->contractor);
            $text = $section->addText("");
            $text = $section->addText("Предмет договора",$format_title);
            $text = $section->addText($contract->subject_contract);
            $text = $section->addText("");
            $text = $section->addText("Сумма договора",$format_title);
            $text = $section->addText($contract->contract_amount);
            $text = $section->addText("");
            $text = $section->addText("Срок договора",$format_title);
            $text = $section->addText(date('d.m.Y', strtotime($contract->contract_term_1)) . " - " . date('d.m.Y', strtotime($contract->contract_term_2)));
            $text = $section->addText("");

            if ($contract->kosgus !== null) {
                $text = $section->addText("Косгу",$format_title);            
                foreach($contract->kosgus as $kosgu) {
                    $text = $section->addText($kosgu->kosgu_title . " - ". $kosgu->kosgu_amount. " р");   
                }
                $text = $section->addText("");
            }

            if ($contract->finance !== null) {
                $text = $section->addText("Источник финансирования",$format_title);    
                $contract->finance = explode(',', $contract->finance);        
                foreach($contract->finance as $finance) {
                    $text = $section->addText($finance);   
                }
                $text = $section->addText("");
            }          

            $text = $section->addText("Название мероприятия",$format_title);
            $text = $section->addText($contract->event_title);
            $text = $section->addText("");
            $text = $section->addText("Ответственнный исполнитель",$format_title);
            $text = $section->addText($contract->institution->user->name);
            $text = $section->addText("");

            if ($contract->remarks !== null) {
                $text = $section->addText("Лист замечаний условий договора",$format_title);            
                foreach($contract->remarks as $remark) {
                    $text = $section->addText(date('d.m.Y', strtotime($remark->remark_date)) . " " . $remark->name); 
                    $text = $section->addText($remark->message);  
                }
                $text = $section->addText("");
            }    

            $objWriter = \PhpOffice\PhpWord\IOFactory::createWriter($phpWord, 'Word2007');
            $project_name = "docs/project".$id.".docx";
            $objWriter->save($project_name);
            return response()->download(public_path($project_name));

        }
    }

 
}
