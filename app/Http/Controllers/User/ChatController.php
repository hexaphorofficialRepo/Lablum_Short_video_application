<?php

namespace App\Http\Controllers\user;

use App\Http\Controllers\Controller;
use App\Models\Chat;
use Illuminate\Foundation\Auth\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class ChatController extends Controller
{
    public function updateUserUuid(Request $request, $user_id)
{
    $validator = Validator::make(
        $request->all(),
        [
            'uuid' => 'nullable', // Allow nullable uuid
        ],
        [
            'uuid.required' => 'UUID is required',
        ]
    );

    if ($validator->fails()) {
        return response()->json(['status' => 'error', 'msg' => $validator->errors()->first()], 400);
    }

    // Check if the user exists
    $user = DB::table('users')->where('user_id', $user_id)->first();
    if (!$user) {
        return response()->json(['status' => 'error', 'msg' => 'User not found'], 404);
    }

    // Update the UUID
    $uuid = $request->input('uuid'); // Get the value of uuid from the request
    DB::table('users')->where('user_id', $user_id)->update(['uuid' => $uuid]);

    return response()->json(['status' => true, 'msg' => 'UUID updated successfully', 'user_id' => $user_id, 'uuid' => $uuid], 200);
}
public function storeChat(Request $request)
{
    // Validate the incoming request
    $validator = Validator::make($request->all(), [
        'sender_id' => 'required',
        'receiver_id' => 'required',
        'chat_id' => 'required',
    ]);

    // Check if validation fails
    if ($validator->fails()) {
        return response()->json(['error' => $validator->errors()->first()], 400);
    }

    // Find or create chat instance for the sender
    $senderChat = Chat::updateOrCreate(
        ['uuid' => $request->sender_id, 'chat_id' => $request->chat_id],
        ['uuid' => $request->sender_id, 'chat_id' => $request->chat_id]
    );

    // Find or create chat instance for the receiver
    $receiverChat = Chat::updateOrCreate(
        ['uuid' => $request->receiver_id, 'chat_id' => $request->chat_id],
        ['uuid' => $request->receiver_id, 'chat_id' => $request->chat_id]
    );

    // Update the updated_at timestamp for both chat instances
    $senderChat->touch();
    $receiverChat->touch();

    return response()->json(['message' => 'Chats stored successfully'], 200);
}


public function getChatsByUuid($uuid)
{
    
    $chatIds = Chat::where('uuid', $uuid)->latest('created_at')->pluck('chat_id');
    
    if ($chatIds->isEmpty()) {
        return response()->json(['error' => 'No chats found for the specified user UUID'], 404);
    }
    
    $formattedChats = [];
    
    foreach ($chatIds as $chatId) {
        $formattedChats[] = [
         
            'chat_id' => $chatId,
        ];
    }
    
    return response()->json($formattedChats, 200);
}



}
