$(function () {

	$.delete = function(url, data, callback, type){
	  if ( $.isFunction(data) ){
	    type = type || callback,
	    callback = data,
	    data = {}
	  }
	  return $.ajax({
	    url: url,
	    type: 'DELETE',
	    success: callback,
	    data: data,
	    contentType: type
	  });
	}

	var counter = 0;
	var counter2 = 100;

	startRefresh();
	console.log('loaded');
	function startRefresh() {
	    setTimeout(startRefresh,2000);
	    $.getJSON(window.location, function(data) {
					console.log(data);
					$("#button-con").empty()
					$(data).each(function (index, button) {
						var color;

						$("#button-con").append("<div id=" + counter + " data-button-id=" + button.id + " class=hey >" + (button.condition) + "</div>");
						$('.hey').addClass('btn btn-sm btn-primary col-xs-3 col-md-2 room_buttons not_voted_button');
						$("#button-con").append("<button id=" + counter2 + " data-button-id=" + button.id + " class=deletes col-xs-1>X</button>")
						$('.deletes').addClass('btn btn-danger col-xs-1 delete_buttons')
						$("#button-con").append("<div class=votes>" + (button.votes) + "</div>")
						determineColor();
						function determineColor() {
							if (button.votes <= 5) {
								color = "red_button";
							} else if (button.votes > 5 && button.votes <= 15) {
								color = "yellow_button";
							} else if (button.votes > 15 && button.votes <= 24) {
								color = "green_button";
							} else {
								color = "blue_button";
							}
						};
						$('#'+counter).addClass(color);
						$('.votes').addClass('votes_class' );
						deleteButtons();
						counter ++;
					})
		   });
	};

	function deleteButtons() {
		$(".deletes").on("click", function (e) {
			var self = e.target;
			var buttonId = $(this).data("buttonId");
			$.delete("/buttons/" + buttonId ).
				done(function (data) {
					console.log(data);
				});
		});
	};


});