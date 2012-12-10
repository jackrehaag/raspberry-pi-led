$(function() {
	$('.button').click(function(){
	  colour = $(this).attr('name')
		$.ajax({
			url: "/set_colour/" + colour,
			success: function(data) {
				$('.light-status').html("The light is now " + colour)
			}
		})
	});
});