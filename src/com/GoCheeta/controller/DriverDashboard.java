package com.GoCheeta.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.GoCheeta.dao.BookingsDAO;
import com.GoCheeta.dao.VehiclesDAO;

@WebServlet("/driver/dashboard")
public class DriverDashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookingsDAO bookingsDAO;
	private VehiclesDAO vehiclesDAO;

	public DriverDashboard() {
		super();
	}

	public void init() {
		bookingsDAO = new BookingsDAO();
		vehiclesDAO = new VehiclesDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String servletPath = request.getServletPath();
		// System.out.println(servletPath);
		try {
			sendDashboardData(request, response);
		} catch (Exception e) {
			System.out.println(e);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void sendDashboardData(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {

		int driver_id = -1;

		HttpSession session = request.getSession();
		if (session.getAttribute("driver_id") != null) {
			driver_id = Integer.parseInt(session.getAttribute("driver_id").toString());
		}

		int bookingsCount = bookingsDAO.selectBookingCountByDriver(driver_id);
		request.setAttribute("bookingsCount", bookingsCount);

		double rev = bookingsDAO.selectDriverRev(driver_id);
		request.setAttribute("rev", rev);

		int vehiclesCount = vehiclesDAO.selectVehicleCountByDriver(driver_id);
		request.setAttribute("vehiclesCount", vehiclesCount);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/driver/dashboard/index.jsp");
		dispatcher.forward(request, response);
	}

}
