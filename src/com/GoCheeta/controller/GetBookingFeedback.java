package com.GoCheeta.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GoCheeta.dao.Booking_FeedbacksDAO;
import com.GoCheeta.model.Booking_Feedbacks;

@WebServlet("/get-booking-feedback")
public class GetBookingFeedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Booking_FeedbacksDAO booking_FeedbacksDAO;

	public GetBookingFeedback() {
		super();
	}

	public void init() {
		booking_FeedbacksDAO = new Booking_FeedbacksDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println(request.getParameter("b-id"));

		String servletPath = request.getServletPath();

		try {
			getBookingFeedback(request, response);

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	private void getBookingFeedback(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {

		response.setContentType("application/json");
		response.setStatus(HttpServletResponse.SC_OK);

		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("Access-Control-Request-Method", "GET");

		if (request.getParameter("b-id") != null) {

			int booking_id = Integer.parseInt(request.getParameter("b-id"));

			List<Booking_Feedbacks> booking_Feedbacks = booking_FeedbacksDAO.selectAllBookingFeedbacksByID(booking_id);
			// request.setAttribute("booking_Feedbacks", booking_Feedbacks);
			if (booking_Feedbacks.size() > 0) {

				int booking_feedback_id = booking_Feedbacks.get(0).getBooking_feedback_id();
				String booking_feedback = booking_Feedbacks.get(0).getBooking_feedback();
				int booking_feedback_rate = booking_Feedbacks.get(0).getBooking_feedback_rate();
				int bookings_booking_id = booking_Feedbacks.get(0).getBookings_booking_id();

				String jsonResponse = "{\"booking_feedback_id\":" + booking_feedback_id + ", \"booking_feedback\":\""
						+ booking_feedback + "\", \"booking_feedback_rate\":" + booking_feedback_rate
						+ " ,\"bookings_booking_id\":" + bookings_booking_id + ", \"status\": true }";
				System.out.println(jsonResponse);
				PrintWriter out = response.getWriter();
				out.println(jsonResponse);
				response.flushBuffer();
				out.flush();
				out.close();

			} else {
				String jsonResponse = "{\"status\": false }";
				System.out.println(jsonResponse);
				PrintWriter out = response.getWriter();
				out.println(jsonResponse);
				response.flushBuffer();
				out.flush();
				out.close();
			}

			// RequestDispatcher dispatcher =
			// request.getRequestDispatcher("/my-bookings");
			// dispatcher.forward(request, response);
		}

	}

}
