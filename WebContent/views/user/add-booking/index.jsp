<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%

if(session.getAttribute("userId") == null){	
	response.sendRedirect("/GoCheeta/sign-in");
}

response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);

%>
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
		<jsp:include page="/views/user/layouts/nav-bar.jsp" />
		<!-- end header section -->

		<!-- Add Booking -->

		<div class="container text-center" style="margin-top: 5%;">

			<div class="col align-self-center">
				<div id="svg_wrap"></div>

				<h1 style="font-weight: bold; text-align: center;">ADD BOOKING</h1>
				<form method="post" action="/GoCheeta/add-booking/place">
					<section id="add-booking-section-01" class="add-booking-section" style="width: 50%;">
						<p style="text-align: start; font-weight: bold;">SELECT
							VEHICLE TYPE</p>
						<select id="vehicle-type" name="booking-vehicle-type" required="required" class="add-booking-input">
							<option class="select-options" value="" disabled="disabled"
								selected="selected">SELECT VEHICLE TYPE</option>
							<c:forEach var="vehicleType" items="${listvehicleTypes}">
							<option value="<c:out value="${vehicleType.vehicle_types_id}" />"><c:out value="${vehicleType.vehicle_type}" /></option>
							</c:forEach>
						</select>
						<c:forEach var="vehicleType" items="${listvehicleTypes}">
							<input id="vehicleTypeCharge<c:out value="${vehicleType.vehicle_types_id}" />" type="hidden" value="<c:out value="${vehicleType.vehicle_type_price}" />">
							</c:forEach>
						<p
							style="text-align: start; font-weight: bold; margin-top: inherit;">SELECT
							CITY</p>
						<select id="travel-city" name="booking-City" required="required" class="add-booking-input">
							<option value="" disabled="disabled" selected="selected">SELECT
								CITY</option>
							<c:forEach var="branch" items="${listBranches}">
							<option value="<c:out value="${branch.branch_id}" />"><c:out value="${branch.branch_loaction}" /></option>
							</c:forEach>
						</select>
						<c:forEach var="branch" items="${listBranches}">
						<input id="brancheName<c:out value="${branch.branch_id}" />" type="hidden" value="<c:out value="${branch.branch_loaction}" />">
							<input id="brancheCordinate<c:out value="${branch.branch_id}" />" type="hidden" value="<c:out value="${branch.brancheCordinate}" />">
							</c:forEach>
						<input type="hidden" id="selectCityLat">
						<input type="hidden" id="selectCityLng">
					</section>

					<section id="add-booking-section-02" style="width: 85%;" class="add-booking-section">
						<p style="text-align: start; font-weight: bold;">PICK UP
							LOACTION</p>
						<div class="autocomplete" style="width: 100%;">
							<input id="pickUpLocation" name="booking-pickUpLocation" required="required" type="text"
								placeholder="TYPE & SELECT YOUR PICK UP LOACTION" />
							<input id="pickUpLocationCity" type="hidden" value=""/>
							<input id="pickUpLocationCoordinates" name="booking-pickUpLocationCoordinates" type="hidden" value=""/>
						</div>
						<div id="pickUpLocationMap" class="location-map"></div>
					</section>

					<section id="add-booking-section-03" style="width: 85%;" class="add-booking-section">
						<p style="text-align: start; font-weight: bold;">DROP LOACTION</p>
						<div class="autocomplete" style="width: 100%;">
						<input id="dropLocation" name="booking-dropLocation" required="required" type="text" placeholder="TYPE & SELECT YOUR DROP LOACTION" />
						<input id="dropLocationCity" type="hidden" value=""/>
						<input id="dropLocationCoordinates" name="booking-dropLocationCoordinates" type="hidden" value=""/>
						</div>

						<div id="dropLocationMap" class="location-map"></div>
					</section>

					<section id="add-booking-section-04" style="width: 85%;" class="add-booking-section">
						<p style="text-align: start; font-weight: bold;">CHARGE</p>
						<input id="bookingPrice" name="booking-bookingPrice" type="text" disabled="disabled" />
						<input id="bookingCharge" name="booking-bookingCharge" type="hidden"/>

						<p
							style="text-align: start; font-weight: bold; margin-top: inherit;">DISTANCE</p>
						<input id="bookingDis" name="booking-bookingDis" type="text" disabled="disabled"/>
						<input id="bookingDistance" name="booking-bookingDistance" type="hidden"/>

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
		src="${initParam['basePath']}/assets/js/map.js"></script>
	<script type="text/javascript"
		src="${initParam['basePath']}/assets/js/add-booking.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
	<script>
	if(performance.navigation.type == 2){
		   location.reload(true);
		}
	</script>


</body>

</html>