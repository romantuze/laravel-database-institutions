@extends('layouts.main-layout')

@section('title','Реестр договоров контрактов')

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
  
@guest

<div class="main-button"><a class="btn btn-primary" href="{{ route('login') }}">Вход</a></div>
<hr />
<div class="main-button"><a class="btn btn-primary" href="{{ route('register') }}" >Регистрация</a></div>


@else


<div class="main-button"><a href="{{route('dashboard')}}" class="btn btn-primary">панель управления</a></div>
<hr />
<div class="main-button"><a href="{{route('logout')}}" class="btn btn-primary">выход</a></div>


@endguest






                </div>
            </div>
        </div>
    </div>
</div>




@endsection