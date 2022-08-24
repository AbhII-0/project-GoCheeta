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