<?php

namespace App\Http\Controllers\Auth;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;

class UserController extends Controller
{
    public function update(Request $request, User $user)
    {
        
        $data = $request->all();
        $user->full_name = $data['full_name'];
        $user->role = $data['role'];
        if (isset($data['password']) && isset($data['password_confirmation'])){
            if ($data['password'] == $data['password_confirmation']){
                $user->password = bcrypt($data['password']);
                $user->password_confirmed = bcrypt($data['password_confirmation']);
            }
        }
        $user->save();
        return response()->json($user);
    }

    public function destroy(User $user)
    {
        return User::where(['id' => $user['id']])->delete();
    }
}
