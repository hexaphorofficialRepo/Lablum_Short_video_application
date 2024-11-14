<?php

namespace App\Http\Controllers;

use App\Models\Officialpayment;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;

class OfficialpaymentController extends Controller
{
    public function create($id, $amount) {
       
        $user = User::where('user_id', $id)->first();
        return view('verification_payments',compact('user','amount'));

    }

    public function store(Request $request) {
    
        $officialpayment = new Officialpayment();
    
       
        $officialpayment->user_id = $request->input('user_id');
        $officialpayment->name = $request->input('name');
        $officialpayment->email = $request->input('email');
        $officialpayment->phone = $request->input('mobile');
        $officialpayment->amount = $request->input('amount');
        $officialpayment->currency = 'INR'; 
        $officialpayment->method = 'Razorpay'; 
        $officialpayment->razorpay_payment_id = $request->input('razorpay_payment_id');
     
    
    
        $officialpayment->save();
    
       $deepLinkUrl = 'https://lablum.com/home'; // Replace 'yourapp' with your actual app URL scheme

    return redirect()->route('payment.success')->with('success', 'Payment stored successfully.');
    }


    public function showOfficial(){
        $officialpayments = Officialpayment::latest()->get();
        return view('admin.transaction.official',compact('officialpayments'));
    }


    public function showpayment($user_id){
        $officialpayments = Officialpayment::where('user_id',$user_id)->get();
        return view('admin.transaction.official',compact('officialpayments'));
    }

    public function showOfficialtransaction(Request $request){
        // Initialize query builder
        $query = Officialpayment::query();
    
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
        $officialpayments = $query->latest()->get();
    
        return view('admin.transaction.official', compact('officialpayments'));
    }


    
    
//     public function downloadToday()
// {
//     $payments = Payment::whereDate('created_at', Carbon::today())->get();
//     return Excel::download(new PaymentsExport($payments), 'transactions_today.xlsx');
// }
    
// public function downloadByDate(Request $request)
// {
//     $startDate = $request->start_date;
//     $endDate = $request->end_date;

//     // Retrieve payments within the date range
//     $payments = Payment::whereBetween('created_at', [$startDate, $endDate])->get();

//     // Download the payments as an Excel file
//     return Excel::download(new PaymentsExport($payments), 'transactions_' . $startDate . '_to_' . $endDate . '.xlsx');
// }


}
