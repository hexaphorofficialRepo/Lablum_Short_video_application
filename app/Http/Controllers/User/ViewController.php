<?php

namespace App\Http\Controllers\user;

use App\Http\Controllers\Controller;
use App\Models\Addvideo;
use App\Models\Bank;
use App\Models\Earning;
use App\Models\Gst;
use App\Models\Post;
use App\Models\Taxcharge;
use App\Models\User;
use App\Models\View;
use App\Models\Wallet;
use Illuminate\Http\Request;

class ViewController extends Controller
{
    // public function viewStore(Request $request, $userId)
    // {
    //     $request->validate([
    //         'post_id' => 'required_without:add_id|exists:posts,id',
    //         'add_id' => 'required_without:post_id|exists:addvideos,id',
    //     ]);
    
    //     $viewingUser = User::findOrFail($userId);
    //     $postId = $request->post_id;
    //     $addId = $request->add_id;
    
    //     // Handle view for post
    //     if ($postId) {
    //         $post = Post::findOrFail($postId);
    //         $existingView = View::where('user_id', $viewingUser->user_id)
    //                             ->where('post_id', $postId)
    //                             ->exists();
    
    //         if (!$existingView) {
    //             // Record the view for the post
    //             $view = new View();
    //             $view->user_id = $viewingUser->user_id;
    //             $view->post_id = $postId;
    //             $view->save();
    
    //             // Update wallets
    //             $videoLength = $post->length;
    //             $earning = Earning::where('from', '<=', $videoLength)
    //                              ->where('to', '>=', $videoLength)
    //                              ->first();
    
    //             if ($earning) {
    //                 // Update or create the viewing user's wallet
    //                 $viewingUserWallet = $viewingUser->wallet ?? new Wallet();
    //                 $viewingUserWallet->points += $earning->viewer_points;
    //                 $viewingUserWallet->user_id = $viewingUser->user_id;
    //                 $viewingUserWallet->save();
    
    //                 // Update or create the post user's wallet
    //                 $postUserWallet = $post->user->wallet ?? new Wallet();
    //                 $postUserWallet->points += $earning->creator_points;
    //                 $postUserWallet->user_id = $post->user->user_id;
    //                 $postUserWallet->save();
    
    //                 return response()->json(['status' => 'success', 'msg' => 'View recorded and wallets updated successfully.']);
    //             } else {
    //                 return response()->json(['status' => 'error', 'msg' => 'Earning bracket not found for the video length.']);
    //             }
    //         } else {
    //             // View already recorded, skip updating wallets
    //             return response()->json(['status' => 'warning', 'msg' => 'You have already viewed this post. Wallets are not updated again.']);
    //         }
    //     }
    
    //     // Handle view for advertisement
    //     if ($addId) {
    //         $advertisement = Addvideo::findOrFail($addId);
    //         $existingView = View::where('user_id', $viewingUser->user_id)
    //                             ->where('add_id', $addId)
    //                             ->exists();
    
    //         if (!$existingView) {
    //             // Record the view for the advertisement
    //             $view = new View();
    //             $view->user_id = $viewingUser->user_id;
    //             $view->add_id = $addId;
    //             $view->save();
    
    //             // Update wallet for the viewer
    //             $videoLength = $advertisement->length;
    //             $earning = Earning::where('from', '<=', $videoLength)
    //                              ->where('to', '>=', $videoLength)
    //                              ->first();
    
    //             if ($earning) {
    //                 // Update or create the viewing user's wallet
    //                 $viewingUserWallet = $viewingUser->wallet ?? new Wallet();
    //                 $viewingUserWallet->points += $earning->viewer_points;
    //                 $viewingUserWallet->user_id = $viewingUser->user_id;
    //                 $viewingUserWallet->save();
    
    //                 return response()->json(['status' => 'success', 'msg' => 'View recorded and wallet updated successfully.']);
    //             } else {
    //                 return response()->json(['status' => 'error', 'msg' => 'Earning bracket not found for the video length.']);
    //             }
    //         } else {
    //             // View already recorded, skip updating wallet
    //             return response()->json(['status' => 'warning', 'msg' => 'You have already viewed this advertisement. Wallet is not updated again.']);
    //         }
    //     }
    
    //     // If neither post_id nor add_id provided
    //     return response()->json(['status' => 'error', 'msg' => 'Either post_id or add_id is required.']);
    // }
    
    

