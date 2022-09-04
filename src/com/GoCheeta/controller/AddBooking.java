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

import com.GoCheeta.dao.BranchesDAO;
import com.GoCheeta.dao.Vehicle_TypesDAO;
import com.GoCheeta.model.Branches;
import com.GoCheeta.model.Vehicle_Types;

@WebServlet("/add-booking")
public class AddBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Vehicle_TypesDAO vehicle_TypesDAO;
	private BranchesDAO branchesDAO;

	public AddBooking() {
		super();

	}

	public void init() {
		vehicle_TypesDAO = new Vehicle_TypesDAO();
		branchesDAO = new BranchesDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String servletPath = request.getServletPath();
		// System.out.println(servletPath);
		try {
			sendDataToAddBooking(request, response);

		} catch (Exception e) {
			System.out.println(e);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	private void sendDataToAddBooking(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {

		int recordCount = 100;

		int startCount = 0;

		List<Vehicle_Types> listvehicleTypes = vehicle_TypesDAO.selectAllOnlineVehicleTypes(startCount, recordCount);
		request.setAttribute("listvehicleTypes", listvehicleTypes);

		List<Branches> listBranches = branchesDAO.selectAllOnlineBranches(startCount, recordCount);
		request.setAttribute("listBranches", listBranches);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/user/add-booking/index.jsp");
		dispatcher.forward(request, response);
	}

}
