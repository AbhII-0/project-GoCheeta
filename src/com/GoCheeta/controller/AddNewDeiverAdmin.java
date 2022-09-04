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
import com.GoCheeta.dao.DriversDAO;
import com.GoCheeta.model.Drivers;

@WebServlet("/admin/drivers/add-new")

public class AddNewDeiverAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DriversDAO driversDAO;
	private PW_DMD5_HASH pwMd5HashObj = new PW_DMD5_HASH();

	public AddNewDeiverAdmin() {
		super();
	}

	public void init() {
		driversDAO = new DriversDAO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String servletPath = request.getServletPath();
		System.out.println(servletPath);
		try {
			if (servletPath.equals("/admin/drivers/add-new")) {
				addDriver(request, response);
			} else {
				System.out.println("servletPath Didn't Match");
			}

		} catch (Exception e) {
			System.out.println(e);
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	private void addDriver(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, NoSuchAlgorithmException {

		String driver_user_name = request.getParameter("driverUserName");
		String driver_email = request.getParameter("driverMail");
		String driver_tp_number = request.getParameter("driverTP");
		String driverProfilePic = "/assets/images/user-img.png";
		String driver_password = request.getParameter("driverPassword");
		String driver_license_number = "DMV-00000215";
		String driver_status = "ONLINE";
		int driver_account_status = Integer.parseInt(request.getParameter("driverAccStatus"));
		int driver_account_verification = 1;
		int branches_branch_id = Integer.parseInt(request.getParameter("driverBranch"));

		driver_password = pwMd5HashObj.md5PwdHash(driver_password);
		System.out.println(driver_user_name);

		Drivers drivers = new Drivers(driver_user_name, driver_email, driver_tp_number, driverProfilePic,
				driver_password, driver_account_status, driver_account_verification, driver_status,
				driver_license_number, branches_branch_id);

		driversDAO.insertDriverUsers(drivers);

		response.sendRedirect("/GoCheeta/admin/drivers");
	}

}
