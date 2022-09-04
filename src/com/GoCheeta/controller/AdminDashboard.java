package com.GoCheeta.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GoCheeta.dao.BookingsDAO;
import com.GoCheeta.dao.DriversDAO;
import com.GoCheeta.dao.VehiclesDAO;

/**
 * Servlet implementation class AdminDashboard
 */
@WebServlet("/admin/dashboard")
public class AdminDashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookingsDAO bookingsDAO;
	private VehiclesDAO vehiclesDAO;
	private DriversDAO driversDAO;

	public AdminDashboard() {
		super();
	}

	public void init() {
		bookingsDAO = new BookingsDAO();
		vehiclesDAO = new VehiclesDAO();
		driversDAO = new DriversDAO();
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

	private void sendDashboardData(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {

		int bookingsCount = bookingsDAO.selectBookingCount();
		request.setAttribute("bookingsCount", bookingsCount);

		double rev = bookingsDAO.selectRev();
		request.setAttribute("rev", rev);

		int vehiclesCount = vehiclesDAO.selectVehicleCount();
		request.setAttribute("vehiclesCount", vehiclesCount);

		int driversCount = driversDAO.selectDriversCount();
		request.setAttribute("driversCount", driversCount);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/admin/dashboard/index.jsp");
		dispatcher.forward(request, response);
	}

}
