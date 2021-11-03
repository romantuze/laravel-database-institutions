<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ContractController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\InstitutionController;
use App\Http\Controllers\TypeContractController;
use App\Http\Controllers\BasisController;
use App\Http\Controllers\ContractorController;
use App\Http\Controllers\KosguController;
use App\Http\Controllers\FinanceController;
use App\Http\Controllers\ExecutorController;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', [ContractController::class, 'index']);

Route::get('/contract/create',[ContractController::class,'create'])->name('contract_create');
Route::post('/contract/store',[ContractController::class,'store'])->name('contract_store');

Route::get('/contract/edit/{id}',[ContractController::class,'edit'])->name('contract_edit');
Route::post('/contract/update/{id}',[ContractController::class,'update'])->name('contract_update');
Route::get('/contract/show/{id}',[ContractController::class,'show'])->name('contract_show');
Route::get('/contract/delete/{id}',[ContractController::class,'destroy'])->name('contract_delete');

Route::get('/contract/approve/{id}',[ContractController::class,'approve'])->name('contract_approve');
Route::get('/contract/remark/{id}',[ContractController::class,'remark'])->name('contract_remark');
Route::get('/contract/doc/{id}',[ContractController::class,'doc'])->name('contract_doc');
Route::get('/contract/file/{id}',[ContractController::class,'downloadFile'])->name('contract_file');



Route::get('/contracts/approval',[ContractController::class,'approval'])->name('contracts_approval');
Route::get('/contracts/approved',[ContractController::class,'approved'])->name('contracts_approved');

/*Route::get('/contracts/coordinators/{id}',[ContractController::class,'coordinators'])->name('contract_coordinators');
Route::post('/contracts/coordinators/update/{id}',[ContractController::class,'coordinators_store'])->name('contract_coordinators_store');
Route::get('/contracts/coordinators/delete/{id}',[ContractController::class,'coordinators_delete'])->name('contract_coordinators_delete');
*/


// admin
Route::get('/contracts/lists',[AdminController::class,'lists'])->middleware(['admin'])->name('contracts_lists');

// institutions
Route::get('/contracts/lists/institutions',[InstitutionController::class,'index'])->middleware(['admin'])->name('institutions');
Route::post('/contracts/lists/institutions/store',[InstitutionController::class,'store'])->middleware(['admin'])->name('institution_store');
Route::get('/contracts/list/institutions/delete/{id}',[InstitutionController::class,'destroy'])->middleware(['admin'])->name('institution_delete');
Route::get('/contracts/list/institutions/edit/{id}',[InstitutionController::class,'edit'])->middleware(['admin'])->name('institution_edit');
Route::post('/contracts/list/institutions/update/{id}',[InstitutionController::class,'update'])->middleware(['admin'])->name('institution_update');
Route::get('/contracts/list/institutions/delete/user/{id}',[InstitutionController::class,'delete_user'])->middleware(['admin'])->name('institution_delete_user');












// type_contract
Route::get('/contracts/lists/type_contract',[TypeContractController::class,'index'])->middleware(['admin'])->name('type_contract');
Route::post('/contracts/lists/type_contract/store',[TypeContractController::class,'store'])->middleware(['admin'])->name('type_contract_store');
Route::get('/contracts/list/type_contract/delete/{id}',[TypeContractController::class,'destroy'])->middleware(['admin'])->name('type_contract_delete');

// basis
Route::get('/contracts/lists/basis',[BasisController::class,'index'])->middleware(['admin'])->name('basis');
Route::post('/contracts/lists/basis/store',[BasisController::class,'store'])->middleware(['admin'])->name('basis_store');
Route::get('/contracts/list/basis/delete/{id}',[BasisController::class,'destroy'])->middleware(['admin'])->name('basis_delete');

// contractor
Route::get('/contracts/lists/contractor',[ContractorController::class,'index'])->middleware(['admin'])->name('contractor');
Route::post('/contracts/lists/contractor/store',[ContractorController::class,'store'])->middleware(['admin'])->name('contractor_store');
Route::get('/contracts/list/contractor/delete/{id}',[ContractorController::class,'destroy'])->middleware(['admin'])->name('contractor_delete');

// kosgu
Route::get('/contracts/lists/kosgu',[KosguController::class,'index'])->middleware(['admin'])->name('kosgu');
Route::post('/contracts/lists/kosgu/store',[KosguController::class,'store'])->middleware(['admin'])->name('kosgu_store');
Route::get('/contracts/list/kosgu/delete/{id}',[KosguController::class,'destroy'])->middleware(['admin'])->name('kosgu_delete');

// finance
Route::get('/contracts/lists/finance',[FinanceController::class,'index'])->middleware(['admin'])->name('finance');
Route::post('/contracts/lists/finance/store',[FinanceController::class,'store'])->middleware(['admin'])->name('finance_store');
Route::get('/contracts/list/finance/delete/{id}',[FinanceController::class,'destroy'])->middleware(['admin'])->name('finance_delete');

// responsible_executor
Route::get('/contracts/lists/responsible_executor',[ExecutorController::class,'index'])->middleware(['admin'])->name('responsible_executor');
Route::post('/contracts/lists/responsible_executor/store',[ExecutorController::class,'store'])->middleware(['admin'])->name('responsible_executor_store');
Route::get('/contracts/list/responsible_executor/delete/{id}',[ExecutorController::class,'destroy'])->middleware(['admin'])->name('responsible_executor_delete');




/*
Route::get('/contracts/list/delete/type_contract/{id}',[AdminController::class,'lists_delete_type_contract'])->middleware(['admin'])->name('lists_delete_type_contract');
Route::get('/contracts/list/delete/basis/{id}',[AdminController::class,'lists_delete_basis'])->middleware(['admin'])->name('lists_delete_basis');
Route::get('/contracts/list/delete/contractor/{id}',[AdminController::class,'lists_delete_contractor'])->middleware(['admin'])->name('lists_delete_contractor');
Route::get('/contracts/list/delete/kosgu/{id}',[AdminController::class,'lists_delete_kosgu'])->middleware(['admin'])->name('lists_delete_kosgu');
Route::get('/contracts/list/delete/finance/{id}',[AdminController::class,'lists_delete_finance'])->middleware(['admin'])->name('lists_delete_finance');
Route::get('/contracts/list/delete/executor/{id}',[AdminController::class,'lists_delete_executor'])->middleware(['admin'])->name('lists_delete_executor');
Route::post('/contracts/lists/store',[AdminController::class,'store'])->middleware(['admin'])->name('contracts_lists_store');

*/








//user
Route::get('dashboard', [UserController::class, 'index'])->name('dashboard'); 

Route::get('users', [UserController::class, 'users'])->middleware(['admin'])->name('users');
Route::get('/user/edit/{id}',[UserController::class,'edit'])->middleware(['admin'])->name('user_edit');
Route::post('/user/update/{id}',[UserController::class,'update'])->middleware(['admin'])->name('user_update');
Route::get('/user/delete/{id}',[UserController::class,'destroy'])->middleware(['admin'])->name('user_delete');






// login registration routes
Route::get('login', [AuthController::class, 'index'])->name('login');
Route::post('submit-login', [AuthController::class, 'postLogin'])->name('login.post'); 
Route::get('registration', [AuthController::class, 'registration'])->name('register');
Route::post('submit-registration', [AuthController::class, 'postRegistration'])->name('register.post'); 

Route::get('logout', [AuthController::class, 'logout'])->name('logout');




