<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
if(session.getAttribute("adminUserId") == null){	
	response.sendRedirect("/GoCheeta/admin/sign-in");
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

<title>GoCheeta | VEHICLES</title>

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
		

		<jsp:include page="/views/admin/layouts/menu-sidebar.jsp" />

		<div class="main">
			
			<jsp:include page="/views/admin/layouts/nav-bar.jsp" />
			

			<main class="content">
			<div class="container-fluid p-0">

				<h1 class="h3 mb-3">
					<strong>Vehicles</strong>
					<button style="margin-left: 15px;" data-toggle="modal"
						data-target="#addNewModel" data-whatever="@mdo"
						class="btn btn-primary btn-sm">
						<i class="fa-solid fa-circle-plus"></i> ADD NEW
					</button>
				</h1>

				<div class="row"
					style="padding-top: 10px; background: #ffffffc4; border-top-left-radius: 20px; border-top-right-radius: 20px; padding-left: 5px; padding-right: 5px;">
					<table class="table table-hover my-0">
						<thead>
							<tr>
								<th>Vehicles Type</th>
								<th>Vehicle Number</th>
								<th>Vehicle's Status</th>
								<th class="d-none d-xl-table-cell d-sm-table-cell">Vehicles Driver</th>
								<th>EDIT</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="vehicle" items="${listvehicles}">
							<tr>
							
								<c:set var = "vehicleTypeID" value = "${vehicle.vehicle_types_vehicle_types_id}"/>
								<c:set var = "vehicleTypeName" value = "${''}"/>
								
								<c:forEach var="vehicleType" items="${listvehicleTypes}">
								<c:if test="${vehicleTypeID == vehicleType.vehicle_types_id}">
								<c:set var = "vehicleTypeName" value = "${vehicleType.vehicle_type}"/>
								</c:if>
								</c:forEach>
							
								<td><c:out value="${vehicleTypeName}" /></td>
								<td id="vehicleNumber<c:out value="${vehicle.vehicle_id}" />"><c:out value="${vehicle.vehicle_number}" /></td>
								
								<c:set var = "vehicleStatus" value = "${vehicle.vehicle_status}"/>
								<c:if test="${vehicleStatus == 1}">
								<td><span class="badge bg-success">ONLINE</span></td>
								</c:if>
								<c:if test="${vehicleStatus == 0}">
								<td><span class="badge bg-danger">OFFLINE</span></td>
								</c:if>
								
								<c:set var = "vehicleDriverID" value = "${vehicle.drivers_driver_id}"/>
								<c:set var = "vehicleDriverName" value = "${''}"/>
								
								<c:forEach var="driver" items="${listDrivers}">
								<c:if test="${vehicleDriverID == driver.driver_id}">
								<c:set var = "vehicleDriverName" value = "${driver.driver_user_name}"/>
								</c:if>
								</c:forEach>
								
								<td class="d-none d-xl-table-cell d-sm-table-cell"><c:out value="${vehicleDriverName}" /></td>
								
								<input id="vehicleType<c:out value="${vehicle.vehicle_id}" />" type="hidden"/ value="<c:out value="${vehicle.vehicle_types_vehicle_types_id}" />">
								<input id="vehicleStatus<c:out value="${vehicle.vehicle_id}" />" type="hidden"/ value="<c:out value="${vehicle.vehicle_status}" />">
								<input id="vehicleDriver<c:out value="${vehicle.vehicle_id}" />" type="hidden"/ value="<c:out value="${vehicle.drivers_driver_id}" />">
								<input id="vehicleDescription<c:out value="${vehicle.vehicle_id}" />" type="hidden"/ value="<c:out value="${vehicle.vehicle_description}" />">
								
								<td><button id="vehicleEdit<c:out value="${vehicle.vehicle_id}" />" data-toggle="modal" data-target="#exampleModal"
										data-whatever="<c:out value="${vehicle.vehicle_id}" />" class="btn btn-primary btn-sm">
										<i class="fa-solid fa-pen-to-square"></i> EDIT
									</button></td>
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
										id="exampleModalLabel">UPDATE</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<form method="post" id="updateVehiclesType" action="/GoCheeta/admin/vehicles/update">
									<input type="hidden" id="edit-vehicleID" name="edit-vehicleID"
											value="">
										<div class="form-group">
											<label style="display: flex; font-weight: bold;"
												for="message-text" class="col-form-label">Vehicle Type:</label>
											<select id="edit-vehicleType" name="edit-vehicleType" required="required" class="form-select mb-3">
												<option selected value="">Select Vehicle Type</option>
											<c:forEach var="vehicleType" items="${listvehicleTypes}">
												<option value="<c:out value="${vehicleType.vehicle_types_id}" />"><c:out value="${vehicleType.vehicle_type}" /></option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group">
											<label style="display: flex; font-weight: bold;"
												for="message-text" class="col-form-label">Vehicle Number:</label> 
												<input id="edit-vehicleNumber" name="edit-vehicleNumber" required="required" type="text" class="form-control"
												placeholder="ABC - 1236">
										</div>
										<div class="form-group">
											<label style="display: flex; font-weight: bold;"
												for="message-text" class="col-form-label">Vehicle Driver:</label>
											<select id="edit-vehicledDriver" name="edit-vehicledDriver" required="required" class="form-select mb-3">
												<option selected value="">Select Vehicle Driver</option>
												<c:forEach var="driver" items="${listDrivers}">
												<option value="<c:out value="${driver.driver_id}" />"><c:out value="${driver.driver_user_name}" /></option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group">
											<label style="display: flex; font-weight: bold;"
												for="message-text" class="col-form-label">Vehicles Status:</label>
											<select id="edit-vehicleStatus" name="edit-vehicleStatus" required="required" class="form-select mb-3">
												<option selected value="">Select Status</option>
												<option value="1">ONLINE</option>
												<option value="0">OFFLINE</option>
											</select>
										</div>
										<div class="form-group">
											<label style="display: flex; font-weight: bold;"
												for="message-text" class="col-form-label">Vehicle Description:</label> 
												<textarea class="form-control" name="edit-vehicleDescription" id="edit-vehicleDescription"></textarea>
										</div>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Close</button>
									<button form="updateVehiclesType" type="submit" class="btn btn-primary">Update</button>
								</div>
							</div>
						</div>
					</div>
					<!-- End Model -->

					<!-- Add New Model -->
					<div class="modal fade bd-example-modal-lg" id="addNewModel"
						tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true" style="z-index: 100000;">
						<div
							class="modal-dialog modal-lg modal-dialog-scrollable modal-dialog-centered"
							role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 style="font-weight: bold;" class="modal-title"
										id="addNewModelTitle">ADD NEW</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<form method="post" id="addVehicles" name="addVehicles" action="/GoCheeta/admin/vehicles/add-new">
									<div class="form-group">
											<label style="display: flex; font-weight: bold;"
												for="message-text" class="col-form-label">Vehicle Type:</label>
											<select id="add-new-vehicleType" name="add-new-vehicleType" required="required" class="form-select mb-3">
												<option selected value="">Select Vehicle Type</option>
												<c:forEach var="vehicleType" items="${listvehicleTypes}">
												<option value="<c:out value="${vehicleType.vehicle_types_id}" />"><c:out value="${vehicleType.vehicle_type}" /></option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group">
											<label style="display: flex; font-weight: bold;"
												for="message-text" class="col-form-label">Vehicle Number:</label> 
												<input id="add-new-vehicleNumber" name="add-new-vehicleNumber" required="required" type="text" class="form-control"
												placeholder="ABC - 1236">
										</div>
										<div class="form-group">
											<label style="display: flex; font-weight: bold;"
												for="message-text" class="col-form-label">Vehicle Driver:</label>
											<select id="add-new-vehicleDriver" name="add-new-vehicleDriver" required="required" class="form-select mb-3">
												<option selected value="">Select Vehicle Driver</option>
												<c:forEach var="driver" items="${listDrivers}">
												<option value="<c:out value="${driver.driver_id}" />"><c:out value="${driver.driver_user_name}" /></option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group">
											<label style="display: flex; font-weight: bold;"
												for="message-text" class="col-form-label">Vehicles Status:</label>
											<select id="add-new-vehicleStatus" name="add-new-vehicleStatus" required="required" class="form-select mb-3">
												<option selected value="">Select Status</option>
												<option value="1">ONLINE</option>
												<option value="0">OFFLINE</option>
											</select>
										</div>
										<div class="form-group">
											<label style="display: flex; font-weight: bold;"
												for="message-text" class="col-form-label">Vehicle Description:</label> 
												<textarea class="form-control" name="add-new-vehicleDescription" id="add-new-vehicleDescription"></textarea>
										</div>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Close</button>
									<button form="addVehicles" type="submit" class="btn btn-primary">ADD</button>
								</div>
							</div>
						</div>
					</div>
					<!-- Add New End Model -->

					<nav aria-label="Page navigation example" style="margin-top: 5%;">
						<ul class="pagination">

							<%
								double branchCount = Integer.parseInt(request.getAttribute("vehiclesCount").toString());
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
								href="/GoCheeta/admin/vehicles?page=<%=curntPage - 1%>"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<%
								}
								for (int i = 1; i <= pageCount; i++) {
									if (curntPage == i) {
							%>
							<li class="page-item active"><a class="page-link"
								href="/GoCheeta/admin/vehicles?page=<%=i%>"><%=i%></a></li>
							<%
								}else{
									%>
									<li class="page-item"><a class="page-link"
								href="/GoCheeta/admin/vehicles?page=<%=i%>"><%=i%></a></li>
									<%
								}
								}
								if (curntPage < pageCount) {
							%>
							<li class="page-item"><a class="page-link"
								href="/GoCheeta/admin/vehicles?page=<%=curntPage + 1%>"
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
		
	<script type="text/javascript">
		$('#exampleModal').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget);
			var recipient = button.data('whatever');
			

			var vehicle_number = $("#vehicleNumber" + recipient).text();
			var vehicle_description = $("#vehicleDescription" + recipient).val();
			var vehicle_status = $("#vehicleStatus" + recipient).val();
			var vehicle_types_id = $("#vehicleType" + recipient).val();
			var driver_id = $("#vehicleDriver" + recipient).val();

			var modal = $(this);
			modal.find('#edit-vehicleID').val(recipient);

			modal.find('#edit-vehicleType').val(vehicle_types_id);
			modal.find('#edit-vehicleNumber').val(vehicle_number);
			modal.find('#edit-vehicledDriver').val(driver_id);
			modal.find('#edit-vehicleStatus').val(vehicle_status);
			modal.find('#edit-vehicleDescription').val(vehicle_description);

		})
	</script>
	<script>
	if(performance.navigation.type == 2){
		   location.reload(true);
		}
	</script>

</body>

</html>