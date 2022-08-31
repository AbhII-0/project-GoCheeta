package com.GoCheeta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.GoCheeta.common.MasterData;
import com.GoCheeta.model.Vehicles;

public class VehiclesDAO {

	MasterData masterDataObj = new MasterData();

	private final String SELECT_ALL_VEHICLES = "SELECT * FROM vehicles LIMIT ?, ?;";

	private final String SELECT_VEHICLES_BY_ID = "SELECT * FROM vehicles WHERE vehicle_id = ?;";

	private final String ADD_VEHICLE = "INSERT INTO vehicles (vehicle_number, vehicle_description, vehicle_status, vehicle_types_vehicle_types_id, drivers_driver_id) VALUES (?, ?, ?, ?, ?);";

	private final String UPDATE_VEHICLE = "UPDATE vehicles SET vehicle_number = ?, vehicle_description = ?, vehicle_status = ?, vehicle_types_vehicle_types_id = ?, drivers_driver_id = ? WHERE vehicle_id = ?;";

	private final String SELECT_VEHICLE_TYPE_COUNT = "SELECT COUNT(*) AS vehicles_count FROM vehicles;";

	public boolean insertVehicle(Vehicles vehicles) throws SQLException {
		boolean rowAdded;
		try (Connection connection = masterDataObj.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(ADD_VEHICLE)) {
			preparedStatement.setString(1, vehicles.getVehicle_number());
			preparedStatement.setString(2, vehicles.getVehicle_description());
			preparedStatement.setInt(3, vehicles.getVehicle_status());
			preparedStatement.setInt(4, vehicles.getVehicle_types_vehicle_types_id());
			preparedStatement.setInt(5, vehicles.getDrivers_driver_id());

			System.out.println(preparedStatement);
			rowAdded = preparedStatement.executeUpdate() > 0;
		} catch (SQLException e) {
			masterDataObj.printSQLException(e);
			rowAdded = false;
		}

		return rowAdded;
	}

	public boolean updateVehicle(Vehicles vehicles) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = masterDataObj.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_VEHICLE);) {
			preparedStatement.setString(1, vehicles.getVehicle_number());
			preparedStatement.setString(2, vehicles.getVehicle_description());
			preparedStatement.setInt(3, vehicles.getVehicle_status());
			preparedStatement.setInt(4, vehicles.getVehicle_types_vehicle_types_id());
			preparedStatement.setInt(5, vehicles.getDrivers_driver_id());
			preparedStatement.setInt(6, vehicles.getVehicle_id());

			rowUpdated = preparedStatement.executeUpdate() > 0;
		}
		return rowUpdated;
	}

	public List<Vehicles> selectAllVehicles(int startCount, int recordCount) {

		List<Vehicles> vehicles = new ArrayList<>();

		try (Connection connection = masterDataObj.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_VEHICLES);) {
			preparedStatement.setInt(1, startCount);
			preparedStatement.setInt(2, recordCount);
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {

				int vehicle_id = rs.getInt("vehicle_id");
				String vehicle_number = rs.getString("vehicle_number");
				String vehicle_description = rs.getString("vehicle_description");
				int vehicle_status = rs.getInt("vehicle_status");
				int vehicle_types_vehicle_types_id = rs.getInt("vehicle_types_vehicle_types_id");
				int drivers_driver_id = rs.getInt("drivers_driver_id");

				vehicles.add(new Vehicles(vehicle_id, vehicle_number, vehicle_description, vehicle_status,
						vehicle_types_vehicle_types_id, drivers_driver_id));

			}
		} catch (SQLException e) {
			masterDataObj.printSQLException(e);
		}
		return vehicles;
	}

	public List<Vehicles> selectVehicleID(Vehicles vehicles) {

		List<Vehicles> vehicleDetails = new ArrayList<>();

		try (Connection connection = masterDataObj.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_VEHICLES_BY_ID);) {
			preparedStatement.setInt(1, vehicles.getVehicle_id());
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {

				int vehicle_id = rs.getInt("vehicle_id");
				String vehicle_number = rs.getString("vehicle_number");
				String vehicle_description = rs.getString("vehicle_description");
				int vehicle_status = rs.getInt("vehicle_status");
				int vehicle_types_vehicle_types_id = rs.getInt("vehicle_types_vehicle_types_id");
				int drivers_driver_id = rs.getInt("drivers_driver_id");

				vehicleDetails.add(new Vehicles(vehicle_id, vehicle_number, vehicle_description, vehicle_status,
						vehicle_types_vehicle_types_id, drivers_driver_id));

			}
		} catch (SQLException e) {
			masterDataObj.printSQLException(e);
		}
		return vehicleDetails;
	}

	public int selectVehicleCount() {

		int vehicles_count = 0;

		try (Connection connection = masterDataObj.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_VEHICLE_TYPE_COUNT);) {
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				vehicles_count = rs.getInt("vehicles_count");
			}

		} catch (SQLException e) {
			masterDataObj.printSQLException(e);
		}

		return vehicles_count;
	}

}
