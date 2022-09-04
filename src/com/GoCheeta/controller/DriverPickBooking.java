package com.GoCheeta.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GoCheeta.dao.BookingsDAO;
import com.GoCheeta.dao.Vehicle_TypesDAO;
import com.GoCheeta.model.Bookings;
import com.GoCheeta.model.Vehicle_Types;

@WebServlet("/driver/select-bookings")
public class DriverPickBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookingsDAO bookingsDAO;
	private Vehicle_TypesDAO vehicle_TypesDAO;

	public DriverPickBooking() {
		super();
	}

	public void init() {
		bookingsDAO = new BookingsDAO();
		vehicle_TypesDAO = new Vehicle_TypesDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String servletPath = request.getServletPath();
		// System.out.println(servletPath);
		try {
			listBookings(request, response);

		} catch (Exception e) {
			System.out.println(e);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	private void listBookings(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {

		int page = 1;
		int recordCount = 8;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		int startCount = (page * recordCount) - recordCount;

		List<Bookings> bookings = bookingsDAO.selectAllBookingsDriverNull(startCount, recordCount);
		request.setAttribute("bookings", bookings);

		List<Vehicle_Types> listvehicleTypes = vehicle_TypesDAO.selectAllVehicleTypes(startCount, recordCount);
		request.setAttribute("listvehicleTypes", listvehicleTypes);

		int bookingsCount = bookingsDAO.selectBookingCountDriverNull();
		request.setAttribute("bookingsCount", bookingsCount);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/driver/select-booking/index.jsp");
		dispatcher.forward(request, response);
	}

}
