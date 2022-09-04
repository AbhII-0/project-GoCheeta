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

@WebServlet("/admin/users/update")
public class UpdateAdminUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Admin_UsersDAO admin_UsersDAO;
	private PW_DMD5_HASH pwMd5HashObj;

	public UpdateAdminUser() {
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
			if (servletPath.equals("/admin/users/update")) {
				updateAdminUser(request, response);
			} else {
				System.out.println("servletPath Didn't Match");
			}

		} catch (Exception e) {
			System.out.println(e);
		}

	}

	private void updateAdminUser(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, NoSuchAlgorithmException {

		int admin_user_id = Integer.parseInt(request.getParameter("edit-adminUserID"));
		String admin_user_name = request.getParameter("edit-adminUserName");
		String admin_user_email = request.getParameter("edit-adminUserMail");
		String admin_user_tp_number = request.getParameter("edit-adminUserTP");
		String admin_user_password = request.getParameter("edit-adminUserPassword");
		int admin_user_account_status = Integer.parseInt(request.getParameter("edit-adminUserStatus"));
		int user_roles_user_role_id = Integer.parseInt(request.getParameter("edit-adminUserRole"));
		int branches_branch_id = Integer.parseInt(request.getParameter("edit-adminUserBranch"));

		Admin_Users admin_Users;

		if (admin_user_password.equals("")) {
			admin_Users = new Admin_Users(admin_user_id, admin_user_name, admin_user_email, admin_user_tp_number,
					admin_user_account_status, user_roles_user_role_id, branches_branch_id);
			admin_UsersDAO.updateAdminUsersWithOutPW(admin_Users);
			System.out.println(user_roles_user_role_id);
		} else {

			admin_user_password = pwMd5HashObj.md5PwdHash(admin_user_password);

			admin_Users = new Admin_Users(admin_user_id, admin_user_name, admin_user_email, admin_user_tp_number,
					admin_user_password, admin_user_account_status, user_roles_user_role_id, branches_branch_id);
			admin_UsersDAO.updateAdminUsers(admin_Users);
			System.out.println(user_roles_user_role_id);
		}

		response.sendRedirect("/GoCheeta/admin/users");
	}

}
