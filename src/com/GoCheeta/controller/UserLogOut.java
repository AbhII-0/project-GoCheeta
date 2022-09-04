package com.GoCheeta.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/log-out")
public class UserLogOut extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserLogOut() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String servletPath = request.getServletPath();
		// System.out.println(servletPath);
		try {
			if (servletPath.equals("/log-out")) {
				HttpSession session = request.getSession();
				session.invalidate();
				response.sendRedirect("/GoCheeta/sign-in");
			}

		} catch (Exception e) {
			System.out.println(e);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
