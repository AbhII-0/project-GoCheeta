<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		

		<jsp:include page="/views/admin/layouts/menu-sidebar.jsp" />

			<div class="main">
			
			<jsp:include page="/views/admin/layouts/nav-bar.jsp" />
			
			

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
											<h1 class="mt-1 mb-3">2.382</h1>
										</div>
									</div>
									<div class="card">
										<div class="card-body">
											<div class="row">
												<div class="col mt-0">
													<h5 class="card-title">Drivers</h5>
												</div>

												<div class="col-auto">
													<div class="stat text-primary">
														<i class="align-middle" data-feather="users"></i>
													</div>
												</div>
											</div>
											<h1 class="mt-1 mb-3">14.212</h1>
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
											<h1 class="mt-1 mb-3">$21.300</h1>
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
											<h1 class="mt-1 mb-3">4</h1>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-xl-6 col-xxl-7">
						<div class="card flex-fill w-100">
							<div class="card-header">

								<h5 class="card-title mb-0">Recent Movement</h5>
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
		document.addEventListener("DOMContentLoaded", function() {
			var ctx = document.getElementById("chartjs-dashboard-line")
					.getContext("2d");
			var gradient = ctx.createLinearGradient(0, 0, 0, 225);
			gradient.addColorStop(0, "rgba(215, 227, 244, 1)");
			gradient.addColorStop(1, "rgba(215, 227, 244, 0)");
			// Line chart
			new Chart(document.getElementById("chartjs-dashboard-line"), {
				type : "line",
				data : {
					labels : [ "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul",
							"Aug", "Sep", "Oct", "Nov", "Dec" ],
					datasets : [ {
						label : "Sales ($)",
						fill : true,
						backgroundColor : gradient,
						borderColor : window.theme.primary,
						data : [ 2115, 1562, 1584, 1892, 1587, 1923, 2566,
								2448, 2805, 3438, 2917, 3327 ]
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
		});
	</script>

</body>

</html>