    public function viewStore(Request $request, $userId)
    {
        $request->validate([
            'post_id' => 'required_without:add_id|exists:posts,id',
            'add_id' => 'required_without:post_id|exists:addvideos,id',
        ]);
    
        $viewingUser = User::findOrFail($userId);
        $postId = $request->post_id;
        $addId = $request->add_id;
    
        // Handle view for post
        if ($postId) {
            $post = Post::findOrFail($postId);
            $existingView = View::where('user_id', $viewingUser->user_id)
                                ->where('post_id', $postId)
                                ->exists();
    
            if (!$existingView) {
                // Record the view for the post
                $view = new View();
                $view->user_id = $viewingUser->user_id;
                $view->post_id = $postId;
                $view->save();
    
                // Update wallets
                $videoLength = $post->length;
                $earning = Earning::where('from', '<=', $videoLength)
                                 ->where('to', '>=', $videoLength)
                                 ->first();
    
                if ($earning) {
                    // Update or create the viewing user's wallet
                    $viewingUserWallet = $viewingUser->wallet ?? new Wallet();
                    $viewingUserWallet->points += $earning->viewer_points;
                    $viewingUserWallet->user_id = $viewingUser->user_id;
    
                    // Calculate taxes
                    $gstTax = Gst::where('payment_for', 3)->first();
                    $otherTaxCharges = Taxcharge::where('payment_for', 3)->get();
                    $gstAmount = $gstTax ? number_format(($gstTax->tax_percentage / 100) * $viewingUserWallet->points, 2, '.', '') : 0;
    
                    $additionalTaxDetails = [];
                    $additionalTaxTotal = 0;
                    foreach ($otherTaxCharges as $taxCharge) {
                        $taxAmount = number_format(($taxCharge->tax_percentage / 100) * $viewingUserWallet->points, 2, '.', '');
                        $additionalTaxDetails[] = [
                            'tax_name' => $taxCharge->tax->tax_type,
                            'tax_percentage' => $taxCharge->tax_percentage,
                            'tax_amount' => $taxAmount,
                        ];
                        $additionalTaxTotal += $taxAmount;
                    }
    
                    $viewingUserWallet->gst_amount = $gstAmount;
                    $viewingUserWallet->additional_tax_details = json_encode($additionalTaxDetails);
                    $viewingUserWallet->additional_tax_amount = $additionalTaxTotal;
                    $viewingUserWallet->net_amount = $viewingUserWallet->points - ($gstAmount + $additionalTaxTotal);
                    $viewingUserWallet->save();
    
                    // Update or create the post user's wallet
                    $postUserWallet = $post->user->wallet ?? new Wallet();
                    $postUserWallet->points += $earning->creator_points;
                    $postUserWallet->user_id = $post->user->user_id;
    
                    // Calculate taxes
                    $gstAmount = $gstTax ? number_format(($gstTax->tax_percentage / 100) * $postUserWallet->points, 2, '.', '') : 0;
    
                    $additionalTaxDetails = [];
                    $additionalTaxTotal = 0;
                    foreach ($otherTaxCharges as $taxCharge) {
                        $taxAmount = number_format(($taxCharge->tax_percentage / 100) * $postUserWallet->points, 2, '.', '');
                        $additionalTaxDetails[] = [
                            'tax_name' => $taxCharge->tax->tax_type,
                            'tax_percentage' => $taxCharge->tax_percentage,
                            'tax_amount' => $taxAmount,
                        ];
                        $additionalTaxTotal += $taxAmount;
                    }
    
                    $postUserWallet->gst_amount = $gstAmount;
                    $postUserWallet->additional_tax_details = json_encode($additionalTaxDetails);
                    $postUserWallet->additional_tax_amount = $additionalTaxTotal;
                    $postUserWallet->net_amount = $postUserWallet->points - ($gstAmount + $additionalTaxTotal);
                    $postUserWallet->save();
    
                    return response()->json(['status' => 'success', 'msg' => 'View recorded and wallets updated successfully.']);
                } else {
                    return response()->json(['status' => 'error', 'msg' => 'Earning bracket not found for the video length.']);
                }
            } else {
                // View already recorded, skip updating wallets
                return response()->json(['status' => 'warning', 'msg' => 'You have already viewed this post. Wallets are not updated again.']);
            }
        }
    
        // Handle view for advertisement
        if ($addId) {
            $advertisement = Addvideo::findOrFail($addId);
            $existingView = View::where('user_id', $viewingUser->user_id)
                                ->where('add_id', $addId)
                                ->exists();
    
            if (!$existingView) {
                // Record the view for the advertisement
                $view = new View();
                $view->user_id = $viewingUser->user_id;
                $view->add_id = $addId;
                $view->save();
    
                // Update wallet for the viewer
                $videoLength = $advertisement->length;
                $earning = Earning::where('from', '<=', $videoLength)
                                 ->where('to', '>=', $videoLength)
                                 ->first();
    
                if ($earning) {
                    // Update or create the viewing user's wallet
                    $viewingUserWallet = $viewingUser->wallet ?? new Wallet();
                    $viewingUserWallet->points += $earning->viewer_points;
                    $viewingUserWallet->user_id = $viewingUser->user_id;
    
                    // Calculate taxes
                    $gstTax = Gst::where('payment_for', 3)->first();
                    $otherTaxCharges = Taxcharge::where('payment_for', 3)->get();
                    $gstAmount = $gstTax ? number_format(($gstTax->tax_percentage / 100) * $viewingUserWallet->points, 2, '.', '') : 0;
    
                    $additionalTaxDetails = [];
                    $additionalTaxTotal = 0;
                    foreach ($otherTaxCharges as $taxCharge) {
                        $taxAmount = number_format(($taxCharge->tax_percentage / 100) * $viewingUserWallet->points, 2, '.', '');
                        $additionalTaxDetails[] = [
                            'tax_name' => $taxCharge->tax->tax_type,
                            'tax_percentage' => $taxCharge->tax_percentage,
                            'tax_amount' => $taxAmount,
                        ];
                        $additionalTaxTotal += $taxAmount;
                    }
    
                    $viewingUserWallet->gst_amount = $gstAmount;
                    $viewingUserWallet->additional_tax_details = json_encode($additionalTaxDetails);
                    $viewingUserWallet->additional_tax_amount = $additionalTaxTotal;
                    $viewingUserWallet->net_amount = $viewingUserWallet->points - ($gstAmount + $additionalTaxTotal);
                    $viewingUserWallet->save();
    
                    return response()->json(['status' => 'success', 'msg' => 'View recorded and wallet updated successfully.']);
                } else {
                    return response()->json(['status' => 'error', 'msg' => 'Earning bracket not found for the video length.']);
                }
            } else {
                // View already recorded, skip updating wallet
                return response()->json(['status' => 'warning', 'msg' => 'You have already viewed this advertisement. Wallet is not updated again.']);
            }
        }
    
        // If neither post_id nor add_id provided
        return response()->json(['status' => 'error', 'msg' => 'Either post_id or add_id is required.']);
    }
    
    









    

