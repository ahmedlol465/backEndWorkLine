<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ServiceController;
use App\Http\Controllers\ProjectController;

use App\Http\Controllers\PaymobController;
use App\Http\Controllers\PayPalApiController;
use App\Http\Controllers\UserBalanceController;
use App\Http\Controllers\FavouriteController;
use App\Http\Controllers\NotificationController;
use App\Http\Controllers\SubServieseController;
use App\Http\Controllers\BankAccountController;
use App\Http\Controllers\EmailController;
use App\Http\Controllers\CrediteCardController;
use App\Http\Controllers\VrificationController;
use App\Http\Controllers\OfferController;

// use App\Http\Controllers\UserBalanceController;
use App\Http\Controllers\TransactionController;

use App\Http\Controllers\PurchaseController; // Import PurchaseController

use App\Http\Controllers\UserStatisticController; // Import PurchaseController


use App\Http\Controllers\ContactMessageController; // Import PurchaseController



// Route::get('/user', function (Request $request) {
//     return $request->user();
// })->middleware('auth:sanctum');

use App\Http\Controllers\UserController;

Route::post('/register', [UserController::class, 'register']);
Route::post('/login', [UserController::class, 'login']);

Route::get('/GetAllFreelancers', [UserController::class, 'GetAllFreelancers']);

Route::
middleware('auth:api')->
post('/verifyEmail', [UserController::class, 'verifyEmail']);



Route::
middleware('auth:api')->
get('/GetUser', [UserController::class, 'GetUser']); // PUT or PATCH for update


Route::
// middleware('auth:api')->
post('/UserData', [UserController::class, 'UserData']);

Route::
// middleware('auth:api')->
post('/UserWork', [UserController::class, 'UserWork']);

Route::
middleware('auth:api')->
post('/addService', [ServiceController::class, 'store']);

Route::
middleware('auth:api')->
post('/addProject', [ProjectController::class, 'store']);
Route::get('/projects/get-project/{id}', [ProjectController::class, 'getProject']);



// Route::prefix('paymob')->group(function ()  {
    Route::post('/payment-key', [PaymobController::class, 'getAuthToken']);
    Route::post('/create-order', [PaymobController::class, 'createOrder']);
    Route::post('/callback', [PaymobController::class, 'paymentCallback']); // Paymob IPN
// });

Route::get('/payment/failure', [PaymobController::class, 'paymentFailure'])->name('payment.failure'); // Frontend redirect on failure
Route::get('/payment/success', [PaymobController::class, 'paymentSuccess'])->name('payment.success'); // Frontend redirect on success




// Route::prefix('paypal')->group(function () {
    Route::post('/paypal/create-order', [PayPalApiController::class, 'createOrder'])
    ->name('paypal.orders.create');

    Route::post('/paypal/capture-payment', [PayPalApiController::class, 'capturePayment'])->name('paypal.orders.capture');
    // Add more API routes here as needed (e.g., get order details, refunds, etc.)
// });


Route::get('/paypal/success', [PayPalApiController::class, 'success'])->name("payment.success");
// Route::get('/payment/success', function () {
//     return 'Payment was successful!';
// })->name('payment.success');

Route::get('/payment/cancel', function () {
    return 'Payment was canceled.';
})->name('payment.cancel');

// Route::get('/getUser', [UserController::class, 'GetUserData']);


Route::middleware('auth:api')->
apiResource('user-balances', UserBalanceController::class);


Route::apiResource('transactions', TransactionController::class);


Route::middleware('auth:api')->
get('projects/status-counts', [ProjectController::class, 'getStatusCounts']);



Route::apiResource('projects', ProjectController::class);





Route::middleware('auth:api')->
get('services/status-counts', [ServiceController::class, 'getStatusCounts']);

Route::apiResource('services', ServiceController::class);

Route::middleware('auth:api')->
get('purchases/status-counts', [PurchaseController::class, 'getStatusCounts']);


Route::
middleware('auth:api')->
apiResource('purchases', PurchaseController::class);



Route::
middleware('auth:api')->
apiResource('statistics', UserStatisticController::class);



Route::
middleware('auth:api')->
put('/profileUpdate', [UserController::class, 'updateProfile']); // PUT or PATCH for update



Route::
middleware('auth:api')->
put('/ResetPassword', [UserController::class, 'ResetPassword']); // PUT or PATCH for update



Route::post('/contact-freelancer', [ContactMessageController::class, 'store']);
Route::get('/contact-freelancers', [ContactMessageController::class, 'index']);
Route::get('/contact-freelancer/{contactMessage}', [ContactMessageController::class, 'show']);


Route::post('/sendRecavation', [UserController::class, 'sendResetLinkEmail']);





Route::
middleware('auth:api')
->post('/verifyAuth', [UserController::class, 'verifyAuth']);


Route::
middleware('auth:api')->
get('/getFavouritesByType', [FavouriteController::class, 'getFavouritesByType']);
// Route::get('/favouritessss', [FavouriteController::class, 'getFavouritesByType'])->where('type', '(project|freelancer)'); //

Route::
middleware('auth:api')->
apiResource('favourites', FavouriteController::class);






Route::apiResource('notification', NotificationController::class);



Route::apiResource('sub_service', SubServieseController::class);



Route::
middleware('auth:api')->
apiResource('bankAccount', BankAccountController::class);
Route::
middleware('auth:api')->
apiResource('email', EmailController::class);
Route::
middleware('auth:api')->
apiResource('creditCard', CrediteCardController::class);
Route::
middleware('auth:api')->
apiResource('VrificationController', VrificationController::class);





// Route::middleware('auth:sanctum')->group(function () {
    Route::middleware('auth:api')->
    get('/offers', [OfferController::class, 'index']);
    Route::middleware('auth:api')->
    post('/offers', [OfferController::class, 'store']);
    Route::middleware('auth:api')->
    get('/offers/{id}', [OfferController::class, 'show']);
    Route::middleware('auth:api')->
    put('/offers/{id}', [OfferController::class, 'update']);
    Route::middleware('auth:api')->
    delete('/offers/{id}', [OfferController::class, 'destroy']);
// });
