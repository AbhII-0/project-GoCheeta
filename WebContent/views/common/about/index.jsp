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

<title>GoCheeta | ABOUT</title>

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

<!-- fontawsome stylesheet -->
<script src="https://kit.fontawesome.com/57cb8f938d.js"
	crossorigin="anonymous"></script>

</head>

<body class="sub_page">

	<div class="hero_area">
		<!-- header section strats -->
		<jsp:include page="/views/layouts/header-some/index.jsp" />
		<!-- end header section -->
	</div>

	<!-- about section -->

	<section class="about_section layout_padding">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-4 col-md-5 offset-lg-2 offset-md-1">
					<div class="detail-box">
						<h2>
							About <br> Taxi Company
						</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua. Ut enim ad minim veniaLorem ipsum dolor sit amet,
							consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
							labore et dolore magna aliqua. Ut enim ad minim veniamm</p>
						<a href=""> Read More </a>
					</div>
				</div>
				<div class="col-md-6">
					<div class="img-box">
						<img src="${initParam['basePath']}/assets/images/about-img.png"
							alt="">
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- end about section -->

	<!-- client section -->

	<section class="client_section layout_padding-bottom">
		<div class="container">
			<div class="heading_container">
				<h2>
					What <br> Client <br> Says
				</h2>
			</div>
			<div class="client_container">
				<div class="carousel-wrap ">
					<div class="owl-carousel">
						<div class="item">
							<div class="box">
								<div class="img-box">
									<img src="${initParam['basePath']}/assets/images/client-1.png"
										alt="">
								</div>
								<div class="detail-box">
									<h3>Aliqua</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
										sed do eiusmod tempor incididunt ut labore et amet,
										consectetur adipiscing</p>
									<img src="${initParam['basePath']}/assets/images/quote.png"
										alt="">
								</div>
							</div>
						</div>
						<div class="item">
							<div class="box">
								<div class="img-box">
									<img src="${initParam['basePath']}/assets/images/client-2.png"
										alt="">
								</div>
								<div class="detail-box">
									<h3>Liqua</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
										sed do eiusmod tempor incididunt ut labore et amet,
										consectetur adipiscing</p>
									<img src="${initParam['basePath']}/assets/images/quote.png"
										alt="">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- end client section -->

	<!-- info section -->
	<jsp:include page="/views/layouts/info/index.jsp" />
	<!-- end info section -->

	<!--footer -->
	<jsp:include page="/views/layouts/footer/index.jsp" />
	<!-- end footer -->

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