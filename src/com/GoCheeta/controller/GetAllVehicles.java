package com.GoCheeta.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GoCheeta.dao.DriversDAO;
import com.GoCheeta.dao.Vehicle_TypesDAO;
import com.GoCheeta.dao.VehiclesDAO;
import com.GoCheeta.model.Drivers;
import com.GoCheeta.model.Vehicle_Types;
import com.GoCheeta.model.Vehicles;

@WebServlet("/admin/vehicles")
public class GetAllVehicles extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private VehiclesDAO vehiclesDAO;
	private Vehicle_TypesDAO vehicle_TypesDAO;
	private DriversDAO driversDAO;

	public GetAllVehicles() {
		super();
	}

	public void init() {
		vehiclesDAO = new VehiclesDAO();
		vehicle_TypesDAO = new Vehicle_TypesDAO();
		driversDAO = new DriversDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String servletPath = request.getServletPath();
		// System.out.println(servletPath);
		try {
			listVehicles(request, response);

		} catch (Exception e) {
			System.out.println(e);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	private void listVehicles(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {

		int page = 1;
		int recordCount = 8;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		int startCount = (page * recordCount) - recordCount;

		List<Vehicles> listvehicles = vehiclesDAO.selectAllVehicles(startCount, recordCount);
		request.setAttribute("listvehicles", listvehicles);

		int vehiclesCount = vehiclesDAO.selectVehicleCount();
		request.setAttribute("vehiclesCount", vehiclesCount);

		List<Vehicle_Types> listvehicleTypes = vehicle_TypesDAO.selectAllVehicleTypes(0, 100);
		request.setAttribute("listvehicleTypes", listvehicleTypes);

		List<Drivers> listDrivers = driversDAO.selectAllDrivers(0, 100);
		request.setAttribute("listDrivers", listDrivers);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/admin/vehicles/index.jsp");
		dispatcher.forward(request, response);
	}

}
