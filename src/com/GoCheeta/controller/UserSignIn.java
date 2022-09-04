package com.GoCheeta.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/sign-in")
public class UserSignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserSignIn() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String servletPath = request.getServletPath();
		// System.out.println(servletPath);
		try {
			if (servletPath.equals("/sign-in")) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/views/user/sign-in/index.jsp");
				dispatcher.forward(request, response);
			} else {
				System.out.println("Servelrt Path Mis Match...!");
			}

		} catch (Exception e) {
			System.out.println(e);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
