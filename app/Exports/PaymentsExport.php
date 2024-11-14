<?php

namespace App\Exports;

use App\Models\Payment;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class PaymentsExport implements FromCollection, WithHeadings
{
    protected $payments;

    public function __construct(Collection $payments)
    {
        $this->payments = $payments;
    }

    public function collection()
    {
        return $this->payments;
    }

    public function headings(): array
    {
    
        $columns = Schema::getColumnListing((new Payment())->getTable());
        
        // Define the headings for the columns you want to include
        $headings = [
            'id' => 'ID',
            'r_payment_id' => 'Transaction ID',
            'advertiser_id' => 'ADVERTISER ID',
            'addplan_id' => 'PLAN ID',
            'invoice_number' => 'INVOICE NUMBER',
            'prefill_name' => 'PREFILL NAME',
            'prefill_email' => 'PREFILL EMAIL',
            'prefill_mobile' => 'MOBILE',
            'method' => 'PAYMENT METHOD',
            'currency' => 'CURRENCY',
            'advertisment_coast' => 'ADVERTISMENT COAST',
            'gst_amount' => 'GST AMOUNT',
            'additional_tax_amounts' => 'ADDITIONAL TAXES',
            'amount' => 'TOTAL AMOUNT',
            'created_at' => 'PAYMENT DATE',
            'user_email' => 'USER EMAIL',
           
        ];

      
        return array_intersect_key($headings, array_flip($columns));
    }
}
