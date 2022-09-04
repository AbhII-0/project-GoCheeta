package com.GoCheeta.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GoCheeta.dao.BookingsDAO;
import com.GoCheeta.model.Bookings;

@WebServlet("/admin/dashboard/get-chart-data")
public class AdminGetDashboardChartData extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookingsDAO bookingsDAO;

	public AdminGetDashboardChartData() {
		super();
	}

	public void init() {
		bookingsDAO = new BookingsDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String servletPath = request.getServletPath();

		try {
			sendDriverChartData(request, response);

		} catch (Exception e) {
			System.out.println(e);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	private void sendDriverChartData(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {

		response.setContentType("application/json");
		response.setStatus(HttpServletResponse.SC_OK);

		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("Access-Control-Request-Method", "GET");

		List<Bookings> bookings = bookingsDAO.selectMnthRev();

		if (bookings.size() > 0) {

			String jsonObject = "{\"monthsRev\":[";

			for (int i = 0; i < bookings.size(); i++) {

				int mnth = bookings.get(i).getMnth();
				Double rev = bookings.get(i).getRev();

				String jsonResponse = "{\"mnth\": " + mnth + ", \"rev\": " + rev + "}";
				String coma = "";
				if (i == bookings.size() - 1) {
					coma = "";
				} else {
					coma = ",";
				}
				jsonObject = jsonObject + jsonResponse + coma;

			}
			jsonObject = jsonObject + "],\"status\": true}";

			System.out.println(jsonObject);
			PrintWriter out = response.getWriter();
			out.println(jsonObject);
			response.flushBuffer();
			out.flush();
			out.close();

		} else {
			String jsonResponse = "{\"status\": false }";
			System.out.println(jsonResponse);
			PrintWriter out = response.getWriter();
			out.println(jsonResponse);
			response.flushBuffer();
			out.flush();
			out.close();
		}
	}

}
