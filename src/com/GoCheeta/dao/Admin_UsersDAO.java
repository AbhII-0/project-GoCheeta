package com.GoCheeta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.GoCheeta.common.MasterData;
import com.GoCheeta.model.Admin_Users;

public class Admin_UsersDAO {

	MasterData masterDataObj = new MasterData();

	private final String GET_ADMIN_USER_BY_UNAME_PWORD = "SELECT * FROM admin_users WHERE (admin_user_name = ? ) AND (admin_user_password = ?) LIMIT 1;";

	private final String GET_ADMIN_USER_BY_ID = "SELECT * FROM admin_users WHERE admin_user_id = ? LIMIT 1;";

	private final String ADD_ADMIN_USER = "INSERT INTO admin_users (admin_user_name, admin_user_email, admin_user_tp_number, admin_user_password, admin_user_account_status, user_roles_user_role_id, branches_branch_id) VALUES (?, ?, ?, ?, ?, ?, ?);";

	private final String UPDATE_ADMIN_USER = "UPDATE admin_users SET admin_user_name = ?, admin_user_email = ?, admin_user_tp_number = ?, admin_user_password = ?, admin_user_account_status = ?, user_roles_user_role_id = ? , branches_branch_id = ? WHERE admin_user_id = ?;";

	private final String UPDATE_ADMIN_USER_WITHOUT_PW = "UPDATE admin_users SET admin_user_name = ?, admin_user_email = ?, admin_user_tp_number = ?, admin_user_account_status = ?, user_roles_user_role_id = ? , branches_branch_id = ? WHERE admin_user_id = ?;";

	private final String SELECT_ALL_ADMIN_USERS = "SELECT * FROM admin_users LIMIT ?, ?";

	private final String SELECT_ADMIN_USERS_COUNT_SQL = "SELECT COUNT(*) AS admin_users_count FROM admin_users;";

	public boolean insertAdminUsers(Admin_Users admin_Users) throws SQLException {
		boolean rowAdded;
		try (Connection connection = masterDataObj.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(ADD_ADMIN_USER)) {
			preparedStatement.setString(1, admin_Users.getAdmin_user_name());
			preparedStatement.setString(2, admin_Users.getAdmin_user_email());
			preparedStatement.setString(3, admin_Users.getAdmin_user_tp_number());
			preparedStatement.setString(4, admin_Users.getAdmin_user_password());
			preparedStatement.setInt(5, admin_Users.getAdmin_user_account_status());
			preparedStatement.setInt(6, admin_Users.getUser_roles_user_role_id());
			preparedStatement.setInt(7, admin_Users.getBranches_branch_id());

			System.out.println(preparedStatement);
			rowAdded = preparedStatement.executeUpdate() > 0;
		} catch (SQLException e) {
			masterDataObj.printSQLException(e);
			rowAdded = false;
		}

		return rowAdded;
	}

