$ ->
	$('[data-toggle=collapse]').click ->
		$('.navbar-collapse').slideToggle()

	$('.navbar-collapse li a').click ->
		$('.navbar-collapse').slideToggle()

