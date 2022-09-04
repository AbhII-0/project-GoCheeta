package com.GoCheeta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.GoCheeta.common.MasterData;
import com.GoCheeta.model.Users;

public class UserDAO {

	MasterData masterDataObj = new MasterData();

	private final String GET_USER_BY_UNAME_PWORD = "SELECT * FROM users WHERE (user_name = ? ) AND (user_password = ?) AND (user_account_status = 1) LIMIT 1;";

	private final String GET_USER_BY_ID = "SELECT * FROM users WHERE (user_id = ?) AND (user_account_status = 1) LIMIT 1;";

	private final String ADD_USER = "INSERT INTO users (user_name, user_email, user_tp_number, userProfilePic, user_password, user_account_status) "
			+ "VALUES (?, ?, ?, ?, ?, 1);";

	private final String UPDATE_USER = "UPDATE users SET user_name = ?, user_email = ?, user_tp_number = ?, userProfilePic = ?, user_password = ? WHERE user_id = ?;";

	private final String UPDATE_USER_WITHOUT_PW = "UPDATE users SET user_name = ?, user_email = ?, user_tp_number = ?, userProfilePic = ? WHERE user_id = ?;";

	private final String UPDATE_USER_ACC_VERIFICARION_STATUS = "UPDATE users SET user_account_verification = 1 WHERE user_id = ?;";

	public boolean insertUsers(Users users) throws SQLException {
		boolean rowAdded;
		try (Connection connection = masterDataObj.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(ADD_USER)) {
			preparedStatement.setString(1, users.getUser_name());
			preparedStatement.setString(2, users.getUser_email());
			preparedStatement.setString(3, users.getUser_tp_number());
			preparedStatement.setString(4, users.getUserProfilePic());
			preparedStatement.setString(5, users.getUser_password());

			System.out.println(preparedStatement);
			rowAdded = preparedStatement.executeUpdate() > 0;
		} catch (SQLException e) {
			masterDataObj.printSQLException(e);
			rowAdded = false;
		}

		return rowAdded;
	}

	public boolean updateUsers(Users users) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = masterDataObj.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER);) {
			preparedStatement.setString(1, users.getUser_name());
			preparedStatement.setString(2, users.getUser_email());
			preparedStatement.setString(3, users.getUser_tp_number());
			preparedStatement.setString(4, users.getUserProfilePic());
			preparedStatement.setString(5, users.getUser_password());

			System.out.println(preparedStatement);

			rowUpdated = preparedStatement.executeUpdate() > 0;
		}
		return rowUpdated;
	}

	public boolean updateUsersWithouPw(Users users) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = masterDataObj.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER_WITHOUT_PW);) {
			preparedStatement.setString(1, users.getUser_name());
			preparedStatement.setString(2, users.getUser_email());
			preparedStatement.setString(3, users.getUser_tp_number());
			preparedStatement.setString(4, users.getUserProfilePic());

			System.out.println(preparedStatement);

			rowUpdated = preparedStatement.executeUpdate() > 0;
		}
		return rowUpdated;
	}

	public boolean findUser(Users users) throws SQLException {
		boolean selectRow;

		try (Connection connection = masterDataObj.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(GET_USER_BY_UNAME_PWORD);) {
			preparedStatement.setString(1, users.getUser_name());
			preparedStatement.setString(2, users.getUser_password());
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

	public List<Users> selectUser(Users users) {

		List<Users> usersDetails = new ArrayList<>();

		try (Connection connection = masterDataObj.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(GET_USER_BY_UNAME_PWORD);) {
			preparedStatement.setString(1, users.getUser_name());
			preparedStatement.setString(2, users.getUser_password());

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {

				int user_id = rs.getInt("user_id");
				String user_name = rs.getString("user_name");
				String user_email = rs.getString("user_email");
				String user_tp_number = rs.getString("user_tp_number");
				String userProfilePic = rs.getString("userProfilePic");
				int user_account_status = rs.getInt("user_account_status");
				int user_account_verification = rs.getInt("user_account_verification");

				usersDetails.add(new Users(user_id, user_name, user_email, user_tp_number, userProfilePic,
						user_account_status, user_account_verification));
			}

		} catch (SQLException e) {
			masterDataObj.printSQLException(e);
		}
		return usersDetails;
	}

	public boolean updateUsersAccountVervication(Users users) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = masterDataObj.getConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement(UPDATE_USER_ACC_VERIFICARION_STATUS);) {
			preparedStatement.setInt(1, users.getUser_id());

			System.out.println(preparedStatement);

			rowUpdated = preparedStatement.executeUpdate() > 0;
		}
		return rowUpdated;
	}

}
