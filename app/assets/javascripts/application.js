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
//= require_tree ./

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

$(function () {
	$(".room_buttons").on("click", function (e) {
		$("body").prepend("<div id=notifications></div>")
		var self = e.target;
		var buttonId = $(this).data("buttonId");
		console.log("buttonId", buttonId);
		$.post("/buttons/" + buttonId + "/votes").
			done(function (data) {
				console.log(data);
				if (data.status === "ERROR") {
					$('#notifications').text('You have already voted').addClass("custom_alert");
					$(self).css("background-color", "rgba(149, 165, 166,1.0)");
				}
				else {
					$('#notifications').text('Your vote has been recorded').addClass("custom_success");
					$(self).css("background-color", "rgba(149, 165, 166,1.0)");
				}
				$('#notifications').fadeOut(3000);
				if (data.votes === 0) {
					console.log('at 0');
					$(self).fadeOut(3000).hide();
				}
			});
	});
})
