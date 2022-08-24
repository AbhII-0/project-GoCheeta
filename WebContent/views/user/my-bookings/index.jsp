<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<!-- Basic -->
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<!-- Site Metas -->
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>GoCheeta | My Bookings</title>

<!-- bootstrap core css -->
<link rel="stylesheet" type="text/css"
	href="${initParam['basePath']}/assets/css/bootstrap.css" />

<!-- fonts style -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${initParam['basePath']}/assets/css/style.css"
	rel="stylesheet" />
<!-- responsive style -->
<link href="${initParam['basePath']}/assets/css/responsive.css"
	rel="stylesheet" />

<!-- buttons stylesheet -->
<link rel="stylesheet" type="text/css"
	href="${initParam['basePath']}/assets/css/custom-style.css" />

<!-- fontawsome stylesheet -->
<script src="https://kit.fontawesome.com/57cb8f938d.js"
	crossorigin="anonymous"></script>
</head>

<body>

	<div class="hero_area">
		<!-- header section strats -->
		<header class="header_section">
			<div class="container-fluid">
				<nav class="navbar navbar-expand-lg custom_nav-container ">
					<a class="navbar-brand" href="index.html"> <span
						style="color: black; background: #FF0063; padding: 10px; border-radius: 5px;">
							GoCheeta <i class="fa-solid fa-taxi fa-xl"
							style="color: #fffa00;"></i>
					</span>
					</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<div
							class="d-flex ml-auto flex-column flex-lg-row align-items-center">
							<ul class="navbar-nav  ">
								<li class="nav-item active"><a class="nav-link"
									href="index.html"><i class="fa-regular fa-square-plus"></i>
										ADD A BOOKING <span class="sr-only">(current)</span></a></li>
								<li class="nav-item"><a class="nav-link" href="about.html"><i
										class="fa-solid fa-clock-rotate-left"></i> MY BOOKINGS</a></li>
								<li class="nav-item"><a class="nav-link"
									href="contact.html"><i class="fa-solid fa-headset"></i>
										Contact Us</a></li>
								<li class="nav-item"><a class="nav-link" href="#"><i
										class="fa-solid fa-user-astronaut"></i> ACCOUNT</a></li>
								<li class="nav-item"><a class="nav-link" href="#"><i class="fa-solid fa-right-from-bracket"></i> LOG OUT</a></li>
							</ul>
						</div>
					</div>
				</nav>
			</div>
		</header>
		<!-- end header section -->

		<div class="container text-center" style="margin-top: 5%;">

			<div class="col align-self-center">

				<h2
					style="text-transform: uppercase; margin-bottom: 25px; font-weight: bold;">My
					Bookings</h2>

				<!--Table-->
				<table class="table table-striped">
					<thead class="table-dark">
						<tr>
							<th scope="col">#</th>
							<th scope="col">Pick Up Location</th>
							<th scope="col">Drop Location</th>
							<th scope="col">Date</th>
							<th scope="col">Status</th>
							<th scope="col">Details</th>
						</tr>
					</thead>
					<tbody>
						<tr class="table-danger">
							<th scope="row">1</th>
							<td>55 Sirimalwatta - Amunugama - Madawala Rd, Sirimalwatta</td>
							<td>Deveni Rajasinghe Mawatha, Kandy</td>
							<td>01-01-2021</td>
							<td>JOUNURY END</td>
							<td><button type="button" class="btn btn-primary"
									data-toggle="modal" data-target="#exampleModal"
									data-whatever="@mdo">
									<i class="fa-solid fa-eye"></i>
								</button></td>
						</tr>
						<tr class="table-success">
							<th scope="row">2</th>
							<td>55 Sirimalwatta - Amunugama - Madawala Rd, Sirimalwatta</td>
							<td>Deveni Rajasinghe Mawatha, Kandy</td>
							<td>01-01-2021</td>
							<td>JOUNURY END</td>
							<td><button type="button" class="btn btn-primary"
									data-toggle="modal" data-target="#exampleModal"
									data-whatever="@mdo">
									<i class="fa-solid fa-eye"></i>
								</button></td>
						</tr>
						<tr class="table-warning">
							<th scope="row">3</th>
							<td>55 Sirimalwatta - Amunugama - Madawala Rd, Sirimalwatta</td>
							<td>Deveni Rajasinghe Mawatha, Kandy</td>
							<td>01-01-2021</td>
							<td>JOUNURY END</td>
							<td><button type="button" class="btn btn-primary"
									data-toggle="modal" data-target="#exampleModal"
									data-whatever="@mdo">
									<i class="fa-solid fa-eye"></i>
								</button></td>
						</tr>
						<tr>
							<th scope="row">4</th>
							<td>55 Sirimalwatta - Amunugama - Madawala Rd, Sirimalwatta</td>
							<td>Deveni Rajasinghe Mawatha, Kandy</td>
							<td>01-01-2021</td>
							<td>JOUNURY END</td>
							<td><button type="button" class="btn btn-primary"
									data-toggle="modal" data-target="#exampleModal"
									data-whatever="@mdo">
									<i class="fa-solid fa-eye"></i>
								</button></td>
						</tr>
						<tr>
							<th scope="row">5</th>
							<td>55 Sirimalwatta - Amunugama - Madawala Rd, Sirimalwatta</td>
							<td>Deveni Rajasinghe Mawatha, Kandy</td>
							<td>01-01-2021</td>
							<td>JOUNURY END</td>
							<td><button type="button" class="btn btn-primary"
									data-toggle="modal" data-target="#exampleModal"
									data-whatever="@mdo">
									<i class="fa-solid fa-eye"></i>
								</button></td>
						</tr>
						<tr>
							<th scope="row">6</th>
							<td>55 Sirimalwatta - Amunugama - Madawala Rd, Sirimalwatta</td>
							<td>Deveni Rajasinghe Mawatha, Kandy</td>
							<td>01-01-2021</td>
							<td>JOUNURY END</td>
							<td><button type="button" class="btn btn-primary"
									data-toggle="modal" data-target="#exampleModal"
									data-whatever="@mdo">
									<i class="fa-solid fa-eye"></i>
								</button></td>
						</tr>
						<tr>
							<th scope="row">7</th>
							<td>55 Sirimalwatta - Amunugama - Madawala Rd, Sirimalwatta</td>
							<td>Deveni Rajasinghe Mawatha, Kandy</td>
							<td>01-01-2021</td>
							<td>JOUNURY END</td>
							<td><button type="button" class="btn btn-primary"
									data-toggle="modal" data-target="#exampleModal"
									data-whatever="@mdo">
									<i class="fa-solid fa-eye"></i>
								</button></td>
						</tr>
						<tr>
							<th scope="row">8</th>
							<td>55 Sirimalwatta - Amunugama - Madawala Rd, Sirimalwatta</td>
							<td>Deveni Rajasinghe Mawatha, Kandy</td>
							<td>01-01-2021</td>
							<td>JOUNURY END</td>
							<td><button type="button" class="btn btn-primary"
									data-toggle="modal" data-target="#exampleModal"
									data-whatever="@mdo">
									<i class="fa-solid fa-eye"></i>
								</button></td>
						</tr>
					</tbody>
				</table>
				<!--End Table-->

				<!-- Pagination -->
				<nav style="padding-bottom: 5%;" aria-label="Page navigation example">
					<ul class="pagination">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<li class="page-item active"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
				<!-- End Pagination -->

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
											for="message-text" class="col-form-label">Driver:</label>
										<p style="display: flex;">Dexter Morgan | TP : 0711234567</p>
									</div>
									<div class="form-group">
										<label style="display: flex; font-weight: bold;"
											for="message-text" class="col-form-label">Vehicle:</label>
										<p style="display: flex;">CAR | NO : AAA-8736</p>
									</div>
									<div class="form-group">
										<label style="display: flex; font-weight: bold;"
											for="message-text" class="col-form-label">Feedback:</label>
										<textarea class="form-control" id="message-text"></textarea>
									</div>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">Send
									message</button>
							</div>
						</div>
					</div>
				</div>
				<!-- End Model -->

			</div>

		</div>


	</div>

	<!-- footer section -->
	<jsp:include page="/views/layouts/footer/index.jsp" />
	<!-- footer section -->

	<script type="text/javascript"
		src="${initParam['basePath']}/assets/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript"
		src="${initParam['basePath']}/assets/js/bootstrap.js"></script>


</body>

</html>