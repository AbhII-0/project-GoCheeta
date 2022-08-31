package com.GoCheeta.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GoCheeta.dao.Admin_UsersDAO;

@WebServlet("/admin/sign-in")
public class AdminSignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Admin_UsersDAO admin_UsersDAO;

	public AdminSignIn() {
		super();
	}

	public void init() {
		admin_UsersDAO = new Admin_UsersDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String servletPath = request.getServletPath();

		try {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/views/admin/sign-in/index.jsp");
			dispatcher.forward(request, response);

		} catch (Exception e) {
			System.out.println(e);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
