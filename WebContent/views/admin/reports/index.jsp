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

<title>GoCheeta | REPORTS</title>

<!-- bootstrap core css -->
<link rel="stylesheet" type="text/css"
	href="${initParam['basePath']}/assets/css/bootstrap.css" />
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
		<nav id="sidebar" class="sidebar js-sidebar">
			<div class="sidebar-content js-simplebar">
				<a class="sidebar-brand" href="index.html"> <span
					class="align-middle"><span
						style="color: black; background: #FF0063; padding: 10px; border-radius: 5px; font-size: x-large;">
							GoCheeta <i class="fa-solid fa-taxi fa-xl"
							style="color: #fffa00;"></i>
					</span></span>
				</a>

				<ul class="sidebar-nav">

					<li class="sidebar-item active"><a class="sidebar-link"
						href="index.html"> <i class="align-middle"
							data-feather="sliders"></i> <span class="align-middle">Dashboard</span>
					</a></li>

					<li class="sidebar-item active"><a class="sidebar-link"
						href="index.html"> <i class="align-middle"
							data-feather=map-pin></i> <span class="align-middle">Branches</span>
					</a></li>

					<li class="sidebar-item active"><a class="sidebar-link"
						href="index.html"> <i class="align-middle" data-feather="book"></i>
							<span class="align-middle">Bookings</span>
					</a></li>

					<li class="sidebar-item active"><a class="sidebar-link"
						href="index.html"> <i class="align-middle" data-feather=users></i>
							<span class="align-middle">Drivers</span>
					</a></li>

					<li class="sidebar-item active"><a class="sidebar-link"
						href="index.html"> <i class="align-middle"
							data-feather=triangle></i> <span class="align-middle">Vehicles
								Types</span>
					</a></li>

					<li class="sidebar-item active"><a class="sidebar-link"
						href="index.html"> <i class="align-middle" data-feather=truck></i>
							<span class="align-middle">Vehicles</span>
					</a></li>

					<li class="sidebar-item active"><a class="sidebar-link"
						href="index.html"> <i class="align-middle" data-feather=award></i>
							<span class="align-middle">Admin Users</span>
					</a></li>

					<li class="sidebar-item active"><a class="sidebar-link"
						href="index.html"> <i class="align-middle"
							data-feather=bar-chart-2></i> <span class="align-middle">Reports</span>
					</a></li>

				</ul>

			</div>
		</nav>

		<div class="main">
			<nav class="navbar navbar-expand navbar-light navbar-bg">
				<a class="sidebar-toggle js-sidebar-toggle"> <i
					class="hamburger align-self-center"></i>
				</a>

				<div class="navbar-collapse collapse">
					<ul class="navbar-nav navbar-align">
						<li class="nav-item dropdown"><a
							class="nav-icon dropdown-toggle d-inline-block d-sm-none"
							href="#" data-bs-toggle="dropdown"> <i class="align-middle"
								data-feather="settings"></i>
						</a> <a class="nav-link dropdown-toggle d-none d-sm-inline-block"
							href="#" data-bs-toggle="dropdown"> <img
								src="${initParam['basePath']}/assets/admin-kit/img/avatars/avatar.jpg"
								class="avatar img-fluid rounded me-1" alt="Charles Hall" /> <span
								class="text-dark">Charles Hall</span>
						</a>
							<div class="dropdown-menu dropdown-menu-end">
								<a class="dropdown-item" href="pages-profile.html"><i
									class="align-middle me-1" data-feather="user"></i> Profile</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#">Log out</a>
							</div></li>
					</ul>
				</div>
			</nav>

			<main class="content">
			<div class="container-fluid p-0">

				<h1 class="h3 mb-3">
					<strong>Reports</strong>
				</h1>

				<div class="row"
					style="padding-top: 10px; background: #ffffffc4; border-top-left-radius: 20px; border-top-right-radius: 20px; padding-left: 5px; padding-right: 5px;">

					<form style="margin-bottom: 15px;"
						class="row row-cols-lg-auto g-3 align-items-center">

						<div class="col-12">
							<label class="visually-hidden" for="inlineFormSelectPref">From
								Date</label>
							<p>From Date</p>
							<input required="required" id="fromDate" type="date"/>
						</div>
						<div class="col-12">
							<label class="visually-hidden" for="inlineFormSelectPref">To
								Date</label>
							<p>To Date</p>
							<input required="required" id="toDate" type="date">
						</div>

						<div class="col-12">
							<label class="visually-hidden" for="inlineFormSelectPref">Brnch</label>
							<p>Brnch</p>
							<select class="form-select" id="inlineFormSelectPref">
								<option value="-1" selected>All</option>
								<option value="1">One</option>
								<option value="2">Two</option>
								<option value="3">Three</option>
							</select>
						</div>

						<div class="col-12">
							<button style="margin-top: 33px;" type="submit"
								class="btn btn-primary">Search</button>
						</div>

						<div class="col-12">
							<button style="margin-top: 33px;" type="button"
								class="btn btn-primary" onclick="Export()">Export To
								PDF</button>
						</div>
					</form>

					<table class="table table-hover my-0" id="totalSale">
						<caption
							style="font-weight: bold; caption-side: top; font-size: x-large; color: black;">Total
							Sale From 01/01/2022 - 08/24/2022</caption>
						<caption style="caption-side: bottom;">Total Sale From
							01/01/2022 - 08/24/2022</caption>
						<thead>
							<tr>
								<th>#</th>
								<th>Branch</th>
								<th>Date Range</th>
								<th>Total Sale</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>001</td>
								<td>Kandy</td>
								<td>01/01/2022 - 08/24/2022</td>
								<td>RS 50000.00</td>
							</tr>
							<tr>
								<td>001</td>
								<td>Kandy</td>
								<td>01/01/2022 - 08/24/2022</td>
								<td>RS 50000.00</td>
							</tr>
							<tr>
								<td>001</td>
								<td>Kandy</td>
								<td>01/01/2022 - 08/24/2022</td>
								<td>RS 50000.00</td>
							</tr>
							<tr>
								<td>001</td>
								<td>Kandy</td>
								<td>01/01/2022 - 08/24/2022</td>
								<td>RS 50000.00</td>
							</tr>
							<tr>
								<td>001</td>
								<td>Kandy</td>
								<td>01/01/2022 - 08/24/2022</td>
								<td>RS 50000.00</td>
							</tr>
							<tr>
								<td>001</td>
								<td>Kandy</td>
								<td>01/01/2022 - 08/24/2022</td>
								<td>RS 50000.00</td>
							</tr>
							<tr>
								<td>001</td>
								<td>Kandy</td>
								<td>01/01/2022 - 08/24/2022</td>
								<td>RS 50000.00</td>
							</tr>
							<tr>
								<td>001</td>
								<td>Kandy</td>
								<td>01/01/2022 - 08/24/2022</td>
								<td>RS 50000.00</td>
							</tr>
						</tbody>
					</table>

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
	<script type="text/javascript"
		src="${initParam['basePath']}/assets/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript"
		src="${initParam['basePath']}/assets/js/bootstrap.js"></script>

	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
	<script type="text/javascript">
		function Export() {
			html2canvas(document.getElementById('totalSale'), {
				onrendered : function(canvas) {
					var data = canvas.toDataURL();
					var docDefinition = {
						content : [ {
							image : data,
							width : 500
						} ]
					};
					pdfMake.createPdf(docDefinition).download("totalSale.pdf");
				}
			});
		}
	</script>

	<script type="text/javascript">
	$(document).ready(function() {

			var today = new Date();
			var dd = String(today.getDate()).padStart(2, '0');
			var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
			var yyyy = today.getFullYear();

			today = yyyy + '-' + mm + '-' + dd;

			$("#fromDate").val(today);
			$("#toDate").val(today);
		});
	</script>

</body>

</html>