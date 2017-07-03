<?php

namespace App\Http\Controllers;

use App\Models\TokenNumber;
use Illuminate\Http\Request;

class TokenNumberController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
            $token = new TokenNumber();
            $token->number = $obj['number'];
            $token->save();
            return $token->id;
        }
        return response()->json([
            'code' => 400,
            'error' => 'Error! Request fields are empty or invalid'
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\TokenNumber  $tokenNumber
     * @return \Illuminate\Http\Response
     */
    public function show(TokenNumber $tokenNumber)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\TokenNumber  $tokenNumber
     * @return \Illuminate\Http\Response
     */
    public function edit(TokenNumber $tokenNumber)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\TokenNumber  $tokenNumber
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, TokenNumber $tokenNumber)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\TokenNumber  $tokenNumber
     * @return \Illuminate\Http\Response
     */
    public function destroy(TokenNumber $tokenNumber)
    {
        if ($tokenNumber != ''){
            $token = TokenNumber::find($tokenNumber->id);
            $token->delete();
            return 'Ok';
        }
        return response()->json([
            'code' => 400,
            'error' => 'Error!'
        ]);
    }
}
