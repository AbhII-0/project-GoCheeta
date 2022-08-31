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
import com.GoCheeta.model.Branches;

@WebServlet("/admin/branches")
public class BranchesServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BranchesDAO branchesDAO;

	public BranchesServelet() {
		super();
	}

	public void init() {
		branchesDAO = new BranchesDAO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String servletPath = request.getServletPath();
		// System.out.println(servletPath);
		try {
			// if (servletPath.equals("/admin/branches")) {
			listBranches(request, response);
			// } else {
			// System.out.println("servletPath Didn't Match");
			// }

		} catch (Exception e) {
			System.out.println(e);
		}

	}

	private void listBranches(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {

		int page = 1;
		int recordCount = 8;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		int startCount = (page * recordCount) - recordCount;

		List<Branches> listBranches = branchesDAO.selectAllBranches(startCount, recordCount);
		request.setAttribute("listBranches", listBranches);

		int branchCount = branchesDAO.selectBranchCount();
		request.setAttribute("branchCount", branchCount);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/admin/branches/index.jsp");
		dispatcher.forward(request, response);
	}

}
