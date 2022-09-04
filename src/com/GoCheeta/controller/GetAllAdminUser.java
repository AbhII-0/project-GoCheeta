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

import com.GoCheeta.dao.Admin_UsersDAO;
import com.GoCheeta.dao.BranchesDAO;
import com.GoCheeta.dao.User_RolesDAO;
import com.GoCheeta.model.Admin_Users;
import com.GoCheeta.model.Branches;
import com.GoCheeta.model.User_Roles;

@WebServlet("/admin/users")
public class GetAllAdminUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Admin_UsersDAO admin_UsersDAO;
	BranchesDAO branchesDAO;
	User_RolesDAO user_RolesDAO;

	public GetAllAdminUser() {
		super();
	}

	public void init() {
		admin_UsersDAO = new Admin_UsersDAO();
		branchesDAO = new BranchesDAO();
		user_RolesDAO = new User_RolesDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String servletPath = request.getServletPath();
		// System.out.println(servletPath);
		try {
			listUsers(request, response);

		} catch (Exception e) {
			System.out.println(e);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	private void listUsers(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {

		int page = 1;
		int recordCount = 8;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		int startCount = (page * recordCount) - recordCount;

		List<Admin_Users> adminUsersList = admin_UsersDAO.selectAllAdminUsers(startCount, recordCount);
		request.setAttribute("adminUsersList", adminUsersList);

		int adminUsersCount = admin_UsersDAO.selectAdminUsersCount();
		request.setAttribute("adminUsersCount", adminUsersCount);

		List<Branches> listBranches = branchesDAO.selectAllOnlineBranches(0, 100);
		request.setAttribute("listBranches", listBranches);

		List<User_Roles> user_Roles = user_RolesDAO.selectAllUserRoles();
		request.setAttribute("user_Roles", user_Roles);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/admin/users/index.jsp");
		dispatcher.forward(request, response);

	}

}
