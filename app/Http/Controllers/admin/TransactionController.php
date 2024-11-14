<?php

namespace App\Http\Controllers\admin;

use App\Exports\PaymentsExport;
use Maatwebsite\Excel\Facades\Excel;
use App\Http\Controllers\Controller;
use App\Models\Payment;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;


class TransactionController extends Controller
{
    // public function showAddtransaction(){
    //     $payments = Payment::latest()->get();
    //     return view('admin.transaction.advertisment',compact('payments'));
    // }


    public function showAddtransaction(Request $request){
        // Initialize query builder
        $query = Payment::query();
    
        // Check if today's date is selected
        if ($request->has('date') && $request->date === Carbon::today()->toDateString()) {
            // Filter by today's date
            $query->whereDate('created_at', Carbon::today());
        } elseif ($request->has('start_date') && $request->has('end_date')) {
            // Filter by date range if start and end dates are provided
            $start_date = $request->start_date;
            $end_date = $request->end_date;
            $query->whereBetween('created_at', [$start_date, $end_date]);
        }
    
        // Get filtered payments
        $payments = $query->latest()->get();
    
        return view('admin.transaction.advertisment', compact('payments'));
    }


    
    // public function downlodAddpayment()
    // {
    //     $payments = Payment::latest()->get();
    //     return Excel::download(new PaymentsExport($payments), 'payments.xlsx');
    // }
    public function downloadToday()
{
    $payments = Payment::whereDate('created_at', Carbon::today())->get();
    return Excel::download(new PaymentsExport($payments), 'transactions_today.xlsx');
}
    
public function downloadByDate(Request $request)
{
    $startDate = $request->start_date;
    $endDate = $request->end_date;

    // Retrieve payments within the date range
    $payments = Payment::whereBetween('created_at', [$startDate, $endDate])->get();

    // Download the payments as an Excel file
    return Excel::download(new PaymentsExport($payments), 'transactions_' . $startDate . '_to_' . $endDate . '.xlsx');
}


    
}
