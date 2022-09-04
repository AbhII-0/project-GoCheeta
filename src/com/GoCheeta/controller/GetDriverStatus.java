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

import com.GoCheeta.dao.DriversDAO;

@WebServlet("/driver/get-status")
public class GetDriverStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DriversDAO driversDAO;

	public GetDriverStatus() {
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
			getDriverStatus(request, response);

		} catch (Exception e) {
			System.out.println(e);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	private void getDriverStatus(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {

		HttpSession session = request.getSession();

		if (session.getAttribute("driver_id") != null) {
			int driver_id = Integer.parseInt(session.getAttribute("driver_id").toString());

			String driver_status = null;

			driver_status = driversDAO.getDriverStatus(driver_id);
			// response.sendRedirect("/GoCheeta/driver/dashboard");

			if (driver_status != null) {

				String jsonResponse = "{\"driver_status\": \"" + driver_status + "\", \"statusNew\": true}";
				System.out.println(jsonResponse);
				PrintWriter out = response.getWriter();
				out.println(jsonResponse);
				response.flushBuffer();
				out.flush();
				out.close();

			} else {
				String jsonResponse = "{\"statusNew\": false }";
				System.out.println(jsonResponse);
				PrintWriter out = response.getWriter();
				out.println(jsonResponse);
				response.flushBuffer();
				out.flush();
				out.close();
			}

		}

	}

}
