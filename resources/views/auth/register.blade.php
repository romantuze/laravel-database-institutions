@extends('layouts.main-layout')

@section('title',"")

@section('content')
<div class="mt-4 register-form">
  <div class="container">
      <div class="row justify-content-center">
          <div class="col-md-8">
              <div class="card">
                  <h2 class="card-header">Регистрация</h2>
                  <div class="card-body">
  
                      <form action="{{ route('register.post') }}" method="POST">
                          @csrf
                          <div class="form-group row">
                              <label for="name" class="col-md-4 col-form-label text-md-right">ФИО</label>
                              <div class="col-md-6">
                                  <input type="text" id="name" class="form-control" name="name" required />
                                  @if ($errors->has('name'))
                                      <span class="text-danger">{{ $errors->first('name') }}</span>
                                  @endif
                              </div>
                          </div>

  
                          <div class="form-group row">
                              <label for="email_address" class="col-md-4 col-form-label text-md-right">Email</label>
                              <div class="col-md-6">
                                  <input type="text" id="email_address" class="form-control" name="email" required />
                                  @if ($errors->has('email'))
                                      <span class="text-danger">{{ $errors->first('email') }}</span>
                                  @endif
                              </div>
                          </div>


                          
  
                          <div class="form-group row">
                              <label for="password" class="col-md-4 col-form-label text-md-right">Пароль</label>
                              <div class="col-md-6">
                                  <input type="password" id="password" class="form-control" name="password" required />
                                  @if ($errors->has('password'))
                                      <span class="text-danger">{{ $errors->first('password') }}</span>
                                  @endif
                              </div>
                          </div>

                          <div class="form-group row">
                              <label for="role" class="col-md-4 col-form-label text-md-right">Роль</label>
                              <div class="col-md-6">
                                  <select class="form-select" id="role" name="role" aria-label=".form-select" required>
                                  <option selected="" value="">выбрать</option>
                                  <option value="Администратор">Администратор</option>
                                  <option value="Согласующий">Согласующий</option>
                                  <option value="Оператор">Оператор</option>
                                  </select>                                  
                                  @if ($errors->has('role'))
                                      <span class="text-danger">{{ $errors->first('role') }}</span>
                                  @endif
                              </div>
                          </div>
                          

  
                          <div class="col-md-6 offset-md-4">
                              <button type="submit" class="btn btn-primary">
                                  регистрация
                              </button>
                          </div>
                      </form>
                        
                  </div>
              </div>
          </div>
      </div>
  </div>
</div>
@endsection