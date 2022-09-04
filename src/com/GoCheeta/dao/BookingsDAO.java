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

	private final String SELECT_BOOKING_COUNT_BY_USER = "SELECT COUNT(*) AS bookings_count FROM bookings WHERE users_user_id = ?;";

	private final String SELECT_BOOKING_COUNT_BY_DRIVER = "SELECT COUNT(*) AS bookings_count FROM bookings WHERE drivers_driver_id = ?;";

	private final String SELCT_ALL_BOOKING_JOIN = "SELECT bookings.*, users.user_name, users.user_tp_number, "
			+ "drivers.driver_user_name, drivers.driver_tp_number, vehicles.vehicle_number, vehicle_types.vehicle_type "
			+ "FROM bookings LEFT JOIN users ON bookings.users_user_id = users.user_id LEFT JOIN drivers "
			+ "ON bookings.drivers_driver_id = drivers.driver_id LEFT JOIN vehicles "
			+ "ON bookings.vehicles_vehicle_id = vehicles.vehicle_id LEFT JOIN vehicle_types "
			+ "ON bookings.vehicle_types_vehicle_types_id = vehicle_types.vehicle_types_id ORDER BY booking_id DESC LIMIT ?, ?;";

	private final String SELCT_ALL_BOOKING_JOIN_BY_USER = "SELECT bookings.*, users.user_name, users.user_tp_number, "
			+ "drivers.driver_user_name, drivers.driver_tp_number, vehicles.vehicle_number, vehicle_types.vehicle_type "
			+ "FROM bookings LEFT JOIN users ON bookings.users_user_id = users.user_id LEFT JOIN drivers "
			+ "ON bookings.drivers_driver_id = drivers.driver_id LEFT JOIN vehicles "
			+ "ON bookings.vehicles_vehicle_id = vehicles.vehicle_id LEFT JOIN vehicle_types "
			+ "ON bookings.vehicle_types_vehicle_types_id = vehicle_types.vehicle_types_id "
			+ "WHERE users_user_id = ? ORDER BY booking_id DESC LIMIT ?, ?;";

	private final String SELCT_ALL_BOOKING_JOIN_BY_DRIVER = "SELECT bookings.*, users.user_name, users.user_tp_number, "
			+ "drivers.driver_user_name, drivers.driver_tp_number, vehicles.vehicle_number, vehicle_types.vehicle_type "
			+ "FROM bookings LEFT JOIN users ON bookings.users_user_id = users.user_id LEFT JOIN drivers "
			+ "ON bookings.drivers_driver_id = drivers.driver_id LEFT JOIN vehicles "
			+ "ON bookings.vehicles_vehicle_id = vehicles.vehicle_id LEFT JOIN vehicle_types "
			+ "ON bookings.vehicle_types_vehicle_types_id = vehicle_types.vehicle_types_id "
			+ "WHERE bookings.drivers_driver_id = ? ORDER BY booking_id DESC LIMIT ?, ?;";

	private final String ADD_BOOKING_USER = "INSERT INTO bookings "
			+ "(booking_name, booking_start_location, booking_start_location_cordinate, booking_end_location, booking_endt_location_cordinate, bookin_charge, booking_status, users_user_id, vehicle_types_vehicle_types_id ) "
			+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

	private final String USER_CANCEL_BOOKING = "UPDATE bookings SET booking_user_status = ?, booking_status = ?, "
			+ "booking_cancel_reason = ? WHERE booking_id = ?;";

	private final String SELECT_DRIVER_NULL_BOOKINGS = "SELECT * FROM bookings WHERE (drivers_driver_id IS NULL) AND (booking_status = 'PENDING') "
			+ "ORDER BY booking_id DESC LIMIT ?, ?;";

	private final String SELECT_DRIVER_NULL_BOOKINGS_COUNT = "SELECT COUNT(*) as bookings_count FROM bookings WHERE drivers_driver_id IS NULL;";

	private final String PICK_DRIVER_BOOKING = "UPDATE bookings SET drivers_driver_id = ? WHERE booking_id = ?;";

	private final String FIND_DRIVER_HAVE_VEHICLE = "SELECT vehicles.* FROM vehicles JOIN drivers "
			+ "ON vehicles.drivers_driver_id = drivers.driver_id "
			+ "WHERE vehicles.vehicle_types_vehicle_types_id = ? AND vehicles.drivers_driver_id = ?;";

	private final String DRIVER_START_BOOKING = "UPDATE bookings SET vehicles_vehicle_id = ?, booking_status = ? WHERE booking_id = ?;";

	private final String UPDATE_USER_PICK = "UPDATE bookings SET booking_driver_get_user = 1, booking_driver_get_user_time = current_timestamp() WHERE booking_id = ?;";

	private final String UPDATE_USER_DROP = "UPDATE bookings SET booking_driver_drop_user = 1, booking_driver_drop_user_time = current_timestamp(), booking_status = 'COMPLETE' WHERE booking_id = ?;";

	private final String DRIVER_CANCEL_BOOKING = "UPDATE bookings SET booking_driver_status = ?, booking_status = ?, "
			+ "booking_cancel_reason = ? WHERE booking_id = ?;";

	private final String DRIVER_REVNUE = "SELECT SUM(bookin_charge) AS REV FROM bookings WHERE (drivers_driver_id = ?) AND (booking_status = 'COMPLETE');";

	private final String SELECT_REVNUE = "SELECT SUM(bookin_charge) AS REV FROM bookings WHERE booking_status = 'COMPLETE';";

	private final String GET_MONTHLY_REV_BY_DRIVER = "SELECT SUM(bookin_charge) AS rev, MONTH(booking_time) AS mnth FROM bookings "
			+ "WHERE (drivers_driver_id = ?) AND (booking_status = 'COMPLETE') GROUP BY MONTH(bookin_charge) ORDER BY mnth DESC;";

	private final String GET_MONTHLY_REV = "SELECT SUM(bookin_charge) AS rev, MONTH(booking_time) AS mnth FROM bookings "
			+ "WHERE booking_status = 'COMPLETE' GROUP BY MONTH(bookin_charge) ORDER BY mnth DESC;";

	public List<Bookings> selectMnthRev() {

		List<Bookings> bookings = new ArrayList<>();

		try (Connection connection = masterDataObj.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(GET_MONTHLY_REV);) {
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {

				double rev = rs.getDouble("rev");
				int mnth = rs.getInt("mnth");

				bookings.add(new Bookings(rev, mnth));

			}
		} catch (SQLException e) {
			masterDataObj.printSQLException(e);
		}
		return bookings;
	}

	public List<Bookings> selectDriverMnthRev(int driver_id) {

		List<Bookings> bookings = new ArrayList<>();

		try (Connection connection = masterDataObj.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(GET_MONTHLY_REV_BY_DRIVER);) {
			preparedStatement.setInt(1, driver_id);
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {

				double rev = rs.getDouble("rev");
				int mnth = rs.getInt("mnth");

				bookings.add(new Bookings(rev, mnth));

			}
		} catch (SQLException e) {
			masterDataObj.printSQLException(e);
		}
		return bookings;
	}

	public double selectRev() {

		double rev = 0;

		try (Connection connection = masterDataObj.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_REVNUE);) {
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				rev = rs.getInt("REV");
			}

		} catch (SQLException e) {
			masterDataObj.printSQLException(e);
		}

		return rev;
	}

	public double selectDriverRev(int drivers_driver_id) {

		double rev = 0;

		try (Connection connection = masterDataObj.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(DRIVER_REVNUE);) {
			preparedStatement.setInt(1, drivers_driver_id);
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				rev = rs.getInt("REV");
			}

		} catch (SQLException e) {
			masterDataObj.printSQLException(e);
		}

		return rev;
	}

	public boolean driverCancelBooking(String booking_cancel_reason, int booking_id) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = masterDataObj.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(DRIVER_CANCEL_BOOKING);) {
			preparedStatement.setString(1, "CANCEL");
			preparedStatement.setString(2, "DRIVER CANCEL");
			preparedStatement.setString(3, booking_cancel_reason);
			preparedStatement.setInt(4, booking_id);
			System.out.println(preparedStatement);
			rowUpdated = preparedStatement.executeUpdate() > 0;
		}
		return rowUpdated;
	}

	public boolean driverDropUser(int booking_id) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = masterDataObj.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER_DROP);) {
			preparedStatement.setInt(1, booking_id);
			System.out.println(preparedStatement);
			rowUpdated = preparedStatement.executeUpdate() > 0;
		}
		return rowUpdated;
	}

	public boolean driverPickUser(int booking_id) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = masterDataObj.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER_PICK);) {
			preparedStatement.setInt(1, booking_id);
			System.out.println(preparedStatement);
			rowUpdated = preparedStatement.executeUpdate() > 0;
		}
		return rowUpdated;
	}

	public boolean driverStartBooking(int vehicles_vehicle_id, int booking_id) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = masterDataObj.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(DRIVER_START_BOOKING);) {
			preparedStatement.setInt(1, vehicles_vehicle_id);
			preparedStatement.setString(2, "ONGOING");
			preparedStatement.setInt(3, booking_id);
			System.out.println(preparedStatement);
			rowUpdated = preparedStatement.executeUpdate() > 0;
		}
		return rowUpdated;
	}

	public boolean findDriverHaveVehiclesr(int vehicle_types_id, int drivers_driver_id) throws SQLException {
		boolean selectRow;

		try (Connection connection = masterDataObj.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(FIND_DRIVER_HAVE_VEHICLE);) {
			preparedStatement.setInt(1, vehicle_types_id);
			preparedStatement.setInt(2, drivers_driver_id);
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

	public boolean driverPickBooking(int drivers_driver_id, int booking_id) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = masterDataObj.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(PICK_DRIVER_BOOKING);) {
			preparedStatement.setInt(1, drivers_driver_id);
			preparedStatement.setInt(2, booking_id);
			System.out.println(preparedStatement);
			rowUpdated = preparedStatement.executeUpdate() > 0;
		}
		return rowUpdated;
	}

	public int selectBookingCountDriverNull() {

		int bookingCount = 0;

		try (Connection connection = masterDataObj.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_DRIVER_NULL_BOOKINGS_COUNT);) {
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

	public List<Bookings> selectAllBookingsDriverNull(int startCount, int recordCount) {

		List<Bookings> bookings = new ArrayList<>();

		try (Connection connection = masterDataObj.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_DRIVER_NULL_BOOKINGS);) {
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
				int vehicle_types_vehicle_types_id = -1;
				if (rs.getString("vehicle_types_vehicle_types_id") != null) {
					vehicle_types_vehicle_types_id = rs.getInt("vehicle_types_vehicle_types_id");
				}

				bookings.add(new Bookings(booking_id, booking_name, booking_create_time, booking_time,
						booking_start_location, booking_start_location_cordinate, booking_end_location,
						booking_endt_location_cordinate, bookin_charge, booking_driver_get_user,
						booking_driver_get_user_time, booking_driver_drop_user, booking_driver_drop_user_time,
						booking_user_status, booking_driver_status, booking_status, booking_cancel_reason,
						users_user_id, drivers_driver_id, vehicle_types_vehicle_types_id, vehicles_vehicle_id));

			}
		} catch (SQLException e) {
			masterDataObj.printSQLException(e);
		}
		return bookings;
	}

	public boolean userCancelBooking(Bookings bookings) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = masterDataObj.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(USER_CANCEL_BOOKING);) {
			preparedStatement.setString(1, "CANCEL");
			preparedStatement.setString(2, "USER CANCEL");
			preparedStatement.setString(3, bookings.getBooking_cancel_reason());
			preparedStatement.setInt(4, bookings.getBooking_id());
			System.out.println(preparedStatement);
			rowUpdated = preparedStatement.executeUpdate() > 0;
		}
		return rowUpdated;
	}

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

	public int selectBookingCountByUser(int users_user_id) {

		int bookingCount = 0;

		try (Connection connection = masterDataObj.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BOOKING_COUNT_BY_USER);) {
			preparedStatement.setInt(1, users_user_id);
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

	public int selectBookingCountByDriver(int driver_id) {

		int bookingCount = 0;

		try (Connection connection = masterDataObj.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BOOKING_COUNT_BY_DRIVER);) {
			preparedStatement.setInt(1, driver_id);
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

	public List<Bookings> selectAllBookingsWithJoinsByUser(int user_id, int startCount, int recordCount) {

		List<Bookings> bookings = new ArrayList<>();

		try (Connection connection = masterDataObj.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(SELCT_ALL_BOOKING_JOIN_BY_USER);) {
			preparedStatement.setInt(1, user_id);
			preparedStatement.setInt(2, startCount);
			preparedStatement.setInt(3, recordCount);
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

	public List<Bookings> selectAllBookingsWithJoinsByDriver(int driver_id, int startCount, int recordCount) {

		List<Bookings> bookings = new ArrayList<>();

		try (Connection connection = masterDataObj.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(SELCT_ALL_BOOKING_JOIN_BY_DRIVER);) {
			preparedStatement.setInt(1, driver_id);
			preparedStatement.setInt(2, startCount);
			preparedStatement.setInt(3, recordCount);
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
				int vehicle_types_vehicle_types_id = -1;
				if (rs.getString("vehicle_types_vehicle_types_id") != null) {
					vehicle_types_vehicle_types_id = rs.getInt("vehicle_types_vehicle_types_id");
				}

				System.out.println(booking_driver_get_user_time);
				System.out.println(booking_driver_drop_user_time);

				bookings.add(new Bookings(booking_id, booking_name, booking_create_time, booking_time,
						booking_start_location, booking_start_location_cordinate, booking_end_location,
						booking_endt_location_cordinate, bookin_charge, booking_driver_get_user,
						booking_driver_get_user_time, booking_driver_drop_user, booking_driver_drop_user_time,
						booking_user_status, booking_driver_status, booking_status, booking_cancel_reason,
						users_user_id, drivers_driver_id, vehicle_types_vehicle_types_id, vehicles_vehicle_id,
						user_name, user_tp_number, driver_user_name, driver_tp_number, vehicle_number, vehicle_type));

			}
		} catch (SQLException e) {
			masterDataObj.printSQLException(e);
		}
		return bookings;
	}

	public boolean addBookingUser(Bookings bookings) throws SQLException {
		boolean rowAdded;
		try (Connection connection = masterDataObj.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(ADD_BOOKING_USER)) {
			preparedStatement.setString(1, bookings.getBooking_name());
			preparedStatement.setString(2, bookings.getBooking_start_location());
			preparedStatement.setString(3, bookings.getBooking_start_location_cordinate());
			preparedStatement.setString(4, bookings.getBooking_end_location());
			preparedStatement.setString(5, bookings.getBooking_endt_location_cordinate());
			preparedStatement.setDouble(6, bookings.getBookin_charge());
			preparedStatement.setString(7, bookings.getBooking_status());
			preparedStatement.setInt(8, bookings.getUsers_user_id());
			preparedStatement.setInt(9, bookings.getvehicle_types_vehicle_types_id());

			System.out.println(preparedStatement);
			rowAdded = preparedStatement.executeUpdate() > 0;
		} catch (SQLException e) {
			masterDataObj.printSQLException(e);
			rowAdded = false;
		}

		return rowAdded;
	}

}
