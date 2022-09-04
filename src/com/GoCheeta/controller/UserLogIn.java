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
import com.GoCheeta.dao.UserDAO;
import com.GoCheeta.model.Users;

@WebServlet("/LogIn")
public class UserLogIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDAO userDAO;
	private PW_DMD5_HASH pw_DMD5_HASH = new PW_DMD5_HASH();

	public UserLogIn() {
		super();
	}

	public void init() {
		userDAO = new UserDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("/GoCheeta/sign-in");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String servletPath = request.getServletPath();
		// System.out.println(servletPath);
		try {
			if (servletPath.equals("/LogIn")) {
				logingAccount(request, response);
			}

		} catch (Exception e) {
			System.out.println(e);
		}

	}

	private void logingAccount(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException, NoSuchAlgorithmException {

		boolean accHave = false;

		if ((request.getParameter("userName") != null) && (request.getParameter("password") != null)) {

			String user_name = request.getParameter("userName");
			String user_password = request.getParameter("password");

			user_password = pw_DMD5_HASH.md5PwdHash(user_password);

			Users users = new Users(user_name, user_password);
			accHave = userDAO.findUser(users);

			if (accHave) {

				List<Users> usersAccDetails = userDAO.selectUser(users);

				HttpSession session = request.getSession();
				session.setAttribute("userId", usersAccDetails.get(0).getUser_id());
				session.setAttribute("userName", usersAccDetails.get(0).getUser_name());
				session.setAttribute("userTP", usersAccDetails.get(0).getUser_tp_number());
				session.setAttribute("userMail", usersAccDetails.get(0).getUser_email());
				session.setAttribute("userStatus", usersAccDetails.get(0).getUser_account_status());
				session.setAttribute("userProfilePic", usersAccDetails.get(0).getUserProfilePic());
				session.setAttribute("user_account_verification",
						usersAccDetails.get(0).getUser_account_verification());

				// session.invalidate();

				response.sendRedirect("/GoCheeta/menu");
			} else {
				response.sendRedirect("/GoCheeta/sign-in");
			}
		} else {
			System.out.println("Null");
			response.sendRedirect("/GoCheeta/sign-in");
		}

	}

}
