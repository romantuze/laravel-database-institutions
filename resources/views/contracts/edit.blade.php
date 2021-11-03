@extends('layouts.main-layout')

@section('title','Редактирование проекта договора')

@section('content')




<h1 class="mb-3">Редактирование проекта договора {{$contract->id}}</h1>

<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="{{route('dashboard')}}">Панель управления</a></li>
    <li class="breadcrumb-item"><a href="{{route('contracts_approval')}}">Договора</a></li>
    <li class="breadcrumb-item active" aria-current="page">Редактирование договора</li>
  </ol>
</nav>

<form method="POST" action="/contract/update/{{$contract->id}}" class="form-create mb-5" enctype="multipart/form-data">
@csrf

<div class="row">

    <div class="col-6">
  








<div class="form-group">
<label for="institution">Учреждение</label>
 <p><strong>{{$contract->institution->name}}</strong></p>
</div>

<div class="form-group">
<label for="type_contract">Вид договора</label>

<div class="row">
<div class="col-6">
<select class="form-select" id="type_contract" name="type_contract" aria-label=".form-select" required
@if ($revision === 0) disabled @endif
>
<option value="">выбрать</option>
@foreach($type_contracts as $item)
    @if ($contract->type_contract === $item->name)
          <option value="{{$item->name}}" selected="">{{$item->name}}</option>
    @else
          <option value="{{$item->name}}">{{$item->name}}</option>
    @endif
@endforeach
</select>
</div>

</div>

</div>

<div class="form-group">
<label for="contract_basis">Основание для заключения</label>
<div class="row">
<div class="col-6">
<select class="form-select" id="contract_basis" name="contract_basis" aria-label=".form-select"
required
@if ($revision === 0) disabled @endif
>
<option svalue="">выбрать</option>
@foreach($bases as $item)
    @if ($contract->contract_basis === $item->name)
          <option value="{{$item->name}}" selected="">{{$item->name}}</option>
    @else
          <option value="{{$item->name}}">{{$item->name}}</option>
    @endif
@endforeach
</select>
</div>

</div>

</div>

<div class="form-group">
<label for="contract_date">Дата договора</label>
<input type="date" class="form-control" id="contract_date" name="contract_date" value="{{$contract->contract_date}}" required
@if ($revision === 0) disabled @endif
>   
</div>

<div class="form-group">
<label for="number_contract">Номер договора</label>
<input type="text" class="form-control" id="number_contract"  name="number_contract" value="{{$contract->number_contract}}" required
@if ($revision === 0) disabled @endif
>   
</div>

<div class="form-group">
<label for="contractor">Контрагент</label>

<div class="row">
<div class="col-6">
<select class="form-select" id="contractor" name="contractor" aria-label=".form-select"
required
@if ($revision === 0) disabled @endif
>
<option value="">выбрать</option>
@foreach($contractors as $item)
    @if ($contract->contractor === $item->name)
          <option value="{{$item->name}}" selected="">{{$item->name}}</option>
    @else
          <option value="{{$item->name}}">{{$item->name}}</option>
    @endif
@endforeach
</select>
</div>

</div>




</div>

<div class="form-group">
<label for="subject_contract">Предмет договора</label>
<input type="text" class="form-control" id="subject_contract" name="subject_contract" value="{{$contract->subject_contract}}" required
@if ($revision === 0) disabled @endif
>   
</div>

<div class="form-group">
<label for="contract_amount">Сумма договора</label>
<input type="text" class="form-control" id="contract_amount" name="contract_amount" value="{{$contract->contract_amount}}" required
@if ($revision === 0) disabled @endif
>   
</div>

<div class="form-group">
<label for="contract_term_1">Срок договора</label>

<div class="row">
<div class="col-6">
<input type="date" class="form-control" id="contract_term_1" name="contract_term_1" value="{{$contract->contract_term_1}}" required
@if ($revision === 0) disabled @endif
> 
</div>
<div class="col-6">
<input type="date" class="form-control" id="contract_term_2" name="contract_term_2" value="{{$contract->contract_term_2}}" required
@if ($revision === 0) disabled @endif
>  
</div>
</div> 


</div>

<hr>

<div class="form-group">
<label for="kosgu">КОСГУ</label>
<div class="kosgu-list">
@if ($contract->kosgus !== null)  
<ol id="kosgu-list">
@foreach($contract->kosgus as $kosgu)
<li>{{$kosgu->kosgu_title}} - {{$kosgu->kosgu_amount}} р</li>
@endforeach
</ol> 
@endif 
</div>

