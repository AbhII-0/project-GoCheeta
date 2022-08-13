<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GoCheeta | SIGN IN</title>

<!-- signIN/UP  CSS-->
<link rel="stylesheet" type="text/css"
	href="${initParam['basePath']}/assets/css/sign-in.css" />

</head>
<body>

	<div class="popup">
		<div class="popup-image">
			<img
				src="https://images.unsplash.com/photo-1536846511313-4b07b637bff9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80"
				alt="Login page image">
		</div>
		<form class="signinForm" onsubmit="return false" action="">
			<h1 class="title">SIGN IN</h1>
			<input type="text" name="userName" id="userName"placeholder="User Name" autocomplete="off" required="required"> 
			<input type="password" name="password" id="password" placeholder="Password" required="required">
			<button class="submit-btn">SIGN IN</button>
			<hr>
			<div class="options">
				<div>
					Don't have a account? <a class="link" href="">join</a>
				</div>
				<div>
					Forgot your password? <a class="link" href="#">Reset</a>
				</div>
			</div>
		</form>
	</div>
</body>
</html>