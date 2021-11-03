@extends('layouts.main-layout')

@section('title','Редактирование пользователя')

@section('content')




<h1 class="mb-3">Редактирование пользователя {{$user->id}}</h1>

<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="{{route('dashboard')}}">Панель управления</a></li>
    <li class="breadcrumb-item"><a href="{{route('users')}}">Пользователи</a></li>
    <li class="breadcrumb-item active" aria-current="page">Редактирование пользователя</li>
  </ol>
</nav>

<form method="POST" action="/user/update/{{$user->id}}" class="form-create mb-5">
@csrf

<div class="row">

    <div class="col-6">




<div class="form-group">
<label for="name">ФИО</label>
<input type="text" class="form-control" id="name" name="name" value="{{$user->name}}" required>   
</div>

<div class="form-group">
<label for="email">Email</label>
<input type="text" class="form-control" id="email" name="email" value="{{$user->email}}" required>   
</div>


<div class="form-group row">
                              <label for="role" class="col-md-4 col-form-label text-md-right">Роль</label>
                              <div class="col-md-6">
<select class="form-select" id="role" name="role" aria-label=".form-select" required>
<option value="Администратор"  @if ($user->role === "Администратор") selected="" @endif>Администратор</option>
<option value="Согласующий" @if ($user->role === "Согласующий") selected="" @endif>Согласующий</option>
<option value="Оператор" @if ($user->role === "Оператор") selected="" @endif>Оператор</option>
</select>
</div>
</div>



<div class="form-group">
<label for="password">Новый пароль</label>
<input type="password" class="form-control" id="password" name="password" value="">   
</div>

<button type="submit" class="btn btn-primary">обновить</button>

</div>

</div>

</form>






@endsection