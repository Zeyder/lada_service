<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', 'IndexController@index')->name('index');

Route::get('/administrator', 'AdminController@index')->name('adminka');
Route::get('/administrator/logout', 'AdminController@logout')->name('logout');
Route::post('/administrator/login', 'AdminController@login')->name('login');

Route::group(['prefix' => 'api/v1'], function(){
    Route::resource('/fines', 'FineController', ['only' => ['store', 'update', 'index']]);
    Route::get('/archives', 'FineController@archives');
    Route::get('/fines/search/{state_number}', 'FineController@search');
    Route::post('/users', 'Auth\RegisterController@register');
    Route::resource('/token_number', 'TokenNumberController');
});


Route::get('/home', 'HomeController@index')->name('home');
