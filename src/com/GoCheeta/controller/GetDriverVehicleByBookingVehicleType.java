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
import javax.servlet.http.HttpSession;

import com.GoCheeta.dao.VehiclesDAO;
import com.GoCheeta.model.Vehicles;

@WebServlet("/driver/my-bookings/my-vehivles")
public class GetDriverVehicleByBookingVehicleType extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private VehiclesDAO vehiclesDAO;

	public GetDriverVehicleByBookingVehicleType() {
		super();
	}

	public void init() {
		vehiclesDAO = new VehiclesDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String servletPath = request.getServletPath();

		try {
			getVehiclesByBooking(request, response);

		} catch (Exception e) {
			System.out.println(e);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	private void getVehiclesByBooking(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {

		response.setContentType("application/json");
		response.setStatus(HttpServletResponse.SC_OK);

		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("Access-Control-Request-Method", "GET");

		if (request.getParameter("v-id") != null) {

			int vehicle_types_id = Integer.parseInt(request.getParameter("v-id"));

			int driver_id = -1;

			HttpSession session = request.getSession();
			if (session.getAttribute("driver_id") != null) {
				driver_id = Integer.parseInt(session.getAttribute("driver_id").toString());
			}

			List<Vehicles> vehicles = vehiclesDAO.selectVehiclesByDriver(driver_id, vehicle_types_id);

			if (vehicles.size() > 0) {

				String jsonObject = "{\"vehicleList\":[";

				for (int i = 0; i < vehicles.size(); i++) {

					int vehicle_id = vehicles.get(i).getVehicle_id();
					String vehicle_number = vehicles.get(i).getVehicle_number();

					String jsonResponse = "{\"vehicle_id\": " + vehicle_id + ", \"vehicle_number\": \"" + vehicle_number
							+ "\"}";
					String coma = "";
					if (i == vehicles.size() - 1) {
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

}
