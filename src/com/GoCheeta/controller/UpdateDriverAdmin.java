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

@WebServlet("/admin/drivers/update")
public class UpdateDriverAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DriversDAO driversDAO;
	private PW_DMD5_HASH pwMd5HashObj = new PW_DMD5_HASH();

	public UpdateDriverAdmin() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void init() {
		driversDAO = new DriversDAO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String servletPath = request.getServletPath();
		System.out.println(servletPath);
		try {
			if (servletPath.equals("/admin/drivers/update")) {
				updateDriver(request, response);
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

	private void updateDriver(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, NoSuchAlgorithmException {

		int driver_id = Integer.parseInt(request.getParameter("edit-driverId"));
		String driver_user_name = request.getParameter("edit-driverName");
		String driver_email = request.getParameter("edit-driverMail");
		String driver_tp_number = request.getParameter("edit-driverTp");
		String driverProfilePic = "/assets/images/user-img.png";
		String driver_password = request.getParameter("edit-driverPassword");
		String driver_license_number = "DMV-00000215";
		int driver_account_status = Integer.parseInt(request.getParameter("edit-driverStatus"));
		int driver_account_verification = 1;
		int branches_branch_id = Integer.parseInt(request.getParameter("edit-driverBranch"));

		Drivers drivers;

		if (driver_password.equals("")) {
			drivers = new Drivers(driver_id, driver_user_name, driver_email, driver_tp_number, driverProfilePic,
					driver_account_status, driver_account_verification, driver_license_number, branches_branch_id);
			driversDAO.updateDriverWithoutPwd(drivers);
		} else {

			driver_password = pwMd5HashObj.md5PwdHash(driver_password);

			drivers = new Drivers(driver_id, driver_user_name, driver_email, driver_tp_number, driverProfilePic,
					driver_password, driver_account_status, driver_account_verification, driver_license_number,
					branches_branch_id);
			driversDAO.updateDriver(drivers);
		}

		System.out.println(branches_branch_id);
		response.sendRedirect("/GoCheeta/admin/drivers");
	}

}
