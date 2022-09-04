<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GoCheeta | SIGN UP</title>

<!-- signIN/UP  CSS-->
<link rel="stylesheet" type="text/css"
	href="${initParam['basePath']}/assets/css/register.css" />
	
<!--scrollbar -->
<link rel="stylesheet" type="text/css"
	href="${initParam['basePath']}/assets/css/scrollbar.css" />


<!-- fontawsome stylesheet -->
<script src="https://kit.fontawesome.com/57cb8f938d.js"
	crossorigin="anonymous"></script>
<body>
<div>
	<h4 id="issue-alert" class="issue-alert-none">Please Check All Fields Corectly...!</h4>
	</div>
	<div class="popup" style="height: auto;">
		<form class="signinForm" method="post" action="/GoCheeta/driver/signUp">
			<h1 class="title" style="text-align: center;">SIGN
				UP</h1>


			<div class="row">
				<div class="small-12 medium-2 large-2 columns">
					<div class="circle" >
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


			<input class="required" type="text" name="userName" id="userName"
				placeholder="User Name" autocomplete="off" required="required">
			<input class="required" type="email" name="email" id="email" placeholder="E-Mail"
				autocomplete="off" required="required"> <input class="required" type="number"
				name="tp" id="tp" placeholder="Mobile Number" autocomplete="off"
				required="required" min="0"> <select name="driverBranch" class="branch-select required"
				required>
				<option class="select-options" value="" disabled="disabled" selected="selected">SELECT
					BRANCH</option>
				<c:forEach var="branch" items="${listBranches}">
												<option value="<c:out value="${branch.branch_id}" />"><c:out value="${branch.branch_loaction}" /></option>
												</c:forEach>
			</select> <input class="required" type="password" name="password" id="password"
				placeholder="Password" required="required">
			<div id="pBar" style="margin-left: 3%; margin-right: 3%;">
				<span class="">
					<div></div>
				</span>
			</div>
			<div>
				<input class="required" id="termCondition" name="termCondition" type="checkbox"
					aria-label="Checkbox for term & Condition"
					style="backdrop-filter: none; height: 15px; width: 15px; margin-top: 3%;"
					required> <label style="font-size: medium;"
					for="termCondition"> Agree For Term & Conditions.</label> <a
					style="color: yellow; text-decoration: none" href="">SEE...!</a>
			</div>
			<button class="submit-btn sign-up-btn"
				style="margin-left: 30%; margin-right: 30%;">SIGN
				UP</button>
			<hr>
			<div class="options">
				<div>
					Do you have a account? <a class="link" onclick="location='/GoCheeta/driver/sign-in'" >SIGN IN</a>
				</div>
			</div>
		</form>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript"
		src="${initParam['basePath']}/assets/js/image-upload.js"></script>
	<script type="text/javascript"
		src="${initParam['basePath']}/assets/js/scrollbar.js"></script>
	<script>
	if(performance.navigation.type == 2){
		   location.reload(true);
		}
	</script>
</body>
</html>