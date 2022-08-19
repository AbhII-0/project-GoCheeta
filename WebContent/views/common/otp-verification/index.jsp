<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GoCheeta | SIGN UP</title>

<!-- signIN/UP  CSS-->
<link rel="stylesheet" type="text/css"
	href="${initParam['basePath']}/assets/css/register.css" />

<!-- fontawsome stylesheet -->
<script src="https://kit.fontawesome.com/57cb8f938d.js"
	crossorigin="anonymous"></script>
<body>
		<div class="popup" style="height: auto;">
			<form class="signinForm" onsubmit="return false" action="">
				<h1 class="title" style="text-align: center; margin-bottom: 10px;">SIGN
					UP</h1>
				<h3
					style="margin-bottom: 20px; text-align: center; text-size-adjust: auto;">
					OTP code send to this mail. : <span style="color: #ffeb3b;">user1234@gmail.com</span>
				</h3>
				<div>
					<input type="number" class="otp-no" name="otpNo1" id="otpNo1"
						placeholder="" autocomplete="off" required="required" min="0"
						max="9"> <input type="number" class="otp-no" name="otpNo2"
						id="otpNo2" placeholder="" autocomplete="off" required="required"
						min="0" max="9"> <input type="number" class="otp-no"
						name="otpNo3" id="otpNo3" placeholder="" autocomplete="off"
						required="required" min="0" max="9"> <input type="number"
						class="otp-no" name="otpNo4" id="otpNo4" placeholder=""
						autocomplete="off" required="required" min="0" max="9"> <input
						type="number" class="otp-no" name="otpNo5" id="otpNo5"
						placeholder="" autocomplete="off" required="required" min="0"
						max="9"> <input type="number" class="otp-no" name="otpNo6"
						id="otpNo6" placeholder="" autocomplete="off" required="required"
						min="0" max="9">
				</div>
				<button class="submit-btn"
					style="margin-left: 30%; margin-right: 30%; margin-top: 10px; margin-bottom: 10px; font-size: medium; width: 40%;">CONFIRM</button>
				<hr>
				<div class="options">
					<div>
						Did't get a code ? <a class="link" href="">RESEND</a>
					</div>
					<div>
						Need to change email ? <a class="link" href="">BACK</a>
					</div>
				</div>
			</form>
		</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript"
		src="${initParam['basePath']}/assets/js/image-upload.js"></script>
</body>
</html>