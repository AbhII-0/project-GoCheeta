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

@WebServlet("/admin/reports/search")
public class AminReportsPost extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BranchesDAO branchesDAO;

	public AminReportsPost() {
		super();

	}

	public void init() {
		branchesDAO = new BranchesDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String servletPath = request.getServletPath();
		System.out.println(servletPath);
		try {

			if (servletPath.equals("/admin/reports/search")) {
				sendData(request, response);

			} else {
				System.out.println("Servlet Path Missmatch...!");
			}

		} catch (Exception e) {
			System.out.println(e);
		}

	}

	private void sendData(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {

		String toDayString = java.time.LocalDate.now().toString();

		String fromDate = null;
		String toDate = null;

		if ((request.getParameter("fromDate") == null) || (request.getParameter("toDate") == null)) {
			if (request.getParameter("fromDate") == null) {
				fromDate = toDayString;
			}
			if (request.getParameter("toDate") == null) {
				toDate = toDayString;
			}
		} else {
			fromDate = request.getParameter("fromDate");
			toDate = request.getParameter("toDate");
		}

		System.out.println(toDayString);

		List<Branches> listBranches = branchesDAO.selectAllBranches(0, 100);
		request.setAttribute("listBranches", listBranches);

		List<Branches> branchesRev = branchesDAO.getBranchRev(fromDate, toDate);
		request.setAttribute("branchesRev", branchesRev);

		request.setAttribute("fromDate", fromDate);
		request.setAttribute("toDate", toDate);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/admin/reports/index.jsp");
		dispatcher.forward(request, response);
	}

}
