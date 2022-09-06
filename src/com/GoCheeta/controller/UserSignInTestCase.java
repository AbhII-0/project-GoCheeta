package com.GoCheeta.controller;

import static org.junit.Assert.assertEquals;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.junit.Test;
import org.mockito.Mockito;

public class UserSignInTestCase extends Mockito {

	@Test
	public void test() throws ServletException, IOException {

		HttpServletRequest request = mock(HttpServletRequest.class);
		HttpServletResponse response = mock(HttpServletResponse.class);

		request.setAttribute("userName", "user01");
		request.setAttribute("password", "1234");

		new UserLogIn().doPost(request, response);

		assertEquals(null, request.getParameter("userName"));

	}

}
