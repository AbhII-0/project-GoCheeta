<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String servletPath = request.getServletPath();
//System.out.println(servletPath);
%>

<nav id="sidebar" class="sidebar js-sidebar">
			<div class="sidebar-content js-simplebar">
				<a class="sidebar-brand" href="/GoCheeta/driver/dashboard"> <span
					class="align-middle"><span
						style="color: black; background: #FF0063; padding: 10px; border-radius: 5px; font-size: x-large;">
							GoCheeta <i class="fa-solid fa-taxi fa-xl"
							style="color: #fffa00;"></i>
					</span></span>
				</a>

				<ul class="sidebar-nav">
				
					<li class="sidebar-item <%if(servletPath.equals("/views/driver/dashboard/index.jsp")){ %>active<%}%>">"><a class="sidebar-link"
						href="/GoCheeta/driver/dashboard"> <i class="align-middle"
							data-feather="sliders"></i> <span class="align-middle">Dashboard</span>
					</a></li>
					
					<li class="sidebar-item <%if(servletPath.equals("/views/driver/select-booking/index.jsp")){ %>active<%}%>">"><a class="sidebar-link"
						href="/GoCheeta/driver/select-bookings"> <i class="align-middle"
							data-feather="send"></i> <span class="align-middle">Select Bookings</span>
					</a></li>
					
					<li class="sidebar-item <%if(servletPath.equals("/views/driver/my-bookings/index.jsp")){ %>active<%}%>">"><a class="sidebar-link"
						href="/GoCheeta/driver/my-bookings"> <i class="align-middle"
							data-feather="book"></i> <span class="align-middle">My Bookings</span>
					</a></li>
					
					<li class="sidebar-item <%if(servletPath.equals("/views/driver/my-vehicles/index.jsp")){ %>active<%}%>">"><a class="sidebar-link"
						href="/GoCheeta/driver/my-vehicles"> <i class="align-middle"
							data-feather=truck></i> <span class="align-middle">My Vehicles</span>
					</a></li>

				</ul>

			</div>
		</nav>