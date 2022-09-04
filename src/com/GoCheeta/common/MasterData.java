package com.GoCheeta.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MasterData {

	public String jdbcURL = "jdbc:mysql://localhost:3306/GoCheetaDB?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	public String jdbcUsername = "root";
	public String jdbcPassword = "";

	public Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (SQLException e) {

			System.out.println("SQLException : \n\n\n" + e);
		} catch (ClassNotFoundException e) {

			System.out.println("ClassNotFoundException : \n\n\n" + e);
		}
		return connection;
	}

	public void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}

}
