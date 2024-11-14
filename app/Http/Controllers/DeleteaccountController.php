<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class DeleteaccountController extends Controller
{
    public function accountDelete(){
        return view('delete_account');
    }
}
