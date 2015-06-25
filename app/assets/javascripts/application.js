// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs 
//= require bootstrap
//= require turbolinks


var app = {};

app.readyAll = function() {
    var sideslider = $('[data-toggle=collapse-side]');
    var sel = sideslider.attr('data-target');
    var sel2 = sideslider.attr('data-target-2');
    sideslider.click(function(event){
      console.log('clicked');
      $(sel).toggleClass('in');
      $(sel2).toggleClass('out');	
      });
};

//Form Events

app.loginForm = function(self) {
	console.log('clicked');
	$("#login-form").delay(100).fadeIn(100);
	$("#register-form").fadeOut(100);
	$('#register-form-link').removeClass('active');
	$(self).addClass('active');
}

app.registerForm = function(self){
	$("#register-form").delay(100).fadeIn(100);
	$("#login-form").fadeOut(100);
	$('#login-form-link').removeClass('active');
	$(self).addClass('active');
}

//Event Listners


	//Form EL
	console.log("setting ELs for register forms")
	var $register = $('#register-form');

	$register.hide();


