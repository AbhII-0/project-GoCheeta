$(document).ready(function() {

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
		// console.log(e.key);
	}
});

$(".otp-no").keyup(function(e) {

	if ($(this).val().length >= 1) {
		// console.log(value.length);
		$(this).next('.otp-no').focus();
	}
});

$(".otp-no").keypress(function(e) {

	if ($(this).val().length >= 1) {
		// console.log(value.length);
		$(this).next('.otp-no').focus();
	}

	var value = $(this).val();
	if (value.length > 0) {
		e.preventDefault();
	}

	var invalidChars = [ "-", "+", "e", ];
	if (invalidChars.includes(e.key)) {
		e.preventDefault();
		// console.log(e.key);
	}

});

document.addEventListener('keyup', function() {

	var conditions = {};
	var password = document.querySelector('#password').value;
	var passwordStrength = document.querySelector('#pBar span');

	if (!/.{8,}/g.test(password)) {
		conditions.tooShort = true;
	}
	if (!/[a-z]/g.test(password)) {
		conditions.noLowerCaseLetter = true;
	}
	if (!/[A-Z]/g.test(password)) {
		conditions.noUpperCaseLetter = true;
	}
	if (!/[0-9]/g.test(password)) {
		conditions.noNumber = true;
	}
	if (!/[^0-9A-Za-z]/g.test(password)) {
		conditions.noSymbol = true;
	}

	if (password == '') {
		passwordStrength.className = '';
		return false;
	} else if (Object.keys(conditions).length >= 3) {
		passwordStrength.className = 'weak';
		return false;
	} else if (Object.keys(conditions).length >= 2) {
		passwordStrength.className = 'medium';
		return false;
	} else if (Object.keys(conditions).length == 1) {
		passwordStrength.className = 'medium';
		return false;
	} else if (!conditions.tooShort && Object.keys(conditions).length == 0) {
		passwordStrength.className = 'strong';
		return true;
	}

});

$(".sign-up-btn").click(
		function(e) {

			$.fn.passVali = function() {

				var conditions = {};
				var password = document.querySelector('#password').value;
				var passwordStrength = document.querySelector('#pBar span');

				if (!/.{8,}/g.test(password)) {
					conditions.tooShort = true;
				}
				if (!/[a-z]/g.test(password)) {
					conditions.noLowerCaseLetter = true;
				}
				if (!/[A-Z]/g.test(password)) {
					conditions.noUpperCaseLetter = true;
				}
				if (!/[0-9]/g.test(password)) {
					conditions.noNumber = true;
				}
				if (!/[^0-9A-Za-z]/g.test(password)) {
					conditions.noSymbol = true;
				}

				if (password == '') {
					passwordStrength.className = '';
					return false;
				} else if (Object.keys(conditions).length >= 3) {
					passwordStrength.className = 'weak';
					return false;
				} else if (Object.keys(conditions).length >= 2) {
					passwordStrength.className = 'medium';
					return false;
				} else if (Object.keys(conditions).length == 1) {
					passwordStrength.className = 'medium';
					return false;
				} else if (!conditions.tooShort
						&& Object.keys(conditions).length == 0) {
					passwordStrength.className = 'strong';
					return true;
				}

			}

			var total = 0;
			var fields = $('.required');
			for (var i = 0; i < fields.length; i++) {
				if ($(fields[i]).val() != '') {
					total = total + 1;
//					console.log(total);
				}
			}

			if ((total >= fields.length) && ($.fn.passVali())) {
			} else {
				e.preventDefault();
				
				$("#issue-alert").removeClass("issue-alert-none");
				$("#issue-alert").addClass("issue-alert");

				setTimeout(function() {
					$("#issue-alert").delay("slow").removeClass("issue-alert");
					$("#issue-alert").delay("slow")
							.addClass("issue-alert-none");
				}, 3000);
				
//				return false;

			}

		});