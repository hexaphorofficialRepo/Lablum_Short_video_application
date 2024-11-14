<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class Addinvoice extends Mailable
{
    use Queueable, SerializesModels;

    public $invoiceView;
    public $payment;
    public $additional_tax_details;
    public $invoiceNumber;

    public function __construct($invoiceView, $payment,$invoiceNumber,$additional_tax_details)
    {
        $this->invoiceView = $invoiceView;
        $this->additional_tax_details = $additional_tax_details;
        $this->payment = $payment;
        $this->invoiceNumber = $invoiceNumber;
    }

    public function build()
    {
        return $this->view('frontend.adds.invoice')
                    ->with([
                        'invoiceView' => $this->invoiceView,
                        'payment' => $this->payment,
                        'additional_tax_details' => $this->additional_tax_details,
                        'invoiceNumber' => $this->invoiceNumber,
                    ]);
    }
    
}
