package com.GoCheeta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.GoCheeta.common.MasterData;
import com.GoCheeta.model.Vehicle_Types;

public class Vehicle_TypesDAO {

	MasterData masterDataObj = new MasterData();

	private final String SELECT_ALL_VEHICLE_TYPES = "SELECT * FROM vehicle_types LIMIT ?, ?;";

	private final String SELECT_VEHICLE_TYPES_BY_ID = "SELECT * FROM vehicle_types WHERE vehicle_types_id = ?;";

	private final String ADD_VEHICLE_TYPES = "INSERT INTO vehicle_types (vehicle_type, vehicle_type_price, vehicle_type_status) VALUES (?, ?, ?);";

	private final String UPDATE_VEHICLE_TYPES = "UPDATE vehicle_types SET vehicle_type = ?, vehicle_type_price = ?, vehicle_type_status = ? WHERE vehicle_types_id = ?;";

	private final String SELECT_VEHICLE_TYPE_COUNT = "SELECT COUNT(*) AS vehicle_type_count FROM vehicle_types;";

	public boolean insertVehicleTypes(Vehicle_Types vehicle_Types) throws SQLException {
		boolean rowAdded;
		try (Connection connection = masterDataObj.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(ADD_VEHICLE_TYPES)) {
			preparedStatement.setString(1, vehicle_Types.getVehicle_type());
			preparedStatement.setDouble(2, vehicle_Types.getVehicle_type_price());
			preparedStatement.setInt(3, vehicle_Types.getVehicle_type_status());

			System.out.println(preparedStatement);
			rowAdded = preparedStatement.executeUpdate() > 0;
		} catch (SQLException e) {
			masterDataObj.printSQLException(e);
			rowAdded = false;
		}

		return rowAdded;
	}

	public boolean updateVehicleTypes(Vehicle_Types vehicle_Types) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = masterDataObj.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_VEHICLE_TYPES);) {
			preparedStatement.setString(1, vehicle_Types.getVehicle_type());
			preparedStatement.setDouble(2, vehicle_Types.getVehicle_type_price());
			preparedStatement.setInt(3, vehicle_Types.getVehicle_type_status());
			preparedStatement.setInt(4, vehicle_Types.getVehicle_types_id());

			rowUpdated = preparedStatement.executeUpdate() > 0;
		}
		return rowUpdated;
	}

	public List<Vehicle_Types> selectAllVehicleTypes(int startCount, int recordCount) {

		List<Vehicle_Types> vehicle_Types = new ArrayList<>();

		try (Connection connection = masterDataObj.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_VEHICLE_TYPES);) {
			preparedStatement.setInt(1, startCount);
			preparedStatement.setInt(2, recordCount);
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {

				int vehicle_types_id = rs.getInt("vehicle_types_id");
				String vehicle_type = rs.getString("vehicle_type");
				double vehicle_type_price = rs.getDouble("vehicle_type_price");
				int vehicle_type_status = rs.getInt("vehicle_type_status");

				vehicle_Types.add(
						new Vehicle_Types(vehicle_types_id, vehicle_type, vehicle_type_price, vehicle_type_status));

			}
		} catch (SQLException e) {
			masterDataObj.printSQLException(e);
		}
		return vehicle_Types;
	}

	public List<Vehicle_Types> selectVehicleTypesByID(Vehicle_Types vehicle_Types) {

		List<Vehicle_Types> vehicle_TypeDetails = new ArrayList<>();

		try (Connection connection = masterDataObj.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_VEHICLE_TYPES_BY_ID);) {
			preparedStatement.setInt(1, vehicle_Types.getVehicle_types_id());
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {

				int vehicle_types_id = rs.getInt("vehicle_types_id");
				String vehicle_type = rs.getString("vehicle_type");
				double vehicle_type_price = rs.getDouble("vehicle_type_price");
				int vehicle_type_status = rs.getInt("vehicle_type_status");

				vehicle_TypeDetails.add(
						new Vehicle_Types(vehicle_types_id, vehicle_type, vehicle_type_price, vehicle_type_status));

			}
		} catch (SQLException e) {
			masterDataObj.printSQLException(e);
		}
		return vehicle_TypeDetails;
	}

	public int selectVehicleTypeCount() {

		int vehicleTypeCount = 0;

		try (Connection connection = masterDataObj.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_VEHICLE_TYPE_COUNT);) {
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				vehicleTypeCount = rs.getInt("vehicle_type_count");
			}

		} catch (SQLException e) {
			masterDataObj.printSQLException(e);
		}

		return vehicleTypeCount;
	}

}
