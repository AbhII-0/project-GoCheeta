package com.GoCheeta.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GoCheeta.common.PW_DMD5_HASH;
import com.GoCheeta.dao.UserDAO;
import com.GoCheeta.model.Users;

@WebServlet("/user/signUp")
public class UserSignUpCreate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;
	private PW_DMD5_HASH pwMd5HashObj = new PW_DMD5_HASH();

	public UserSignUpCreate() {
		super();
	}

	public void init() {
		userDAO = new UserDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String servletPath = request.getServletPath();
		System.out.println(servletPath);
		try {
			if (servletPath.equals("/user/signUp")) {
				addUser(request, response);
			} else {
				System.out.println("servletPath Didn't Match");
			}

		} catch (Exception e) {
			System.out.println(e);
		}

	}

	private void addUser(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, NoSuchAlgorithmException, ServletException {

		String user_name = request.getParameter("userName");
		String user_email = request.getParameter("email");
		String user_tp_number = request.getParameter("tp");
		String userProfilePic = "/assets/images/user-img.png";
		String user_password = request.getParameter("password");

		user_password = pwMd5HashObj.md5PwdHash(user_password);
		System.out.println(user_password);

		Users users = new Users(user_name, user_email, user_tp_number, userProfilePic, user_password);

		userDAO.insertUsers(users);

		request.setAttribute("user_email", user_email);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/user/otp-verification/index.jsp");
		dispatcher.forward(request, response);
	}

}
