

$(function () {
	//startRefresh();
	console.log('loaded');
	// function startRefresh() {
	// 	console.log("REFRESh!")
	//     setTimeout(startRefresh,5000);
	//     $.getJSON(window.location, function(data) {
	// 				console.log(data)
	// 				$("#button-con").empty()
	// 				$(data).each(function (index, button) {
	// 					console.log(button)
	// 					$("#button-con").append("<div data-button-id=" + button.id + " class=hey >" + (button.condition) + "</div>");
	// 					$('.hey').addClass('btn btn-sm btn-primary col-xs-3 room_buttons ' + button.color );
	// 				})
	// 	   });
	// };

	$(".room_buttons").on("click", function (e) {
		console.log('clicked');
		var self = e.target;
		var buttonId = $(this).data("buttonId");
		console.log("buttonId", buttonId);
		$.post("/buttons/" + buttonId + "/votes").
			done(function (data) {
				console.log(data);
				if (data.status === "ERROR") {
					$('#notifications').text('You have already voted').addClass("custom_alert").removeClass("custom_success");
					$(self).css("background-color", "rgba(149, 165, 166,1.0)");
				}
				else {
					$('#notifications').text('Your vote has been recorded').addClass("custom_success").removeClass("custom_alert");
					$(self).css("background-color", "rgba(149, 165, 166,1.0)");
				}
				if (data.votes === 0) {
					console.log('at 0');
					$(self).fadeOut(2000).hide();
				}
			});
	});
});

