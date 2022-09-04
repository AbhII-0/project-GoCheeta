<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
if(session.getAttribute("driver_id") == null){	
	response.sendRedirect("/GoCheeta/driver/sign-in");
}
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description"
	content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
<meta name="author" content="AdminKit">
<meta name="keywords"
	content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

<title>GoCheeta | DASHBOARD</title>

<link href="${initParam['basePath']}/assets/admin-kit/css/app.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap"
	rel="stylesheet">
<!-- fontawsome stylesheet -->
<script src="https://kit.fontawesome.com/57cb8f938d.js"
	crossorigin="anonymous"></script>	
</head>

<body>
	<div class="wrapper">
	
		<jsp:include page="/views/driver/layouts/side-menu-bar.jsp" />

		<div class="main">
			
			<jsp:include page="/views/driver/layouts/nav-bar.jsp" />

			<main class="content">
			<div class="container-fluid p-0">

				<h1 class="h3 mb-3">
					<strong>Dashboard</strong>
				</h1>

				<div class="row">
					<div class="col-xl-6 col-xxl-5 d-flex">
						<div class="w-100">
							<div class="row">
								<div class="col-sm-6">
									<div class="card">
										<div class="card-body">
											<div class="row">
												<div class="col mt-0">
													<h5 class="card-title">Bookings</h5>
												</div>

												<div class="col-auto">
													<div class="stat text-primary">
														<i class="align-middle" data-feather="book"></i>
													</div>
												</div>
											</div>
											<h1 class="mt-1 mb-3"><c:out value="${bookingsCount}" /></h1>
										</div>
									</div>
									<div class="card">
										<div class="card-body">
											<div class="row">
												<div class="col mt-0">
													<h5 class="card-title">Vehicles</h5>
												</div>

												<div class="col-auto">
													<div class="stat text-primary">
														<i class="align-middle" data-feather="truck"></i>
													</div>
												</div>
											</div>
											<h1 class="mt-1 mb-3"><c:out value="${vehiclesCount}" /></h1>
										</div>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="card">
										<div class="card-body">
											<div class="row">
												<div class="col mt-0">
													<h5 class="card-title">Earnings</h5>
												</div>

												<div class="col-auto">
													<div class="stat text-primary">
														<i class="align-middle" data-feather="dollar-sign"></i>
													</div>
												</div>
											</div>
											<h1 class="mt-1 mb-3">RS. <c:out value="${rev}" /></h1>
										</div>
									</div>
									<div class="card">
										<div class="card-body">
											<div class="row">
												<div class="col mt-0">
													<h5 class="card-title">Rating</h5>
												</div>

												<div class="col-auto">
													<div class="stat text-primary">
														<i class="align-middle" data-feather="star"></i>
													</div>
												</div>
											</div>
											<h1 class="mt-1 mb-3">4/5</h1>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-xl-6 col-xxl-7">
						<div class="card flex-fill w-100">
							<div class="card-header">

								<h5 class="card-title mb-0">Monthly Colection</h5>
							</div>
							<div class="card-body py-3">
								<div class="chart chart-sm">
									<canvas id="chartjs-dashboard-line"></canvas>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
			</main>

			<footer class="footer">
				<div class="container-fluid">
					<div class="row text-muted">
						<div class="col-6 text-start">
							<p class="mb-0">
								<a class="text-muted" href="" target="_blank"><strong>GoCheeta
										&copy;</strong></a>
							</p>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>

	<script src="${initParam['basePath']}/assets/admin-kit/js/app.js"></script>
		<script>
	if(performance.navigation.type == 2){
		   location.reload(true);
		}
	</script>
	
	<jsp:include page="/views/driver/layouts/get-status.jsp" />

	<script>
		document.addEventListener("DOMContentLoaded", function() {
			
			const mnths = [];
			const revs = [];
			
			var xhr = new XMLHttpRequest();
			
			xhr.onreadystatechange = function () {
				  setTimeout(function() {
			        }, 3000);
	            if (xhr.readyState == XMLHttpRequest.DONE) {
//	                alert(xhr.responseText);
	                var jsonData = JSON.parse(xhr.responseText);
	                if(jsonData.status == true){
					//console.table(jsonData.monthsRev);
					
					for(var i = 0; i < jsonData.monthsRev.length; i++){
						
						var mnthText = "";
						//console.table(jsonData.monthsRev[i].mnth);
						switch (jsonData.monthsRev[i].mnth) {
						  case 1:
							  mnthText = "JAN";
						    break;
						  case 2:
							  mnthText = "FEB";
						    break;
						  case 3:
							  mnthText = "MAR";
							    break;
						  case 4:
							  mnthText = "APR";
							    break;
						  case 5:
							  mnthText = "AMY";
							    break;
						  case 6:
							  mnthText = "JUN";
							    break;
						  case 7:
							  mnthText = "JUL";
							    break;
						  case 8:
							  mnthText = "AUG";
							    break;
						  case 9:
							  mnthText = "SEP";
							    break;
						  case 10:
							  mnthText = "OCT";
							    break;
						  case 11:
							  mnthText = "NOV";
							    break;
						  default:
							  mnthText = "DEC";
							}	
						
						//console.log(mnthText);
						//console.log(revs);
					  
					  mnths.push(mnthText);
					  revs.push(jsonData.monthsRev[i].rev);
						}
						console.log(typeof mnths);
						console.log(typeof revs);
						
						var ctx = document.getElementById("chartjs-dashboard-line")
						.getContext("2d");
				var gradient = ctx.createLinearGradient(0, 0, 0, 225);
				gradient.addColorStop(0, "rgba(215, 227, 244, 1)");
				gradient.addColorStop(1, "rgba(215, 227, 244, 0)");
				// Line chart
				new Chart(document.getElementById("chartjs-dashboard-line"), {
					type : "line",
					data : {
						labels : mnths,
						datasets : [ {
							label : "Sales (RS. )",
							fill : true,
							backgroundColor : gradient,
							borderColor : window.theme.primary,
							data : revs
						} ]
					},
					options : {
						maintainAspectRatio : false,
						legend : {
							display : false
						},
						tooltips : {
							intersect : false
						},
						hover : {
							intersect : true
						},
						plugins : {
							filler : {
								propagate : false
							}
						},
						scales : {
							xAxes : [ {
								reverse : true,
								gridLines : {
									color : "rgba(0,0,0,0.0)"
								}
							} ],
							yAxes : [ {
								ticks : {
									stepSize : 1000
								},
								display : true,
								borderDash : [ 3, 3 ],
								gridLines : {
									color : "rgba(0,0,0,0.0)"
								}
							} ]
						}
					}
				});
						
	            	}else{
	            		
	            		var canvas = document.getElementById("chartjs-dashboard-line");
	            		var ctx = canvas.getContext("2d");
	            		ctx.font = "15px system-ui";
	            		ctx.fillText("No data found...!", 150, canvas.height/2);
	            		ctx.fillText("Make Bookings..!", 150, (canvas.height/2)+40);
	            	}
	        }
	        }
	        
	        xhr.open('GET', '/GoCheeta/driver/dashboard/get-chart-data',true);
	        xhr.setRequestHeader('Content-Type', 'application/json');
	        xhr.send();
	        	
			
			
		});
	</script>


</body>

</html>