$(document).ready(function() {

	console.log("Click");

	var readURL = function(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('.profile-pic').attr('src', e.target.result);
			}

			reader.readAsDataURL(input.files[0]);
		}
	}

	$(".file-upload").on('change', function() {
		readURL(this);
	});

	$(".upload-button").on('click', function() {
		$(".file-upload").click();
	});
});


$("#tp").keypress(function(e) {

	var invalidChars = [ "-", "+", "e", ];
	if (invalidChars.includes(e.key)) {
		e.preventDefault();
		console.log(e.key);
	}
});