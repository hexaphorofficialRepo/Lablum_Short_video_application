<?php

namespace App\Http\Controllers\user;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Wallet;
use App\Models\Withdrawl;
use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Log;

class WithdrawlController extends Controller
{


 

    // public function storeWithdrawal(Request $request)
    // {
    //     $validator = Validator::make($request->all(), [
    //         'order_id' => 'required|unique:withdrawls',
    //         'user_id' => 'required|exists:users,user_id',
    //         'wallet_id' => 'required|exists:wallets,id',
    //         'transfer_amount' => 'required',
    //         'previous_wallet_amount' => 'required',
    //         'new_wallet_amount' => 'required',   
    //     ], [
    //         'order_id.required' => 'Order ID is required.',
    //         'order_id.unique' => 'Order ID must be unique.',
    //         'user_id.required' => 'User ID is required.',
    //         'user_id.exists' => 'User ID does not exist.',
    //         'wallet_id.required' => 'Wallet ID is required.',
    //         'wallet_id.exists' => 'Wallet ID does not exist.',
    //         'transfer_amount.required' => 'Transfer amount is required.',
    //         'previous_wallet_amount.required' => 'Previous wallet amount is required.',
    //         'new_wallet_amount.required' => 'New wallet amount is required.',
    //     ]);
        
    //     if ($validator->fails()) {
    //         return response()->json(['status' => 'error', 'msg' => $validator->errors()->first()], 400);
    //     }
    
     
    //     $withdrawal = new Withdrawl([
    //         'order_id' => $request->input('order_id'),
    //         'user_id' => $request->input('user_id'),
    //         'wallet_id' => $request->input('wallet_id'),
    //         'transfer_amount' => $request->input('transfer_amount'),
    //         'previous_wallet_amount' => $request->input('previous_wallet_amount'),
    //         'new_wallet_amount' => $request->input('new_wallet_amount'),
    //     ]);
    
    //     // Save the withdrawal
    //     $withdrawal->save();
    
    //     // Update wallet points
    //     $wallet = Wallet::findOrFail($request->input('wallet_id'));
    //     $wallet->points = $request->input('new_wallet_amount');
    //     $wallet->save();
    

    //     $wallet->increment('withdrawal_count'); 
    //     $wallet->last_withdrawal_date = Carbon::now(); 
    //     $wallet->next_withdrawal_date = Carbon::now()->addMonths(3); 
    //     $wallet->withdraw_status = 0; 
    

    //     $wallet->save();
    
