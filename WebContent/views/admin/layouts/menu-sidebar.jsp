<nav id="sidebar" class="sidebar js-sidebar">
	<div class="sidebar-content js-simplebar">
		<a class="sidebar-brand" href="/GoCheeta/admin/dashboard"> <span
			class="align-middle"><span
				style="color: black; background: #FF0063; padding: 10px; border-radius: 5px; font-size: x-large;">
					GoCheeta <i class="fa-solid fa-taxi fa-xl" style="color: #fffa00;"></i>
			</span></span>
		</a>

		<ul class="sidebar-nav">

			<li class="sidebar-item active"><a class="sidebar-link"
				href="/GoCheeta/admin/dashboard"> <i class="align-middle"
					data-feather="sliders"></i> <span class="align-middle">Dashboard</span>
			</a></li>

			<li class="sidebar-item active"><a class="sidebar-link"
				href="/GoCheeta/admin/branches"> <i class="align-middle" data-feather=map-pin></i>
					<span class="align-middle">Branches</span>
			</a></li>

			<li class="sidebar-item active"><a class="sidebar-link"
				href="/GoCheeta/admin/bookings"> <i class="align-middle" data-feather="book"></i>
					<span class="align-middle">Bookings</span>
			</a></li>

			<li class="sidebar-item active"><a class="sidebar-link"
				href="/GoCheeta/admin/drivers"> <i class="align-middle" data-feather=users></i>
					<span class="align-middle">Drivers</span>
			</a></li>

			<li class="sidebar-item active"><a class="sidebar-link"
				href="/GoCheeta/admin/vehicle-types"> <i class="align-middle" data-feather=triangle></i>
					<span class="align-middle">Vehicles Types</span>
			</a></li>

			<li class="sidebar-item active"><a class="sidebar-link"
				href="/GoCheeta/admin/vehicles"> <i class="align-middle" data-feather=truck></i>
					<span class="align-middle">Vehicles</span>
			</a></li>

			<%
			if(session.getAttribute("adminUserRoleID") != null){
			int userRoleID = Integer.parseInt(session.getAttribute("adminUserRoleID").toString());
			System.out.println(userRoleID);
			if(userRoleID == 1){
			%>
			<li class="sidebar-item active"><a class="sidebar-link"
				href="/GoCheeta/admin/users"> <i class="align-middle" data-feather=award></i>
					<span class="align-middle">Admin Users</span>
			</a></li>
			<%} }%>

			<li class="sidebar-item active"><a class="sidebar-link"
				href="/GoCheeta/admin/reports"> <i class="align-middle"
					data-feather=bar-chart-2></i> <span class="align-middle">Reports</span>
			</a></li>

		</ul>

	</div>
</nav>