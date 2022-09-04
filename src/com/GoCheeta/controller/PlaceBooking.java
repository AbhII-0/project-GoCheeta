package com.GoCheeta.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.GoCheeta.dao.BookingsDAO;
import com.GoCheeta.model.Bookings;

@WebServlet("/add-booking/place")
public class PlaceBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookingsDAO bookingsDAO;

	public PlaceBooking() {
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
			if (servletPath.equals("/add-booking/place")) {
				placeBooking(request, response);
			} else {
				System.out.println("servletPath Didn't Match");
			}

		} catch (Exception e) {
			System.out.println(e);
		}

	}

	private void placeBooking(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {

		HttpSession session = request.getSession();

		int vehicle_types_vehicle_types_id = Integer.parseInt(request.getParameter("booking-vehicle-type"));
		System.out.println(vehicle_types_vehicle_types_id);
		String booking_start_location = request.getParameter("booking-pickUpLocation");
		System.out.println(booking_start_location);
		String booking_start_location_cordinate = request.getParameter("booking-pickUpLocationCoordinates");
		System.out.println(booking_start_location_cordinate);
		String booking_end_location = request.getParameter("booking-dropLocation");
		System.out.println(booking_end_location);
		String booking_endt_location_cordinate = request.getParameter("booking-dropLocationCoordinates");
		System.out.println(booking_endt_location_cordinate);
		System.out.println(request.getParameter("booking-bookingCharge"));
		double bookin_charge = Double.parseDouble(request.getParameter("booking-bookingCharge"));
		double bookin_Dis = Double.parseDouble(request.getParameter("booking-bookingDistance"));
		System.out.println(bookin_Dis);
		String booking_status = "PENDING";
		System.out.println(booking_status);
		int users_user_id = Integer.parseInt(session.getAttribute("userId").toString());
		System.out.println(users_user_id);
		String booking_name = booking_start_location;
		System.out.println(booking_name);

		Bookings bookings = new Bookings(booking_name, booking_start_location, booking_start_location_cordinate,
				booking_end_location, booking_endt_location_cordinate, bookin_charge, booking_status, users_user_id,
				vehicle_types_vehicle_types_id);

		bookingsDAO.addBookingUser(bookings);

		response.sendRedirect("/GoCheeta/my-bookings");
	}

}
