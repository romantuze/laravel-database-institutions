@extends('layouts.main-layout')

@section('title',"Реестр договоров контрактов")

@section('content')
<div class="mt-4">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <h1 class="card-header">{{ __('Реестр договоров контрактов') }}</h1>
  
                <div class="card-body">
                    @if (Session::get('success'))
                        <div class="alert alert-success" role="alert">
                            {{ Session::get('success') }}
                        </div>
                    @endif
  
                    @if ($is_admin || $is_operator) 
                    <div class="main-button"><a href="{{route('contract_create')}}" class="btn btn-success">Создание договора</a></div>
                    <hr />
                    @endif
                    <div class="main-button"><a href="{{route('contracts_approval')}}" class="btn btn-success">Согласование</a></div>
                    <hr />
                    <div class="main-button"><a href="{{route('contracts_approved')}}" class="btn btn-success">Утвержденные</a></div>
                    <hr />
                     @if ($is_admin) 
                    <div class="main-button"><a href="{{route('contracts_lists')}}"  class="btn btn-success">Списки</a></div>
                    <hr />
                    @endif
                     @if ($is_admin)
                    <div class="main-button"><a href="{{route('users')}}"  class="btn btn-success">Пользователи</a></div>
                    <hr />
                    @endif

                    <p>Вы вошли как: {{$current_user->name}}</p>
                    <div class="main-button"><a href="{{route('logout')}}"  class="btn btn-success">Выход</a></div>



                </div>
            </div>
        </div>
    </div>
</div>
@endsection