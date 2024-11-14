<?php

namespace App\Http\Controllers;

use App\Models\Gst;
use App\Models\Payment;
use App\Models\Tax;
use App\Models\Taxcharge;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Razorpay\Api\Api;
use Illuminate\Support\Facades\Log;
use Session;
use Exception;
use Illuminate\Support\Facades\Mail;
use App\Mail\AddInvoice; // Assuming your mailable is located in 'App\Mail' namespace
use Illuminate\Support\Facades\View;

class PaymentController extends Controller
{





    public function index($advertiser_id, $payment_amount, $addplan_id)
    {
        $advertiser = Auth::guard('advertiser')->user();
        $advertisment_coast = $payment_amount;
        $payment_amount_formatted = $payment_amount * 100;

        // Retrieve the corresponding GST record based on the conditions
        $gst = Gst::where('payment_type', 1)
            ->where('payment_for', 1)
            ->first();

        // If GST record is not available, assume GST as 0
        $gst_amount = 0;
        if ($gst) {
            // Calculate the total amount after adding additional taxes
            $total_amount_with_additional_taxes = $payment_amount;
            $additional_taxes = Taxcharge::where('payment_type', 1)
                ->where('payment_for', 1)
                ->get();
            foreach ($additional_taxes as $tax) {
                $tax_amount = $total_amount_with_additional_taxes * ($tax->tax_percentage / 100);
                $total_amount_with_additional_taxes += $tax_amount;
            }

            // Calculate GST from the total amount including additional taxes
            $gst_amount = $total_amount_with_additional_taxes * ($gst->tax_percentage / 100);
            $gst_amount = number_format($gst_amount, 1, '.', '');
        }

        // Retrieve additional tax charges from Taxcharge model based on conditions
        $additional_tax_amounts = 0;
        $additional_tax_details = []; // to store tax details

        foreach ($additional_taxes as $tax) {
            $tax_amount = $payment_amount * ($tax->tax_percentage / 100);
            $additional_tax_amounts += $tax_amount;
            $additional_tax_details[$tax->tax->tax_type] = $tax_amount; // assuming $tax->tax is the relationship to the Tax model
        }

        // Total amount including all taxes
        $total_amount = ($payment_amount + $additional_tax_amounts + $gst_amount) * 100;
        $total_amount = number_format($total_amount, 1, '.', '');
        $show_amount = $payment_amount + $additional_tax_amounts + $gst_amount;
        $show_amount = number_format($show_amount, 1, '.', '');

        return view('rozerpay', compact('advertiser_id', 'advertisment_coast', 'show_amount', 'payment_amount', 'payment_amount_formatted', 'advertiser', 'addplan_id', 'total_amount', 'gst_amount', 'additional_tax_amounts', 'additional_tax_details'));
    }


    // Assuming your Payment model namespace is correct

    public function store(Request $request)
    {


        $validatedData = $request->validate([

        ]);


        $advertiserId = $request->input('advertiser_id');
        $addplanId = $request->input('addplan_id');
        $prefill_mobile = $request->input('prefill_mobile');
        $prefill_name = $request->input('prefill_name');
        $prefill_email = $request->input('prefill_email');
        $payment_amount = $request->input('payment_amount');
        $advertisment_coast = $request->input('advertisment_coast');
        $payment_method = $request->input('method');
        $gst_amount = $request->input('gst_amount');
        $additional_tax_amounts = $request->input('additional_tax_amounts');
        $payment_currency = $request->input('currency');
        $razorpayPaymentId = $request->input('razorpay_payment_id'); // assuming you have an input field with this name

        // Save all data to the database
        $payment = new Payment();
        $payment->advertiser_id = $advertiserId;
        $payment->addplan_id = $addplanId;
        $payment->prefill_mobile = $prefill_mobile;
        $payment->prefill_name = $prefill_name;
        $payment->prefill_email = $prefill_email;
        $payment->amount = $payment_amount;
        $payment->advertisment_coast = $advertisment_coast;

        $payment->currency = $payment_currency;
        $payment->method = $payment_method;
        $payment->gst_amount = $gst_amount;
        $payment->additional_tax_amounts = $additional_tax_amounts;
        // Add more fields as needed
        $payment->save();

        // If the payment ID is available, update the payment record
        if ($razorpayPaymentId) {
            $payment->r_payment_id = $razorpayPaymentId;
            // Store all request data along with payment ID as JSON
            $payment->json_response = json_encode($request->all());
            $payment->save();
        }

        $invoicePageUrl = route('invoice.show', ['payment' => $payment->id]);

        // Redirect or return a response as needed
        return redirect()->route('invoice.show', compact('payment')); // Redirect to a success page
    }


    public function showInvoicePage($paymentId)
    {
        // Retrieve the payment data
        $payment = Payment::findOrFail($paymentId);
    
        // Check if the invoice number is already set for the payment
        if (!$payment->invoice_number) {
            // Generate a unique invoice number starting with "LLM" and followed by four random numbers
            $invoiceNumber = 'LLM' . str_pad(mt_rand(0, 9999), 4, '0', STR_PAD_LEFT);
    
            // Update the invoice_number in the Payment model
            $payment->invoice_number = $invoiceNumber;
            $payment->save();
        } else {
            // If the invoice number is already set, use the existing invoice number
            $invoiceNumber = $payment->invoice_number;
        }
    
        // Retrieve additional tax charges from Taxcharge model based on conditions
        $additional_taxes = Taxcharge::where('payment_type', 1)
            ->where('payment_for', 1)
            ->get();
    
        $additional_tax_details = [];
    
        foreach ($additional_taxes as $tax) {
            $tax_percentage = (float) $tax->tax_percentage; // Ensure $tax->tax_percentage is numeric
            $tax_amount = $payment->advertisment_coast * ($tax_percentage / 100);
            $additional_tax_details[] = [
                'tax_type' => $tax->tax->tax_type,
                'tax_amount' => $tax_amount
            ];
        }
    
        // Render the invoice view with additional_tax_details and payment
        $invoiceView = view('frontend.adds.invoice', compact('payment', 'invoiceNumber', 'additional_tax_details'))->render();
    
      
        // if (!$payment->invoice_sent) {
            
        //     Mail::to($payment->prefill_email)->send(new AddInvoice($invoiceView, $payment, $invoiceNumber, $additional_tax_details));
    

        //     $payment->invoice_sent = true;
        //     $payment->save();
        // }
    
        return $invoiceView; // Optionally, return the invoice vie
    }



}



