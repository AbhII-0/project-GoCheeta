package com.GoCheeta.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GoCheeta.dao.BranchesDAO;
import com.GoCheeta.model.Branches;

@WebServlet("/admin/branches/add-new")
public class AddNewBranch extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BranchesDAO branchesDAO;

	public AddNewBranch() {
		super();
	}

	public void init() {
		branchesDAO = new BranchesDAO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String servletPath = request.getServletPath();
		System.out.println(servletPath);
		try {
			if (servletPath.equals("/admin/branches/add-new")) {
				addNewBranch(request, response);
			} else {
				System.out.println("servletPath Didn't Match");
			}

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	private void addNewBranch(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		String branch_name = request.getParameter("add-new-branch-name");
		String branch_loaction = request.getParameter("add-new-branch-loaction");
		String brancheCordinate = request.getParameter("add-new-branch-cordinate");
		int branche_status = Integer.parseInt(request.getParameter("add-new-branch-status"));

		Branches branches = new Branches(branch_name, branch_loaction, brancheCordinate, branche_status);
		branchesDAO.insertBranche(branches);
		// System.out.println(branch_name);
		// System.out.println(branch_loaction);
		// System.out.println(brancheCordinate);

		response.sendRedirect("/GoCheeta/admin/branches");
	}

}
