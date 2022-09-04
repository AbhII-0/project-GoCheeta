package com.GoCheeta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.GoCheeta.common.MasterData;
import com.GoCheeta.model.Booking_Feedbacks;

public class Booking_FeedbacksDAO {

	MasterData masterDataObj = new MasterData();

	private final String GET_ALL_BOOKING_FEEDBACKS = "SELECT * from booking_feedbacks;";

	private final String INSERT_INTO_BOOKING_FEEDBACK = "INSERT INTO booking_feedbacks (booking_feedback, booking_feedback_rate, bookings_booking_id) "
			+ "VALUES (?, ?, ?);";

	private final String GET_ALL_BOOKING_FEEDBACKS_BY_ID = "SELECT * from booking_feedbacks WHERE bookings_booking_id = ?;";

	public boolean insertBookingFeedBack(Booking_Feedbacks booking_Feedbacks) throws SQLException {
		boolean rowAdded;
		try (Connection connection = masterDataObj.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_BOOKING_FEEDBACK)) {
			preparedStatement.setString(1, booking_Feedbacks.getBooking_feedback());
			preparedStatement.setInt(2, booking_Feedbacks.getBooking_feedback_rate());
			preparedStatement.setInt(3, booking_Feedbacks.getBookings_booking_id());

			System.out.println(preparedStatement);
			rowAdded = preparedStatement.executeUpdate() > 0;
		} catch (SQLException e) {
			masterDataObj.printSQLException(e);
			rowAdded = false;
		}

		return rowAdded;
	}

	public List<Booking_Feedbacks> selectAllBookingFeedbacks() {

		List<Booking_Feedbacks> booking_Feedbacks = new ArrayList<>();

		try (Connection connection = masterDataObj.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_BOOKING_FEEDBACKS);) {

			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {

				int booking_feedback_id = rs.getInt("driver_id");
				String booking_feedback = rs.getString("driver_user_name");
				int booking_feedback_rate = rs.getInt("driver_account_status");
				int bookings_booking_id = rs.getInt("driver_account_verification");

				booking_Feedbacks.add(new Booking_Feedbacks(booking_feedback_id, booking_feedback,
						booking_feedback_rate, bookings_booking_id));
			}
		} catch (SQLException e) {
			masterDataObj.printSQLException(e);
		}
		return booking_Feedbacks;
	}

	public List<Booking_Feedbacks> selectAllBookingFeedbacksByID(int booking_id) {

		List<Booking_Feedbacks> booking_Feedbacks = new ArrayList<>();

		try (Connection connection = masterDataObj.getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_BOOKING_FEEDBACKS_BY_ID);) {
			preparedStatement.setInt(1, booking_id);
			System.out.println(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {

				int booking_feedback_id = rs.getInt("booking_feedback_id");
				String booking_feedback = rs.getString("booking_feedback");
				int booking_feedback_rate = rs.getInt("booking_feedback_rate");
				int bookings_booking_id = rs.getInt("bookings_booking_id");

				booking_Feedbacks.add(new Booking_Feedbacks(booking_feedback_id, booking_feedback,
						booking_feedback_rate, bookings_booking_id));
			}
		} catch (SQLException e) {
			masterDataObj.printSQLException(e);
		}
		return booking_Feedbacks;
	}

}
