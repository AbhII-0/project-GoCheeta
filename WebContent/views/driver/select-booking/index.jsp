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

<title>GoCheeta | SELECT BOOKING</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">

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
						href="index.html"> <i class="align-middle" data-feather="send"></i>
							<span class="align-middle">Select Bookings</span>
					</a></li>

					<li class="sidebar-item active"><a class="sidebar-link"
						href="index.html"> <i class="align-middle" data-feather="book"></i>
							<span class="align-middle">My Bookings</span>
					</a></li>

					<li class="sidebar-item active"><a class="sidebar-link"
						href="index.html"> <i class="align-middle" data-feather=truck></i>
							<span class="align-middle">My Vehicles</span>
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
							class="nav-icon dropdown-toggle" href="#" id="messagesDropdown"
							data-bs-toggle="dropdown">
								<div class="position-relative">
									<i class="fa-solid fa-circle"
										style="background-color: black; color: #00ff0a; padding: 2px; border-radius: 20px;"></i>
								</div>
						</a>
							<div
								class="dropdown-menu dropdown-menu-lg dropdown-menu-end py-0"
								aria-labelledby="messagesDropdown">
								<div class="dropdown-menu-header">
									<div class="position-relative">STATUS</div>
								</div>
								<div class="list-group">
									<a href="#" class="list-group-item">
										<div class="row g-0 align-items-center">
											<div class="col-2">
												<i class="fa-solid fa-circle fa-2x"
													style="background-color: black; color: #00ff0a; padding: 2px; border-radius: 20px;"></i>
											</div>
											<div class="col-10 ps-2">
												<div class="text-dark">ONLINE</div>
											</div>
										</div>
									</a> <a href="#" class="list-group-item">
										<div class="row g-0 align-items-center">
											<div class="col-2">
												<i class="fa-solid fa-moon fa-2x"
													style="background: black; color: yellow; padding: 3px; border-radius: 20px;"></i>
											</div>
											<div class="col-10 ps-2">
												<div class="text-dark">IDLE</div>
											</div>
										</div>
									</a> <a href="#" class="list-group-item">
										<div class="row g-0 align-items-center">
											<div class="col-2">
												<i class="fa-solid fa-ban fa-2x"
													style="background: #e91e63; padding: 3px; border-radius: 20px;"></i>
											</div>
											<div class="col-10 ps-2">
												<div class="text-dark">BUSY</div>
											</div>
										</div>
									</a> <a href="#" class="list-group-item">
										<div class="row g-0 align-items-center">
											<div class="col-2">
												<i class="fa-solid fa-circle fa-2x"
													style="background-color: black; color: #9e9e9e; padding: 2px; border-radius: 20px;"></i>
											</div>
											<div class="col-10 ps-2">
												<div class="text-dark">OFFLINE</div>
											</div>
										</div>
									</a>
								</div>
							</div></li>
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
					<strong>Select Booking</strong>
				</h1>

				<div class="row"
					style="padding-top: 10px; background: #ffffffc4; border-top-left-radius: 20px; border-top-right-radius: 20px; padding-left: 5px; padding-right: 5px;">
					<table class="table table-hover my-0">
						<thead>
							<tr>
								<th class="d-none d-xl-table-cell d-sm-table-cell">Pick
									Location</th>
								<th class="d-none d-xl-table-cell">Drop Location</th>
								<th class="d-none d-xl-table-cell">Date</th>
								<th>Distance</th>
								<th>Charge</th>
								<th>Select</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="d-none d-xl-table-cell d-sm-table-cell">Kandy
									Lake, Anagarika Dharmapala Mawatha, Malwatta, Sri Lanka</td>
								<td class="d-none d-xl-table-cell">Kandy Railway Station,
									William Gopallawa Mawatha, Kandy, Sri Lanka</td>
								<td class="d-none d-xl-table-cell">31/06/2022</td>
								<td>1.197km</td>
								<td>RS 71.82</td>
								<td><button class="btn btn-primary btn-sm">
										<i class="fa-solid fa-check-double"></i> SELECT
									</button></td>
							</tr>
							<tr>
								<td class="d-none d-xl-table-cell d-sm-table-cell">Kandy
									Lake, Anagarika Dharmapala Mawatha, Malwatta, Sri Lanka</td>
								<td class="d-none d-xl-table-cell">Kandy Railway Station,
									William Gopallawa Mawatha, Kandy, Sri Lanka</td>
								<td class="d-none d-xl-table-cell">31/06/2022</td>
								<td>1.197km</td>
								<td>RS 71.82</td>
								<td><button class="btn btn-primary btn-sm">
										<i class="fa-solid fa-check-double"></i> SELECT
									</button></td>
							</tr>
							<tr>
								<td class="d-none d-xl-table-cell d-sm-table-cell">Kandy
									Lake, Anagarika Dharmapala Mawatha, Malwatta, Sri Lanka</td>
								<td class="d-none d-xl-table-cell">Kandy Railway Station,
									William Gopallawa Mawatha, Kandy, Sri Lanka</td>
								<td class="d-none d-xl-table-cell">31/06/2022</td>
								<td>1.197km</td>
								<td>RS 71.82</td>
								<td><button class="btn btn-primary btn-sm">
										<i class="fa-solid fa-check-double"></i> SELECT
									</button></td>
							</tr>
							<tr>
								<td class="d-none d-xl-table-cell d-sm-table-cell">Kandy
									Lake, Anagarika Dharmapala Mawatha, Malwatta, Sri Lanka</td>
								<td class="d-none d-xl-table-cell">Kandy Railway Station,
									William Gopallawa Mawatha, Kandy, Sri Lanka</td>
								<td class="d-none d-xl-table-cell">31/06/2022</td>
								<td>1.197km</td>
								<td>RS 71.82</td>
								<td><button class="btn btn-primary btn-sm">
										<i class="fa-solid fa-check-double"></i> SELECT
									</button></td>
							</tr>
							<tr>
								<td class="d-none d-xl-table-cell d-sm-table-cell">Kandy
									Lake, Anagarika Dharmapala Mawatha, Malwatta, Sri Lanka</td>
								<td class="d-none d-xl-table-cell">Kandy Railway Station,
									William Gopallawa Mawatha, Kandy, Sri Lanka</td>
								<td class="d-none d-xl-table-cell">31/06/2022</td>
								<td>1.197km</td>
								<td>RS 71.82</td>
								<td><button class="btn btn-primary btn-sm">
										<i class="fa-solid fa-check-double"></i> SELECT
									</button></td>
							</tr>
							<tr>
								<td class="d-none d-xl-table-cell d-sm-table-cell">Kandy
									Lake, Anagarika Dharmapala Mawatha, Malwatta, Sri Lanka</td>
								<td class="d-none d-xl-table-cell">Kandy Railway Station,
									William Gopallawa Mawatha, Kandy, Sri Lanka</td>
								<td class="d-none d-xl-table-cell">31/06/2022</td>
								<td>1.197km</td>
								<td>RS 71.82</td>
								<td><button class="btn btn-primary btn-sm">
										<i class="fa-solid fa-check-double"></i> SELECT
									</button></td>
							</tr>
							<tr>
								<td class="d-none d-xl-table-cell d-sm-table-cell">Kandy
									Lake, Anagarika Dharmapala Mawatha, Malwatta, Sri Lanka</td>
								<td class="d-none d-xl-table-cell">Kandy Railway Station,
									William Gopallawa Mawatha, Kandy, Sri Lanka</td>
								<td class="d-none d-xl-table-cell">31/06/2022</td>
								<td>1.197km</td>
								<td>RS 71.82</td>
								<td><button class="btn btn-primary btn-sm">
										<i class="fa-solid fa-check-double"></i> SELECT
									</button></td>
							</tr>
							<tr>
								<td class="d-none d-xl-table-cell d-sm-table-cell">Kandy
									Lake, Anagarika Dharmapala Mawatha, Malwatta, Sri Lanka</td>
								<td class="d-none d-xl-table-cell">Kandy Railway Station,
									William Gopallawa Mawatha, Kandy, Sri Lanka</td>
								<td class="d-none d-xl-table-cell">31/06/2022</td>
								<td>1.197km</td>
								<td>RS 71.82</td>
								<td><button class="btn btn-primary btn-sm">
										<i class="fa-solid fa-check-double"></i> SELECT
									</button></td>
							</tr>
						</tbody>
					</table>

					<nav aria-label="Page navigation example" style="margin-top: 5%;">
						<ul class="pagination">
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>

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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>

</body>

</html>