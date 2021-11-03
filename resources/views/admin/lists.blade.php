@extends('layouts.main-layout')

@section('title','Списки')

@section('content')




<h1 class="mb-3">Списки</h1>


<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="{{route('dashboard')}}">Панель управления</a></li>
    <li class="breadcrumb-item active" aria-current="page">Списки</li>
    <li class="breadcrumb-item active" aria-current="page">Учреждения</li>
  </ol>
</nav>



<div class="row">

<div class="col-6">
  






<div class="main-button"><a href="{{route('institutions')}}" class="btn btn-success">Учреждения</a></div>
<hr />


<div class="main-button"><a href="{{route('type_contract')}}" class="btn btn-success">Вид договора</a></div>
<hr />

<div class="main-button"><a href="{{route('basis')}}" class="btn btn-success">Основание для заключения</a></div>
<hr />

<div class="main-button"><a href="{{route('contractor')}}" class="btn btn-success">Контрагент</a></div>
<hr />

<div class="main-button"><a href="{{route('kosgu')}}" class="btn btn-success">КОСГУ</a></div>
<hr />

<div class="main-button"><a href="{{route('finance')}}" class="btn btn-success">Источник финансирования</a></div>
<hr />

<!--<div class="main-button"><a href="{{route('responsible_executor')}}" class="btn btn-success">Ответственнный исполнитель</a></div>
<hr />-->













</div>







</div>








@endsection