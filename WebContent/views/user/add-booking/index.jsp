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

<title>GoCheeta | ADD BOOKING</title>


<!-- slider stylesheet -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />

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

<!-- add booking stylesheet -->
<link rel="stylesheet" type="text/css"
	href="${initParam['basePath']}/assets/css/add-booking.css" />

<!-- add booking stylesheet -->
<link rel="stylesheet" type="text/css"
	href="${initParam['basePath']}/assets/css/map.css" />

<!-- fontawsome stylesheet -->
<script src="https://kit.fontawesome.com/57cb8f938d.js"
	crossorigin="anonymous"></script>

<script type="text/javascript"
	src="https://js.api.here.com/v3/3.1/mapsjs-core.js"></script>
<script type="text/javascript"
	src="https://js.api.here.com/v3/3.1/mapsjs-service.js"></script>
<script type="text/javascript"
	src="https://js.api.here.com/v3/3.1/mapsjs-mapevents.js"></script>


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

		<!-- Add Booking -->

		<div class="container text-center" style="margin-top: 5%;">

			<div class="col align-self-center">
				<div id="svg_wrap"></div>

				<h1 style="font-weight: bold; text-align: center;">ADD BOOKING</h1>
				<form action="test.html">
					<section id="add-booking-section-01" class="add-booking-section" style="width: 50%;">
						<p style="text-align: start; font-weight: bold;">SELECT
							VEHICLE TYPE</p>
						<select id="vehicle-type" required="required" class="add-booking-input">
							<option class="select-options" value="" disabled="disabled"
								selected="selected">SELECT VEHICLE TYPE</option>
							<option value="BIKE">BIKE</option>
							<option value="CAR">CAR</option>
							<option value="SUV">SUV</option>
							<option value="VAN">VAN</option>
							<option value="LORRY">LORRY</option>
						</select>
						<p
							style="text-align: start; font-weight: bold; margin-top: inherit;">SELECT
							CITY</p>
						<select id="travel-city" required="required" class="add-booking-input">
							<option value="" disabled="disabled" selected="selected">SELECT
								CITY</option>
							<option value="KANDY">KANDY</option>
							<option value="GALLE">GALLE</option>
							<option value="COLOMBO">COLOMBO</option>
						</select>
						<!--<input type="text" placeholder="Firstname" /> <input type="text"
						placeholder="Surname" /> <input type="text"
						placeholder="Birthdate" /> <input type="text"
						placeholder="Insurance number" /> <input type="text"
						placeholder="Family status" />-->
					</section>

					<section id="add-booking-section-02" style="width: 85%;" class="add-booking-section">
						<p style="text-align: start; font-weight: bold;">PICK UP
							LOACTION</p>
						<div class="autocomplete" style="width: 100%;">
							<input id="pickUpLocation" required="required" type="text"
								placeholder="TYPE & SELECT YOUR PICK UP LOACTION" />
							<input id="pickUpLocationCity" type="hidden" value=""/>
							<input id="pickUpLocationCoordinates" type="hidden" value=""/>
						</div>
						<div id="pickUpLocationMap" class="location-map"></div>
					</section>

					<section id="add-booking-section-03" style="width: 85%;" class="add-booking-section">
						<p style="text-align: start; font-weight: bold;">DROP LOACTION</p>
						<div class="autocomplete" style="width: 100%;">
						<input id="dropLocation" required="required" type="text" placeholder="TYPE & SELECT YOUR DROP LOACTION" />
						<input id="dropLocationCity" type="hidden" value=""/>
						<input id="dropLocationCoordinates" type="hidden" value=""/>
						</div>

						<div id="dropLocationMap" class="location-map"></div>
					</section>

					<section id="add-booking-section-04" style="width: 85%;" class="add-booking-section">
						<p style="text-align: start; font-weight: bold;">CHARGE</p>
						<input id="bookingPrice" type="text" disabled="disabled" value="RS 2500.00" />

						<p
							style="text-align: start; font-weight: bold; margin-top: inherit;">DISTANCE</p>
						<input id="bookingDis" type="text" disabled="disabled" value="" />

						<div id="disMap" class="location-map"></div>
					</section>

					<div class="button" id="prev">&larr; Previous</div>
					<div class="button" id="next">Next &rarr;</div>
					<!--<div class="button" id="submit">Place Booking</div>-->
					<button style="border: none;" type="submit" class="button"
						id="submit">Place Booking</button>
				</form>
			</div>
		</div>

		<!-- End Booking -->

	</div>

	<!-- footer section -->
	<jsp:include page="/views/layouts/footer/index.jsp" />
	<!-- footer section -->

	<script type="text/javascript"
		src="${initParam['basePath']}/assets/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript"
		src="${initParam['basePath']}/assets/js/bootstrap.js"></script>
	<script type="text/javascript"
		src="${initParam['basePath']}/assets/js/add-booking.js"></script>
	<script type="text/javascript"
		src="${initParam['basePath']}/assets/js/map.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>


</body>

</html>