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
		

		<jsp:include page="/views/driver/layouts/side-menu-bar.jsp" />

		<div class="main">
			
			<jsp:include page="/views/driver/layouts/nav-bar.jsp" />
			

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
						<c:forEach var="booking" items="${bookings}">
							<tr>
								<td class="d-none d-xl-table-cell d-sm-table-cell"><c:out value="${booking.booking_start_location}" /></td>
								<td class="d-none d-xl-table-cell"><c:out value="${booking.booking_end_location}" /></td>
								<td class="d-none d-xl-table-cell"><c:out value="${booking.booking_time}" /></td>
								
								<c:set var = "bookinStatus" value = "${booking.booking_status}"/>
								<c:if test="${bookinStatus == 'ONGOING'}">
								<td><span class="badge bg-primary">ON GOING</span></td>
								</c:if>
								<c:if test="${bookinStatus == 'PENDING'}">
								<td><span class="badge bg-warning">PENDING</span></td>
								</c:if>
								<c:if test="${bookinStatus == 'COMPLETE'}">
								<td><span class="badge bg-success">COMPLETE</span></td>
								</c:if>
								<c:if test="${bookinStatus == 'DRIVER CANCEL'}">
								<td><span class="badge bg-danger">DRIVER CANCEL</span></td>
								</c:if>
								<c:if test="${bookinStatus == 'USER CANCEL'}">
								<td><span class="badge bg-danger">USER CANCEL</span></td>
								</c:if>
								
								<td><button data-toggle="modal" data-target="#exampleModal"
										data-whatever="<c:out value="${booking.booking_id}" />" class="btn btn-primary btn-sm">
										<i class="fa-solid fa-eye"></i> VIEW
									</button></td>
								
								<input id="bookingStatus<c:out value="${booking.booking_id}" />" type="hidden"  value="<c:out value="${booking.booking_status}" />"/>
								<input id="bookingPickLocation<c:out value="${booking.booking_id}" />" type="hidden"  value="<c:out value="${booking.booking_start_location}" />"/>
								<input id="bookingDropLocation<c:out value="${booking.booking_id}" />" type="hidden"  value="<c:out value="${booking.booking_end_location}" />"/>
								<input id="bookingDate<c:out value="${booking.booking_id}" />" type="hidden"  value="<c:out value="${booking.booking_time}" />"/>
								<input id="bookingPickTime<c:out value="${booking.booking_id}" />" type="hidden"  value="<c:out value="${booking.booking_driver_get_user_time}" />"/>
								<input id="bookingDropTime<c:out value="${booking.booking_id}" />" type="hidden"  value="<c:out value="${booking.booking_driver_drop_user_time}" />"/>
								<input id="bookingCharge<c:out value="${booking.booking_id}" />" type="hidden"  value="<c:out value="${booking.bookin_charge}" />"/>
								<input id="bookingClientName<c:out value="${booking.booking_id}" />" type="hidden"  value="<c:out value="${booking.user_name}" />"/>
								<input id="bookingClientTP<c:out value="${booking.booking_id}" />" type="hidden"  value="<c:out value="${booking.user_tp_number}" />"/>
								<input id="bookingDriverName<c:out value="${booking.booking_id}" />" type="hidden"  value="<c:out value="${booking.driver_user_name}" />"/>
								<input id="bookingDriverTP<c:out value="${booking.booking_id}" />" type="hidden"  value="<c:out value="${booking.driver_tp_number}" />"/>
								<input id="bookingVehicleType<c:out value="${booking.booking_id}" />" type="hidden"  value="<c:out value="${booking.vehicle_number}" />"/>
								<input id="bookingVehicleNumber<c:out value="${booking.booking_id}" />" type="hidden"  value="<c:out value="${booking.vehicle_type}" />"/>
								<input id="bookingCancelReason<c:out value="${booking.booking_id}" />" type="hidden"  value="<c:out value="${booking.booking_cancel_reason}" />"/>
								<input id="bookingVehicleTypeID<c:out value="${booking.booking_id}" />" type="hidden"  value="<c:out value="${booking.vehicle_types_vehicle_types_id}" />"/>
									
								
							</tr>
							</c:forEach>
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
										Booking Status : <span id="details-bookingStatus" class="btn">JOUNURY
											END</span>
									</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
								
								<form method="post" action="/GoCheeta//driver/my-bookings/update" id="updateBooking" >
										<input type="hidden" id="bookingID" name="bookingID">
										<div class="form-group" style="width: 155px;" id="isBookingStartDiv">
											<div class="form-check form-check-inline">
												<input style="font-size: large;" class="form-check-input" type="checkbox"
													id="isBookingStart" name="isBookingStart"> <label
													class="form-check-label" for="inlineCheckbox1" style="font-weight: bold;">Booking Start</label>
											</div>
										</div>
										<div class="form-group" id="bookingVehicleDiv">
											<label style="display: flex; font-weight: bold;"
												for="message-text" class="col-form-label">Vehicle Driver:</label>
											<select id="bookingVehicled" name="bookingVehicled" required="required" class="form-select mb-3">
												<option selected value="">Select Your Vehicle</option>
												
											</select>
										</div>
										<div class="form-group">
											<label style="display: flex; font-weight: bold;"
												for="message-text" class="col-form-label">Pick Up
												Location:</label>
											<p id="details-bookingPickLocation" style="display: flex;">55 Sirimalwatta - Amunugama -
												Madawala Rd, Sirimalwatta</p>
										</div>
										<div class="form-group">
											<label style="display: flex; font-weight: bold;"
												for="message-text" class="col-form-label">Drop
												Location:</label>
											<p id="details-bookingDropLocation" style="display: flex;">55 Sirimalwatta - Amunugama -
												Madawala Rd, Sirimalwatta</p>
										</div>
										<div class="form-group">
											<label style="display: flex; font-weight: bold;"
												for="message-text" class="col-form-label">Date:</label>
											<p id="details-bookingTime" style="display: flex;">01-01-2021</p>
										</div>
										<div class="form-group" style="width: 155px;" id="isUserPickDiv">
											<div class="form-check form-check-inline">
												<input style="font-size: large;" class="form-check-input" type="checkbox"
													id="isUserPick" name="isUserPick"> <label
													class="form-check-label" for="inlineCheckbox1" style="font-weight: bold;">User Picked</label>
											</div>
										</div>
										<div class="form-group">
											<label style="display: flex; font-weight: bold;"
												for="message-text" class="col-form-label">Pick Up
												Time:</label>
											<p id="details-bookingPickTime" style="display: flex;">01.15 PM</p>
										</div>
										<div class="form-group" style="width: 155px;" id="isUserDropDiv">
											<div class="form-check form-check-inline">
												<input style="font-size: large;" class="form-check-input" type="checkbox"
													id="isUserDrop" name="isUserDrop"> <label
													class="form-check-label" for="inlineCheckbox1" style="font-weight: bold;">User Dropd</label>
											</div>
										</div>
										<div class="form-group">
											<label style="display: flex; font-weight: bold;"
												for="message-text" class="col-form-label">Drop Time:</label>
											<p id="details-bookingDropTime" style="display: flex;">04.15 PM</p>
										</div>
										<div class="form-group">
											<label style="display: flex; font-weight: bold;"
												for="message-text" class="col-form-label">Charge:</label>
											<p id="details-bookingCharge" style="display: flex;">RS. 2500.00</p>
										</div>
										<div class="form-group">
											<label style="display: flex; font-weight: bold;"
												for="message-text" class="col-form-label">Client:</label>
											<p id="details-bookingClientDetails" style="display: flex;">Dexter Morgan | TP : 0711234567</p>
										</div>

										<div class="form-group">
											<label style="display: flex; font-weight: bold;"
												for="message-text" class="col-form-label">Vehicle:</label>
											<p id="details-bookingVehicleDetals" style="display: flex;">SUV | No : AAA - 8745</p>
										</div>
										<div class="form-group" style="width: 155px;" id="isBookingCancelDiv">
											<div class="form-check form-check-inline">
												<input style="font-size: large;" class="form-check-input" type="checkbox"
													id="bookingCancelCheckBox" name="isBookingCancel"> <label
													class="form-check-label" for="inlineCheckbox1">Booking Cancel</label>
											</div>
										</div>
									<div id="bookingCancelNoteDiv" class="form-group" style="display: none;">
											<label style="display: flex; font-weight: bold;"
												for="message-text" class="col-form-label">Cancel Note:</label>
											<textarea class="form-control" id="bookingCancelNote" name="bookingCancelNote"></textarea>
										</div>
									</form>
								
								</div>
								<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
								<button form="updateBooking" type="submit" class="btn btn-primary">Update</button>
							</div>
							</div>
						</div>
					</div>
					<!-- End Model -->

					<nav aria-label="Page navigation example" style="margin-top: 5%;">
						<ul class="pagination">

							<%
								int branchCount = Integer.parseInt(request.getAttribute("bookingsCount").toString());
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
								href="/GoCheeta/driver/my-bookings?page=<%=curntPage - 1%>"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<%
								}
								for (int i = 1; i <= pageCount; i++) {
									if (curntPage == i) {
							%>
							<li class="page-item active"><a class="page-link"
								href="/GoCheeta/driver/my-bookings?page=<%=i%>"><%=i%></a></li>
							<%
								}else{
									%>
									<li class="page-item"><a class="page-link"
								href="/GoCheeta/driver/my-bookings?page=<%=i%>"><%=i%></a></li>
									<%
								}
								}
								if (curntPage < pageCount) {
							%>
							<li class="page-item"><a class="page-link"
								href="/GoCheeta/driver/my-bookings?page=<%=curntPage + 1%>"
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
	<script type="text/javascript"
		src="${initParam['basePath']}/assets/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript"
		src="${initParam['basePath']}/assets/js/bootstrap.js"></script>
		
			<script>
	if(performance.navigation.type == 2){
		   location.reload(true);
		}
	</script>
	
	<script type="text/javascript">
		$('#exampleModal').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget);
			var recipient = button.data('whatever');
			

			var bookingStatus = $("#bookingStatus" + recipient).val();
			var bookingPickLocation = $("#bookingPickLocation" + recipient).val();
			var bookingDropLocation = $("#bookingDropLocation" + recipient).val();
			var bookingDate = $("#bookingDate" + recipient).val();
			var bookingPickTime = $("#bookingPickTime" + recipient).val();
			var bookingDropTime = $("#bookingDropTime" + recipient).val();
			var bookingCharge = $("#bookingCharge" + recipient).val();
			var bookingClientName = $("#bookingClientName" + recipient).val();
			var bookingClientTP = $("#bookingClientTP" + recipient).val();
			var bookingDriverName = $("#bookingDriverName" + recipient).val();
			var bookingDriverTP = $("#bookingDriverTP" + recipient).val();
			var bookingVehicleType = $("#bookingVehicleType" + recipient).val();
			var bookingVehicleNumber = $("#bookingVehicleNumber" + recipient).val();
			var bookingCancelReason = $("#bookingCancelReason" + recipient).val();
			var bookingVehicleTypeID = $("#bookingVehicleTypeID" + recipient).val();

			var modal = $(this);
			//modal.find('#edit-vehicleID').val(recipient);
			
			if(bookingPickTime == ""){
				bookingPickTime = "-";
			}
			if(bookingDropTime == ""){
				bookingDropTime = "-";
			}
			if(bookingDriverName == ""){
				bookingDriverName = "-";
			}
			if(bookingDriverTP == ""){
				bookingDriverTP = "-";
			}
			if(bookingVehicleType == ""){
				bookingVehicleType = "-";
			}
			if(bookingVehicleNumber == ""){
				bookingVehicleNumber = "-";
			}
			
			
			$('#details-bookingStatus').removeClass();
			$('#details-bookingStatus').addClass("btn");
			
			if(bookingStatus == "PENDING"){				
				$('#details-bookingStatus').addClass("btn-warning");
				$("#isBookingCancelDiv").css("display","block");
			}else if (bookingStatus == "ONGOING") {
				$('#details-bookingStatus').addClass("btn-primary");
				$("#isBookingCancelDiv").css("display","block");
			}else if (bookingStatus == "COMPLETE") {
				$('#details-bookingStatus').addClass("btn-success");
				$("#isBookingCancelDiv").css("display","none");
			}else {
				$('#details-bookingStatus').addClass("btn-danger");
				$('#isBookingCancelDiv').css("display","none");
			}
			
			if(bookingCancelReason != ""){
				$("#bookingCancelNoteDiv").css("display","block");
				$("#bookingCancelNote").val(bookingCancelReason);
				$("#bookingCancelCheckBox").prop("disabled", true);
				$("#bookingCancelCheckBox").prop("checked", true);
				$("#bookingCancelNote").prop("disabled", true);
			}else{
				$("#bookingCancelNoteDiv").css("display","none");
				$("#bookingCancelNote").val("");
				$("#bookingCancelCheckBox").prop("disabled", false);
				$("#bookingCancelCheckBox").prop("checked", false);
				$("#bookingCancelNote").prop("disabled", false);
			}
			
			if(bookingPickTime == '-'){
				$("#isUserPickDiv").css("display","block");
			}else {
				$("#isUserPickDiv").css("display","none");
			}
			
			if(bookingDropTime == '-'){
				$("#isUserDropDiv").css("display","block");
			}else {
				$("#isUserDropDiv").css("display","none");
			}
			
			if(bookingStatus == 'PENDING'){
				$("#isBookingStartDiv").css("display","block");
				$("#bookingVehicleDiv").css("display","block");
				
				$("#isBookingStart").prop('required',true);
				$("#bookingVehicled").prop('required',true);
				
				$("#isUserDropDiv").css("display","none");
				$("#isUserPickDiv").css("display","none");
			}else {
				$("#isBookingStartDiv").css("display","none");
				$("#bookingVehicleDiv").css("display","none");
				
				$("#isBookingStart").prop('required',false);
				$("#bookingVehicled").prop('required',false);
				
				if(bookingPickTime == '-'){
					$("#isUserPickDiv").css("display","block");
				}else {
					$("#isUserPickDiv").css("display","none");
				}
				
				if(bookingDropTime == '-'){
					$("#isUserDropDiv").css("display","block");
				}else {
					$("#isUserDropDiv").css("display","none");
				}
			}
			
			
			var xhr = new XMLHttpRequest();

	        xhr.onreadystatechange = function () {
	            if (xhr.readyState == XMLHttpRequest.DONE) {
//	                alert(xhr.responseText);
	                var jsonData = JSON.parse(xhr.responseText);
	                if(jsonData.status == true){
	                	$('#bookingVehicled').find('option').remove().end().append('<option selected value="">Select Your Vehicle</option>');
	                	for(var i =0; i< jsonData.vehicleList.length; i++){
	                	$("#bookingVehicled").append(new Option(jsonData.vehicleList[i].vehicle_number, jsonData.vehicleList[i].vehicle_id));
	                	//console.log(jsonData.vehicleList[i].vehicle_id);
	                	//console.log(jsonData.vehicleList[i].vehicle_number);
	                	}
	
	
	            	}else{
	            		$('#bookingVehicled').find('option').remove().end().append('<option selected value="">Select Your Vehicle</option>');
	            	}
	        }
	        }

	        xhr.open('GET', '/GoCheeta/driver/my-bookings/my-vehivles?v-id='+bookingVehicleTypeID);
	        xhr.setRequestHeader('Content-Type', 'application/json');
	        xhr.send();

	        modal.find('#bookingID').val(recipient);

			modal.find('#details-bookingStatus').text(bookingStatus);
			modal.find('#details-bookingPickLocation').text(bookingPickLocation);
			modal.find('#details-bookingDropLocation').text(bookingDropLocation);
			modal.find('#details-bookingTime').text(bookingDate);
			modal.find('#details-bookingPickTime').text(bookingPickTime);
			modal.find('#details-bookingDropTime').text(bookingDropTime);
			modal.find('#details-bookingCharge').text(bookingCharge);
			modal.find('#details-bookingClientDetails').text(bookingClientName+" | "+bookingClientTP);
			modal.find('#details-bookingDriverDetails').text(bookingDriverName+" | "+bookingDriverTP);
			modal.find('#details-bookingVehicleDetals').text(bookingVehicleType+" | "+bookingVehicleNumber);
			modal.find('#details-bookingCancelReason').text(bookingCancelReason);

		})
	</script>
	
	<script>
	
	$("#bookingCancelCheckBox").on("change" , function() {
		console.log($("#bookingCancelCheckBox").is(':checked'));
		if($("#bookingCancelCheckBox").is(':checked') == true){
			$("#bookingCancelNoteDiv").css("display","block");
			$("#bookingCancelNote").prop('required',true);
		}else {
			console.log("Click");
			$("#bookingCancelNoteDiv").css("display","none");
			$("#bookingCancelNote").prop('required',false);
		}
		
	});
	
	</script>

</body>

</html>