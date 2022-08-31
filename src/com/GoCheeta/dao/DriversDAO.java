package com.GoCheeta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.GoCheeta.common.MasterData;
import com.GoCheeta.model.Drivers;

public class DriversDAO {

	MasterData masterDataObj = new MasterData();

	private final String GET_DRIVER_BY_UNAME_PWORD = "SELECT * FROM drivers WHERE (driver_user_name = ? ) AND (driver_password = ?) LIMIT 1;";

	private final String GET_DRIVER_BY_ID = "SELECT * FROM drivers WHERE driver_id = ? LIMIT 1;";

	private final String ADD_DRIVER = "INSERT INTO drivers (driver_user_name, driver_email, driver_tp_number, driverProfilePic, driver_password, driver_account_status, driver_account_verification, driver_status, driver_license_number, branches_branch_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

	private final String UPDATE_DRIVER = "UPDATE drivers SET driver_user_name = ?, driver_email = ?, driver_tp_number = ?, driverProfilePic = ?, driver_password = ? , driver_account_status = ?, driver_account_verification = ?, driver_license_number = ?, branches_branch_id = ? WHERE driver_id = ?;";

	private final String UPDATE_DRIVER_WITHOUT_PWD = "UPDATE drivers SET driver_user_name = ?, driver_email = ?, driver_tp_number = ?, driverProfilePic = ?,  driver_account_status = ?, driver_account_verification = ?, driver_license_number = ?, branches_branch_id = ? WHERE driver_id = ?;";

	private final String SELECT_ALL_DRIVERS = "SELECT drivers.*, branches.branch_loaction FROM drivers JOIN branches ON drivers.branches_branch_id = branches.branch_id LIMIT ?, ?";

	private final String SELECT_DRIVERS_COUNT_SQL = "SELECT COUNT(*) AS drivers_count FROM drivers;";

	public boolean insertDriverUsers(Drivers drivers) throws SQLException {
		boolean rowAdded;
		try (Connection connection = masterDataObj.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(ADD_DRIVER)) {
			preparedStatement.setString(1, drivers.getDriver_user_name());
			preparedStatement.setString(2, drivers.getDriver_email());
			preparedStatement.setString(3, drivers.getDriver_tp_number());
			preparedStatement.setString(4, drivers.getDriverProfilePic());
			preparedStatement.setString(5, drivers.getDriver_password());
			preparedStatement.setInt(6, drivers.getDriver_account_status());
			preparedStatement.setInt(7, drivers.getDriver_account_verification());
			preparedStatement.setString(8, drivers.getDriver_status());
			preparedStatement.setString(9, drivers.getDriver_license_number());
			preparedStatement.setInt(10, drivers.getBranches_branch_id());

			System.out.println(preparedStatement);
			rowAdded = preparedStatement.executeUpdate() > 0;
		} catch (SQLException e) {
			masterDataObj.printSQLException(e);
			rowAdded = false;
		}

		return rowAdded;
	}

