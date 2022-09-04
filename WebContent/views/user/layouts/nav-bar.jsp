<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<header class="header_section">
			<div class="container-fluid">
				<nav class="navbar navbar-expand-lg custom_nav-container ">
					<a class="navbar-brand" href="/GoCheeta/menu"> <span
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
									href="/GoCheeta/add-booking"><i class="fa-regular fa-square-plus"></i>
										ADD A BOOKING <span class="sr-only">(current)</span></a></li>
								<li class="nav-item"><a class="nav-link" href="/GoCheeta/my-bookings"><i
										class="fa-solid fa-clock-rotate-left"></i> MY BOOKINGS</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/GoCheeta/contact-us"><i class="fa-solid fa-headset"></i>
										Contact Us</a></li>
								<!--<li class="nav-item"><a class="nav-link" href="/GoCheeta/account"><i
										class="fa-solid fa-user-astronaut"></i> ACCOUNT</a></li>-->
								<li class="nav-item"><a class="nav-link" href="/GoCheeta/log-out"><i class="fa-solid fa-right-from-bracket"></i> LOG OUT</a></li>
							</ul>
						</div>
					</div>
				</nav>
			</div>
		</header>