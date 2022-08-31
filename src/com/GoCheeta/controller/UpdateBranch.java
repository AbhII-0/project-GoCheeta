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

/**
 * Servlet implementation class UpdateBranch
 */
@WebServlet("/admin/branches/update-branch")
public class UpdateBranch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private BranchesDAO branchesDAO;

	public UpdateBranch() {
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
			if (servletPath.equals("/admin/branches/update-branch")) {
				updateBranch(request, response);
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

	private void updateBranch(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {

		int branch_id = Integer.parseInt(request.getParameter("edit-branch-id"));
		String branch_name = request.getParameter("edit-branch-name");
		String branch_loaction = request.getParameter("edit-branch-location");
		String brancheCordinate = request.getParameter("edit-branch-cordinate");
		int branche_status = Integer.parseInt(request.getParameter("edit-branch-status"));

		Branches branches = new Branches(branch_id, branch_name, branch_loaction, brancheCordinate, branche_status);
		branchesDAO.updateBranches(branches);

		response.sendRedirect("/GoCheeta/admin/branches");
	}

}
