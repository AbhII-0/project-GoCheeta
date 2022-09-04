package com.GoCheeta.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.GoCheeta.dao.BookingsDAO;

@WebServlet("/driver/select-bookings/pick")
public class DriverSelectBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookingsDAO bookingsDAO;

	public DriverSelectBooking() {
		super();
	}

	public void init() {
		bookingsDAO = new BookingsDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String servletPath = request.getServletPath();
		// System.out.println(servletPath);
		try {
			driverSelectBookings(request, response);

		} catch (Exception e) {
			System.out.println(e);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	private void driverSelectBookings(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {

		HttpSession session = request.getSession();

		int booking_id = Integer.parseInt(request.getParameter("b-id"));
		int drivers_driver_id = Integer.parseInt(session.getAttribute("driver_id").toString());
		int vehicle_types_vehicle_types_id = Integer.parseInt(request.getParameter("vt-id"));

		if (bookingsDAO.findDriverHaveVehiclesr(vehicle_types_vehicle_types_id, drivers_driver_id)) {
			bookingsDAO.driverPickBooking(drivers_driver_id, booking_id);

			response.sendRedirect("/GoCheeta/driver/my-bookings");
		} else {
			System.out.println("No Vehicles");

			PrintWriter out = response.getWriter();

			out.println("<script type=\"text/javascript\">");
			out.println("alert('You Don\\'t Have This Type Vehicles...! Try Another One');");
			out.println("location='/GoCheeta/driver/select-bookings';");
			out.println("</script>");
			// response.sendRedirect("/GoCheeta/driver/select-bookings");
		}

	}

}
