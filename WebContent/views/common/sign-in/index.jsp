<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE >
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

</head>
<body>

	<div class="popup">

		<form class="signinForm" onsubmit="return false" action="">
			<h1 class="title" style="text-align: center; margin-bottom: 50px;">SIGN
				IN</h1>
			<button class="submit-btn"
				style="margin-left: 20%; margin-right: 20%; background: #00ffff;" onclick="location='/GoCheeta/sign-in'">
				USER <i class="fa-solid fa-user-astronaut"
					style="padding-left: 10px;"></i>
			</button>
			<button class="submit-btn"
				style="margin-left: 20%; margin-right: 20%; background: #ffe000;" onclick="location='/GoCheeta/driver/sign-in'">
				DRIVER <i class="fa-solid fa-id-card" style="padding-left: 10px;"></i>
			</button>
		</form>
	</div>
</body>
</html>