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
import com.GoCheeta.dao.DriversDAO;
import com.GoCheeta.model.Branches;
import com.GoCheeta.model.Drivers;

@WebServlet("/admin/drivers")
public class GetAllDriversAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DriversDAO driversDAO;
	private BranchesDAO branchesDAO;

	public GetAllDriversAdmin() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void init() {
		driversDAO = new DriversDAO();
		branchesDAO = new BranchesDAO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String servletPath = request.getServletPath();

		try {
			listDrivers(request, response);

		} catch (Exception e) {
			System.out.println(e);
		}

	}

	private void listDrivers(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {

		int page = 1;
		int recordCount = 8;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		int startCount = (page * recordCount) - recordCount;

		List<Drivers> listDrivers = driversDAO.selectAllDrivers(startCount, recordCount);
		request.setAttribute("listDrivers", listDrivers);

		int driversCount = driversDAO.selectDriversCount();
		request.setAttribute("driversCount", driversCount);

		int pagebranch = 1;
		int recordCountBranch = 100;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		int startCountBranch = (pagebranch * recordCountBranch) - recordCountBranch;

		List<Branches> listBranches = branchesDAO.selectAllOnlineBranches(startCountBranch, recordCountBranch);
		request.setAttribute("listBranches", listBranches);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/admin/drivers/index.jsp");
		dispatcher.forward(request, response);
	}

}
