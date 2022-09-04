<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav class="navbar navbar-expand navbar-light navbar-bg">
				<a class="sidebar-toggle js-sidebar-toggle"> <i
					class="hamburger align-self-center"></i>
				</a>

				<div class="navbar-collapse collapse">
					<ul class="navbar-nav navbar-align">
						
						<li class="nav-item dropdown"><a
							class="nav-icon dropdown-toggle" href="#" id="messagesDropdown"
							data-bs-toggle="dropdown">
								<div class="position-relative">
									<i id="driverStatusIcon" class="fa-solid" style="padding: 2px;border-radius: 20px;"></i>
								</div>
						</a>
							<div
								class="dropdown-menu dropdown-menu-lg dropdown-menu-end py-0"
								aria-labelledby="messagesDropdown">
								<div class="dropdown-menu-header">
									<div class="position-relative">STATUS</div>
								</div>
								<div class="list-group">
									<a href="/GoCheeta/driver/status-update?d-status=ONLINE" class="list-group-item">
										<div class="row g-0 align-items-center">
											<div class="col-2">
												<i class="fa-solid fa-circle fa-2x" style="background-color: black;color: #00ff0a;padding: 2px;border-radius: 20px;"></i>
											</div>
											<div class="col-10 ps-2">
												<div class="text-dark">ONLINE</div>
											</div>
										</div>
									</a> 
									<a href="/GoCheeta/driver/status-update?d-status=IDLE" class="list-group-item">
										<div class="row g-0 align-items-center">
											<div class="col-2">
												<i class="fa-solid fa-moon fa-2x" style="background: black;color: yellow;padding: 3px;border-radius: 20px;"></i>
											</div>
											<div class="col-10 ps-2">
												<div class="text-dark">IDLE</div>
											</div>
										</div>
									</a> 
									<a href="/GoCheeta/driver/status-update?d-status=BUSY" class="list-group-item">
										<div class="row g-0 align-items-center">
											<div class="col-2">
												<i class="fa-solid fa-ban fa-2x" style="background: #e91e63;padding: 3px;border-radius: 20px;"></i>
											</div>
											<div class="col-10 ps-2">
												<div class="text-dark">BUSY</div>
											</div>
										</div>
									</a> 
									<a href="/GoCheeta/driver/status-update?d-status=OFFLINE" class="list-group-item">
										<div class="row g-0 align-items-center">
											<div class="col-2">
												<i class="fa-solid fa-circle fa-2x" style="background-color: black;color: #9e9e9e;padding: 2px;border-radius: 20px;"></i>
											</div>
											<div class="col-10 ps-2">
												<div class="text-dark">OFFLINE</div>
											</div>
										</div>
									</a> 
								</div>
							</div></li>
						<li class="nav-item dropdown"><a
							class="nav-icon dropdown-toggle d-inline-block d-sm-none"
							href="#" data-bs-toggle="dropdown"> <i class="align-middle"
								data-feather="settings"></i>
						</a> <a class="nav-link dropdown-toggle d-none d-sm-inline-block"
							href="#" data-bs-toggle="dropdown"> <img
								src="${initParam['basePath']}/assets/admin-kit/img/avatars/avatar.jpg"
								class="avatar img-fluid rounded me-1" alt="Charles Hall" /> <span
								class="text-dark"><c:out value='${sessionScope.driver_user_name}' /></span>
						</a>
							<div class="dropdown-menu dropdown-menu-end">
								<!--<a class="dropdown-item" href="pages-profile.html"><i
									class="align-middle me-1" data-feather="user"></i> Profile</a>-->
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="/GoCheeta/driver/log-out">Log out</a>
							</div></li>
					</ul>
				</div>
			</nav>

			