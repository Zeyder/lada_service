<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Fine extends Model
{
    protected $hidden = ['updated_at', 'created_at'];

    public static function getAll($archive = 0){
        return self::where('archive', $archive)
                ->join('users', 'users.id', '=', 'fines.id_user')
                ->select('fines.*', 'users.full_name as responsible')
                ->orderBy('id', 'desc')
                ->get();
    }
}
