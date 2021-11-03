@extends('layouts.main-layout')

@section('title','Просмотр проекта договора')

@section('content')




<h1 class="mb-3">Просмотр проекта договора {{$contract->id}}</h1>

<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="{{route('dashboard')}}">Панель управления</a></li>
    <li class="breadcrumb-item"><a href="{{route('contracts_approval')}}">Договора</a></li>
    <li class="breadcrumb-item active" aria-current="page">Просмотр договора</li>
  </ol>
</nav>


<div class="row mb-5">

    <div class="col-6">
  


<form method="POST" action="" class="form-create">
    @csrf






<div class="form-group">
    <label for="institution">Учреждение</label>
   
    <p><strong>{{$contract->institution->name}}</strong></p>
</div>

<div class="form-group">
    <label for="type_contract">Вид договора</label>
    <p><strong>{{$contract->type_contract}}</strong></p>   
</div>

<div class="form-group">
    <label for="contract_basis">Основание для заключения</label>
    <p><strong>{{$contract->contract_basis}}</strong></p>    
</div>

<div class="form-group">
    <label for="institution">Дата договора</label>
    <p><strong>{{date('d.m.Y', strtotime($contract->contract_date))}}</strong></p>
</div>

<div class="form-group">
    <label for="institution">Номер договора</label>
     <p><strong>{{$contract->number_contract}}</strong></p>
  </div>

<div class="form-group">
    <label for="institution">Контрагент</label>
    <p><strong>{{$contract->contractor}}</strong></p>
  </div>

<div class="form-group">
    <label for="institution">Предмет договора</label>
    <p><strong>{{$contract->subject_contract}}</strong></p> 
  </div>

<div class="form-group">
    <label for="institution">Сумма договора</label>
    <p><strong>{{$contract->contract_amount}}</strong></p>    
  </div>

<div class="form-group">
    <label for="institution">Срок договора</label>
     <p><strong>
        {{date('d.m.Y', strtotime($contract->contract_term_1))}}
        </strong> - <strong>
            {{date('d.m.Y', strtotime($contract->contract_term_2))}}
        </strong></p> 
  
  </div>

<div class="form-group">
    <label for="institution">КОСГУ</label>

    <div id="kosgu-list" class="kosgu-list">
    @if ($contract->kosgus !== null)      
    <ol>
    @foreach($contract->kosgus as $kosgu)
    <li><strong>{{$kosgu->kosgu_title}} - {{$kosgu->kosgu_amount}} р</strong></li>
    @endforeach
    </ol>   
    @endif 
    </div>
</div>


<div class="form-group">
    <label for="institution">Источник финансирования</label>

    <div id="finance-list" class="finance-list">
    @if ($contract->finance !== null)
    <ol>
    @foreach($contract->finance as $finance)
    <li><strong>{{$finance}}</strong></li>
    @endforeach
    </ol> 
    @endif  
    </div>
         
</div>

<div class="form-group">
    <label for="institution">Название мероприятия</label>
    <p><strong>{{$contract->event_title}}</strong></p> 
   
</div>

<div class="form-group">
    <label for="institution">Ответственнный исполнитель</label>
    <p><strong>{{$contract->institution->user->name}}</strong></p> 
</div>


  
</form>


</div>



<div class="col-6">

<div class="form-group">  

<h3>Лист замечаний условий договора</h3>

<table class="table">
<tr>
<td>Дата</td>
<td>Имя</td>
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
</table>

</div>


<div class="form-group">
<label for="">Автор</label>
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




<a href="{{route('contract_doc', [$contract->id])}}" class="btn btn-success">скачать договор</a>



</div>




</div>








@endsection