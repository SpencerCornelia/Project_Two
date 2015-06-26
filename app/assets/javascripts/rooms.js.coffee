source = new EventSource('/buttons/events')
source.addEventListener 'button', (e) ->
	button = $.parseJSON(e.data).message
	$('#button-con').append("#{button.condition}")