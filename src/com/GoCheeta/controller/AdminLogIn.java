package com.GoCheeta.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.GoCheeta.common.PW_DMD5_HASH;
import com.GoCheeta.dao.Admin_UsersDAO;
import com.GoCheeta.model.Admin_Users;

@WebServlet("/admin/signIn/")
public class AdminLogIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Admin_UsersDAO admin_UsersDAO;
	private PW_DMD5_HASH pw_DMD5_HASH = new PW_DMD5_HASH();

	public AdminLogIn() {
		super();
	}

	public void init() {
		admin_UsersDAO = new Admin_UsersDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			logingAccount(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void logingAccount(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException, NoSuchAlgorithmException {

		boolean accHave = false;

		String admin_user_name = request.getParameter("userName");
		String admin_user_password = request.getParameter("password");

		admin_user_password = pw_DMD5_HASH.md5PwdHash(admin_user_password);

		Admin_Users admin_Users = new Admin_Users(admin_user_name, admin_user_password);
		accHave = admin_UsersDAO.findAdminUser(admin_Users);

		if (accHave) {

			List<Admin_Users> admin_UserDetails = admin_UsersDAO.selectAdminUser(admin_Users);

			HttpSession session = request.getSession();
			session.setAttribute("adminUserId", admin_UserDetails.get(0).getAdmin_user_id());
			session.setAttribute("adminUserName", admin_UserDetails.get(0).getAdmin_user_name());
			session.setAttribute("adminUserTP", admin_UserDetails.get(0).getAdmin_user_tp_number());
			session.setAttribute("adminUserMail", admin_UserDetails.get(0).getAdmin_user_email());
			session.setAttribute("adminUserStatus", admin_UserDetails.get(0).getAdmin_user_account_status());
			session.setAttribute("adminUserRoleID", admin_UserDetails.get(0).getUser_roles_user_role_id());
			session.setAttribute("adminUserBranchID", admin_UserDetails.get(0).getBranches_branch_id());

			// session.invalidate();

			response.sendRedirect("/GoCheeta/admin/dashboard");
		} else {
			response.sendRedirect("/GoCheeta/admin/sign-in");
		}

	}

}
