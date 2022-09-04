<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
if(session.getAttribute("userId") == null){	
	response.sendRedirect("/GoCheeta/sign-in");
}
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
		<jsp:include page="/views/user/layouts/nav-bar.jsp" />
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
							<th scope="col">ID</th>
							<th scope="col">Pick Up Location</th>
							<th scope="col">Drop Location</th>
							<th scope="col">Date</th>
							<th scope="col">Status</th>
							<th scope="col">Details</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="booking" items="${bookings}">
					
					<c:set var = "tblClass" value = "${''}"/>
					<c:set var = "tblClass" value = "${''}"/>
					<c:set var = "bookinStatus" value = "${booking.booking_status}"/>
								<c:if test="${bookinStatus == 'ONGOING'}">
								<c:set var = "tblClass" value = "${'table-success'}"/>
								</c:if>
								<c:if test="${bookinStatus == 'PENDING'}">
								<c:set var = "tblClass" value = "${'table-warning'}"/>
								</c:if>
								<c:if test="${bookinStatus == 'COMPLETE'}">
								<c:set var = "tblClass" value = "${'table-success'}"/>
								</c:if>
								<c:if test="${bookinStatus == 'DRIVER CANCEL'}">
								<c:set var = "tblClass" value = "${'table-danger'}"/>
								</c:if>
								<c:if test="${bookinStatus == 'USER CANCEL'}">
								<c:set var = "tblClass" value = "${'table-danger'}"/>
								</c:if>
					
						<tr class="<c:out value="${tblClass}" />">
							<th scope="row">BK<c:out value="${booking.booking_id}" /></th>
							<td><c:out value="${booking.booking_start_location}" /></td>
							<td><c:out value="${booking.booking_end_location}" /></td>
							<td><c:out value="${booking.booking_time}" /></td>
							<td><c:out value="${booking.booking_status}" /></td>
							<td><button type="button" class="btn btn-primary"
									data-toggle="modal" data-target="#exampleModal"
									data-whatever="<c:out value="${booking.booking_id}" />">
									<i class="fa-solid fa-eye"></i>
								</button></td>
						</tr>
						
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
						
						</c:forEach>
						
					</tbody>
				</table>
				<!--End Table-->

				<!-- Pagination -->
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
								href="/GoCheeta/my-bookings?page=<%=curntPage - 1%>"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<%
								}
								for (int i = 1; i <= pageCount; i++) {
									if (curntPage == i) {
							%>
							<li class="page-item active"><a class="page-link"
								href="/GoCheeta/my-bookings?page=<%=i%>"><%=i%></a></li>
							<%
								}else{
									%>
									<li class="page-item"><a class="page-link"
								href="/GoCheeta/my-bookings?page=<%=i%>"><%=i%></a></li>
									<%
								}
								}
								if (curntPage < pageCount) {
							%>
							<li class="page-item"><a class="page-link"
								href="/GoCheeta/my-bookings?page=<%=curntPage + 1%>"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
							<%
								}
							%>
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
									Booking Status : <span id="details-bookingStatus" class="btn btn-success">JOUNURY
										END</span>
								</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form method="post" action="/GoCheeta/my-bookings/update" id="updateBooking" >
								<input type="hidden" id="bookingID" name="bookingID">
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
									<div class="form-group">
										<label style="display: flex; font-weight: bold;"
											for="message-text" class="col-form-label">Pick Up
											Time:</label>
										<p id="details-bookingPickTime" style="display: flex;">01.15 PM</p>
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
											for="message-text" class="col-form-label">Driver:</label>
										<p id="details-bookingDriverDetails" style="display: flex;">Dexter Morgan | TP : 0711234567</p>
									</div>
									<div class="form-group">
										<label style="display: flex; font-weight: bold;"
											for="message-text" class="col-form-label">Vehicle:</label>
										<p id="details-bookingVehicleDetals" style="display: flex;">CAR | NO : AAA-8736</p>
									</div>
									<div class="form-group">
										<label style="display: flex; font-weight: bold;"
											for="message-text" class="col-form-label">Feedback:</label>
										<textarea class="form-control" id="message-text" name="booking-Feedback"></textarea>
									</div>
									<div class="form-group" style="width: 155px;">
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
			}else if (bookingStatus == "ONGOING") {
				$('#details-bookingStatus').addClass("btn-primary");
			}else if (bookingStatus == "COMPLETE") {
				$('#details-bookingStatus').addClass("btn-success");
			}else {
				$('#details-bookingStatus').addClass("btn-danger");
			}
			
			if(bookingCancelReason != ""){
				$('#bookingCancelReasonDiv').css("display" ,"block")
			}else{
				$('#bookingCancelReasonDiv').css("display" ,"none")
			}

			modal.find('#bookingID').val(recipient);
			
			modal.find('#details-bookingStatus').text(bookingStatus);
			modal.find('#details-bookingPickLocation').text(bookingPickLocation);
			modal.find('#details-bookingDropLocation').text(bookingDropLocation);
			modal.find('#details-bookingTime').text(bookingDate);
			modal.find('#details-bookingPickTime').text(bookingPickTime);
			modal.find('#details-bookingDropTime').text(bookingDropTime);
			modal.find('#details-bookingCharge').text(bookingCharge);
			//modal.find('#details-bookingClientDetails').text(bookingClientName+" | "+bookingClientTP);
			modal.find('#details-bookingDriverDetails').text(bookingDriverName+" | "+bookingDriverTP);
			modal.find('#details-bookingVehicleDetals').text(bookingVehicleType+" | "+bookingVehicleNumber);
			modal.find('#details-bookingCancelReason').text(bookingCancelReason);
			
			console.log(bookingCancelReason);
			
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
			
			var xhr = new XMLHttpRequest();

	        xhr.onreadystatechange = function () {
	            if (xhr.readyState == XMLHttpRequest.DONE) {
//	                alert(xhr.responseText);
	                var jsonData = JSON.parse(xhr.responseText);
	                if(jsonData.status == true){
	                	
	                	//console.log(jsonData.booking_feedback);
	                if(jsonData.booking_feedback != ""){
	                	//console.log("disabled");
	                	$("#message-text").prop('disabled',true);
		                $("#message-text").val(jsonData.booking_feedback);
	                }else{
	                	$("#message-text").prop('disabled',false);
	                	$("#message-text").val("");
	                	//console.log("enebled");
	                }
	                }else{
	                	$("#message-text").prop('disabled',false);
	                	$("#message-text").val("");
	                	//console.log("enebled");
	                }
	            }
	        }

	        xhr.open('GET', '/GoCheeta/get-booking-feedback?b-id='+recipient);
	        xhr.setRequestHeader('Content-Type', 'application/json');
	        xhr.send();

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