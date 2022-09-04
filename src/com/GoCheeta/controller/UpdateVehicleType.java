package com.GoCheeta.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GoCheeta.dao.Vehicle_TypesDAO;
import com.GoCheeta.model.Vehicle_Types;

@WebServlet("/admin/vehicle-types/update")
public class UpdateVehicleType extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Vehicle_TypesDAO vehicle_TypesDAO;

	public UpdateVehicleType() {
		super();
	}

	public void init() {
		vehicle_TypesDAO = new Vehicle_TypesDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String servletPath = request.getServletPath();
		System.out.println(servletPath);
		try {
			if (servletPath.equals("/admin/vehicle-types/update")) {
				updateVehicleType(request, response);
			} else {
				System.out.println("servletPath Didn't Match");
			}

		} catch (Exception e) {
			System.out.println(e);
		}

	}

	private void updateVehicleType(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {

		int vehicle_types_id = Integer.parseInt(request.getParameter("edit-vehicleTypeID"));
		String vehicle_type = request.getParameter("edit-vehicleType");
		Double vehicle_type_price = Double.parseDouble(request.getParameter("edit-vehicleTypePrice"));
		int vehicle_type_status = Integer.parseInt(request.getParameter("edit-vehicleTypeStatus"));

		Vehicle_Types vehicle_Types = new Vehicle_Types(vehicle_types_id, vehicle_type, vehicle_type_price,
				vehicle_type_status);
		vehicle_TypesDAO.updateVehicleTypes(vehicle_Types);

		System.out.println(vehicle_type_status);
		response.sendRedirect("/GoCheeta/admin/vehicle-types");
	}

}
