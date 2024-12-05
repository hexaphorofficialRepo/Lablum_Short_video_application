<?php

use App\Http\Controllers\admin\AddcategoryController;
use App\Http\Controllers\admin\AddpricingController;
use App\Http\Controllers\admin\AdminController;
use App\Http\Controllers\admin\AdvertiserController;
use App\Http\Controllers\admin\AuthController;
use App\Http\Controllers\admin\BanneraddController;
use App\Http\Controllers\admin\GstController;
use App\Http\Controllers\admin\settings\OtherlinkController;
use App\Http\Controllers\admin\settings\UpdatepasswordController;
use App\Http\Controllers\admin\TaxController;

use App\Http\Controllers\admin\TermsController;
use App\Http\Controllers\admin\TransactionController;
use App\Http\Controllers\admin\UserwithdrawlController;
use App\Http\Controllers\advertisment\AddvideoController;
use App\Http\Controllers\advertisment\AuthController as AddAuthController;
use App\Http\Controllers\admin\BlogController;
use App\Http\Controllers\admin\CategoryController;
use App\Http\Controllers\admin\EarningController;
use App\Http\Controllers\admin\PostController;
use App\Http\Controllers\admin\RoleController;
use App\Http\Controllers\admin\SongController;
use App\Http\Controllers\admin\UserController;
use App\Http\Controllers\advertisment\AddplanController;
use App\Http\Controllers\advertisment\AddsController;
use App\Http\Controllers\advertisment\BanneraddsController;
use App\Http\Controllers\advertisment\ForgetpasswordController;
use App\Http\Controllers\ContactController;
use App\Http\Controllers\frontend\PageController;
use App\Http\Controllers\OrganizationController;
use App\Http\Controllers\DeleteaccountController;
use App\Http\Controllers\OfficialpaymentController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\User\VideoController;
use App\Livewire\Admin\AddPostCategory;
use App\Livewire\Admin\AllPostCategory;
use App\Livewire\Admin\EditPostCategory;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/admin/login', function () {
    return view('admin.auth.login');
});
Route::get('/admin/login', [AuthController::class, 'loginView'])->name('login');
Route::post('admin/login', [AuthController::class, 'adminLogin'])->name('admin.login');
Route::group(['middleware' => 'auth:admin'], function () {
    Route::get('/admin/dashboard', [AuthController::class, 'dashboard'])->name('admin.dashboard')->middleware('permission:dashboard');
    Route::post('/admin/logout', [AuthController::class, 'logout'])->name('admin.logout');



    Route::get('/add_staff/{id?}', [AuthController::class, 'add_staff'])->name('add_staff');
    Route::post('/staff_store/{id?}', [AuthController::class, 'staff_store'])->name('staff_store');
    Route::put('/staff_update/{staff}', [AuthController::class, 'staff_update'])->name('staff_update');
    Route::get('/delete_staff/{id}', [AuthController::class, 'staff_delete'])->name('delete_staff');


    //Roles Permission
    Route::get('/admin/role', [RoleController::class, 'index'])->name('admin.role')->middleware('permission:role_view');
    Route::post('/admin/role/store', [RoleController::class, 'store'])->name('admin.role.store')->middleware('permission:role_create');
    Route::get('/admin/permission/{id}', [RoleController::class, 'permissionView'])->name('admin.permissions')->middleware('permission:role_permission');
    Route::post('/admin/permission/update/{id}', [RoleController::class, 'update'])->name('admin.permissions.update')->middleware('permission:role_permission');
    Route::get('/admin/user', [AdminController::class, 'index'])->name('admin.user')->middleware('permission:user_view');
    Route::get('/admin/user/create', [AdminController::class, 'create'])->name('admin.user.create')->middleware('permission:user_create');
    Route::post('/admin/user/store', [AdminController::class, 'store'])->name('admin.user.store')->middleware('permission:user_create');
    Route::get('/admin/user/edit/{admin}', [AdminController::class, 'edit'])->name('admin.user.edit')->middleware('permission:user_edit');
    Route::post('/admin/user/update/{admin}', [AdminController::class, 'update'])->name('admin.user.update')->middleware('permission:user_edit');
    Route::delete('/admin/user/{admin}', [AdminController::class, 'destroy'])->name('admin.user.destroy');






    Route::get('/add_organization/{id?}', [OrganizationController::class, 'add_organization'])->name('add_organization')->middleware('permission:add_organization');
    Route::post('/organization_store/{id?}', [OrganizationController::class, 'organization_store'])->name('organization_store')->middleware('permission:add_organization');
    Route::put('/organization_update/{organization}', [OrganizationController::class, 'organization_update'])->name('organization_update')->middleware('permission:edit_organization');
    Route::get('/delete_organization/{id}', [OrganizationController::class, 'organization_delete'])->name('delete_organization')->middleware('permission:delete_organization');
    Route::get('/admin/category/add', AddPostCategory::class)->name('admin.addcategory')->middleware('permission:add_post_category');

    Route::get('/post-category', AllPostCategory::class)->name('admin.all.post.category')->middleware('permission:add_post_category');
    Route::get('/admin/categories/{category}/edit', EditPostCategory::class)->name('admin.categories.edit')->middleware('permission:edit_post_category');


    // USER ROUTE
    Route::get('/admin/real-users', [UserController::class, 'realUser'])->name('admin.real.user')->middleware('permission:real_user_view');
    Route::get('/admin-filter-real-users', [UserController::class, 'showUser'])->name('filter.user.date')->middleware('permission:filter_user');
    Route::get('/download-today-user', [UserController::class, 'downloadToday'])->name('download.today.users')->middleware('permission:download_today_user');
    Route::get('/download-by-date-user', [UserController::class, 'downloadByDate'])->name('download.by.date.users')->middleware('permission:download_bydate_user');
    Route::get('/admin-filter-fake-users', [UserController::class, 'showfakeUser'])->name('filter.fake.user.date')->middleware('permission:filter_fake_user');
    Route::get('/download-today-fake-user', [UserController::class, 'downloadFakeToday'])->name('download.today.fake.users')->middleware('permission:download_today_fake_user');
    Route::get('/download-fake-by-date-user', [UserController::class, 'downloadFakeByDate'])->name('download.fake.by.date.users')->middleware('permission:download_bydate_fake_user');








    Route::get('/admin/blocked-users', [UserController::class, 'fakeUser'])->name('admin.fake.user')->middleware('permission:fake_user');
    Route::post('/update-is_active/{userId}', [UserController::class, 'updateIsActive'])->middleware('permission:fake_user');

    // USER POST
    Route::get('/admin/real-post', [PostController::class, 'realPost'])->name('admin.real.post')->middleware('permission:real_post');
    Route::get('/admin-filter-real-post', [PostController::class, 'showRealpost'])->name('filter.post.date')->middleware('permission:filter_post_date');
    Route::get('/admin-filter-fake-post', [PostController::class, 'showFakepost'])->name('filter.fake.post.date')->middleware('permission:filter_fake_post');
    Route::get('/admin/fake-post', [PostController::class, 'fakePost'])->name('admin.fake.post')->middleware('permission:fake_post');
    Route::post('/update-post-is_active/{postId}', [PostController::class, 'updateIsActive'])->middleware('permission:update_post_isactive');



    Route::get('/load-more-posts', [PostController::class, 'loadMorePosts'])->name('load-more-posts');
    // SONG

    Route::get('/admin/song-list', [SongController::class, 'index'])->name('admin.song.index')->middleware('permission:song_list');
    Route::get('/admin/song-create', [SongController::class, 'create'])->name('admin.song.create')->middleware('permission:create_song');
    Route::post('/admin/song-post', [SongController::class, 'store'])->name('admin.song.store')->middleware('permission:create_song');
    Route::get('/admin/song-edit/{song}', [SongController::class, 'edit'])->name('admin.song.edit')->middleware('permission:edit_song');
    Route::post('/admin/song-update/{song}', [SongController::class, 'update'])->name('admin.song.update')->middleware('permission:edit_song');
    // Admin Category
    Route::get('/admin-category-list', [CategoryController::class, 'index'])->name('admin.category.index')->middleware('permission:category_list');
    Route::get('/admin-category-create', [CategoryController::class, 'create'])->name('admin.category.create')->middleware('permission:create_category');
    Route::post('/admin-category-store', [CategoryController::class, 'storeCategory'])->name('admin.category.store')->middleware('permission:create_category');
    Route::get('/admin-category-edit/{category}', [CategoryController::class, 'edit'])->name('admin.category.edit')->middleware('permission:edit_category');
    Route::post('/categories/{category}', [CategoryController::class, 'update'])->name('admin.category.update')->middleware('permission:edit_category');
;
  
    Route::get('/categories/filter', [CategoryController::class, 'filter'])->name('categories.filter');
    




    // Dashboard Like
    Route::get('/admin/post-like/{post}', [PostController::class, 'showLikesForPost'])->name('admin.like.post')->middleware('permission:like_post');
    Route::get('/admin/post-comments/{post}', [PostController::class, 'showCommentsForPost'])->name('admin.comment.post')->middleware('permission:comment_post');

    // Wallet And View
    Route::get('/admin/post-watch-list/{post}', [PostController::class, 'showWatclist'])->name('admin.post.watchlist')->middleware('permission:watch_list');


    // ADVERTISMENT
    Route::get('/admin/advertismnet-partners-list', [AdvertiserController::class, 'advertiserList'])->name('admin.advertiser.list')->middleware('permission:advertisement_list');
    Route::get('/admin-add-advertisment-partner', [AdvertiserController::class, 'createAdvertiser'])->name('admin.add.advertiser')->middleware('permission:add_advertiser');
    Route::post('/admin-store-advertisment-partners', [AdvertiserController::class, 'storeAdvertiser'])->name('admin.store.advertiser')->middleware('permission:add_advertiser');

    Route::post('/update-advertiser-is_active/{postId}', [AdvertiserController::class, 'updateIsActive'])->middleware('permission:update_advertiser_isactive');

    Route::get('/plan/{advertiserId}', [AdvertiserController::class, 'showPlan'])->name('plan.show')->middleware('permission:show_plan');

    Route::post('/update-plan-status/{planId}', [AdvertiserController::class, 'updatePlanStatusAndDates'])->name('update.plan.status')->middleware('permission:plan_videos');
    Route::get('/plans/{addplanId}/videos', [AdvertiserController::class, 'showVideo'])->name('plan.videos')->middleware('permission:plan_videos');
    Route::post('/update-video-status/{videoId}', [AdvertiserController::class, 'updateVideoActive'])->middleware('permission:update_videos_status');

    Route::get('add-delete-vide/{videoId}', [AdvertiserController::class, 'deleteAddVideo'])->name('admin.add.video.delete')->middleware('permission:delete_add_video');

    Route::get('/payment/details/{planId}', [AdvertiserController::class, 'showPaymentDetails'])->name('payment.details')->middleware('permission:show_payment_details');
    //Advertisment Pricing
    Route::get('/set-advertisment-pricing', [AddpricingController::class, 'create'])->name('admin.addpricing.create')->middleware('permission:create_advertisement_pricing');
    Route::post('/store-advertisment-pricing', [AddpricingController::class, 'store'])->name('admin.add.pricing.store')->middleware('permission:create_advertisement_pricing');
    Route::get('/advertisment-pricing-list', [AddpricingController::class, 'index'])->name('admin.add.pricing.index')->middleware('permission:advertisement_pricing_list');
    Route::get('/advertisment-pricing-update/{pricing}', [AddpricingController::class, 'edit'])->name('admin.add.pricing.edit')->middleware('permission:edit_advertisement_pricing');
    Route::post('/update-advertisment-pricing/{pricing}', [AddpricingController::class, 'update'])->name('admin.add.pricing.update')->middleware('permission:edit_advertisement_pricing');
    // Advertisment Category
    Route::get('/advertisment-category-list', [AddcategoryController::class, 'index'])->name('admin.index.add.category')->middleware('permission:advertisement_category_list');
    Route::get('/create-advertisment-category', [AddcategoryController::class, 'create'])->name('admin.create.add.category')->middleware('permission:create_advertisement_category');
    Route::get('admin/advertisement/category/edit/{slug}', [AddcategoryController::class, 'edit'])->name('admin.edit.add.category')->middleware('permission:edit_advertisement_category');
    Route::post('/store-advertisment-category', [AddcategoryController::class, 'store'])->name('admin.store.add.category')->middleware('permission:create_advertisement_category');

    Route::post('/advertisement/category/update/{slug}', [AddcategoryController::class, 'update'])->name('admin.advertisement.category.update')->middleware('permission:edit_advertisement_category');












    // BLOG CATEGORY ROUTE
    Route::get('/admin/blog-category-index', [BlogController::class, 'index'])->name('admin.blog.category.index')->middleware('permission:blog_list');
    Route::get('/admin/blog-category-create', [BlogController::class, 'create'])->name('admin.blog.category.create')->middleware('permission:create_blog');
    Route::post('/admin/blog-category-store', [BlogController::class, 'store'])->name('admin.blog.category.store')->middleware('permission:create_blog');
    Route::get('/admin/blog-category-edit/{category}', [BlogController::class, 'edit'])->name('admin.blog.category.edit')->middleware('permission:edit_blog');
    Route::post('/admin/blog-category-update/{category}', [BlogController::class, 'update'])->name('admin.blog.category.update')->middleware('permission:edit_blog');

    // BLOG ROUTE
    Route::get('/admin/blog-create', [BlogController::class, 'createBlog'])->name('admin.blog.create')->middleware('permission:create_blog');
    Route::post('/admin/blog-store', [BlogController::class, 'storeBlog'])->name('admin.blog.store')->middleware('permission:create_blog');
    Route::get('/admin/blog-list', [BlogController::class, 'blogIndex'])->name('admin.blog.index')->middleware('permission:blog_list');
    Route::get('/admin/blog/{slug}/edit', [BlogController::class, 'editBlog'])->name('admin.blog.edit')->middleware('permission:edit_blog');
    Route::post('/admin/blog-update/{slug}', [BlogController::class, 'updateBlog'])->name('admin.blog.update')->middleware('permission:edit_blog');
    Route::delete('/blogs/{id}', [BlogController::class, 'destroy'])->name('blogs.destroy')->middleware('permission:delete_blog');

    //Earnings Points Route
    Route::get('/admin-earning-points-list', [EarningController::class, 'index'])->name('admin.earning.list')->middleware('permission:earning_points_list');
    Route::get('/admin/earning-points-create', [EarningController::class, 'create'])->name('admin.create.earning')->middleware('permission:create_earning_points');
    Route::post('/admin/earning-points-store', [EarningController::class, 'store'])->name('admin.store.earning')->middleware('permission:create_earning_points');
    Route::get('/admin/earning-points-edit/{earning}', [EarningController::class, 'edit'])->name('admin.edit.earning')->middleware('permission:edit_earning_points');
    Route::post('/admin/earning-points-update/{earning}', [EarningController::class, 'update'])->name('admin.update.earning')->middleware('permission:edit_earning_points');

    //USER WALLET RECORD HISTORY
    Route::get('/admin/user-wallet-list', [UserController::class, 'userWallet'])->name('admin.user.wallet')->middleware('permission:user_wallet_list');
    Route::get('/search/user-wallet', [UserController::class, 'searchUserWallet'])->name('admin.search.wallet')->middleware('permission:search_user_wallet');


    Route::get('/admin-official-verify', [UserController::class, 'offcialVrification'])->name('admin.official.verify')->middleware('permission:official_verification');

    Route::post('/update-verify-status/{id}', [UserController::class, 'updateStatus'])->name('verify.updateStatus')->middleware('permission:update_verify_status');



    // TERMS ROUTE
    Route::get('/admin-terms-policies-list', [TermsController::class, 'index'])->name('admin.terms.index')->middleware('permission:term_policy_list');
    Route::get('/admin-create-terms-condition', [TermsController::class, 'create'])->name('admin.terms.create')->middleware('permission:create_term_policy');
    Route::post('/admin-store-terms-policies', [TermsController::class, 'store'])->name('admin.store.terms')->middleware('permission:create_term_policy');
    Route::get('/admin-terms-policies-edit/{term}', [TermsController::class, 'edit'])->name('admin.term.edit')->middleware('permission:edit_term_policy');
    Route::post('/admin-terms-update/{term}', [TermsController::class, 'updateTerms'])->name('admin.update.terms')->middleware('permission:edit_term_policy');

    // TAX AND PERCENTAGE
    Route::get('admin-gst-index', [GstController::class, 'index'])->name('admin.gst.index')->middleware('permission:gst_list');
    Route::get('/admin-create-gst', [GstController::class, 'create'])->name('admin.gst.create')->middleware('permission:create_gst');
    Route::post('/admin-store-gst', [GstController::class, 'store'])->name('admin.gst.store')->middleware('permission:create_gst');
    Route::get('/admin-gst-edit/{gst}', [GstController::class, 'edit'])->name('admin.gst.edit')->middleware('permission:edit_gst');
    Route::post('/admin-gst-update/{gst}', [GstController::class, 'update'])->name('admin.gst.update')->middleware('permission:edit_gst');

    // Admin Taxes Type
    Route::get('/admin-taxes-type-create', [TaxController::class, 'create'])->name('admin.taxes.type.create')->middleware('permission:create_tax');
    Route::post('/admin-taxes-type-store', [TaxController::class, 'store'])->name('admin.taxes.type.store')->middleware('permission:create_tax');
    Route::get('/admin-taxes-type-index', [TaxController::class, 'index'])->name('admin.taxes.type.index')->middleware('permission:tax_list');
    Route::get('/admin-taxes-type-edit/{tax}', [TaxController::class, 'edit'])->name('admin.taxes.type.edit')->middleware('permission:edit_tax');
    Route::post('/admin-taxes-type-update/{tax}', [Taxcontroller::class, 'update'])->name('admin.taxes.type.update')->middleware('permission:edit_tax');
    // ADMIN TAXES CHARGES
    Route::get('/admin-taxes-charges-create', [Taxcontroller::class, 'createTaxcharge'])->name('admin.tax.charge.create')->middleware('permission:create_taxcharges');
    Route::post('/admin-taxes-charges-store', [Taxcontroller::class, 'storeTaxcharge'])->name('admin.tax.charges.store')->middleware('permission:create_taxcharges');
    Route::get('/admin-taxes-charges-index', [Taxcontroller::class, 'indexTaxcharges'])->name('admin.tax.charges.index')->middleware('permission:taxcharges_list');
    Route::get('/admin-taxes-charges-edit/{taxcharge}', [Taxcontroller::class, 'editTaxcharges'])->name('admin.tax.charges.edit')->middleware('permission:edit_taxcharges');
    Route::post('/admin-taxes-charges-update/{taxcharge}', [Taxcontroller::class, 'updateTaxcharge'])->name('admin.tax.charges.update')->middleware('permission:edit_taxcharges');

    // BILLING AND TRANSACTION
    Route::get('/admin-advertisment-billing-and-transaction', [TransactionController::class, 'showAddtransaction'])->name('admin.advertisment.payment.trns')->middleware('permission:advertisement_billing_transaction');
    Route::get('/download-payments', [TransactionController::class, 'downlodAddpayment'])->name('download.payments')->middleware('permission:download_payment');
    Route::get('/admin-advertisment-billing-and-transaction/today', [TransactionController::class, 'showAddtransaction'])->name('add.transaction.today')->middleware('permission:show_today_addtransaction');
    Route::get('/download-today', [TransactionController::class, 'downloadToday'])->name('download.today')->middleware('permission:download_today_addtransaction');
    Route::get('/download-by-date', [TransactionController::class, 'downloadByDate'])->name('download.by.date')->middleware('permission:download_bydate_addtransaction');



    // SETTINGS FOR ADMIN AND DASHBOARD

    Route::get('/admin-other-links/create', [OtherlinkController::class, 'create'])->name('admin.other_link.create')->middleware('permission:create_otherlinks');
    Route::get('/admin-other-links/list', [OtherlinkController::class, 'index'])->name('admin.other_link.index')->middleware('permission:otherlinks_list');
    Route::get('/admin-other-links/edit/{otherlink}', [OtherlinkController::class, 'edit'])->name('admin.other_link.edit')->middleware('permission:edit_otherlinks');
    Route::post('/admin-other-links/store', [OtherlinkController::class, 'store'])->name('admin.other_link.store')->middleware('permission:create_otherlinks');
    Route::post('/admin-other-links/update/{otherlink}', [OtherlinkController::class, 'update'])->name('admin.other_link.update')->middleware('permission:edit_otherlinks');

    // UPDATE PASSWORD
    Route::get('/admin-update-password-view', [UpdatepasswordController::class, 'updatepasswordview'])->name('admin.update.password.view')->middleware('permission:update_password');
    Route::post('/admin/update/password', [UpdatepasswordController::class, 'updatePassword'])->name('admin.update.password')->middleware('permission:update_password');
    // WithDrawl
    Route::get('/admin-withawal-history', [UserwithdrawlController::class, 'showWithdrawal'])->name('admin.user.withdrawal')->middleware('permission:withdrawal_history');
    Route::get('/download-today-withdrawal', [UserwithdrawlController::class, 'downloadToday'])->name('download.today.withdrawal')->middleware('permission:download_today_withdrawal');
    Route::get('/download-by-date-withdrawal', [UserwithdrawlController::class, 'downloadByDate'])->name('download.by.date.withdrawal')->middleware('permission:download_bydate_withdrawal');

// USER BANK
// WITHOUT ROLES AND PERMISSION
Route::get('/user-bank-details/{user_id}', [UserController::class, 'userBank'])->name('admin.user.bank.details');
// USER INFORMATION
Route::get('/user-info-details/{user_id}',[UserController::class,'userDetails'])->name('admin.user.details');
Route::get('/user-document-verification-date/{user_id}',[UserController::class,'userData'])->name('admin.user.data');
Route::get('/user-wallet_record/{user_id}',[UserController::class,'userWallet_record'])->name('admin.user.wallet.record');
// REASON BLOCK USER
Route::post('/admin/block/user', [UserController::class, 'blockUser'])->name('admin.block.user');
Route::post('/admin/block/post',[PostController::class,'blockPost'])->name('admin.block.post');

//USER REPORT RECORD
// Route::get('/admin-reported-account/{user_id}',[UserController::class,'reportAccount'])->name('admin.reported.account');
//POST REPORT
Route::get('/admin-post-report/{post_id}',[PostController::class,'reportPost'])->name('admin.reported.post');
// POST INFO
Route::get('/admin-post-details/{post_id}',[PostCOntroller::class,'postInfo'])->name('admin.post.info');

// ADD BANNER CONTROLLER ROUTE
Route::get('/add-banner-create',[BanneraddController::class,'create'])->name('admin.create.banner.add');
Route::post('/add-banner-store',[BanneraddController::class,'store'])->name('admin.add.banner.store');
Route::get('/add-banner-index',[BanneraddController::class,'index'])->name('admin.add.banner.index');

// Add this route definition in your web.php file or routes file

Route::post('/admin/update-banner-status/{addbannerId}', [BanneraddController::class, 'updateIsActive'])->name('admin.update.banner.status');

Route::get('/post-stats/{period?}', [AuthController::class, 'getPostStatsForPeriod']);
Route::get('/user-stats/{period?}', [AuthController::class, 'getUserStatsForPeriod']);

// OFFICIAL VERIFICATION
Route::get('/official-payments-history',[OfficialpaymentController::class,'showOfficial'])->name('admin.official.payment');
Route::get('/admin-/official-payments-history/today', [OfficialpaymentController::class, 'showOfficialtransaction'])->name('official.transaction.today');
Route::get('/admin-/official-payment/{user_id}', [OfficialpaymentController::class, 'showpayment'])->name('official.payment.user');


});



