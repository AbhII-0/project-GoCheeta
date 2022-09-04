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
		

		<jsp:include page="/views/driver/layouts/side-menu-bar.jsp" />

		<div class="main">
			
			<jsp:include page="/views/driver/layouts/nav-bar.jsp" />
			

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
								<th>Vehicle</th>
								<th>Charge</th>
								<th>Select</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="booking" items="${bookings}">
							<tr>
								<td class="d-none d-xl-table-cell d-sm-table-cell"><c:out value="${booking.booking_start_location}" /></td>
								<td class="d-none d-xl-table-cell"><c:out value="${booking.booking_end_location}" /></td>
								<td class="d-none d-xl-table-cell"><c:out value="${booking.booking_time}" /></td>
								
								<c:set var = "vehicleTypeID" value = "${booking.vehicle_types_vehicle_types_id}"/>
								<c:set var = "vehicleTypeName" value = "${''}"/>
								
								<c:forEach var="vehicleType" items="${listvehicleTypes}">
								<c:if test="${vehicleTypeID == vehicleType.vehicle_types_id}">
								<c:set var = "vehicleTypeName" value = "${vehicleType.vehicle_type}"/>
								</c:if>
								</c:forEach>
								
								<td><c:out value="${vehicleTypeName}" /></td>
								<td>RS <c:out value="${booking.bookin_charge}" /></td>

									
								<td><a href="/GoCheeta/driver/select-bookings/pick?b-id=<c:out value="${booking.booking_id}" />&vt-id=<c:out value="${booking.vehicle_types_vehicle_types_id}" />" ><button id="slectBooking" class="btn btn-primary btn-sm">
										<i class="fa-solid fa-check-double"></i> SELECT
									</button></a></td>
							</tr>
							</c:forEach>
						</tbody>
					</table>

					<nav aria-label="Page navigation example" style="margin-top: 5%;">
						<ul class="pagination">

							<%
								double branchCount = Integer.parseInt(request.getAttribute("bookingsCount").toString());
								double recordForPage = 8;
								double pageCount = Math.ceil(branchCount / recordForPage);
								int curntPage = 1;

								if (request.getParameter("page") != null) {
									curntPage = Integer.parseInt(request.getParameter("page"));
								} else {
									curntPage = 1;
								}
								if (curntPage > 1) {
							%>
							<li class="page-item"><a class="page-link"
								href="/GoCheeta/driver/select-bookings?page=<%=curntPage - 1%>"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<%
								}
								for (int i = 1; i <= pageCount; i++) {
									if (curntPage == i) {
							%>
							<li class="page-item active"><a class="page-link"
								href="/GoCheeta/driver/select-bookings?page=<%=i%>"><%=i%></a></li>
							<%
								}else{
									%>
									<li class="page-item"><a class="page-link"
								href="/GoCheeta/driver/select-bookings?page=<%=i%>"><%=i%></a></li>
									<%
								}
								}
								if (curntPage < pageCount) {
							%>
							<li class="page-item"><a class="page-link"
								href="/GoCheeta/driver/select-bookings?page=<%=curntPage + 1%>"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
							<%
								}
							%>
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
		
		<script>
	if(performance.navigation.type == 2){
		   location.reload(true);
		}
	</script>

</body>

</html>