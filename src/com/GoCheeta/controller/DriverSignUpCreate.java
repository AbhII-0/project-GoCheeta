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
import com.GoCheeta.dao.DriversDAO;
import com.GoCheeta.model.Drivers;

@WebServlet("/driver/signUp")
public class DriverSignUpCreate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DriversDAO driversDAO;
	private PW_DMD5_HASH pwMd5HashObj = new PW_DMD5_HASH();

	public DriverSignUpCreate() {
		super();
	}

	public void init() {
		driversDAO = new DriversDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String servletPath = request.getServletPath();
		System.out.println(servletPath);
		try {
			if (servletPath.equals("/driver/signUp")) {
				addDriver(request, response);
			} else {
				System.out.println("servletPath Didn't Match");
			}

		} catch (Exception e) {
			System.out.println(e);
		}

	}

	private void addDriver(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, NoSuchAlgorithmException, ServletException {

		String driver_user_name = request.getParameter("userName");
		String driver_email = request.getParameter("email");
		String driver_tp_number = request.getParameter("tp");
		String driverProfilePic = "/assets/images/user-img.png";
		String driver_password = request.getParameter("password");
		String driver_license_number = "DMV-00000215";
		String driver_status = "ONLINE";
		int driver_account_status = 1;
		int driver_account_verification = 0;
		int branches_branch_id = Integer.parseInt(request.getParameter("driverBranch"));

		driver_password = pwMd5HashObj.md5PwdHash(driver_password);
		System.out.println(driver_user_name);

		Drivers drivers = new Drivers(driver_user_name, driver_email, driver_tp_number, driverProfilePic,
				driver_password, driver_account_status, driver_account_verification, driver_status,
				driver_license_number, branches_branch_id);

		driversDAO.insertDriverUsers(drivers);

		request.setAttribute("driver_email", driver_email);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/driver/otp-verification/index.jsp");
		dispatcher.forward(request, response);
	}

}
