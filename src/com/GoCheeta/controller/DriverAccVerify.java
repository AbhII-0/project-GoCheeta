package com.GoCheeta.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/driver/signUp/acc-verify")
public class DriverAccVerify extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DriverAccVerify() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String servletPath = request.getServletPath();
		System.out.println(servletPath);
		try {
			if (servletPath.equals("/driver/signUp/acc-verify")) {
				driverAccVerify(request, response);
			} else {
				System.out.println("servletPath Didn't Match");
			}

		} catch (Exception e) {
			System.out.println(e);
		}

	}

	private void driverAccVerify(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, NoSuchAlgorithmException, ServletException {

		String otpNo1 = request.getParameter("otpNo1");
		String otpNo2 = request.getParameter("otpNo2");
		String otpNo3 = request.getParameter("otpNo3");
		String otpNo4 = request.getParameter("otpNo4");
		String otpNo5 = request.getParameter("otpNo5");
		String otpNo6 = request.getParameter("otpNo6");

		String driver_email = request.getParameter("driverMail");

		String fullOTP = otpNo1 + otpNo2 + otpNo3 + otpNo4 + otpNo5 + otpNo6;
		String orginalOTP = "123456";

		if (fullOTP.equals(orginalOTP)) {

			response.sendRedirect("/GoCheeta/driver/sign-in");
		} else {

			request.setAttribute("driver_email", driver_email);

			PrintWriter out = response.getWriter();

			out.println("<script type=\"text/javascript\">");
			out.println("alert('alert('Your OTP Code Wrong...! Try Again');");
			// out.println("location='/GoCheeta/driver/select-bookings';");
			out.println("</script>");

			RequestDispatcher dispatcher = request.getRequestDispatcher("/views/driver/otp-verification/index.jsp");
			dispatcher.forward(request, response);

		}

	}

}
