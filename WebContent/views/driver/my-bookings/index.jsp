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

<title>GoCheeta | MY BOOKINGS</title>

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
						href="index.html"> <i class="align-middle" data-feather="send"></i>
							<span class="align-middle">VIEW Bookings</span>
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
					<strong>My Booking</strong>
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
								<th>Status</th>
								<th>VIEW</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="d-none d-xl-table-cell d-sm-table-cell">Kandy
									Lake, Anagarika Dharmapala Mawatha, Malwatta, Sri Lanka</td>
								<td class="d-none d-xl-table-cell">Kandy Railway Station,
									William Gopallawa Mawatha, Kandy, Sri Lanka</td>
								<td class="d-none d-xl-table-cell">31/06/2022</td>
								<td><span class="badge bg-warning">On Going</span></td>
								<td><button data-toggle="modal" data-target="#exampleModal"
										data-whatever="@mdo" class="btn btn-primary btn-sm">
										<i class="fa-solid fa-eye"></i> VIEW
									</button></td>
							</tr>
							<tr>
								<td class="d-none d-xl-table-cell d-sm-table-cell">Kandy
									Lake, Anagarika Dharmapala Mawatha, Malwatta, Sri Lanka</td>
								<td class="d-none d-xl-table-cell">Kandy Railway Station,
									William Gopallawa Mawatha, Kandy, Sri Lanka</td>
								<td class="d-none d-xl-table-cell">31/06/2022</td>
								<td><span class="badge bg-danger">Cancelled</span></td>
								<td><button data-toggle="modal" data-target="#exampleModal"
										data-whatever="@mdo" class="btn btn-primary btn-sm">
										<i class="fa-solid fa-eye"></i> VIEW
									</button></td>
							</tr>
							<tr>
								<td class="d-none d-xl-table-cell d-sm-table-cell">Kandy
									Lake, Anagarika Dharmapala Mawatha, Malwatta, Sri Lanka</td>
								<td class="d-none d-xl-table-cell">Kandy Railway Station,
									William Gopallawa Mawatha, Kandy, Sri Lanka</td>
								<td class="d-none d-xl-table-cell">31/06/2022</td>
								<td><span class="badge bg-success">FINISH</span></td>
								<td><button data-toggle="modal" data-target="#exampleModal"
										data-whatever="@mdo" class="btn btn-primary btn-sm">
										<i class="fa-solid fa-eye"></i> VIEW
									</button></td>
							</tr>
							<tr>
								<td class="d-none d-xl-table-cell d-sm-table-cell">Kandy
									Lake, Anagarika Dharmapala Mawatha, Malwatta, Sri Lanka</td>
								<td class="d-none d-xl-table-cell">Kandy Railway Station,
									William Gopallawa Mawatha, Kandy, Sri Lanka</td>
								<td class="d-none d-xl-table-cell">31/06/2022</td>
								<td><span class="badge bg-success">FINISH</span></td>
								<td><button data-toggle="modal" data-target="#exampleModal"
										data-whatever="@mdo" class="btn btn-primary btn-sm">
										<i class="fa-solid fa-eye"></i> VIEW
									</button></td>
							</tr>
							<tr>
								<td class="d-none d-xl-table-cell d-sm-table-cell">Kandy
									Lake, Anagarika Dharmapala Mawatha, Malwatta, Sri Lanka</td>
								<td class="d-none d-xl-table-cell">Kandy Railway Station,
									William Gopallawa Mawatha, Kandy, Sri Lanka</td>
								<td class="d-none d-xl-table-cell">31/06/2022</td>
								<td><span class="badge bg-success">FINISH</span></td>
								<td><button data-toggle="modal" data-target="#exampleModal"
										data-whatever="@mdo" class="btn btn-primary btn-sm">
										<i class="fa-solid fa-eye"></i> VIEW
									</button></td>
							</tr>
							<tr>
								<td class="d-none d-xl-table-cell d-sm-table-cell">Kandy
									Lake, Anagarika Dharmapala Mawatha, Malwatta, Sri Lanka</td>
								<td class="d-none d-xl-table-cell">Kandy Railway Station,
									William Gopallawa Mawatha, Kandy, Sri Lanka</td>
								<td class="d-none d-xl-table-cell">31/06/2022</td>
								<td><span class="badge bg-success">FINISH</span></td>
								<td><button data-toggle="modal" data-target="#exampleModal"
										data-whatever="@mdo" class="btn btn-primary btn-sm">
										<i class="fa-solid fa-eye"></i> VIEW
									</button></td>
							</tr>
							<tr>
								<td class="d-none d-xl-table-cell d-sm-table-cell">Kandy
									Lake, Anagarika Dharmapala Mawatha, Malwatta, Sri Lanka</td>
								<td class="d-none d-xl-table-cell">Kandy Railway Station,
									William Gopallawa Mawatha, Kandy, Sri Lanka</td>
								<td class="d-none d-xl-table-cell">31/06/2022</td>
								<td><span class="badge bg-success">FINISH</span></td>
								<td><button data-toggle="modal" data-target="#exampleModal"
										data-whatever="@mdo" class="btn btn-primary btn-sm">
										<i class="fa-solid fa-eye"></i> VIEW
									</button></td>
							</tr>
							<tr>
								<td class="d-none d-xl-table-cell d-sm-table-cell">Kandy
									Lake, Anagarika Dharmapala Mawatha, Malwatta, Sri Lanka</td>
								<td class="d-none d-xl-table-cell">Kandy Railway Station,
									William Gopallawa Mawatha, Kandy, Sri Lanka</td>
								<td class="d-none d-xl-table-cell">31/06/2022</td>
								<td><span class="badge bg-success">FINISH</span></td>
								<td><button data-toggle="modal" data-target="#exampleModal"
										data-whatever="@mdo" class="btn btn-primary btn-sm">
										<i class="fa-solid fa-eye"></i> VIEW
									</button></td>
							</tr>
						</tbody>
					</table>

					<!-- Model -->
					<div class="modal fade bd-example-modal-lg" id="exampleModal"
						tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true" style="z-index: 100000;">
						<div
							class="modal-dialog modal-lg modal-dialog-scrollable modal-dialog-centered"
							role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 style="font-weight: bold;" class="modal-title"
										id="exampleModalLabel">
										Booking Status : <span class="btn btn-success">JOUNURY
											END</span>
									</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<form>
										<div class="form-group">
											<label style="display: flex; font-weight: bold;"
												for="message-text" class="col-form-label">Pick Up
												Location:</label>
											<p style="display: flex;">55 Sirimalwatta - Amunugama -
												Madawala Rd, Sirimalwatta</p>
										</div>
										<div class="form-group">
											<label style="display: flex; font-weight: bold;"
												for="message-text" class="col-form-label">Drop
												Location:</label>
											<p style="display: flex;">55 Sirimalwatta - Amunugama -
												Madawala Rd, Sirimalwatta</p>
										</div>
										<div class="form-group">
											<label style="display: flex; font-weight: bold;"
												for="message-text" class="col-form-label">Date:</label>
											<p style="display: flex;">01-01-2021</p>
										</div>
										<div class="form-group">
											<label style="display: flex; font-weight: bold;"
												for="message-text" class="col-form-label">Pick Up
												Time:</label>
											<p style="display: flex;">01.15 PM</p>
										</div>
										<div class="form-group">
											<label style="display: flex; font-weight: bold;"
												for="message-text" class="col-form-label">Drop Time:</label>
											<p style="display: flex;">04.15 PM</p>
										</div>
										<div class="form-group">
											<label style="display: flex; font-weight: bold;"
												for="message-text" class="col-form-label">Charge:</label>
											<p style="display: flex;">RS. 2500.00</p>
										</div>
										<div class="form-group">
											<label style="display: flex; font-weight: bold;"
												for="message-text" class="col-form-label">Client:</label>
											<p style="display: flex;">Dexter Morgan | TP : 0711234567</p>
										</div>
										<div class="form-group">
											<div class="form-check form-check-inline">
												<input style="font-size: large;" class="form-check-input" type="checkbox"
													id="inlineCheckbox1" value="option1"> <label
													class="form-check-label" for="inlineCheckbox1">Booking Cancel</label>
											</div>
										</div>
										<div class="form-group">
											<label style="display: flex; font-weight: bold;"
												for="message-text" class="col-form-label">Note:</label>
											<textarea class="form-control" id="message-text"></textarea>
										</div>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Close</button>
									<button type="button" class="btn btn-primary">Update</button>
								</div>
							</div>
						</div>
					</div>
					<!-- End Model -->

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
	<script type="text/javascript"
		src="${initParam['basePath']}/assets/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript"
		src="${initParam['basePath']}/assets/js/bootstrap.js"></script>

</body>

</html>