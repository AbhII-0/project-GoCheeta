package com.GoCheeta.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GoCheeta.dao.VehiclesDAO;
import com.GoCheeta.model.Vehicles;

@WebServlet("/admin/vehicles/add-new")
public class AddNewVehicle extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private VehiclesDAO vehiclesDAO;

	public AddNewVehicle() {
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
			if (servletPath.equals("/admin/vehicles/add-new")) {
				addNewVehicle(request, response);
			} else {
				System.out.println("servletPath Didn't Match");
			}

		} catch (Exception e) {
			System.out.println(e);
		}

	}

	private void addNewVehicle(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {

		String vehicle_number = request.getParameter("add-new-vehicleNumber");
		String vehicle_description = request.getParameter("add-new-vehicleDescription");
		int vehicle_status = Integer.parseInt(request.getParameter("add-new-vehicleStatus"));
		int vehicle_types_vehicle_types_id = Integer.parseInt(request.getParameter("add-new-vehicleType"));
		int drivers_driver_id = Integer.parseInt(request.getParameter("add-new-vehicleDriver"));

		Vehicles vehicles = new Vehicles(vehicle_number, vehicle_description, vehicle_status,
				vehicle_types_vehicle_types_id, drivers_driver_id);
		vehiclesDAO.insertVehicle(vehicles);

		response.sendRedirect("/GoCheeta/admin/vehicles");
	}

}
