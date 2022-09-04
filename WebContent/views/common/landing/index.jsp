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
</head>

<body>

	<div class="hero_area">
		<!-- header section strats -->
		<header class="header_section">
			<div class="container-fluid">
				<nav class="navbar navbar-expand-lg custom_nav-container ">
					<a class="navbar-brand" href="/GoCheeta/common/landing"> <span
						style="color: black; background: #FF0063; padding: 10px; border-radius: 5px;">
							GoCheeta <i class="fa-solid fa-taxi fa-xl"
							style="color: #fffa00;"></i>
					</span>
					</a>
				</nav>
			</div>
		</header>
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

					<div class="col-lg-4 col-md-7 landing-des-div" style="margin-left: 100px">

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
							<a href="/GoCheeta/common/sign-in" class="btn-1-cus"> SIGN IN </a>
						</div>

						<div class="btn-box-cus">
							<a href="/GoCheeta/common/register" class="btn-1-cus"> SIGN UP </a>
						</div>

						<div class="btn-box-cus" >
							<a href="/GoCheeta/common/home" class="btn-1-cus" style="width: 200px"> TAKE A LOOK </a>
						</div>

					</div>

				</div>
			</div>

		</section>
		<!-- end slider section -->
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