	public boolean updateDriver(Drivers drivers) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = masterDataObj.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_DRIVER);) {
			preparedStatement.setString(1, drivers.getDriver_user_name());
			preparedStatement.setString(2, drivers.getDriver_email());
			preparedStatement.setString(3, drivers.getDriver_tp_number());
			preparedStatement.setString(4, drivers.getDriverProfilePic());
			preparedStatement.setString(5, drivers.getDriver_password());
			preparedStatement.setInt(6, drivers.getDriver_account_status());
			preparedStatement.setInt(7, drivers.getDriver_account_verification());
			preparedStatement.setString(8, drivers.getDriver_license_number());
			preparedStatement.setInt(9, drivers.getBranches_branch_id());
			preparedStatement.setInt(10, drivers.getDriver_id());

			rowUpdated = preparedStatement.executeUpdate() > 0;
		}
		return rowUpdated;
	}

	public boolean updateDriverWithoutPwd(Drivers drivers) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = masterDataObj.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_DRIVER_WITHOUT_PWD);) {
			preparedStatement.setString(1, drivers.getDriver_user_name());
			preparedStatement.setString(2, drivers.getDriver_email());
			preparedStatement.setString(3, drivers.getDriver_tp_number());
			preparedStatement.setString(4, drivers.getDriverProfilePic());
			preparedStatement.setInt(5, drivers.getDriver_account_status());
			preparedStatement.setInt(6, drivers.getDriver_account_verification());
			preparedStatement.setString(7, drivers.getDriver_license_number());
			preparedStatement.setInt(8, drivers.getBranches_branch_id());
			preparedStatement.setInt(9, drivers.getDriver_id());

			rowUpdated = preparedStatement.executeUpdate() > 0;
		}
		return rowUpdated;
	}

	public List<Drivers> selectAllDrivers(int startCount, int recordCount) {

		List<Drivers> drivers = new ArrayList<>();

		try (Connection connection = masterDataObj.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_DRIVERS);) {
			preparedStatement.setInt(1, startCount);
			preparedStatement.setInt(2, recordCount);
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {

				int driver_id = rs.getInt("driver_id");
				String driver_user_name = rs.getString("driver_user_name");
				String driver_email = rs.getString("driver_email");
				String driver_tp_number = rs.getString("driver_tp_number");
				String driverProfilePic = rs.getString("driverProfilePic");
				int driver_account_status = rs.getInt("driver_account_status");
				int driver_account_verification = rs.getInt("driver_account_verification");
				String driver_status = rs.getString("driver_status");
				String driver_license_number = rs.getString("driver_license_number");
				int branches_branch_id = rs.getInt("branches_branch_id");
				String branch_loaction = rs.getString("branch_loaction");

				drivers.add(new Drivers(driver_id, driver_user_name, driver_email, driver_tp_number, driverProfilePic,
						driver_account_status, driver_account_verification, driver_status, driver_license_number,
						branches_branch_id, branch_loaction));
			}
		} catch (SQLException e) {
			masterDataObj.printSQLException(e);
		}
		return drivers;
	}

	public boolean findDriver(Drivers drivers) throws SQLException {
		boolean selectRow;

		try (Connection connection = masterDataObj.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(GET_DRIVER_BY_UNAME_PWORD);) {
			preparedStatement.setString(1, drivers.getDriver_user_name());
			preparedStatement.setString(2, drivers.getDriver_password());
			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();

			if (rs.next()) {
				selectRow = true;
				System.out.println("Not Null");
			} else {
				selectRow = false;
				System.out.println("Null");
			}
		}
		return selectRow;
	}

	public List<Drivers> selectDriver(Drivers drivers) {

		List<Drivers> driverDetails = new ArrayList<>();

		try (Connection connection = masterDataObj.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(GET_DRIVER_BY_UNAME_PWORD);) {
			preparedStatement.setString(1, drivers.getDriver_user_name());
			preparedStatement.setString(2, drivers.getDriver_password());

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {

				int driver_id = rs.getInt("driver_id");
				String driver_user_name = rs.getString("driver_user_name");
				String driver_email = rs.getString("driver_email");
				String driver_tp_number = rs.getString("driver_tp_number");
				String driverProfilePic = rs.getString("driverProfilePic");
				int driver_account_status = rs.getInt("driver_account_status");
				int driver_account_verification = rs.getInt("driver_account_verification");
				String driver_license_number = rs.getString("driver_license_number");
				int branches_branch_id = rs.getInt("branches_branch_id");

				driverDetails.add(new Drivers(driver_id, driver_user_name, driver_email, driver_tp_number,
						driverProfilePic, driver_account_status, driver_account_verification, driver_license_number,
						branches_branch_id));

			}

		} catch (SQLException e) {
			masterDataObj.printSQLException(e);
		}
		return driverDetails;
	}

	public List<Drivers> selectDriverById(Drivers drivers) {

		List<Drivers> driverDetails = new ArrayList<>();

		try (Connection connection = masterDataObj.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(GET_DRIVER_BY_ID);) {
			preparedStatement.setInt(1, drivers.getDriver_id());

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {

				int driver_id = rs.getInt("driver_id");
				String driver_user_name = rs.getString("driver_user_name");
				String driver_email = rs.getString("driver_email");
				String driver_tp_number = rs.getString("driver_tp_number");
				String driverProfilePic = rs.getString("driverProfilePic");
				int driver_account_status = rs.getInt("driver_account_status");
				int driver_account_verification = rs.getInt("driver_account_verification");
				String driver_license_number = rs.getString("driver_license_number");
				int branches_branch_id = rs.getInt("branches_branch_id");

				driverDetails.add(new Drivers(driver_id, driver_user_name, driver_email, driver_tp_number,
						driverProfilePic, driver_account_status, driver_account_verification, driver_license_number,
						branches_branch_id));

			}

		} catch (SQLException e) {
			masterDataObj.printSQLException(e);
		}
		return driverDetails;
	}

	public int selectDriversCount() {

		int driversCount = 0;

		try (Connection connection = masterDataObj.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_DRIVERS_COUNT_SQL);) {
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				driversCount = rs.getInt("drivers_count");
			}

		} catch (SQLException e) {
			masterDataObj.printSQLException(e);
		}

		return driversCount;
	}

}
