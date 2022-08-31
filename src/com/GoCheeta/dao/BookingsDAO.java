package com.GoCheeta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.GoCheeta.common.MasterData;
import com.GoCheeta.model.Bookings;

public class BookingsDAO {

	MasterData masterDataObj = new MasterData();

	private final String SELECT_ALL_BOOKINGS = "SELECT * FROM bookings LIMIT ?, ?;";

	private final String SELECT_BOOKING_BY_ID = "SELECT * FROM bookings WHERE booking_id = ?;";

	private final String SELECT_BOOKING_COUNT = "SELECT COUNT(*) AS bookings_count FROM bookings;";

	private final String SELCT_ALL_BOOKING_JOIN = "SELECT bookings.*, users.user_name, users.user_tp_number, "
			+ "drivers.driver_user_name, drivers.driver_tp_number, vehicles.vehicle_number, vehicle_types.vehicle_type "
			+ "FROM bookings JOIN users ON bookings.users_user_id = users.user_id JOIN drivers "
			+ "ON bookings.drivers_driver_id = drivers.driver_id JOIN vehicles "
			+ "ON bookings.vehicles_vehicle_id = vehicles.vehicle_id JOIN vehicle_types "
			+ "ON vehicles.vehicle_types_vehicle_types_id = vehicle_types.vehicle_types_id LIMIT ?, ?;";

	// private final String ADD_BOOKING = "INSERT INTO bookings "
	// + "(booking_name, booking_start_location,
	// booking_start_location_cordinate, booking_end_location,
	// booking_endt_location_cordinate, bookin_charge, booking_driver_get_user,)
	// "
	// + "VALUES "
	// + "(?, ?);";

