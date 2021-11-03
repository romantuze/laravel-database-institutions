@extends('layouts.main-layout')

@section('title','Список пользователей')

@section('content')



<h1 class="mb-3">Список пользователей</h1>

<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="{{route('dashboard')}}">Панель управления</a></li>
    <li class="breadcrumb-item"><a href="{{route('users')}}">Пользователи</a></li>
  </ol>
</nav>

<p><a class="btn btn-primary" href="{{ route('register') }}">Регистрация нового пользователя</a></p>

<table class="table">
<tr>
<td>id</td>
<td>имя</td>
<td>email</td>
<td>роль</td>

<td></td>
</tr>
    @foreach($users as $user)

        <tr class="card-body">
            <td>{{$user->id}}</td>
            <td>{{$user->name}}</td>
            <td>{{$user->email}}</td>
            <td>{{$user->role}}</td>  
     
            <td>               
                <a href="{{route('user_edit', [$user->id])}}" class="btn btn-primary btn-sm">редактировать</a>
               <a href="{{route('user_delete', [$user->id])}}" class="btn btn-danger btn-sm">удалить</a>
            </td>
        </tr>

    @endforeach
</table>

 {{$users->links('vendor.pagination.bootstrap-4')}}





@endsection