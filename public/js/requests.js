$(function() {
	$('.button').click(function(){
		$.ajax({
			url: "/setcolour/" + $(this).attr('name'),
			success: function(data) {
				$('.light-status').html(data)
			}
		})
	});
});