// Forntend Route
Route::get('/', [PageController::class, 'home'])->name('frontend.home');
Route::get('/about-us', [PageController::class, 'aboutUs'])->name('frontend.about');
Route::get('/blog', [PageController::class, 'blogList'])->name('frontend.blog');
Route::get('/blog-details/{slug}', [PageController::class, 'blogDetails'])->name('blog.details');
Route::get('/blog/{slug}', [PageController::class, 'blogsByCategory'])->name('category.blog');
Route::get('/contact-us', [PageController::class, 'contactUs'])->name('frontend.contact');
// User Contact Controller
Route::post('/contact-inquiry', [ContactController::class, 'store'])->name('user.contact.store');

Route::get('/our-terms-and-condition', [PageController::class, 'viewTerms'])->name('our-terms');
Route::get('/our-advertisment-policies', [PageController::class, 'viewAddpolicy'])->name('our-add-policies');
Route::get('/our-official-verification-policies', [PageController::class, 'viewOfficialpolicy'])->name('our-official-policies');
Route::get('/our-privacy-policies', [PageController::class, 'viewprivacypolicies'])->name('our-privacy-policies');
Route::get('/our-content-write-policies', [PageController::class, 'viewcontentCreator'])->name('our-content-writer-policies');
Route::get('/our-content-viewer-policies', [PageController::class, 'viewViewerpolicies'])->name('our-content-viewer-policies');