	public boolean updateAdminUsers(Admin_Users admin_Users) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = masterDataObj.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_ADMIN_USER);) {
			preparedStatement.setString(1, admin_Users.getAdmin_user_name());
			preparedStatement.setString(2, admin_Users.getAdmin_user_email());
			preparedStatement.setString(3, admin_Users.getAdmin_user_tp_number());
			preparedStatement.setString(4, admin_Users.getAdmin_user_password());
			preparedStatement.setInt(5, admin_Users.getAdmin_user_account_status());
			preparedStatement.setInt(6, admin_Users.getUser_roles_user_role_id());
			preparedStatement.setInt(7, admin_Users.getBranches_branch_id());
			preparedStatement.setInt(8, admin_Users.getAdmin_user_id());

			System.out.println(preparedStatement);

			rowUpdated = preparedStatement.executeUpdate() > 0;
		}
		return rowUpdated;
	}

	public boolean updateAdminUsersWithOutPW(Admin_Users admin_Users) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = masterDataObj.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_ADMIN_USER_WITHOUT_PW);) {
			preparedStatement.setString(1, admin_Users.getAdmin_user_name());
			preparedStatement.setString(2, admin_Users.getAdmin_user_email());
			preparedStatement.setString(3, admin_Users.getAdmin_user_tp_number());
			preparedStatement.setInt(4, admin_Users.getAdmin_user_account_status());
			preparedStatement.setInt(5, admin_Users.getUser_roles_user_role_id());
			preparedStatement.setInt(6, admin_Users.getBranches_branch_id());
			preparedStatement.setInt(7, admin_Users.getAdmin_user_id());

			System.out.println(preparedStatement);

			rowUpdated = preparedStatement.executeUpdate() > 0;
		}
		return rowUpdated;
	}

	public List<Admin_Users> selectAllAdminUsers(int startCount, int recordCount) {

		List<Admin_Users> admin_Users = new ArrayList<>();

		try (Connection connection = masterDataObj.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_ADMIN_USERS);) {
			preparedStatement.setInt(1, startCount);
			preparedStatement.setInt(2, recordCount);
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {

				int admin_user_id = rs.getInt("admin_user_id");
				String admin_user_name = rs.getString("admin_user_name");
				String admin_user_email = rs.getString("admin_user_email");
				String admin_user_tp_number = rs.getString("admin_user_tp_number");
				int admin_user_account_status = rs.getInt("admin_user_account_status");
				int user_roles_user_role_id = rs.getInt("user_roles_user_role_id");
				int branches_branch_id = rs.getInt("branches_branch_id");

				admin_Users.add(new Admin_Users(admin_user_id, admin_user_name, admin_user_email, admin_user_tp_number,
						admin_user_account_status, user_roles_user_role_id, branches_branch_id));
			}
		} catch (SQLException e) {
			masterDataObj.printSQLException(e);
		}
		return admin_Users;
	}

	public boolean findAdminUser(Admin_Users admin_Users) throws SQLException {
		boolean selectRow;

		try (Connection connection = masterDataObj.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(GET_ADMIN_USER_BY_UNAME_PWORD);) {
			preparedStatement.setString(1, admin_Users.getAdmin_user_name());
			preparedStatement.setString(2, admin_Users.getAdmin_user_password());
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

	public List<Admin_Users> selectAdminUser(Admin_Users admin_Users) {

		List<Admin_Users> admin_User_Details = new ArrayList<>();

		try (Connection connection = masterDataObj.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(GET_ADMIN_USER_BY_UNAME_PWORD);) {
			preparedStatement.setString(1, admin_Users.getAdmin_user_name());
			preparedStatement.setString(2, admin_Users.getAdmin_user_password());

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {

				int admin_user_id = rs.getInt("admin_user_id");
				String admin_user_name = rs.getString("admin_user_name");
				String admin_user_email = rs.getString("admin_user_email");
				String admin_user_tp_number = rs.getString("admin_user_tp_number");
				int admin_user_account_status = rs.getInt("admin_user_account_status");
				int user_roles_user_role_id = rs.getInt("user_roles_user_role_id");
				int branches_branch_id = rs.getInt("branches_branch_id");

				admin_User_Details.add(new Admin_Users(admin_user_id, admin_user_name, admin_user_email,
						admin_user_tp_number, admin_user_account_status, user_roles_user_role_id, branches_branch_id));
			}

		} catch (SQLException e) {
			masterDataObj.printSQLException(e);
		}
		return admin_User_Details;
	}

	public int selectAdminUsersCount() {

		int adminUsersCount = 0;

		try (Connection connection = masterDataObj.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ADMIN_USERS_COUNT_SQL);) {
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				adminUsersCount = rs.getInt("admin_users_count");
			}

		} catch (SQLException e) {
			masterDataObj.printSQLException(e);
		}
		// System.out.println("branchCount" + branchCount);
		return adminUsersCount;
	}

	public List<Admin_Users> selectAdminUserByID(Admin_Users admin_Users) {

		List<Admin_Users> admin_User_Details = new ArrayList<>();

		try (Connection connection = masterDataObj.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(GET_ADMIN_USER_BY_ID);) {
			preparedStatement.setInt(1, admin_Users.getAdmin_user_id());

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {

				int admin_user_id = rs.getInt("admin_user_id");
				String admin_user_name = rs.getString("admin_user_name");
				String admin_user_email = rs.getString("admin_user_email");
				String admin_user_tp_number = rs.getString("admin_user_tp_number");
				int admin_user_account_status = rs.getInt("admin_user_account_status");
				int user_roles_user_role_id = rs.getInt("user_roles_user_role_id");
				int branches_branch_id = rs.getInt("branches_branch_id");

				admin_User_Details.add(new Admin_Users(admin_user_id, admin_user_name, admin_user_email,
						admin_user_tp_number, admin_user_account_status, user_roles_user_role_id, branches_branch_id));
			}

		} catch (SQLException e) {
			masterDataObj.printSQLException(e);
		}
		return admin_User_Details;
	}

}
