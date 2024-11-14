<?php
use App\Http\Controllers\AnalyticsController;
use App\Http\Controllers\User\BankController;
use App\Http\Controllers\User\BlockuserController;
use App\Http\Controllers\User\CommentreportController;
use App\Http\Controllers\User\ChatController;
use App\Http\Controllers\User\FollowController;
use App\Http\Controllers\User\ForgetpaswordController;
use App\Http\Controllers\User\KycController;
use App\Http\Controllers\User\LiveController;
use App\Http\Controllers\User\DeleteuserController;
use App\Http\Controllers\User\NotificationController;
use App\Http\Controllers\User\OfficialVerifyController;
use App\Http\Controllers\User\AddbannerController;
use App\Http\Controllers\User\ReportController;
use App\Http\Controllers\User\SavepostController;
use App\Http\Controllers\User\SearchController;
use App\Http\Controllers\User\SongController;
use App\Http\Controllers\User\UserPostController;
use App\Http\Controllers\User\UserRegisterController as RegisterController ;
use App\Http\Controllers\User\VideoController;
use App\Http\Controllers\User\ViewController;
use App\Http\Controllers\User\PoliciesController;
use App\Http\Controllers\User\UserreportController;
use App\Http\Controllers\User\WithdrawlController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
Route::post('register',[RegisterController::class,'index'])->name('user_register');
Route::post('verify-otp', [RegisterController::class, 'verifyOTP1'])->name('verify-otp');
Route::post('resend-otp', [RegisterController::class,'resendOtp'])->name('resend-otp');
Route::post('login', [RegisterController::class,'login'])->name('login');
Route::post('send-otp', [RegisterController::class, 'sendOTP']);
//Update FCM token


Route::middleware('auth:api')->group(function () {
   
});


Route::post('/update-fcm-token/{user_id}',[RegisterController::class, 'updateUserFCMToken']);




Route::post('is-email-exist', 'RegisterController@isEmailExist')->name('is_email_exist');

Route::post('social-register', 'RegisterController@socialRegister')->name('social-register');
Route::post('refresh', 'RegisterController@refresh')->name('refresh');

Route::post('logout', 'UserController@logout')->name('logout');
Route::post('register-social', 'RegisterController@socialLogin')->name('user_register_social');
Route::get('register-demo', [RegisterController::class,'demo'])->name('user_register_demo');

//User Profile
Route::get('user-profile/{user_id}',[RegisterController::class,'userProfile'])->name('user.profile');
Route::post('user-update-profile/{user_id}',[RegisterController::class,'updateProfile'])->name('user-profile-update');

//User Post
Route::get('/hashtags', [VideoController::class, 'suggestHashtag'])->name('hashtags.suggest');
Route::post('/posts/{user_id}', [VideoController::class, 'Poststore'])->name('post.add');
Route::get('/all-posts/{user_id?}', [VideoController::class, 'getAllPosts'])->name('all.posts');
// Route::middleware('throttle:posts')->get('/all-posts/{user_id?}', [VideoController::class, 'getAllPosts']);



Route::get('/single-post-details/{user_id}/{post_id}',[VideoController::class,'getSinglePost']);


//POST LIKE AND COMMENT
Route::post('/Post-like/{userId}', [VideoController::class, 'likePost']);
Route::post('/Post-comment/{userId}', [VideoController::class, 'commentPost']);
Route::post('/comment/reply/{commentId}', [VideoController::class, 'replyToComment']);

Route::post('users/{userId}/comments/like', [VideoController::class, 'likeComment']);





Route::get('/posts/comments/{postId}/{user_id?}',[VideoController::class,'getCommentsByPostId']);
Route::get('/user-post/{user_id}/{view_id?}',[UserPostController::class,'getUserPosts']);
Route::post('/user-share-count/{postId}',[VideoController::class,'sharePost']);

// SEARCH API
Route::get('/search-page-post/{user_id?}',[SearchController::class,'allPosts']);
Route::get('/serach-post/{user_id?}',[SearchController::class,'searchPost']);
Route::get('/serach-all-user',[SearchController::class,'getAllUsers']);
Route::get('/search-users/{user_id?}',[SearchController::class,'searchUsers']);

Route::get('/song-list',[SongController::class,'songApi'])->name('admin.song.api');

// FOLLOW
Route::post('/user/following/{user_id}', [FollowController::class, 'store']);

Route::get('/user/following/{user_id}',[FollowController::class,'followCounts']);


