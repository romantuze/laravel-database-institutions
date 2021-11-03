@extends('layouts.main-layout')

@section('title','Редактирование пользователей договора')

@section('content')




<h1 class="mb-3">Редактирование пользователей договора {{$contract->id}}</h1>

<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="{{route('dashboard')}}">Панель управления</a></li>
    <li class="breadcrumb-item"><a href="{{route('contracts_approval')}}">Договора</a></li>
    <li class="breadcrumb-item active" aria-current="page">Просмотр договора</li>
  </ol>
</nav>


<div class="row mb-5">

    <div class="col-6">
  


<div class="form-group">
    <label for="institution">Автор</label>
    <p><strong>{{$contract->user->name}}</strong></p>
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
<small><a href="{{route('contract_coordinators_delete', [$user_contract->id])}}">убрать</a></small></li>
@endforeach
</ol>
</div>

<form method="POST" action="{{route('contract_coordinators_store', [$contract->id])}}" class="form-create">
    @csrf
<div class="form-group">
<label for="new_user">Добавить пользователя</label>      
<select class="form-select" id="new_user_id" name="new_user_id" aria-label=".form-select" required>
<option selected="" value="">выбрать</option>
@foreach($users as $item)
<option value="{{$item->id}}">{{$item->name}} ({{$item->institution->name}})</option>
@endforeach
</select>
</div>


<button type="submit" class="btn btn-primary">добавить</button>

  
</form>


</div>



<div class="col-6">


</div>




</div>








@endsection