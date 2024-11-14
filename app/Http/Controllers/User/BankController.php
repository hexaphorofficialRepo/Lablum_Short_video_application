<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Bank;
use App\Models\Bankcode;
use App\Models\User;
use Illuminate\Http\Request;
use GuzzleHttp\Client;
use Illuminate\Support\Facades\Http;   
use Illuminate\Support\Facades\Validator;

class BankController extends Controller
{
    


public function addBank(Request $request, $userId) {
    // Validation
    $validator = Validator::make($request->all(), [
        'account_name' => 'required|string|max:255',
        'ifsc_code' => 'required|string|max:255',
        'bank_name' => 'required',
        'beneficiaryId' => 'required|string|max:255',
        'account_no' => [
            'required',
            'string',
            'max:255',
            'unique:banks,account_no,NULL,id,user_id,' . $userId, // Validation rule for unique account_no per user
        ],
    ], [
        // Custom error messages for each field and rule
        'account_name.required' => 'Account name is required.',
        'account_name.string' => 'Account name must be a valid string.',
        'account_name.max' => 'Account name may not be greater than :max characters.',
        
        'ifsc_code.required' => 'IFSC code is required.',
        'ifsc_code.string' => 'IFSC code must be a valid string.',
        'ifsc_code.max' => 'IFSC code may not be greater than :max characters.',
        
        'bank_name.required' => 'Bank name is required.',
        
        'beneficiaryId.required' => 'Beneficiary ID is required.',
        'beneficiaryId.string' => 'Beneficiary ID must be a valid string.',
        'beneficiaryId.max' => 'Beneficiary ID may not be greater than :max characters.',
        
        'account_no.required' => 'Account number is required.',
        'account_no.string' => 'Account number must be a valid string.',
        'account_no.unique' => 'The account number has already been taken.',
        'account_no.max' => 'Account number may not be greater than :max characters.'
    ]);

    // Check if validation fails
    if ($validator->fails()) {
        return response()->json(['errors' => $validator->errors()], 422); // Return validation errors
    }

    try {
        // Create new bank account
        $bank = Bank::create([
            'user_id' => $userId,
            'account_name' => $request->input('account_name'),
            'ifsc_code' => $request->input('ifsc_code'),
            'bank_name' => $request->input('bank_name'),
            'account_no' => $request->input('account_no'),
            'beneficiaryId' => $request->input('beneficiaryId'),
        ]);

        // Return success response
        return response()->json([
            'status' => 'success',
            'message' => 'Bank account added successfully',
            'data' => $bank
        ], 200);
        
    } catch (\Exception $e) {
        \Log::error('Error adding bank account: ' . $e->getMessage()); // Log the error for debugging
        return response()->json([
            'status' => 'error',
            'message' => 'Failed to add bank account',
            'error' => $e->getMessage()
        ], 500); // Return error response
    }
}

// protected function get_query_result($service_url = '',$data = '',$method = 'GET') {
//     try {
//         $ch = curl_init();

//         curl_setopt_array($ch, array(
//             CURLOPT_URL => $service_url,
//             CURLOPT_RETURNTRANSFER => true,
//             CURLOPT_ENCODING => '',
//             CURLOPT_MAXREDIRS => 10,
//             CURLOPT_TIMEOUT => 0,
//             CURLOPT_FOLLOWLOCATION => true,
//             CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
//             CURLOPT_CUSTOMREQUEST => $method,
//             CURLOPT_POSTFIELDS => $data,
//             CURLOPT_HTTPHEADER => array(
//               'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJtZW1iZXJJZCI6MywiaWF0IjoxNjk1MDIwNDQzfQ.wziU9smNaBZQk5PyAUq4CYhMCr_cIPDBE8rdw7qi7TY',
//               'Content-Type: application/json'
//             ),
//         ));
//         print_r($ch);
//         exit();

//         if (($result = curl_exec($ch)) === FALSE) {
//             $info = curl_error($ch);
//             curl_close($ch);
//             return '';
//         } else {
//             curl_close($ch);
//             return $result;
//         }
//     } catch (Exception $e) {
//         return '';
//     }
// }

// public function getBankCode($bankName) {
//         try {
//             $response = Http::withHeaders([
//                 'Authorization' => 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJtZW1iZXJJZCI6MTAzLCJpYXQiOjE3MTA4NDIzMTN9.YmOX3LGr50l-lpP2rRlmJiqLe5czoC9DGMk9c71nPOk',
//             ])->get('https://v2bapi.rechargkit.biz/moneytransfer2/getBankList');
//             // $bankName = "State Bank of India";
//             // Check for a successful response
//             if ($response->successful()) {
//                 $data = $response->json();
//                 $normalizedInputBankName = array_map('trim', explode(' ', strtolower($bankName)));
//                 foreach ($data['bankList'] as $bank) {
//                     $normalizedBankName = array_map('trim', explode(' ', strtolower($bank['bankName'])));
//                     if (count(array_intersect($normalizedInputBankName, $normalizedBankName)) == count($normalizedInputBankName)) {
//                         return $bank['bankCode'];
//                     }
//                 }
//             } else {
//                 return response()->json([
//                     'code' => $response->status(),
//                     'status' => 'error',
//                     'message' => $response->body()
//                 ], $response->status());
//             }
    
//         } catch (\Exception $e) {
//             // Handle any exceptions
//             return response()->json([
//                 'code' => 500,
//                 'status' => 'error',
//                 'message' => $e->getMessage()
//             ], 500);
//         }
//     }








public function getUserBanks($userId) {
    try {
        $banks = Bank::where('user_id', $userId)
                     ->select('id', 'user_id', 'account_name', 'ifsc_code', 'bank_name', 'account_no', 'beneficiaryId')
                     ->get();

        $mobileNumber = '6204577138'; // Set the mobile number

        $banksWithMobile = $banks->map(function ($bank) use ($mobileNumber) {
            $bank['mobile_number'] = $mobileNumber;
            return $bank;
        });

        return response()->json(['status' => 'success', 'banks' => $banksWithMobile], 200);
    } catch (\Exception $e) {
        return response()->json(['status' => 'error', 'message' => 'Failed to fetch user banks', 'error' => $e->getMessage()], 500);
    }
}

public function apidata(){
        $curl = curl_init();
        curl_setopt_array($curl, array(
        CURLOPT_URL => 'https://v2bapi.rechargkit.biz/moneytransfer2/addBeneficiaryRequest',
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => '',
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => 'POST',
        CURLOPT_POSTFIELDS =>'{
            "mobile_no":"7683814502",
            "accountNo":"159668305427",
            "ifsc":"INDB0000035",
            "bankName": "1170",
            "beneficiaryName":"Wasim Reja",
            "partner_request_id":"3456678899892453666666"
        }',
        CURLOPT_HTTPHEADER => array(
            'Content-Type: application/json',
            'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJtZW1iZXJJZCI6MTAzLCJpYXQiOjE3MTA4NDIzMTN9.YmOX3LGr50l-lpP2rRlmJiqLe5czoC9DGMk9c71nPOk'
        ),
        ));

        $response = curl_exec($curl);

        curl_close($curl);
        echo $response;
    }





    
}