// Route::delete('/user/unfollow/{user_id}', [FollowController::class, 'destroy']);
Route::get('/following-list/{user_id}',[FollowController::class,'followingList']);
Route::get('/followerslist/{user_id}',[FollowController::class,'followerList']);


// Save Post
Route::post('/user-save-post/{user_id}',[SavepostController::class,'savePost']);
Route::get('/user-saved-post/{user_id}',[SavepostController::class,'getUserSavedPosts']);




//Like Posts
Route::get('/user-all-like-post/{user_id}',[VideoController::class,'getlikePosts']);


//Wallet 
Route::post('/wallet/users/{userId}/views', [ViewController::class, 'viewStore']);
Route::get('/user/{userId}/wallet',[ViewController::class,'getUserWallet']);


Route::post('/users/update-kyc/{userId}', [KycController::class, 'updateKyc']);
Route::post('/users/add-bank/{userId}', [BankController::class, 'addBank']);

// Official Verification
Route::post('/user-official-verfication/{user_id}',[OfficialVerifyController::class,'officialverify'])->name('user.official.verify');


//Notification
Route::post('/store/notification/{fcm_token}',[NotificationController::class,'store']);
Route::get('/get/notification/{fcm_token}',[NotificationController::class,'getNotifications']);

//Forget Password
Route::post('/validate-user',[ForgetpaswordController::class,'validateUser']);
Route::post('/users/update-password/{userId}', [ForgetpaswordController::class, 'updatePassword']);

//CHATTING API
Route::post('/update-uuid/{user_id}', [ChatController::class,'updateUserUuid']);
Route::post('/store-chat',[ChatController::class,'storeChat']);
Route::get('/chats/{uuid}', [ChatController::class, 'getChatsByUuid']);

//VIEW PROFILE
Route::get('/user/profile/{viewer_id}', [RegisterController::class,'viewProfile']);

// Live Stareming Api
Route::post('/user/live-stream/{userId}',[LiveController::class,'addlive']);

Route::delete('/users/livestreams/{userId}', [LiveController::class,'deleteLiveByUser']);
Route::get('/all-livestreams',[LiveController::class,'getAllLiveStreams']);
Route::get('/getBankList', [BankController::class, 'getBankList']);

Route::get('/user/banks/{userId}',[BankController::class,'getUserBanks']); 

// Withdrwal Api
Route::post('/withdrawal-transaction',[WithdrawlController::class,'storeWithdrawal']);
Route::get('/withdrawal-history/{user_id}',[WithdrawlController::class,'getUserWithdrawalHistory'])->name('user.withdrawal.history');

// POST REPORT
Route::post('post-report/{post_id}',[ReportController::class,'storePostreport']);
// POST TAG
Route::get('/user-tagged-post/{user_id}',[SavepostController::class,'getUserTaggedPosts']);

// Lablum Policies
Route::get('/our-terms-policies',[PoliciesController::class,'ourPolicies']);
//ADDBANNER
Route::get('/banners',[AddbannerController::class,'getBanners']);
Route::post('/addbanner/view/{addbannerId}',[AddbannerController::class,'increaseViewCount']);



// Analytics Routes
Route::get('/analytics/views', [AnalyticsController::class, 'getAnalytics']);
Route::get('/follower/analytics', [AnalyticsController::class, 'getFollowersAnalytics']);
Route::get('/earning/analytics',[AnalyticsController::class,'getEarningAnalytics']);
Route::get('/like/analytics',[AnalyticsController::class,'getLikesAnalytics']);
Route::get('/top/content',[AnalyticsController::class,'getTopPostsByViews']);
// BLOCK USER
Route::post('/blockuser/{user_id}', [BlockuserController::class, 'blockUser']);
Route::get('/users/blocked/{user_id}', [BlockuserController::class, 'getBlockedUsers']);
//USERREPORT
Route::post('/report-user/{user_id}',[UserreportController::class,'reportUser']);
// USER DELETE ACCOUNT
Route::delete('/user/delete/{user_id}', [DeleteuserController::class, 'deleteUserAccount']);
// COMMENT |REPORT
Route::post('/report-comment/{id}', [CommentreportController::class, 'reportCommentOrReply']);
Route::delete('/delete-comment/{id}', [CommentreportController::class, 'deleteCommentOrReply']);

// REMOVE TAG
Route::delete('/delete-tag/{tag_id}', [VideoController::class, 'deleteTag']);
// DELTE POST
Route::delete('/delete-post/{post_id}', [VideoController::class, 'deletePost']);

Route::post('/get_api_data_party',[BankController::class,'apidata']);