    //     return response()->json(['status' => 'success', 'msg' => 'Withdrawal created successfully.'], 200);
    // }



public function storeWithdrawal(Request $request)
{
    try {
        // Start logging user action
        \Log::info('Withdrawal process started for user.', ['user_id' => $request->input('user_id')]);

        // Validation
        $validator = Validator::make($request->all(), [
            'order_id' => 'required|unique:withdrawls',
            'user_id' => 'required|exists:users,user_id',
            'wallet_id' => 'required|exists:wallets,id',
            'transfer_amount' => 'required|numeric|min:0',
            'previous_wallet_amount' => 'required|numeric|min:0',
            'previous_net_amount' => 'required|numeric|min:0',
        ]);

        if ($validator->fails()) {
            \Log::warning('Validation failed for user withdrawal.', [
                'user_id' => $request->input('user_id'),
                'errors' => $validator->errors()->first()
            ]);
            return response()->json(['status' => 'error', 'msg' => $validator->errors()->first()], 400);
        }

        $wallet = Wallet::findOrFail($request->input('wallet_id'));
        \Log::info('Wallet found for user.', ['wallet_id' => $wallet->id, 'user_id' => $request->input('user_id')]);

        // Check if transfer amount is greater than net amount
        if ($request->input('transfer_amount') > $wallet->net_amount) {
            \Log::warning('Transfer amount exceeds available net amount.', [
                'user_id' => $request->input('user_id'),
                'transfer_amount' => $request->input('transfer_amount'),
                'net_amount' => $wallet->net_amount
            ]);
            return response()->json(['status' => 'error', 'msg' => 'Transfer amount exceeds available net amount.'], 400);
        }

        // Calculate total deduction
        $transferAmount = $request->input('transfer_amount');
        $totalDeduction = $transferAmount + $wallet->gst_amount + $wallet->additional_tax_amount;

        // Ensure the total deduction does not exceed wallet points
        if ($totalDeduction > $wallet->points) {
            \Log::warning('Total deduction exceeds available wallet points.', [
                'user_id' => $request->input('user_id'),
                'total_deduction' => $totalDeduction,
                'wallet_points' => $wallet->points
            ]);
            return response()->json(['status' => 'error', 'msg' => 'Total deduction exceeds available wallet points.'], 400);
        }

        // Log wallet deduction details
        \Log::info('Wallet deduction calculated.', [
            'user_id' => $request->input('user_id'),
            'total_deduction' => $totalDeduction,
            'wallet_points_before' => $wallet->points,
            'wallet_net_amount_before' => $wallet->net_amount
        ]);

        // Update wallet points and net amount
        $wallet->points -= $totalDeduction;
        $wallet->net_amount -= $transferAmount;
        $wallet->save();

        // Log successful wallet update
        \Log::info('Wallet updated after withdrawal.', [
            'user_id' => $request->input('user_id'),
            'new_wallet_points' => $wallet->points,
            'new_net_amount' => $wallet->net_amount
        ]);

        // Create the withdrawal
        $withdrawal = new Withdrawl([
            'order_id' => $request->input('order_id'),
            'user_id' => $request->input('user_id'),
            'wallet_id' => $request->input('wallet_id'),
            'transfer_amount' => $transferAmount,
            'previous_wallet_amount' => $request->input('previous_wallet_amount'),
            'previous_net_amount' => $request->input('previous_net_amount'),
            'new_net_amount' => $wallet->net_amount,
            'new_wallet_amount' => $wallet->points,
        ]);

        // Save the withdrawal
        $withdrawal->save();

        // Update withdrawal count and dates
        $wallet->increment('withdrawal_count');
        $wallet->last_withdrawal_date = Carbon::now();
        $wallet->next_withdrawal_date = Carbon::now()->addMonths(6);
        $wallet->withdraw_status = 0;
        $wallet->save();

        \Log::info('Withdrawal successfully created.', [
            'user_id' => $request->input('user_id'),
            'order_id' => $request->input('order_id'),
            'transfer_amount' => $transferAmount
        ]);

        return response()->json(['status' => 'success', 'msg' => 'Withdrawal created successfully.'], 200);

    } catch (\Exception $e) {
        // Log the exception details for debugging
        \Log::error('Error during withdrawal process.', [
            'user_id' => $request->input('user_id'),
            'error_message' => $e->getMessage(),
            'file' => $e->getFile(),
            'line' => $e->getLine()
        ]);

        // Return detailed error in the response (useful for debugging)
        return response()->json([
            'status' => 'error',
            'msg' => 'An error occurred while processing your request.',
            'error' => [
                'message' => $e->getMessage(),  // The actual error message
                'file' => $e->getFile(),        // The file where the error occurred
                'line' => $e->getLine(),        // The line number of the error
                'trace' => $e->getTraceAsString() // Stack trace of the error
            ]
        ], 500);
    }
}







    
    public function getUserWithdrawalHistory($user_id)
    {
        try {
      
            if (!User::where('user_id', $user_id)->exists()) {
                return response()->json(['status' => 'error', 'message' => 'User not found.'], 404);
            }
    
          
            $withdrawals = Withdrawl::where('user_id', $user_id)->get();
            if ($withdrawals->isEmpty()) {
                return response()->json(['status' => 'error', 'message' => 'You don\'t have any withdrawal history yet.'], 404);
            }
    
          
            $formattedWithdrawals = $withdrawals->map(function ($withdrawal) {
                return [
                    'order_id' => $withdrawal->order_id,
                    'transfer_amount' => $withdrawal->transfer_amount,
                    'previous_wallet_amount' => $withdrawal->previous_wallet_amount,
                    'new_wallet_amount' => $withdrawal->new_wallet_amount,
                    'withdrawal_date' => $withdrawal->created_at->format('jS F Y'),
                ];
            });
    
           
            return response()->json(['status' => 'success', 'data' => $formattedWithdrawals], 200);
        } catch (\Exception $e) {
         
            return response()->json(['status' => 'error', 'message' => 'Failed to retrieve withdrawal history.', 'error' => $e->getMessage()], 500);
        }
    }
    


   
}
