@extends('layouts.main-layout')

@section('title','Создание проекта договора')

@section('content')




<h1 class="mb-3">Создание проекта договора</h1>


<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="{{route('dashboard')}}">Панель управления</a></li>
    <li class="breadcrumb-item"><a href="{{route('contracts_approval')}}">Договора</a></li>
    <li class="breadcrumb-item active" aria-current="page">Создание договора</li>
  </ol>
</nav>



<div class="row">

<div class="col-6">
  

<form method="POST" action="/contract/store" class="form-create mb-5" enctype="multipart/form-data">
@csrf

<div class="form-group">
<label for="institution">Учреждение</label>

<div class="row">
<div class="col-6">
<select class="form-select" id="institution_id" name="institution_id" aria-label=".form-select" required>
<option selected="" value="">выбрать</option>
@foreach($institutions as $item)
<option value="{{$item->id}}">{{$item->name}}</option>
@endforeach
</select>
</div>

</div>

</div>

<div class="form-group">
<label for="type_contract">Вид договора</label>


<div class="row">
<div class="col-6">
<select class="form-select" id="type_contract" name="type_contract" aria-label=".form-select" required>
<option selected="" value="">выбрать</option>
@foreach($type_contracts as $item)
<option value="{{$item->name}}">{{$item->name}}</option>
@endforeach
</select>
</div>

</div>

</div>

<div class="form-group">
<label for="contract_basis">Основание для заключения</label>

<div class="row">
<div class="col-6">
<select class="form-select form-select" id="contract_basis" name="contract_basis" aria-label=".form-select" required>
<option selected="" value="">выбрать</option>
@foreach($bases as $item)
<option value="{{$item->name}}">{{$item->name}}</option>
@endforeach
</select>
</div>

</div>

</div>

<div class="form-group">
<label for="contract_date">Дата договора</label>
<input type="date" class="form-control" id="contract_date" name="contract_date" placeholder="" value="{{$today}}" required>   
</div>

<div class="form-group">
<label for="number_contract">Номер договора</label>
<input type="text" class="form-control" id="number_contract"  name="number_contract" placeholder="" required>   
</div>

<div class="form-group">
<label for="contractor">Контрагент</label>

<div class="row">
<div class="col-6">
<select class="form-select form-select" id="contractor" name="contractor" aria-label=".form-select" required>
<option selected="" value="">выбрать</option>
@foreach($contractors as $item)
<option value="{{$item->name}}">{{$item->name}}</option>
@endforeach
</select>
</div>

</div>




</div>

<div class="form-group">
<label for="subject_contract">Предмет договора</label>
<input type="text" class="form-control" id="subject_contract" name="subject_contract" placeholder="" required>   
</div>

<div class="form-group">
<label for="contract_amount">Сумма договора</label>
<input type="text" class="form-control" id="contract_amount" name="contract_amount" placeholder="" required>   
</div>

<div class="form-group">
<label for="contract_term_1">Срок договора</label>

<div class="row">
<div class="col-6">
<input type="date" class="form-control" id="contract_term_1" name="contract_term_1" required> 
</div>
<div class="col-6">
<input type="date" class="form-control" id="contract_term_2" name="contract_term_2" required>  
</div>
</div> 

</div>
<hr>







<div class="form-group">
<label for="kosgu">КОСГУ</label>
<div  class="kosgu-list"><ol id="kosgu-list"></ol></div>
<div class="row">
<div class="col-6">
<label for="kosgu">КОСГУ</label>
<p><select class="form-select" id="kosgu-select" aria-label=".form-select">
<option selected="" value="">выбрать</option>
@foreach($kosgus as $item)
<option value="{{$item->name}}">{{$item->name}}</option>
@endforeach
</select></p>
</div>
<div class="col-6">
<label for="kosgu_amount">Сумма по КОСГУ</label>
<input type="text" class="form-control" id="kosgu-amount" placeholder="" > 
</div>
</div> 
<input type="hidden" value='' name="kosgu" id="kosgu-input">
<a id="kosgu-button" class="btn btn-primary">добавить</a>
</div>



<hr>


<div class="form-group">
<label for="finance-select">Источник финансирования</label>
<div class="finance-list"><ol id="finance-list"></ol></div>
<div class="row">
<div class="col-6">
<select class="form-select form-select" id="finance-select"  aria-label=".form-select">
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




<div class="form-group">
<label for="event_title">Название мероприятия</label>
<input type="text" class="form-control" id="event_title" name="event_title" placeholder="" required>   
</div>



<?php /*
<div class="form-group">
<label for="responsible_executor">Ответственнный исполнитель</label>
<div class="row">
<div class="col-6">
<select class="form-select form-select" id="responsible_executor" name="responsible_executor" aria-label=".form-select" required>
<option selected="" value="">выбрать</option>
@foreach($responsible_executors as $item)
<option value="{{$item->name}}">{{$item->name}}</option>
@endforeach
</select>
</div>
</div>
</div>
*/ ?>


<?php /*
<div class="form-group">   
<label for="user_contract_select">Согласующие</label>

<input type="hidden" name="user_contract" class="user-contract-input" value="1">

<div class="row">
<div class="col-6">
<select class="form-select form-select" id="user_contract_select" 
name="user_contract_select" aria-label=".form-select" 
multiple size="10"
>
@foreach($users as $item)
<option value="{{$item->name}}">{{$item->name}}</option>
@endforeach
</select>
</div>
<div class="col-6">

</div>
</div>
</div>
*/ ?>



<div class="form-group">   

<label for="docs">Вложенные документы</label><br>

<input name="docs" id="docs" type="file"  accept=".pdf, .doc">

</div>



<button type="submit" class="btn btn-success">отправить на согласование</button>
</form>


</div>



<div class="col-6">



</div>




</div>






<script src="/js/form-create.js"></script>

@endsection