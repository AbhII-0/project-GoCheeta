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

@WebServlet("/admin/vehicle-types/add-new")
public class AddNewVehicleType extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Vehicle_TypesDAO vehicle_TypesDAO;

	public AddNewVehicleType() {
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
			if (servletPath.equals("/admin/vehicle-types/add-new")) {
				addNewVehiclesType(request, response);
			} else {
				System.out.println("servletPath Didn't Match");
			}

		} catch (Exception e) {
			System.out.println(e);
		}

	}

	private void addNewVehiclesType(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {

		String vehicle_type = request.getParameter("add-new-VehiclesType");
		Double vehicle_type_price = Double.parseDouble(request.getParameter("add-new-VehiclesTypePrice"));
		int vehicle_type_status = Integer.parseInt(request.getParameter("add-new-VehiclesTypeStatus"));

		Vehicle_Types vehicle_Types = new Vehicle_Types(vehicle_type, vehicle_type_price, vehicle_type_status);
		vehicle_TypesDAO.insertVehicleTypes(vehicle_Types);

		System.out.println(vehicle_type_status);

		response.sendRedirect("/GoCheeta/admin/vehicle-types");
	}

}
