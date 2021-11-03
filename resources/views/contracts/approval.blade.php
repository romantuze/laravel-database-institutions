@extends('layouts.main-layout')

@section('title','Список договора на согласовании')

@section('content')



<h1 class="mb-3">Список договора на согласовании</h1>

<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="{{route('dashboard')}}">Панель управления</a></li>
    <li class="breadcrumb-item"><a href="{{route('contracts_approval')}}">Договора</a></li>
  </ol>
</nav>



<form class="form-inline" action="" method="get">
  <div class="form-group form-group-filtr ">
    <label for="institution" class="sr-only">Учреждение</label> 
    <select class="form-select form-select-filtr" id="institution" name="institution" aria-label=".form-select">
<option selected="" value="">выбрать все</option>
@foreach($institutions as $item)    
          <option value="{{$item->id}}"
          @if(isset($_GET["institution"])) @if($_GET["institution"] == $item->id) selected @endif @endif
           >{{$item->name}}</option>   
@endforeach
</select>
  </div>
  <div class="form-group form-group-filtr mx-sm-3">
    <label for="type_contract" class="sr-only">Вид договора</label> 
    <select class="form-select form-select-filtr" id="type_contract" name="type_contract" aria-label=".form-select">
    <option selected="" value="">выбрать все</option>
    @foreach($type_contracts as $item)
        <option value="{{$item->name}}" 
        @if(isset($_GET["type_contract"]))  @if($_GET["type_contract"] === $item->name) selected @endif @endif
          >{{$item->name}}</option>   
    @endforeach
    </select>
  </div>


  <div class="form-group  form-group-filtr mx-sm-3 ">
    <label for="date" class="sr-only">Дата</label> 
    <input type="date" class="form-control form-select-input" id="contract_date" name="contract_date" 
    @if(isset($_GET["contract_date"])) value="{{$_GET['contract_date']}}" @endif
    />
  </div>


  <div class="form-group form-group-filtr mx-sm-3 ">
    <label for="revision" class="sr-only">Доработка</label> 
    <select class="form-select form-select-filtr" id="revision" name="revision" aria-label=".form-select">
      <option selected="" value="">выбрать все</option>
              <option value="0" 
              @if(isset($_GET["revision"]))  @if($_GET["revision"] === "0") selected @endif @endif
              >нет</option>     
              <option value="1"
              @if(isset($_GET["revision"]))  @if($_GET["revision"] === "1") selected @endif @endif
              >да</option>    
    </select>
  </div>


  <button type="submit" class="btn btn-primary mb-2">фильтр</button>
</form>


<table class="table">
<tr>
<th>id</th>
<th>Учреждение</th>
<th>Название мероприятия</th>
<th>Вид договора</th>
<th>Дата</th>
<th>Доработка</th>

<th>Исполнитель</th>
<th>Создан</th>

<th></th>
</tr>



@if ($contracts->isEmpty())
<tr class="card-body"> 
<td colspan="8"> <p>не найдено</p></td>
</tr>
@endif



    @foreach($contracts as $contract)
        <tr class="card-body">
            <td>{{$contract->id}}</td>

            <td>{{$contract->institution->name}}</td>

             <td>{{$contract->event_title}}</td>
            <td>{{$contract->type_contract}}</td>
    
             <td>{{date('d.m.Y', strtotime($contract->contract_date))}}</td>             

             <td>  
                @if ($contract->revision === 1)
                  <small>да</small>
                @else
                  <small>нет</small>
                @endif  
            </td>
            <td> </td> 
             <td>  
               <small>{{date('d.m.Y h:i', strtotime($contract->created_at))}}</small><br>
               <small>{{$contract->user->name}}</small>
             
            </td>            
            <td>
               <div class="table-buttons">
                <a href="{{route('contract_show', [$contract->id])}}" class="btn btn-success btn-sm">просмотр</a><br>
                <a href="{{route('contract_edit', [$contract->id])}}" class="btn btn-primary btn-sm">изменить</a><br>
                @if ($is_admin)<a href="{{route('contract_delete', [$contract->id])}}" class="btn btn-danger btn-sm">удалить</a> @endif  
              </div>
            </td>
        </tr>   
    @endforeach
</table>

 {{$contracts->links('vendor.pagination.bootstrap-4')}}






@endsection