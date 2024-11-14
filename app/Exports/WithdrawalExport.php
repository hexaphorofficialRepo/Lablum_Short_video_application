<?php

namespace App\Exports;

use App\Models\Withdrawl;
use Maatwebsite\Excel\Concerns\FromCollection;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Schema;

class WithdrawalExport implements FromCollection
{
    protected $withdrawals;

    public function __construct(Collection $withdrawals)
    {
        $this->withdrawals = $withdrawals;
    }       

    public function collection()
    {
        return $this->withdrawals;
    }

    public function headings(): array
    {
        $columns = Schema::getColumnListing((new Withdrawl())->getTable());
        
        // Define the headings for the columns you want to include
        $headings = [
            'id' => 'ID',
            'order_id' => 'ORDER ID',
            'user_id' => 'USER ID',
            'user_name' => 'USER NAME', // New heading for user name
            'user_email' => 'USER EMAIL',
            'user_phone' => 'USER MOBILE NUMBER',
            'wallet_id' => 'WALLET ID',
            'previous_wallet_amount' => 'PREVIOUS AMOUNT',
            'transfer_amount' => 'TRANSFER AMOUNT',
            'new_wallet_amount' => 'UPDATED WALLET AMOUNT',
            'created_at' => 'TRANSACTION DATE', 
        ];

        return array_intersect_key($headings, array_flip($columns));
    }

    public function map($withdrawal): array
    {
        return [
            'id' => $withdrawal->id,
            'order_id' => $withdrawal->order_id,
            'user_id' => $withdrawal->user_id,
            'user_name' => $withdrawal->user->fname . ' ' . $withdrawal->user->lname,
            'user_email' => $withdrawal->user->email,
            'user_phone' => $withdrawal->user->mobile,
            'wallet_id' => $withdrawal->wallet_id,
            'previous_wallet_amount' => $withdrawal->previous_wallet_amount,
            'transfer_amount' => $withdrawal->transfer_amount,
            'new_wallet_amount' => $withdrawal->new_wallet_amount,
            'created_at' => $withdrawal->created_at,
        ];
    }
}
