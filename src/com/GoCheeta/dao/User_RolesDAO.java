package com.GoCheeta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.GoCheeta.common.MasterData;
import com.GoCheeta.model.User_Roles;

public class User_RolesDAO {
	MasterData masterDataObj = new MasterData();

	private final String SELECT_ALL_USER_ROLES = "SELECT * FROM user_roles;";

	public List<User_Roles> selectAllUserRoles() {

		List<User_Roles> user_Roles = new ArrayList<>();

		try (Connection connection = masterDataObj.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USER_ROLES);) {
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {

				int user_role_id = rs.getInt("user_role_id");
				String user_role = rs.getString("user_role");

				user_Roles.add(new User_Roles(user_role_id, user_role));
			}
		} catch (SQLException e) {
			masterDataObj.printSQLException(e);
		}
		return user_Roles;
	}

}
