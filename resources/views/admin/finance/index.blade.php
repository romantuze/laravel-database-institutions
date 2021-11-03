@extends('layouts.main-layout')

@section('title',$title)

@section('content')

<h1 class="mb-3">{{$title}}</h1>
<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="{{route('dashboard')}}">Панель управления</a></li>
    <li class="breadcrumb-item"><a href="{{route('contracts_lists')}}">Списки</a></li>
    <li class="breadcrumb-item active" aria-current="page">{{$title}}</li>
  </ol>
</nav>
<div class="row">
<div class="col-12"> 
<div class="page">

<form method="POST" action="{{route('finance_store')}}" class="form-create mb-5" enctype="multipart/form-data">
@csrf
<div class="form-group"><input type="text" class="form-control" name="finance_new" value="" placeholder="добавить новое">  </div>
<button type="submit" class="btn btn-primary">добавить</button>
</form>
<div class="box">
<table class="table">
<tr>
<th>id</th>
<th>название</th>
<th></th>
</tr>
@foreach($items as $item)
<tr>
<td>{{$item->id}}</td>
<td>{{$item->name}}</td>
<td>
<a href="{{route('finance_delete', [$item->id])}}" class="btn btn-danger btn-sm">удалить</a> 
</td>
</tr>
@endforeach
</table>
{{$items->links('vendor.pagination.bootstrap-4')}}
</div>
</div>
</div>
@endsection