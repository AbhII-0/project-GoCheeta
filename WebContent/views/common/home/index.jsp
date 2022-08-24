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

<title>GoCheeta</title>

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
<body>

	<div class="hero_area">
		<!-- header section strats -->
		<jsp:include page="/views/layouts/header-some/index.jsp" />
		<!-- end header section -->

		<!-- slider section -->
		<section class=" slider_section ">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-7 ">
						<div class="box">
							<div class="detail-box">
								<h4>Welcome to</h4>
								<h1>GoCheeta</h1>
							</div>
							<div id="carouselExampleIndicators" class="carousel slide"
								data-ride="carousel">
								<ol class="carousel-indicators">
									<li data-target="#carouselExampleIndicators" data-slide-to="0"
										class="active"></li>
									<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
									<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
									<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
								</ol>
								<div class="carousel-inner">
									<div class="carousel-item active">

										<div class="img-box">
											<img
												src="${initParam['basePath']}/assets/images/bike_img.png"
												alt="">
										</div>
									</div>
									<div class="carousel-item">
										<div class="img-box">
											<img
												src="${initParam['basePath']}/assets/images/car-img.png"
												alt="">
										</div>
									</div>
									<div class="carousel-item">
										<div class="img-box">
											<img
												src="${initParam['basePath']}/assets/images/car-img-2.png"
												alt="">
										</div>
									</div>
									<div class="carousel-item">
										<div class="img-box">
											<img
												src="${initParam['basePath']}/assets/images/van-img.png"
												alt="">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-7 landing-des-div"
						style="margin-left: 100px">

						<h2 class="landing-des">
							<span style="background-color: yellow; padding: 5px">Go
								With</span> <span
								style="color: yellow; background-color: black; padding: 5px">GoCheeta...!</span>
						</h2>

						<p>Make Your Journey With Us...!</p>
						<h3>
							<span style="color: red;"> SAFE & </span> TRUST
						</h3>

						<div class="btn-box-cus">
							<a href="" class="btn-1-cus"> SIGN IN </a>
						</div>

						<div class="btn-box-cus">
							<a href="" class="btn-1-cus"> SIGN UP </a>
						</div>

					</div>

				</div>
			</div>

		</section>
		<!-- end slider section -->
	</div>

	<!-- app section -->

	<section class="app_section layout_padding2">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<div class="detail-box">
						<h2>Download Our app</h2>
						<div class="text-box">
							<h5>details</h5>
							<p>It is a long established fact that a reader will be
								distracted by the readable content of a page when distribution
								of letters</p>
						</div>
						<div class="text-box">
							<h5>How it works</h5>
							<p>It is a long established fact that a reader will be
								distracted by the readable content of a page when distribution
								of letters</p>
						</div>
						<div class="btn-box">
							<a href=""> <img
								src="${initParam['basePath']}/assets/images/playstore.png"
								alt="">
							</a> <a href=""> <img
								src="${initParam['basePath']}/assets/images/appstore.png"
								alt="">
							</a>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="img-box">
						<img src="${initParam['basePath']}/assets/images/mobile.png"
							alt="">
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- end app section -->

	<!-- why section -->

	<section class="why_section layout_padding">
		<div class="container">
			<div class="heading_container">
				<h2>
					Why <br> Choose Us
				</h2>
			</div>
			<div class="why_container">
				<div class="box">
					<div class="img-box">
						<img
							src="${initParam['basePath']}/assets/images/delivery-man-white.png"
							alt="" class="img-1"> <img
							src="${initParam['basePath']}/assets/images/delivery-man-black.png"
							alt="" class="img-2">
					</div>
					<div class="detail-box">
						<h5>Best Drivers</h5>
						<p>It is a long established fact that a reader will be
							distracted by the readable content of a page when looking at its
						</p>
					</div>
				</div>
				<div class="box">
					<div class="img-box">
						<img
							src="${initParam['basePath']}/assets/images/shield-white.png"
							alt="" class="img-1"> <img
							src="${initParam['basePath']}/assets/images/shield-black.png"
							alt="" class="img-2">
					</div>
					<div class="detail-box">
						<h5>Safe and Secure</h5>
						<p>It is a long established fact that a reader will be
							distracted by the readable content of a page when looking at its
						</p>
					</div>
				</div>
				<div class="box">
					<div class="img-box">
						<img
							src="${initParam['basePath']}/assets/images/repairing-service-white.png"
							alt="" class="img-1"> <img
							src="${initParam['basePath']}/assets/images/repairing-service-black.png"
							alt="" class="img-2">
					</div>
					<div class="detail-box">
						<h5>24x7 support</h5>
						<p>It is a long established fact that a reader will be
							distracted by the readable content of a page when looking at its
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- end why section -->

	<!-- info section -->
	<jsp:include page="/views/layouts/info/index.jsp" />
	<!-- end info section -->

	<!-- footer section -->
	<jsp:include page="/views/layouts/footer/index.jsp" />
	<!-- footer section -->

	<script type="text/javascript"
		src="${initParam['basePath']}/assets/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript"
		src="${initParam['basePath']}/assets/js/bootstrap.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
		
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