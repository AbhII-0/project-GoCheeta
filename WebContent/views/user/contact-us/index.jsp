<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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

<title>GoCheeta | CONTACT US</title>


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

<!-- fontawsome stylesheet -->
<script src="https://kit.fontawesome.com/57cb8f938d.js"
	crossorigin="anonymous"></script>
</head>

<body>

	<div class="hero_area">
		<!-- header section strats -->
		<jsp:include page="/views/user/layouts/nav-bar.jsp" />
		<!-- end header section -->

		<!-- contact section -->

		<section class="contact_section layout_padding">
			<div class="container">
				<div class="heading_container">
					<h2>
						Any Problems <br> Any Questions
					</h2>
				</div>
			</div>
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-5  offset-md-1">
						<div class="contact_form">
							<h4>Get In touch</h4>
							<form action="">
								<input type="text" placeholder="Name"> <input
									type="text" placeholder="Phone Number"> <input
									type="text" placeholder="Message" class="message_input">
								<button>Send</button>
							</form>
						</div>
					</div>
					<div class="col-md-6 px-0">
						<div class="img-box">
							<img src="${initParam['basePath']}/assets/images/contact-img.png"
								alt="">
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- end contact section -->

	</div>

	<!-- footer section -->
	<jsp:include page="/views/layouts/footer/index.jsp" />
	<!-- footer section -->

	<script type="text/javascript"
		src="${initParam['basePath']}/assets/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript"
		src="${initParam['basePath']}/assets/js/bootstrap.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
		
	</script>


	<!-- owl carousel script -->
	<script type="text/javascript">
		$(".owl-carousel").owlCarousel({
			loop : true,
			margin : 20,
			navText : [],
			autoplay : true,
			autoplayHoverPause : true,
			responsive : {
				0 : {
					items : 1
				},
				768 : {
					items : 2
				},
				1000 : {
					items : 2
				}
			}
		});
	</script>
	<!-- end owl carousel script -->

</body>

</html>