<?php

// app/Console/Commands/DeductGst.php

namespace App\Console\Commands;

use App\Models\Wallet;
use Illuminate\Console\Command;
use App\Models\Gst;
use App\Models\UserWallet;
use App\Models\Withdrawl;
use Illuminate\Support\Carbon;

class DeductGst extends Command
{
    protected $signature = 'gst:deduct';
    protected $description = 'Deduct GST from user wallets at the end of each month';

    public function __construct()
    {
        parent::__construct();
    }

    public function handle()
    {
        $gst = Gst::where('payment_for', '3')->first();

        if ($gst) {
            $taxPercentage = $gst->tax_percentage;

            $wallets = Wallet::where('tax_status', 0)->get();

            foreach ($wallets as $wallet) {
                $amountToDeduct = $wallet->balance * ($taxPercentage / 100);
                $previousWalletAmount = $wallet->balance;
                $newWalletAmount = $wallet->balance - $amountToDeduct;

                // Update wallet balance and tax status
                $wallet->balance = $newWalletAmount;
                $wallet->tax_status = 1;
                $wallet->save();

                // Store the withdrawal record
                Withdrawl::create([
                    'order_id' => null, // Assuming no order_id for GST deductions
                    'user_id' => $wallet->user_id,
                    'wallet_id' => $wallet->id,
                    'transfer_amount' => $amountToDeduct,
                    'previous_wallet_amount' => $previousWalletAmount,
                    'new_wallet_amount' => $newWalletAmount,
                    'type' => 1
                ]);
            }
        }

        $this->info('GST deducted and records stored successfully.');
    }
}