<div class="row">
<div class="col-6">
<label for="kosgu">КОСГУ</label>
<p><select class="form-select" id="kosgu-select" aria-label=".form-select"
@if ($revision === 0) disabled @endif
  >
<option selected="" value="">выбрать</option>
@foreach($kosgus as $item)
<option value="{{$item->name}}">{{$item->name}}</option>
@endforeach
</select></p>
</div>
<div class="col-6">
<label for="kosgu_amount">Сумма по КОСГУ</label>
<input type="text" class="form-control" id="kosgu-amount" placeholder="" 
@if ($revision === 0) disabled @endif
> 
</div>
</div> 
<input type="hidden" value='' name="kosgu" id="kosgu-input">
<a id="kosgu-button" class="btn btn-primary">добавить</a>
</div>


<hr>

<div class="form-group">
<label for="finance-select">Источник финансирования</label>
<div class="finance-list">
@if ($contract->finance !== null)
<ol id="finance-list">
@foreach($contract->finance as $finance)
<li>{{$finance}}</li>
@endforeach
@endif 
</ol>  

</div>
<div class="row">
<div class="col-6">
<select class="form-select form-select" id="finance-select"  aria-label=".form-select"
@if ($revision === 0) disabled @endif
>
<option selected="" value="">выбрать</option>
@foreach($finances as $item)
<option value="{{$item->name}}">{{$item->name}}</option>
@endforeach
</select>
<input type="hidden" value='' name="finances" id="finance-input">
</div>
<div class="col-6">
<a id="finance-button" class="btn btn-primary">добавить</a>
</div>
</div>
</div>


<hr>


<div class="form-group">
<label for="event_title">Название мероприятия</label>
<input type="text" class="form-control" id="event_title" name="event_title" value="{{$contract->event_title}}" required
@if ($revision === 0) disabled @endif
>   
</div>

<div class="form-group">
<label for="responsible_executor">Ответственнный исполнитель</label>
<p><strong>{{$contract->institution->user->name}}</strong></p> 
</div>




<div class="form-group">   

<label for="docs">Вложенные документы</label><br>

<input name="docs" id="docs" type="file"  accept=".pdf, .doc, .docx">

</div>




</div>



<div class="col-6">

<div class="form-group">  

<h3>Лист замечаний условий договора</h3>

<table class="table">
<tr>
<td>Дата</td>
<td>Фио</td>
</tr>
@foreach($contract->remarks as $remark)
<tr>
<td>{{date('d.m.Y', strtotime($remark->remark_date))}}</td>
<td>{{$remark->name}}</td>
</tr>
<tr>
<td colspan="2">{{$remark->message}}</td>
</tr>
@endforeach
<tr>
<td><input type="date" class="form-control"  id="remark_date" name="remark_date" value="{{$today}}" placeholder=""></td>
<td><input type="text" class="form-control"  id="remark_name" name="remark_name" value="{{$current_user->name}}" placeholder=""></td>
</tr>
<tr>
<td colspan="2">Сообщение 

<textarea class="form-control"  id="remark_message" name="remark_message"></textarea>

 </td>
</tr>
</table>

</div>






<div class="form-group">
<label for="institution">Автор</label>
<p><strong>{{$contract->user->name}}</strong></p>
</div>

<div class="form-group">
<label for="">Создан</label>   
<p><strong>{{date('d.m.Y h:i', strtotime($contract->created_at))}}</strong></p>
</div>


<div class="form-group">
<label for="institution">Согласующие</label>   
<ol>
@foreach($contract->user_contracts as $user_contract)
<li><strong>{{$user_contract->user->name}}</strong> 
@if ($user_contract->user_approved === 1)
<small>согласован</small>
@else
<small>не согласован</small>
@endif    
</li>
@endforeach
</ol>
</div>

<div class="form-group">
<label for="institution">Вложенные документы</label>
<ol>
@foreach($contract->files as $file)
<li><strong><a href="{{route('contract_file', [$file->id])}}">{{$file->name}}</a></strong></li>
@endforeach
</ol>
</div>







@if ($can_update)
<button type="submit" class="btn btn-primary">обновить</button>
@endif

@if ($revision === 0)
@if ($can_remark)
<a href="{{route('contract_remark', [$contract->id])}}" class="btn btn-warning">отправить на доработку</a>
@endif
@endif

@if ($can_approve)
<a href="{{route('contract_approve', [$contract->id])}}" class="btn btn-success">согласовать</a>
@endif



</div>




</div>

</form>



<script src="/js/form-create.js"></script>



@endsection