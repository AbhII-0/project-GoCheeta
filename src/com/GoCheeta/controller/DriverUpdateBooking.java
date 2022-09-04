package com.GoCheeta.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GoCheeta.dao.BookingsDAO;

@WebServlet("/driver/my-bookings/update")
public class DriverUpdateBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookingsDAO bookingsDAO;

	public DriverUpdateBooking() {
		super();
	}

	public void init() {
		bookingsDAO = new BookingsDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String servletPath = request.getServletPath();
		System.out.println(servletPath);
		try {
			if (servletPath.equals("/driver/my-bookings/update")) {
				driverUpdateBooking(request, response);
			} else {
				System.out.println("servletPath Didn't Match");
			}

		} catch (Exception e) {
			System.out.println(e);
		}

	}

	private void driverUpdateBooking(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {

		int booking_id = Integer.parseInt(request.getParameter("bookingID"));

		if (request.getParameter("isBookingStart") != null) {

			System.out.println(request.getParameter("bookingVehicled"));
			System.out.println(request.getParameter("bookingID"));

			int vehicle_id = Integer.parseInt(request.getParameter("bookingVehicled"));

			bookingsDAO.driverStartBooking(vehicle_id, booking_id);

		}

		System.out.println(request.getParameter("isUserPick"));
		if (request.getParameter("isUserPick") != null) {
			bookingsDAO.driverPickUser(booking_id);
		}

		System.out.println(request.getParameter("isUserDrop"));
		if (request.getParameter("isUserDrop") != null) {
			bookingsDAO.driverDropUser(booking_id);
		}

		if (request.getParameter("isBookingCancel") != null) {

			String booking_cancel_reason = request.getParameter("bookingCancelNote");

			bookingsDAO.driverCancelBooking(booking_cancel_reason, booking_id);

		}

		response.sendRedirect("/GoCheeta/driver/my-bookings");
	}

}
