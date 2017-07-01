<?php

namespace App\Http\Controllers;

use App\Models\Fine;
use App\User;
use Illuminate\Http\Request;

class FineController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return response()->json(Fine::getAll());
    }

    public function archives(){
        return response()->json(Fine::getAll(1));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if (count($obj = $request->all()) != 0){
            $fine = new Fine();
            $fine->model = $obj['model'];
            $fine->state_number = $obj['state_number'];
            $fine->token_number = $obj['token_number'];
            $fine->id_user = $obj['id_user'];
            if ($obj['date_parking'] != ''){
                $fine->date_parking = $obj['date_parking'];
            }
            if ($obj['date_end'] != ''){
                $fine->date_end = $obj['date_end'];
            }
            $fine->date_start = $obj['date_start'];
            $fine->save();
            return $fine->id;
        }
        return response()->json([
            'code' => 400,
            'error' => 'Error! Request fields are empty or invalid'
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Fine  $fine
     * @return \Illuminate\Http\Response
     */
    public function show(Fine $fine)
    {
        
    }

    public function search($state_number){
        $dbh = Fine::where(['state_number' => $state_number, 'archive' => 0]);
        if ($dbh->count() > 0){
            return response()->json($dbh->first(), 200);
        }else{
            return response()->json([
                'code' => 404,
                'error' => 'Object not found'
            ], 404);
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Fine  $fine
     * @return \Illuminate\Http\Response
     */
    public function edit(Fine $fine)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Fine  $fine
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Fine $fine)
    {
        $obj = $request->all();
        $fine->model = $obj['model'];
        $fine->state_number = $obj['state_number'];
        $fine->token_number = $obj['token_number'];
        $fine->id_user = $obj['id_user'];
        $fine->archive = $obj['archive'];
        if ($obj['date_parking'] != ''){
            $fine->date_parking = $obj['date_parking'];
        }
        if ($obj['date_end'] != ''){
            $fine->date_end = $obj['date_end'];
        }
        $fine->date_start = $obj['date_start'];
        $fine->save();
        return response()->json($fine);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Fine  $fine
     * @return \Illuminate\Http\Response
     */
    public function destroy(Fine $fine)
    {
        //
    }
}
