@extends('layouts.main-layout')

@section('title','Список договора утверждены')

@section('content')



<h1 class="mb-3">Список договора утверждены</h1>

<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="{{route('dashboard')}}">Панель управления</a></li>
    <li class="breadcrumb-item"><a href="{{route('contracts_approved')}}">Договора</a></li>
  </ol>
</nav>






<form class="form-inline" action="" method="get">
  <div class="form-group form-group-filtr ">
    <label for="institution" class="sr-only">Учреждение</label> 
    <select class="form-select form-select-filtr" id="institution" name="institution" aria-label=".form-select">
<option selected="" value="">выбрать все</option>
@foreach($institutions as $item)    
          <option value="{{$item->name}}"
          @if(isset($_GET["institution"])) @if($_GET["institution"] === $item->name) selected @endif @endif
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

  <button type="submit" class="btn btn-primary mb-2">фильтр</button>
</form>



<table class="table">
<tr>
<th>id</th>
<th>Учреждение</th>
<th>Название мероприятия</th>
<th>Вид договора</th>
<th>Дата</th>

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

            <td>{{$contract->institution}}</td>

             <td>{{$contract->event_title}}</td>
            <td>{{$contract->type_contract}}</td>
    
             <td>{{$contract->contract_date}}</td>             

     
             <td>  
               <small>{{$contract->created_at}}</small><br>
               <small>
                 @if (isset($contract->user->name))
                {{$contract->user->name}}
                @endif  
                </small>               
            </td>            
            <td>
               <div>
                 <!--<a href="{{route('contract_show', [$contract->id])}}" class="btn btn-success btn-sm">просмотр</a><br>-->
                <a href="{{route('contract_edit', [$contract->id])}}" class="btn btn-primary btn-sm">открыть</a><br>              
              </div>
            </td>
        </tr>   
    @endforeach
</table>

 {{$contracts->links('vendor.pagination.bootstrap-4')}}







@endsection