	public List<Bookings> selectAllBookings(int startCount, int recordCount) {

		List<Bookings> bookings = new ArrayList<>();

		try (Connection connection = masterDataObj.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_BOOKINGS);) {
			preparedStatement.setInt(1, startCount);
			preparedStatement.setInt(2, recordCount);
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {

				int booking_id = -1;
				if (rs.getString("booking_id") != null) {
					booking_id = rs.getInt("booking_id");
				}
				String booking_name = null;
				if (rs.getString("booking_name") != null) {
					booking_name = rs.getString("booking_name");
				}
				String booking_create_time = null;
				if (rs.getString("booking_create_time") != null) {
					booking_create_time = rs.getString("booking_create_time");
				}
				String booking_time = null;
				if (rs.getString("booking_time") != null) {
					booking_time = rs.getString("booking_time");
				}
				String booking_start_location = null;
				if (rs.getString("booking_start_location") != null) {
					booking_start_location = rs.getString("booking_start_location");
				}
				String booking_start_location_cordinate = null;
				if (rs.getString("booking_start_location_cordinate") != null) {
					booking_start_location_cordinate = rs.getString("booking_start_location_cordinate");
				}
				String booking_end_location = null;
				if (rs.getString("booking_end_location") != null) {
					booking_end_location = rs.getString("booking_end_location");
				}
				String booking_endt_location_cordinate = null;
				if (rs.getString("booking_endt_location_cordinate") != null) {
					booking_endt_location_cordinate = rs.getString("booking_endt_location_cordinate");
				}
				double bookin_charge = -1;
				if (rs.getString("bookin_charge") != null) {
					bookin_charge = rs.getDouble("bookin_charge");
				}
				int booking_driver_get_user = -1;
				if (rs.getString("booking_driver_get_user") != null) {
					booking_driver_get_user = rs.getInt("booking_driver_get_user");
				}
				String booking_driver_get_user_time = null;
				if (rs.getString("booking_driver_get_user_time") != null) {
					booking_driver_get_user_time = rs.getString("booking_driver_get_user_time");
				}
				int booking_driver_drop_user = -1;
				if (rs.getString("booking_driver_drop_user") != null) {
					booking_driver_drop_user = rs.getInt("booking_driver_drop_user");
				}
				String booking_driver_drop_user_time = null;
				if (rs.getString("booking_driver_drop_user_time") != null) {
					booking_driver_drop_user_time = rs.getString("booking_driver_drop_user_time");
				}
				String booking_user_status = null;
				if (rs.getString("booking_user_status") != null) {
					booking_user_status = rs.getString("booking_user_status");
				}
				String booking_driver_status = null;
				if (rs.getString("booking_driver_status") != null) {
					booking_driver_status = rs.getString("booking_driver_status");
				}
				String booking_status = null;
				if (rs.getString("booking_status") != null) {
					booking_status = rs.getString("booking_status");
				}
				String booking_cancel_reason = null;
				if (rs.getString("booking_cancel_reason") != null) {
					booking_cancel_reason = rs.getString("booking_cancel_reason");
				}
				int users_user_id = -1;
				if (rs.getString("users_user_id") != null) {
					users_user_id = rs.getInt("users_user_id");
				}
				int drivers_driver_id = -1;
				if (rs.getString("drivers_driver_id") != null) {
					drivers_driver_id = rs.getInt("drivers_driver_id");
				}
				int vehicles_vehicle_id = -1;
				if (rs.getString("vehicles_vehicle_id") != null) {
					vehicles_vehicle_id = rs.getInt("vehicles_vehicle_id");
				}

				bookings.add(new Bookings(booking_id, booking_name, booking_create_time, booking_time,
						booking_start_location, booking_start_location_cordinate, booking_end_location,
						booking_endt_location_cordinate, bookin_charge, booking_driver_get_user,
						booking_driver_get_user_time, booking_driver_drop_user, booking_driver_drop_user_time,
						booking_user_status, booking_driver_status, booking_status, booking_cancel_reason,
						users_user_id, drivers_driver_id, vehicles_vehicle_id));

			}
		} catch (SQLException e) {
			masterDataObj.printSQLException(e);
		}
		return bookings;
	}

	public int selectBookingCount() {

		int bookingCount = 0;

		try (Connection connection = masterDataObj.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BOOKING_COUNT);) {
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				bookingCount = rs.getInt("bookings_count");
			}

		} catch (SQLException e) {
			masterDataObj.printSQLException(e);
		}

		return bookingCount;
	}

	public List<Bookings> selectAllBookingsWithJoins(int startCount, int recordCount) {

		List<Bookings> bookings = new ArrayList<>();

		try (Connection connection = masterDataObj.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(SELCT_ALL_BOOKING_JOIN);) {
			preparedStatement.setInt(1, startCount);
			preparedStatement.setInt(2, recordCount);
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {

				int booking_id = -1;
				if (rs.getString("booking_id") != null) {
					booking_id = rs.getInt("booking_id");
				}
				String booking_name = null;
				if (rs.getString("booking_name") != null) {
					booking_name = rs.getString("booking_name");
				}
				String booking_create_time = null;
				if (rs.getString("booking_create_time") != null) {
					booking_create_time = rs.getString("booking_create_time");
				}
				String booking_time = null;
				if (rs.getString("booking_time") != null) {
					booking_time = rs.getString("booking_time");
				}
				String booking_start_location = null;
				if (rs.getString("booking_start_location") != null) {
					booking_start_location = rs.getString("booking_start_location");
				}
				String booking_start_location_cordinate = null;
				if (rs.getString("booking_start_location_cordinate") != null) {
					booking_start_location_cordinate = rs.getString("booking_start_location_cordinate");
				}
				String booking_end_location = null;
				if (rs.getString("booking_end_location") != null) {
					booking_end_location = rs.getString("booking_end_location");
				}
				String booking_endt_location_cordinate = null;
				if (rs.getString("booking_endt_location_cordinate") != null) {
					booking_endt_location_cordinate = rs.getString("booking_endt_location_cordinate");
				}
				double bookin_charge = -1;
				if (rs.getString("bookin_charge") != null) {
					bookin_charge = rs.getDouble("bookin_charge");
				}
				int booking_driver_get_user = -1;
				if (rs.getString("booking_driver_get_user") != null) {
					booking_driver_get_user = rs.getInt("booking_driver_get_user");
				}
				String booking_driver_get_user_time = null;
				if (rs.getString("booking_driver_get_user_time") != null) {
					booking_driver_get_user_time = rs.getString("booking_driver_get_user_time");
				}
				int booking_driver_drop_user = -1;
				if (rs.getString("booking_driver_drop_user") != null) {
					booking_driver_drop_user = rs.getInt("booking_driver_drop_user");
				}
				String booking_driver_drop_user_time = null;
				if (rs.getString("booking_driver_drop_user_time") != null) {
					booking_driver_drop_user_time = rs.getString("booking_driver_drop_user_time");
				}
				String booking_user_status = null;
				if (rs.getString("booking_user_status") != null) {
					booking_user_status = rs.getString("booking_user_status");
				}
				String booking_driver_status = null;
				if (rs.getString("booking_driver_status") != null) {
					booking_driver_status = rs.getString("booking_driver_status");
				}
				String booking_status = null;
				if (rs.getString("booking_status") != null) {
					booking_status = rs.getString("booking_status");
				}
				String booking_cancel_reason = null;
				if (rs.getString("booking_cancel_reason") != null) {
					booking_cancel_reason = rs.getString("booking_cancel_reason");
				}
				int users_user_id = -1;
				if (rs.getString("users_user_id") != null) {
					users_user_id = rs.getInt("users_user_id");
				}
				int drivers_driver_id = -1;
				if (rs.getString("drivers_driver_id") != null) {
					drivers_driver_id = rs.getInt("drivers_driver_id");
				}
				int vehicles_vehicle_id = -1;
				if (rs.getString("vehicles_vehicle_id") != null) {
					vehicles_vehicle_id = rs.getInt("vehicles_vehicle_id");
				}
				String user_name = null;
				if (rs.getString("user_name") != null) {
					user_name = rs.getString("user_name");
				}
				String user_tp_number = null;
				if (rs.getString("user_tp_number") != null) {
					user_tp_number = rs.getString("user_tp_number");
				}
				String driver_user_name = null;
				if (rs.getString("driver_user_name") != null) {
					driver_user_name = rs.getString("driver_user_name");
				}
				String driver_tp_number = null;
				if (rs.getString("driver_tp_number") != null) {
					driver_tp_number = rs.getString("driver_tp_number");
				}
				String vehicle_number = null;
				if (rs.getString("vehicle_number") != null) {
					vehicle_number = rs.getString("vehicle_number");
				}
				String vehicle_type = null;
				if (rs.getString("vehicle_type") != null) {
					vehicle_type = rs.getString("vehicle_type");
				}

				System.out.println(booking_driver_get_user_time);
				System.out.println(booking_driver_drop_user_time);

				bookings.add(new Bookings(booking_id, booking_name, booking_create_time, booking_time,
						booking_start_location, booking_start_location_cordinate, booking_end_location,
						booking_endt_location_cordinate, bookin_charge, booking_driver_get_user,
						booking_driver_get_user_time, booking_driver_drop_user, booking_driver_drop_user_time,
						booking_user_status, booking_driver_status, booking_status, booking_cancel_reason,
						users_user_id, drivers_driver_id, vehicles_vehicle_id, user_name, user_tp_number,
						driver_user_name, driver_tp_number, vehicle_number, vehicle_type));

			}
		} catch (SQLException e) {
			masterDataObj.printSQLException(e);
		}
		return bookings;
	}

}
