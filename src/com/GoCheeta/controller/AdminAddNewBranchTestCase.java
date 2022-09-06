package com.GoCheeta.controller;

import static org.junit.Assert.assertEquals;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.junit.Test;
import org.mockito.Mockito;

public class AdminAddNewBranchTestCase extends Mockito {

	@Test
	public void test() throws ServletException, IOException {
		HttpServletRequest request = mock(HttpServletRequest.class);
		HttpServletResponse response = mock(HttpServletResponse.class);

		request.getParameter("add-new-branch-name");
		request.getParameter("add-new-branch-loaction");
		request.getParameter("dd-new-branch-cordinate");
		request.getParameter("add-new-branch-status");

		StringWriter stringWriter = new StringWriter();
		PrintWriter writer = new PrintWriter(stringWriter);
		when(response.getWriter()).thenReturn(writer);

		new AddNewBranch().doPost(request, response);

		assertEquals(null, request.getParameter("add-new-branch-name"));
	}

}
