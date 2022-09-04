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

<title>GoCheeta | REPORTS</title>

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
					<strong>Reports</strong>
				</h1>

				<div class="row"
					style="padding-top: 10px; background: #ffffffc4; border-top-left-radius: 20px; border-top-right-radius: 20px; padding-left: 5px; padding-right: 5px;">

					<form style="margin-bottom: 15px;"
						class="row row-cols-lg-auto g-3 align-items-center" method="post" action="/GoCheeta/admin/reports">

						<div class="col-12">
							<label class="visually-hidden" for="inlineFormSelectPref">From
								Date</label>
							<p>From Date</p>
							<input required="required" id="fromDate" name="fromDate" type="date"/>
						</div>
						<div class="col-12">
							<label class="visually-hidden" for="inlineFormSelectPref">To
								Date</label>
							<p>To Date</p>
							<input required="required" id="toDate" name="toDate" type="date">
						</div>

						<!--<div class="col-12">
							<label class="visually-hidden" for="inlineFormSelectPref">Brnch</label>
							<p>Brnch</p>
							<select class="form-select" id="inlineFormSelectPref">
								<option value="-1" selected>All</option>
								<option value="1">One</option>
								<option value="2">Two</option>
								<option value="3">Three</option>
							</select>
						</div>-->

						<div class="col-12">
							<button style="margin-top: 33px;" type="submit"
								class="btn btn-primary">Search</button>
						</div>

						<div class="col-12">
							<button style="margin-top: 33px;" type="button"
								class="btn btn-primary" onclick="Export()">Export To
								PDF</button>
						</div>
					</form>

					<table class="table table-hover my-0" id="totalSale">
						<caption
							style="font-weight: bold; caption-side: top; font-size: x-large; color: black;">TOTAL COLECTION FROM <span id="topicStartDateTop">01/01/2022</span> - <span id="topicEndtDateTop">08/24/2022</span></caption>
						<caption style="caption-side: bottom;">TOTAL COLECTION FROM
							<span id="topicStartDateBot">01/01/2022</span> - <span id="topicEndtDateBot">08/24/2022</caption>
						<thead>
							<tr>
								<th>#</th>
								<th>Branch</th>
								<th>Date Range</th>
								<th>Total Sale</th>
							</tr>
						</thead>
						<tbody>
						<c:set var = "fromDate" value = "${fromDate}"/>
						<c:set var = "toDate" value = "${toDate}"/>
						<input type="hidden" id="fromDateResived" value="<c:out value="${fromDate}" />">
						<input type="hidden" id="toDateResived" value="<c:out value="${toDate}" />">
						
						<c:forEach var="branch" items="${listBranches}">
						
							<tr>
								<td>B-00<c:out value="${branch.branch_id}" /></td>
								<td><c:out value="${branch.branch_loaction}" /></td>
								<td><c:out value="${fromDate}" /> - <c:out value="${toDate}" /></td>
								<c:forEach var="branchRev" items="${branchesRev}">
								<td>RS. <c:if test="${branch.branch_id == branchRev.branch_id}"><c:out value="${branchRev.branch_total_collection}" /></c:if><c:if test="${branch.branch_id != branchRev.branch_id}">0.00</c:if></td>
								</c:forEach>
								<c:if test="${branchesRev.size() < 1}">
								<td>RS. 0.00</td>
								</c:if>
								
							</tr>
							</c:forEach>
						</tbody>
					</table>

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

	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.22/pdfmake.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>
	<script type="text/javascript">
		function Export() {
			html2canvas(document.getElementById('totalSale'), {
				onrendered : function(canvas) {
					var data = canvas.toDataURL();
					var docDefinition = {
						content : [ {
							image : data,
							width : 500
						} ]
					};
					pdfMake.createPdf(docDefinition).download("totalSale.pdf");
				}
			});
		}
	</script>

	<script type="text/javascript">
	$(document).ready(function() {

			var today = new Date();
			var dd = String(today.getDate()).padStart(2, '0');
			var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
			var yyyy = today.getFullYear();

			today = yyyy + '-' + mm + '-' + dd;
			
			var fromDate = $("#fromDateResived").val();
			var toDate = $("#toDateResived").val();

			$("#fromDate").val(fromDate);
			$("#toDate").val(toDate);
			
			$("#topicStartDateTop").text(fromDate);
			$("#topicEndtDateTop").text(toDate);
			
			$("#topicStartDateBot").text(fromDate);
			$("#topicEndtDateBot").text(toDate);
		});
	</script>
	<script>
	if(performance.navigation.type == 2){
		   location.reload(true);
		}
	</script>

</body>

</html>