    public function getUserWallet($userId) {
        $user = User::findOrFail($userId);
        $wallet = $user->wallet;
        
        $kyc_status = $user->kyc_status;
        
        if (!$wallet) {
            return response()->json(['status' => 'error', 'msg' => 'Wallet not found for this user.']);
        }
    
        // Retrieve bank account for the user
        $bank = Bank::where('user_id', $userId)->first();
    
        // Prepare wallet data including kyc_status and bank_status
        $walletData = $wallet->toArray();
        $walletData['kyc_status'] = $kyc_status == 1 ? true : false;
        $walletData['bank_status'] = $bank && $bank->bank_status == 1 ? true : false;
        
        // Decode the additional_tax_details from JSON to array
        $walletData['additional_tax_details'] = json_decode($walletData['additional_tax_details'], true);
    
        // Remove bank_status from bank account data
        if ($bank) {
            unset($bank['bank_status']);
        }
    
        return response()->json([
            'status' => 'success',
            'wallet' => $walletData,
            'mobile_number'=>"6204577138",
            'bank_account' => $bank ? $bank->toArray() : null
        ]);
    }
    
    // public function getUserWallet($userId) {
    
    //     $user = User::findOrFail($userId);
    //     $wallet = $user->wallet;
    
    //     if (!$wallet) {
    //         return response()->json(['status' => 'error', 'msg' => 'Wallet not found for this user.']);
    //     }
    
    //     $kyc_status = $user->kyc_status;
    
        
    //     $bank = Bank::where('user_id', $userId)->first();
    
       
    //     $gstTax = Gst::where('payment_for', 3)->first();
    
     
    //     $otherTaxCharges = Taxcharge::where('payment_for', 3)->get();
    
      
    //     $gstAmount = 0;
    //     if ($gstTax) {
    //         $gstAmount = ($gstTax->tax_percentage / 100) * $wallet->points;
    //         $gstAmount = number_format($gstAmount, 2, '.', ''); 
    //     }
    
      
    //     $otherTaxDetails = [];
    //     foreach ($otherTaxCharges as $taxCharge) {
    //         $taxAmount = ($taxCharge->tax_percentage / 100) * $wallet->points;
    //         $taxAmount = number_format($taxAmount, 2, '.', ''); 
    //         $otherTaxDetails[] = [
    //             'tax_name' => $taxCharge->tax->tax_type, 
    //             'tax_percentage' => $taxCharge->tax_percentage,
    //             'tax_amount' => $taxAmount
    //         ];
    //     }
    

    //     $walletData = $wallet->toArray();
    //     $walletData['kyc_status'] = $kyc_status == 1 ? true : false;
    //     $walletData['bank_status'] = $bank && $bank->bank_status == 1 ? true : false;
    //     $walletData['gst_amount'] = $gstAmount;
    //     $walletData['other_tax_details'] = $otherTaxDetails;
    
    
    //     if ($bank) {
    //         unset($bank['bank_status']);
    //     }
    
    //     return response()->json([
    //         'status' => 'success',
    //         'wallet' => $walletData,
    //         'bank_account' => $bank ? $bank->toArray() : null
    //     ]);
    // }
    
    
    
    
    
}
