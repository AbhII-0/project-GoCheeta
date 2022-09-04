package com.GoCheeta.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GoCheeta.dao.Booking_FeedbacksDAO;
import com.GoCheeta.dao.BookingsDAO;
import com.GoCheeta.model.Booking_Feedbacks;
import com.GoCheeta.model.Bookings;

@WebServlet("/my-bookings/update")
public class UserBookingUpdateAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Booking_FeedbacksDAO booking_FeedbacksDAO;
	private BookingsDAO bookingsDAO;

	public UserBookingUpdateAdd() {
		super();
	}

	public void init() {
		booking_FeedbacksDAO = new Booking_FeedbacksDAO();
		bookingsDAO = new BookingsDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String servletPath = request.getServletPath();
		System.out.println(servletPath);
		try {
			if (servletPath.equals("/my-bookings/update")) {
				addBookingFeedback(request, response);
			} else {
				System.out.println("servletPath Didn't Match");
			}

		} catch (Exception e) {
			System.out.println(e);
		}

	}

	private void addBookingFeedback(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		System.out.println(request.getParameter("booking-Feedback"));
		if ((request.getParameter("booking-Feedback") != null) && (request.getParameter("booking-Feedback") != "")) {

			String booking_feedback = request.getParameter("booking-Feedback");
			int booking_feedback_rate = 5;
			int bookings_booking_id = Integer.parseInt(request.getParameter("bookingID"));

			Booking_Feedbacks booking_Feedbacks = new Booking_Feedbacks(booking_feedback, booking_feedback_rate,
					bookings_booking_id);
			booking_FeedbacksDAO.insertBookingFeedBack(booking_Feedbacks);

		}

		if (request.getParameter("isBookingCancel") != null) {

			String booking_cancel_reason = request.getParameter("bookingCancelNote");
			int booking_id = Integer.parseInt(request.getParameter("bookingID"));

			Bookings bookings = new Bookings(booking_id, booking_cancel_reason);
			bookingsDAO.userCancelBooking(bookings);

		}

		response.sendRedirect("/GoCheeta/my-bookings");
	}

}
