<?php

namespace App\Http\Controllers\admin;

use App\Exports\WithdrawalExport;
use App\Http\Controllers\Controller;
use App\Models\Withdrawl;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Maatwebsite\Excel\Facades\Excel;

class UserwithdrawlController extends Controller
{
    // public function showWithdrawal(){
    //     $withdrawals = Withdrawl::latest()->get();
    //     return view('admin.withdrawal.index',compact('withdrawals'));
    // }



    public function showWithdrawal(Request $request){
        
        $query = Withdrawl::query();
    
       
        if ($request->has('date') && $request->date === Carbon::today()->toDateString()) {
          
            $query->whereDate('created_at', Carbon::today());
        } elseif ($request->has('start_date') && $request->has('end_date')) {
           
            $start_date = $request->start_date;
            $end_date = $request->end_date;
            $query->whereBetween('created_at', [$start_date, $end_date]);
        }
    
       
        $withdrawals = $query->latest()->get();
    
        return view('admin.withdrawal.index', compact('withdrawals'));
    }
    public function downloadToday()
    {
        $withdrawals = Withdrawl::whereDate('created_at', Carbon::today())->get();
        return Excel::download(new WithdrawalExport($withdrawals), 'withdrawal_today.xlsx');
    }
        
    public function downloadByDate(Request $request)
    {
        $startDate = $request->start_date;
        $endDate = $request->end_date;
    
        // Retrieve payments within the date range
        $withdrawals = Withdrawl::whereBetween('created_at', [$startDate, $endDate])->get();
    
        // Download the payments as an Excel file
        return Excel::download(new WithdrawalExport($withdrawals), 'withdrawal_' . $startDate . '_to_' . $endDate . '.xlsx');
    }

}
