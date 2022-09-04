package com.GoCheeta.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GoCheeta.common.PW_DMD5_HASH;
import com.GoCheeta.dao.Admin_UsersDAO;
import com.GoCheeta.model.Admin_Users;

@WebServlet("/admin/users/add-new")
public class AddNewAdminUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private Admin_UsersDAO admin_UsersDAO;
	private PW_DMD5_HASH pwMd5HashObj;

	public AddNewAdminUser() {
		super();
	}

	public void init() {
		admin_UsersDAO = new Admin_UsersDAO();
		pwMd5HashObj = new PW_DMD5_HASH();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String servletPath = request.getServletPath();
		System.out.println(servletPath);
		try {
			if (servletPath.equals("/admin/users/add-new")) {
				addAdminUser(request, response);
			} else {
				System.out.println("servletPath Didn't Match");
			}

		} catch (Exception e) {
			System.out.println(e);
		}

	}

	private void addAdminUser(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, NoSuchAlgorithmException {

		String admin_user_name = request.getParameter("add-new-AdminUserName");
		String admin_user_email = request.getParameter("add-new-AdminUserMail");
		String admin_user_tp_number = request.getParameter("add-new-AdminUserTP");
		String admin_user_password = request.getParameter("add-new-AdminUserPassword");
		int admin_user_account_status = Integer.parseInt(request.getParameter("add-new-AdminUserStatus"));
		int user_roles_user_role_id = Integer.parseInt(request.getParameter("add-new-AdminUserRole"));
		int branches_branch_id = Integer.parseInt(request.getParameter("add-new-AdminUserBranch"));

		admin_user_password = pwMd5HashObj.md5PwdHash(admin_user_password);

		Admin_Users admin_Users = new Admin_Users(admin_user_name, admin_user_email, admin_user_tp_number,
				admin_user_password, admin_user_account_status, user_roles_user_role_id, branches_branch_id);

		admin_UsersDAO.insertAdminUsers(admin_Users);

		response.sendRedirect("/GoCheeta/admin/users");
	}

}
