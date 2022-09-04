package com.GoCheeta.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.GoCheeta.dao.BookingsDAO;
import com.GoCheeta.model.Bookings;

@WebServlet("/my-bookings")
public class UserMyBookings extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookingsDAO bookingsDAO;

	public UserMyBookings() {
		super();
	}

	public void init() {
		bookingsDAO = new BookingsDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String servletPath = request.getServletPath();
		// System.out.println(servletPath);
		try {
			listBookings(request, response);

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	private void listBookings(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {

		int page = 1;
		int recordCount = 8;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		int startCount = (page * recordCount) - recordCount;

		int user_user_id = -1;

		HttpSession session = request.getSession();
		if (session.getAttribute("userId") != null) {
			user_user_id = Integer.parseInt(session.getAttribute("userId").toString());
		}

		List<Bookings> bookings = bookingsDAO.selectAllBookingsWithJoinsByUser(user_user_id, startCount, recordCount);
		request.setAttribute("bookings", bookings);

		int bookingsCount = bookingsDAO.selectBookingCountByUser(user_user_id);
		request.setAttribute("bookingsCount", bookingsCount);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/user/my-bookings/index.jsp");
		dispatcher.forward(request, response);
	}

}
