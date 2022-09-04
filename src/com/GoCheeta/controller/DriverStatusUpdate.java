package com.GoCheeta.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.GoCheeta.dao.DriversDAO;

@WebServlet("/driver/status-update")
public class DriverStatusUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DriversDAO driversDAO;

	public DriverStatusUpdate() {
		super();
	}

	public void init() {
		driversDAO = new DriversDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String servletPath = request.getServletPath();
		// System.out.println(servletPath);
		try {
			updateDriverStatus(request, response);

		} catch (Exception e) {
			System.out.println(e);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	private void updateDriverStatus(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {

		HttpSession session = request.getSession();

		if (session.getAttribute("driver_id") != null) {
			int driver_id = Integer.parseInt(session.getAttribute("driver_id").toString());

			String status = request.getParameter("d-status");

			System.out.println(status);

			driversDAO.updateDriverStatus(status, driver_id);
			response.sendRedirect("/GoCheeta/driver/dashboard");

		}

	}

}
