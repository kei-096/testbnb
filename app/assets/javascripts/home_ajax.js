document.addEventListener("DOMContentLoaded", function(){
	$('#search').on('keyup', function(){
	autocomplete()
	});
});


function autocomplete(){
	$.ajax({
		url: 'listings/autocomplete',
		type: 'POST',
		data: $('#search').serialize(),
		dataType: 'json',
		error: function(){
			console.log('Something went wrong');
		},
		success: function(data){
			$('#list').html('');
			data.forEach(function(element){
				let option = document.createElement('option');
				option.value = element;

				$('#list').append(option);
			});
		}
	});
}