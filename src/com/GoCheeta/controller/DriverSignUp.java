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

@WebServlet("/driver/sign-up")
public class DriverSignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BranchesDAO branchesDAO;

	public DriverSignUp() {
		super();
	}

	public void init() {
		branchesDAO = new BranchesDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String servletPath = request.getServletPath();

		try {
			senDataToSignUp(request, response);

		} catch (Exception e) {
			System.out.println(e);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	private void senDataToSignUp(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {

		List<Branches> listBranches = branchesDAO.selectAllOnlineBranches(0, 1000);
		request.setAttribute("listBranches", listBranches);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/driver/sign-up/index.jsp");
		dispatcher.forward(request, response);

	}

}
