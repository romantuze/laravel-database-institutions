@extends('layouts.main-layout')

@section('title',$title)

@section('content')


<h1 class="mb-3">{{$title}}</h1>

<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="{{route('dashboard')}}">Панель управления</a></li>
    <li class="breadcrumb-item"><a href="{{route('contracts_lists')}}">Списки</a></li>
    <li class="breadcrumb-item"><a href="{{route('institutions')}}">Учреждения</a></li>
    <li class="breadcrumb-item active" aria-current="page">{{$title}}</li>
  </ol>
</nav>

<div class="row">

<div class="col-6">

<div class="form-box">   

<form method="POST" action="{{route('institution_update', [$institution->id])}}" class="form-create mb-5">
@csrf
 <div class="form-group">
  <label for="institution"><strong>Ответственный исполнитель</strong></label>  
<select class="form-select" id="responsible" name="responsible" aria-label=".form-select" required>
<option selected="" value="">выбрать</option>
@foreach($users_operators as $item)
    @if ($institution->user_id === $item->id)
          <option value="{{$item->id}}" selected="">{{$item->name}} ({{$item->role}})</option>
    @else
          <option value="{{$item->id}}">{{$item->name}} ({{$item->role}})</option>
    @endif
@endforeach
</select>
 </div>
<button type="submit" class="btn btn-primary">выбрать</button>
</form>
</div>

<div class="form-box">
<div class="form-group">
<label for="institution"><strong>Согласующие</strong></label>   
<ol>
@foreach($institution->coordinators_users as $coordinators_user)
<li><strong>{{$coordinators_user->user->name}}</strong>
<small><a href="{{route('institution_delete_user', [$coordinators_user->id])}}">убрать</a></small></li>
@endforeach
</ol>
</div>
</div>

<div class="form-box">
<form method="POST" action="{{route('institution_update', [$institution->id])}}" class="form-create">
    @csrf
<div class="form-group">
<label for="new_user">Добавить согласующего</label>      
<select class="form-select" id="coordinator" name="coordinator" aria-label=".form-select" required>
<option selected="" value="">выбрать</option>
@foreach($users_coordinators as $item)
<option value="{{$item->id}}">{{$item->name}} ({{$item->role}})</option>
@endforeach
</select>
</div>
<button type="submit" class="btn btn-primary">добавить</button>
</form>
</div>



</div>


</div>


</div>

@endsection