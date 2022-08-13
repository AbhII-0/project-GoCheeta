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


			<div class="row">
				<div class="small-12 medium-2 large-2 columns">
					<div class="circle">
						<img class="profile-pic upload-button"
							src="${initParam['basePath']}/assets/images/user-img.png"><input
							class="file-upload" type="file" accept="image/*" />

					</div>
					<!--<div class="p-image">
						<i class="fa fa-camera upload-button"></i> <input
							class="file-upload" type="file" accept="image/*" />
					</div>-->
				</div>
			</div>


			<input type="text" name="userName" id="userName"
				placeholder="User Name" autocomplete="off" required="required">
			<input type="email" name="email" id="email" placeholder="E-Mail"
				autocomplete="off" required="required"> <input type="number"
				name="tp" id="tp" placeholder="Mobile Number" autocomplete="off"
				required="required" min="0"> <input type="password"
				name="password" id="password" placeholder="Password"
				required="required">
			<button class="submit-btn"
				style="margin-left: 30%; margin-right: 30%; margin-top: 10px;">SIGN
				UP</button>
			<hr>
			<div class="options">
				<div>
					Do you have a account? <a class="link" href="">SIGN IN</a>
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