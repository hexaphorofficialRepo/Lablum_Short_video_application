<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lablum Entertainment</title>
    <style>
        /* Inline CSS styles */
        @media print {
            #printButtons {
                display: none;
            }
        }

        /* Additional styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 2px solid #ccc;
            gap:50px;
           
        }

        .header img {
            max-width: 100%;
            height: auto;
            
        }

        .invoice-title {
            font-size: 24px;
            font-weight: bold;
            color: #333;
        }

        .footer {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 2px solid #ccc;
            text-align: center;
            background:#e91e6321;
        }

        .invoice-details {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .invoice-details .left {
            flex: 0 0 60%;
        }

        .invoice-details .right {
            flex: 0 0 40%;
            text-align: right;
        }

        .invoice-table {
            width: 100%;
            border-collapse: collapse;
        }

        .invoice-table th,
        .invoice-table td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        .invoice-table th {
            text-align: left;
            background-color: #f7f7f7;
            font-weight: 800;
        }

        .invoice-table td {
            text-align: left;
        }

        .total-row {
            font-weight: bold;
        }

        .btn {
            padding: 10px 20px;
            background-color: #e85679;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .invoice-table {
        border: 2px solid #ccc;
        border-radius: 8px;
        overflow: hidden;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    th, td {
        padding: 8px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #f2f2f2;
    }

    .total-row {
        background-color:#b854bf57;;
        font-weight: bold;
    }
        
    </style>
</head>

<body>
    <div class="container">
        <div class="header" style=" background:#lavenderblush;">
            <img src="https://lablum.com/assets/images/all-img/lablum_logo.png" style="aspect-ratio: 2 / 2;
    mix-blend-mode: darken;height:111px;" alt="Lablum Entertainment Logo">
            <div class="invoice-title">Advertisment Payment Bill</div>
        </div>
        <div class="invoice-details">
            <div class="left">
                <h4>{{ $payment->advertiser->business_name }}</h4>
                <address>
                    <strong>{{ $payment->prefill_name }}</strong><br>
                    {{ $payment->advertiser->area }}<br>
                    {{ $payment->advertiser->city }}, {{ $payment->advertiser->state }}, {{ $payment->advertiser->zipcode }}<br>
                    India<br>
                    Phone: {{ $payment->advertiser->mobile }}<br>
                    Email: {{ $payment->advertiser->email }}
                </address>
            </div>
            <div class="right">
                <p>Invoice ID: <strong>{{ $payment->invoice_number }}</strong></p>
                <p>Invoice Date: <strong>{{ \Carbon\Carbon::parse($payment->created_at)->format('d/m/Y') }}</strong></p>
            </div>
        </div>
        <div class="invoice-table">
    <table>
        <thead>
            <tr>
                <th>Item</th>
                <th>Amount</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Advertisement Cost</td>
                <td>₹{{ $payment->advertisment_coast }}</td>
            </tr>
            <tr>
                <td>GST</td>
                <td>₹{{ $payment->gst_amount }}</td>
            </tr>
            @foreach ($additional_tax_details as $tax)
            <tr>
                <td>{{ $tax['tax_type'] }}</td>
                <td>₹{{ $tax['tax_amount'] }}</td>
            </tr>
            @endforeach
            <tr class="total-row">
                <td>Total Amount</td>
                <td>{{ $payment->amount }}</td>
            </tr>
        </tbody>
    </table>
</div>
        <div class="footer">
            <p>This is a computer-generated invoice and does not require a signature.</p>
            <p>For any queries, please contact us at support@lablum.com</p>
        </div>
        <div class="text-center" id="printButtons">
            <button id="downloadInvoiceBtn" class="btn" type="button">Download Invoice</button>
        </div>
    </div>

    <script>
        function printInvoice() {
            window.print();
        }

        document.addEventListener("DOMContentLoaded", function() {
            const downloadBtn = document.querySelector("#downloadInvoiceBtn");
            if (downloadBtn) {
                downloadBtn.addEventListener("click", function() {
                    printInvoice();
                });
            }
        });
    </script>
</body>

</html>