Route::get('/invoice', function () {
    return view('frontend.adds.invoice');
});

// Advertisment Registration
Route::post('/advertisment-registration', [AddsController::class, 'store'])->name('frontend.adds.register');

Route::post('/advertisment-login', [AddAuthController::class, 'addLogin'])->name('add.login');

Route::post('/update-profile', [AddsController::class, 'updateProfile'])->name('update-profile');

Route::group(['middleware' => 'auth:advertiser'], function () {

    Route::get('/add-dashboard', [AddAuthController::class, 'addDashboard'])->name('add.dashboard');
    Route::get('/adds-update-profile', [AddAuthController::class, 'updateloginProfile'])->name('add.login.update.profile');

    // Adds Plan
    Route::get('/advertisment-plan', [AddplanController::class, 'choosePlan'])->name('add.choose.plan');

    Route::post('/calculate-payment-amount', [AddplanController::class, 'calculatePaymentAmount'])->name('calculate.payment.amount');
    Route::post('/store-advertisment-plan', [AddplanController::class, 'store'])->name('store.add.plan');

    Route::get('/addplan/show', [AddplanController::class, 'myAddshow'])->name('addplan.show');




    Route::get('/add-video', [AddvideoController::class, 'addVideo'])->name('add.add.video');

    Route::get('/calculate-payment-amount', [AddvideoController::class, 'calculatePaymentAmount'])->name('calculate.payment.amount');

    Route::post('/store-advertisment-video', [AddvideoController::class, 'store'])->name('add.video.store');
    Route::get('/videos', [AddvideoController::class, 'showVideo'])->name('advertiser.videos');

    Route::get('/logout', [AddAuthController::class, 'logout'])->name('logout');

    Route::get('plan-payment/{advertiser_id}/{payment_amount}/{addplan_id}', [PaymentController::class, 'index'])->name('payment.index');



    Route::post('/razorpay-payment', [PaymentController::class, 'store'])->name('razorpay.payment.store');
    Route::get('/advertiser-banner-advertisment',[BanneraddsController::class,'create'])->name('adds.banner.inquiry');

    Route::post('/advertiser-banner-advertisment-store',[BanneraddsController::class,'store'])->name('adds.banner.store');




});
Route::get('/invoice/{payment}', [PaymentController::class, 'showInvoicePage'])->name('invoice.show');
// OFFICIAL PAYMENT PAGE
Route::get('/payment-account-official-verification/{id}/{amount}',[OfficialpaymentController::class,'create'])->name('official.payment.page');
Route::post('/officialpayments/store', [OfficialpaymentController::class, 'store'])->name('officialpayments.store');
// ACCOUNT DELETE
Route::get('/delete-account-request',[DeleteaccountController::class,'accountDelete'])->name('delete.account.request');

// PAYMENT SUCCESS
Route::get('/Thankyou-Payment-Success',[PageController::class,'payment_success'])->name('payment.success');

// Advertiser Forget Password


Route::get('/verify-send-update-poassword-link',[ForgetpasswordController::class,'viewemailPage'])->name('email.page.password');
Route::post('/send-reset-link', [ForgetpasswordController::class, 'sendResetLink'])->name('password.send-reset-link');

// Route to display the reset password form with token and email in the query string
Route::get('/reset-password/{token}', [ForgetpasswordController::class, 'showResetForm'])->name('password.reset');

// Route to update the password
Route::post('/reset-password', [ForgetpasswordController::class, 'resetPassword'])->name('password.update');












