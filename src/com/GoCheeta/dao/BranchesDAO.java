package com.GoCheeta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.GoCheeta.common.MasterData;
import com.GoCheeta.model.Branches;

public class BranchesDAO {

	MasterData masterDataObj = new MasterData();

	private final String INSERT_BRANCH_SQL = "INSERT INTO branches (branch_name, branch_loaction, brancheCordinate, branche_status) VALUES (?, ?, ?, ?);";

	private final String UPDATE_BRANCH_SQL = "UPDATE branches SET branch_name = ?, branch_loaction = ?, brancheCordinate = ?, branche_status = ? WHERE branch_id = ?;";

	private final String SELECT_ALL_BRANCHS_SQL = "SELECT * FROM branches ORDER BY branch_id ASC LIMIT ?, ?;";

	private final String SELECT_ALL_ONLINE_BRANCHS_SQL = "SELECT * FROM branches WHERE branche_status = 1 LIMIT ?, ?;";

	private final String SELECT_BRANCH_COUNT_SQL = "SELECT COUNT(*) AS branch_count FROM branches;";

	private final String SELECT_BRANCH_REV = "SELECT branches.branch_id, SUM(bookings.bookin_charge) AS branch_total_collection FROM branches "
			+ "LEFT JOIN drivers ON branches.branch_id = drivers.branches_branch_id "
			+ "LEFT JOIN bookings ON drivers.driver_id = bookings.drivers_driver_id "
			+ "WHERE (booking_status = \"COMPLETE\") AND (booking_time >= ?) AND (booking_time <= ?) "
			+ "GROUP BY branches.branch_id ORDER BY branches.branch_id ASC ;";

	public List<Branches> getBranchRev(String fromDate, String toDate) {

		List<Branches> branchesRev = new ArrayList<>();

		try (Connection connection = masterDataObj.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BRANCH_REV);) {
			preparedStatement.setString(1, fromDate);
			;
			preparedStatement.setString(2, toDate);
			;
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				int branch_id = rs.getInt("branch_id");
				double branch_total_collection = rs.getDouble("branch_total_collection");

				branchesRev.add(new Branches(branch_id, branch_total_collection));
			}
		} catch (SQLException e) {
			masterDataObj.printSQLException(e);
		}
		return branchesRev;
	}

	public void insertBranche(Branches branches) throws SQLException {
		// System.out.println(INSERT_BRANCH_SQL);

		try (Connection connection = masterDataObj.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_BRANCH_SQL)) {
			preparedStatement.setString(1, branches.getBranch_name());
			preparedStatement.setString(2, branches.getBranch_loaction());
			preparedStatement.setString(3, branches.getBrancheCordinate());
			preparedStatement.setInt(4, branches.getBranche_status());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			masterDataObj.printSQLException(e);
		}
	}

	public boolean updateBranches(Branches branches) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = masterDataObj.getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_BRANCH_SQL);) {
			statement.setString(1, branches.getBranch_name());
			statement.setString(2, branches.getBranch_loaction());
			statement.setString(3, branches.getBrancheCordinate());
			statement.setInt(4, branches.getBranche_status());
			statement.setInt(5, branches.getBranch_id());

			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}

	public List<Branches> selectAllBranches(int startCount, int recordCount) {

		List<Branches> branches = new ArrayList<>();

		try (Connection connection = masterDataObj.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_BRANCHS_SQL);) {
			preparedStatement.setInt(1, startCount);
			preparedStatement.setInt(2, recordCount);
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				int branch_id = rs.getInt("branch_id");
				String branch_name = rs.getString("branch_name");
				String branch_loaction = rs.getString("branch_loaction");
				String brancheCordinate = rs.getString("brancheCordinate");
				int branche_status = rs.getInt("branche_status");
				branches.add(new Branches(branch_id, branch_name, branch_loaction, brancheCordinate, branche_status));
			}
		} catch (SQLException e) {
			masterDataObj.printSQLException(e);
		}
		return branches;
	}

	public List<Branches> selectAllOnlineBranches(int startCount, int recordCount) {

		List<Branches> branches = new ArrayList<>();

		try (Connection connection = masterDataObj.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_ONLINE_BRANCHS_SQL);) {
			preparedStatement.setInt(1, startCount);
			preparedStatement.setInt(2, recordCount);
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				int branch_id = rs.getInt("branch_id");
				String branch_name = rs.getString("branch_name");
				String branch_loaction = rs.getString("branch_loaction");
				String brancheCordinate = rs.getString("brancheCordinate");
				int branche_status = rs.getInt("branche_status");
				branches.add(new Branches(branch_id, branch_name, branch_loaction, brancheCordinate, branche_status));
			}
		} catch (SQLException e) {
			masterDataObj.printSQLException(e);
		}
		return branches;
	}

	public int selectBranchCount() {

		int branchCount = 0;

		try (Connection connection = masterDataObj.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BRANCH_COUNT_SQL);) {
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				branchCount = rs.getInt("branch_count");
			}

		} catch (SQLException e) {
			masterDataObj.printSQLException(e);
		}
		// System.out.println("branchCount" + branchCount);
		return branchCount;
	}

}
