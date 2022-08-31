<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<title>GoCheeta | ADMIN USERS</title>

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
					<strong>Admin Users</strong>
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
								<th>User Name</th>
								<th class="d-none d-xl-table-cell d-sm-table-cell">E-Mail</th>
								<th class="d-none d-xl-table-cell d-sm-table-cell">Branch</th>
								<th>Status</th>
								<th>EDIT</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="adminUser" items="${adminUsersList}">
							<tr>
								<td><c:out value="${adminUser.admin_user_name}" /></td>
								<td class="d-none d-xl-table-cell d-sm-table-cell"><c:out value="${adminUser.admin_user_email}" /></td>
								
								<c:set var = "adminUserBranchID" value = "${adminUser.branches_branch_id}"/>
								<c:set var = "adminUserBranchName" value = "${''}"/>
								
								<c:forEach var="branch" items="${listBranches}">
								<c:if test="${adminUserBranchID == branch.branch_id}">
								<c:set var = "adminUserBranchName" value = "${branch.branch_loaction}"/>
								</c:if>
								</c:forEach>
								
								<td class="d-none d-xl-table-cell d-sm-table-cell"><c:out value="${adminUserBranchName}" /></td>
								
								
								<c:set var = "adminUserStatus" value = "${adminUser.admin_user_account_status}"/>
								<c:if test="${adminUserStatus == 1}">
								<td><span class="badge bg-success">ONLINE</span></td>
								</c:if>
								<c:if test="${adminUserStatus == 0}">
								<td><span class="badge bg-danger">OFFLINE</span></td>
								</c:if>
								<td><button data-toggle="modal" data-target="#exampleModal"
										data-whatever="<c:out value="${adminUser.admin_user_id}" />" class="btn btn-primary btn-sm">
										<i class="fa-solid fa-pen-to-square"></i> EDIT
									</button></td>
								<input id="userName<c:out value="${adminUser.admin_user_id}" />" type="hidden" value="<c:out value="${adminUser.admin_user_name}" />"/>
								<input id="userMail<c:out value="${adminUser.admin_user_id}" />" type="hidden" value="<c:out value="${adminUser.admin_user_email}" />"/>
								<input id="userTP<c:out value="${adminUser.admin_user_id}" />" type="hidden" value="<c:out value="${adminUser.admin_user_tp_number}" />"/>
								<input id="userStatus<c:out value="${adminUser.admin_user_id}" />" type="hidden" value="<c:out value="${adminUser.admin_user_account_status}" />"/>
								<input id="userBranchID<c:out value="${adminUser.admin_user_id}" />" type="hidden" value="<c:out value="${adminUser.branches_branch_id}" />"/>
								<input id="userRoleID<c:out value="${adminUser.admin_user_id}" />" type="hidden" value="<c:out value="${adminUser.user_roles_user_role_id}" />"/>
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
									<form id="updateUser" method="post" action="/GoCheeta/admin/users/update">
									<input type="hidden" id="edit-adminUserID" name="edit-adminUserID" value="">
										<div class="form-group">
											<label style="display: flex; font-weight: bold;"
												for="message-text" class="col-form-label">User Name:</label> 
												<input id="edit-adminUserName" name="edit-adminUserName" required="required" type="text" class="form-control"
												placeholder="Jhone Doe">
										</div>
										<div class="form-group">
											<label style="display: flex; font-weight: bold;"
												for="message-text" class="col-form-label">E-Mail:</label> 
												<input id="edit-adminUserMail" name="edit-adminUserMail" required="required" type="email" class="form-control"
												placeholder="admin@gmail.com">
										</div>
										<div class="form-group">
											<label style="display: flex; font-weight: bold;"
												for="message-text" class="col-form-label">Mobile Number:</label> 
												<input id="edit-adminUserTP" name="edit-adminUserTP" required="required" type="text" class="form-control"
												placeholder="0714567890">
										</div>
										<div class="form-group">
											<label style="display: flex; font-weight: bold;"
												for="message-text" class="col-form-label">Branch:</label>
											<select id="edit-adminUserBranch" name="edit-adminUserBranch" required="required" class="form-select mb-3">
												<option selected value="">Select Branch</option>
												<c:forEach var="branch" items="${listBranches}">
												<option value="<c:out value="${branch.branch_id}" />"><c:out value="${branch.branch_loaction}" /></option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group">
											<label style="display: flex; font-weight: bold;"
												for="message-text" class="col-form-label">Password:</label> 
												<input id="edit-adminUserPassword" name="edit-adminUserPassword"  type="password" class="form-control"
												placeholder="Password">
										</div>
										<div class="form-group">
											<label style="display: flex; font-weight: bold;"
												for="message-text" class="col-form-label">User Role:</label>
											<select id="edit-adminUserRole" name="edit-adminUserRole" required="required" class="form-select mb-3">
												<option selected value="">Select User Role</option>
												<c:forEach var="userRole" items="${user_Roles}">
												<option value="<c:out value="${userRole.user_role_id}" />"><c:out value="${userRole.user_role}" /></option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group">
											<label style="display: flex; font-weight: bold;"
												for="message-text" class="col-form-label">Status:</label>
											<select id="edit-adminUserStatus" name="edit-adminUserStatus" required="required" class="form-select mb-3">
												<option selected value="">Select Status</option>
												<option value="1">ONLINE</option>
												<option value="0">OFFLINE</option>
											</select>
										</div>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Close</button>
									<button form="updateUser" type="submit" class="btn btn-primary">Update</button>
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
									<form id="addNewAdminUser" method="post" action="/GoCheeta/admin/users/add-new">
										<div class="form-group">
											<label style="display: flex; font-weight: bold;"
												for="message-text" class="col-form-label">User Name:</label> 
												<input name="add-new-AdminUserName" required="required" type="text" class="form-control"
												placeholder="Jhone Doe">
										</div>
										<div class="form-group">
											<label style="display: flex; font-weight: bold;"
												for="message-text" class="col-form-label">E-Mail:</label> 
												<input name="add-new-AdminUserMail" required="required" type="email" class="form-control"
												placeholder="admin@gmail.com">
										</div>
										<div class="form-group">
											<label style="display: flex; font-weight: bold;"
												for="message-text" class="col-form-label">Mobile Number:</label> 
												<input name="add-new-AdminUserTP" required="required" type="tel" class="form-control"
												placeholder="0714567890">
										</div>
										<div class="form-group">
											<label style="display: flex; font-weight: bold;"
												for="message-text" class="col-form-label">Branch:</label>
											<select name="add-new-AdminUserBranch" required="required" class="form-select mb-3">
												<option selected value="">Select Branch</option>
												<c:forEach var="branch" items="${listBranches}">
												<option value="<c:out value="${branch.branch_id}" />"><c:out value="${branch.branch_loaction}" /></option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group">
											<label style="display: flex; font-weight: bold;"
												for="message-text" class="col-form-label">Password:</label> 
												<input name="add-new-AdminUserPassword" required="required" type="password" class="form-control"
												placeholder="Password">
										</div>
										<div class="form-group">
											<label style="display: flex; font-weight: bold;"
												for="message-text" class="col-form-label">User Role:</label>
											<select name="add-new-AdminUserRole" required="required" class="form-select mb-3">
												<option selected value="">Select User Role</option>
												<c:forEach var="userRole" items="${user_Roles}">
												<option value="<c:out value="${userRole.user_role_id}" />"><c:out value="${userRole.user_role}" /></option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group">
											<label style="display: flex; font-weight: bold;"
												for="message-text" class="col-form-label">Status:</label>
											<select name="add-new-AdminUserStatus" required="required" class="form-select mb-3">
												<option selected value="">Select Status</option>
												<option value="1">ONLINE</option>
												<option value="0">OFFLINE</option>
											</select>
										</div>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Close</button>
									<button form="addNewAdminUser" type="submit" class="btn btn-primary">ADD</button>
								</div>
							</div>
						</div>
					</div>
					<!-- Add New End Model -->

					<nav aria-label="Page navigation example" style="margin-top: 5%;">
						<ul class="pagination">

							<%
								double branchCount = Integer.parseInt(request.getAttribute("adminUsersCount").toString());
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
								href="/GoCheeta/admin/users?page=<%=curntPage - 1%>"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<%
								}
								for (int i = 1; i <= pageCount; i++) {
									if (curntPage == i) {
							%>
							<li class="page-item active"><a class="page-link"
								href="/GoCheeta/admin/users?page=<%=i%>"><%=i%></a></li>
							<%
								}else{
									%>
									<li class="page-item"><a class="page-link"
								href="/GoCheeta/admin/users?page=<%=i%>"><%=i%></a></li>
									<%
								}
								}
								if (curntPage < pageCount) {
							%>
							<li class="page-item"><a class="page-link"
								href="/GoCheeta/admin/users?page=<%=curntPage + 1%>"
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
			

			var admin_user_name = $("#userName" + recipient).val();
			var admin_user_email = $("#userMail" + recipient).val();
			var admin_user_tp_number = $("#userTP" + recipient).val();
			var admin_user_account_status = $("#userStatus" + recipient).val();
			var user_role_id = $("#userRoleID" + recipient).val();
			var branch_id = $("#userBranchID" + recipient).val();

			var modal = $(this);
			modal.find('#edit-adminUserID').val(recipient);

			modal.find('#edit-adminUserName').val(admin_user_name);
			modal.find('#edit-adminUserMail').val(admin_user_email);
			modal.find('#edit-adminUserTP').val(admin_user_tp_number);
			modal.find('#edit-adminUserBranch').val(branch_id);
			modal.find('#edit-adminUserRole').val(user_role_id);
			modal.find('#edit-adminUserStatus').val(admin_user_account_status);

		})
	</script>

</body>

</html>