package com.GoCheeta.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.GoCheeta.dao.VehiclesDAO;
import com.GoCheeta.model.Vehicles;

@WebServlet("/driver/my-vehicles/update")
public class DriverUpdateVehicle extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private VehiclesDAO vehiclesDAO;

	public DriverUpdateVehicle() {
		super();
	}

	public void init() {
		vehiclesDAO = new VehiclesDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String servletPath = request.getServletPath();
		System.out.println(servletPath);
		try {
			if (servletPath.equals("/driver/my-vehicles/update")) {
				updateVehicle(request, response);
			} else {
				System.out.println("servletPath Didn't Match");
			}

		} catch (Exception e) {
			System.out.println(e);
		}

	}

	private void updateVehicle(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {

		HttpSession session = request.getSession();

		int driver_id = Integer.parseInt(session.getAttribute("driver_id").toString());

		int vehicle_id = Integer.parseInt(request.getParameter("edit-vehicleID"));
		String vehicle_number = request.getParameter("edit-vehicleNumber");
		String vehicle_description = request.getParameter("edit-vehicleDescription");
		int vehicle_status = Integer.parseInt(request.getParameter("edit-vehicleStatus"));
		int vehicle_types_vehicle_types_id = Integer.parseInt(request.getParameter("edit-vehicleType"));
		int drivers_driver_id = driver_id;

		Vehicles vehicles = new Vehicles(vehicle_id, vehicle_number, vehicle_description, vehicle_status,
				vehicle_types_vehicle_types_id, drivers_driver_id);
		vehiclesDAO.updateVehicle(vehicles);

		response.sendRedirect("/GoCheeta/driver/my-vehicles");
	}

}
