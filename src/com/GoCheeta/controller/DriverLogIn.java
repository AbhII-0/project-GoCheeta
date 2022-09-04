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
import com.GoCheeta.dao.DriversDAO;
import com.GoCheeta.model.Drivers;

@WebServlet("/driver/log-in")
public class DriverLogIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DriversDAO driversDAO;
	private PW_DMD5_HASH pw_DMD5_HASH = new PW_DMD5_HASH();

	public DriverLogIn() {
		super();
	}

	public void init() {
		driversDAO = new DriversDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("/GoCheeta/driver/sign-in");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String servletPath = request.getServletPath();
		// System.out.println(servletPath);
		try {
			if (servletPath.equals("/driver/log-in")) {
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

			String driver_user_name = request.getParameter("userName");
			String driver_password = request.getParameter("password");

			driver_password = pw_DMD5_HASH.md5PwdHash(driver_password);

			Drivers drivers = new Drivers(driver_user_name, driver_password);
			accHave = driversDAO.findDriver(drivers);

			if (accHave) {

				List<Drivers> driversAccDetails = driversDAO.selectDriver(drivers);

				HttpSession session = request.getSession();
				session.setAttribute("driver_id", driversAccDetails.get(0).getDriver_id());
				session.setAttribute("driver_user_name", driversAccDetails.get(0).getDriver_user_name());
				session.setAttribute("driver_email", driversAccDetails.get(0).getDriver_email());
				session.setAttribute("driver_tp_number", driversAccDetails.get(0).getDriver_tp_number());
				session.setAttribute("driverProfilePic", driversAccDetails.get(0).getDriverProfilePic());
				session.setAttribute("driver_account_status", driversAccDetails.get(0).getDriver_account_status());
				session.setAttribute("driver_account_verification",
						driversAccDetails.get(0).getDriver_account_verification());
				session.setAttribute("driver_status", driversAccDetails.get(0).getDriver_status());
				session.setAttribute("driver_license_number", driversAccDetails.get(0).getDriver_license_number());
				session.setAttribute("branches_branch_id", driversAccDetails.get(0).getBranches_branch_id());

				// session.invalidate();

				response.sendRedirect("/GoCheeta/driver/dashboard");
			} else {
				response.sendRedirect("/GoCheeta/driver/sign-in");
			}
		} else {
			System.out.println("Null");
			response.sendRedirect("/GoCheeta/sign-in");
		}

	}

}
