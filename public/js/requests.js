$(function() {
	$('.button').click(function(){
		$.ajax({
			url: "/set_colour/" + $(this).attr('name'),
			success: function(data) {
				$('.light-status').html(data)
			}
		})
	});
});