<?php
use App\Http\Controllers\Api\V1\UserController;
use App\Http\Controllers\Api\LoginController;
use App\Http\Controllers\TestimonialController;
use App\Http\Controllers\PostController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

//Route::apiResource('v1/users', App\Http\Controllers\Api\V1\UserController::class)->only('show');

Route::post('login', [
    App\Http\Controllers\Api\LoginController::class,
    'login'
]);

Route::get('slider', [
    App\Http\Controllers\Api\sliderController::class,
    'showSlider'
]);

Route::controller(App\Http\Controllers\Api\TestimonialController::class)->group(function () {
    Route::get('testimonial', 'getTestimonials');
    Route::get('testimonials/{name}', 'search');
    Route::get('testimonials', 'getAllTestimonials');
    Route::post('testimonial', 'createTestimonial');
    Route::post('testimonial/edit/{id_testimonio}', 'editTestimony');
    Route::post('testimonial/delete/{id_testimony}', 'deleteTestimony');
});

Route::controller(App\Http\Controllers\Api\PostController::class)->group(function () {
    Route::post('post', 'createPost');
    Route::get('post/{id}', 'getPostById');
    Route::get('posts/{title}', 'searchPost');
    Route::get('posts', 'getAllPosts');
    Route::post('post/delete/{id_post}', 'deletePost');
    Route::post('post/edit/{id_post}', 'editPost');
    
});

Route::controller(App\Http\Controllers\Api\UserController::class)->group(function(){
    Route::post('users', 'searchUser');
    Route::post('register','registerUser');
    Route::post('user/delete/{id_user}', 'deleteUser');
    Route::post('user/change-role/{id_usuario}', 'changeRole');
    Route::post('change-password', 'changePassword');
    Route::get('user/{cookie}', 'searchByCookie');
    Route::post('user/edit/{cookie}', 'editByCookie');
    Route::post('user/isAdmin', 'isAdmin');
});

Route::controller(App\Http\Controllers\Api\EventController::class)->group(function(){
    Route::post('event', 'createEvent');
    Route::get('events', 'searchEvent');
    Route::post('event/delete/{id_event}', 'deleteEvent');
    Route::post('event/edit/{id_event}', 'editEvent');
});

Route::controller(App\Http\Controllers\Api\CareerController::class)->group(function(){
    Route::post('career', 'createCareer');
    Route::get('careers', 'getCareers');
    Route::get('career/{id}', 'getCarrerById');
    Route::get('career/search/{name}', 'searchCareer');
    Route::get('career/search', 'getAllCareers');
    Route::post('career/delete/{id}', 'deleteCareer');
    Route::post('career/edit/{id}', 'editCareer');
});

Route::controller(App\Http\Controllers\Api\SubjectController::class)->group(function(){
    Route::post('subject', 'createSubject');
    Route::get('subjects', 'getSubjects');
    Route::get('subject/{id}', 'getSubjectById');
    Route::get('subject/search/{name}', 'searchSubject');
    Route::get('subject/search', 'getSubjects');
    Route::post('subject/delete/{id}', 'deleteSubject');
    Route::post('subject/edit/{id}', 'editSubject');
});

Route::controller(App\Http\Controllers\Api\ComplaintController::class)->group(function(){
    Route::post('complaint', 'createComplaint');
    Route::post('complaints', 'getComplaints');
    Route::get('complaint/{url}', 'getComplaintByUrl');
    Route::post('complaint/search/{name}', 'searchComplaint');
    Route::post('complaint/delete/{url}', 'deleteComplaint');
    Route::post('complaint/edit/{url}', 'editComplaint');
    Route::post('complaint/check/{id}', 'checkComplaint');
});

Route::controller(App\Http\Controllers\Api\AdmissionController::class)->group(function(){
    Route::post('admission', 'createAdmission');
    Route::post('admissions', 'getAdmissions');
    Route::get('admission/{url}', 'getAdmissionByUrl');
    Route::post('admission/search/{name}', 'searchAdmission');
    Route::post('admission/delete/{url}', 'deleteAdmission');
    Route::post('admission/edit/{url}', 'editAdmission');
    Route::post('admission/response/{id}', 'respondAdmission');
    Route::post('admission/check/{id}', 'checkAdmission');
});

Route::controller(App\Http\Controllers\Api\FileController::class)->group(function(){
    Route::get('download/{filename}', 'download');
    Route::get('database/download/{cookie}', 'backupDownload');
});

