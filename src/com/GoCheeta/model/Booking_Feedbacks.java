package com.GoCheeta.model;

public class Booking_Feedbacks {

	protected int booking_feedback_id;
	protected String booking_feedback;
	protected int booking_feedback_rate;
	protected int bookings_booking_id;

	public Booking_Feedbacks(int booking_feedback_id, String booking_feedback, int booking_feedback_rate,
			int bookings_booking_id) {
		super();
		this.booking_feedback_id = booking_feedback_id;
		this.booking_feedback = booking_feedback;
		this.booking_feedback_rate = booking_feedback_rate;
		this.bookings_booking_id = bookings_booking_id;
	}

	public Booking_Feedbacks(String booking_feedback, int booking_feedback_rate, int bookings_booking_id) {
		super();
		this.booking_feedback = booking_feedback;
		this.booking_feedback_rate = booking_feedback_rate;
		this.bookings_booking_id = bookings_booking_id;
	}

	public int getBooking_feedback_id() {
		return booking_feedback_id;
	}

	public void setBooking_feedback_id(int booking_feedback_id) {
		this.booking_feedback_id = booking_feedback_id;
	}

	public String getBooking_feedback() {
		return booking_feedback;
	}

	public void setBooking_feedback(String booking_feedback) {
		this.booking_feedback = booking_feedback;
	}

	public int getBooking_feedback_rate() {
		return booking_feedback_rate;
	}

	public void setBooking_feedback_rate(int booking_feedback_rate) {
		this.booking_feedback_rate = booking_feedback_rate;
	}

	public int getBookings_booking_id() {
		return bookings_booking_id;
	}

	public void setBookings_booking_id(int bookings_booking_id) {
		this.bookings_booking_id = bookings_booking_id;
	}

}
