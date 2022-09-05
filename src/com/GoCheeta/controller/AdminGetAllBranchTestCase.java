package com.GoCheeta.controller;

import static org.junit.Assert.assertEquals;

import java.io.IOException;

import javax.servlet.ServletException;

import org.apache.sling.servlethelpers.MockSlingHttpServletRequest;
import org.apache.sling.servlethelpers.MockSlingHttpServletResponse;
import org.junit.BeforeClass;
import org.junit.Test;

import io.wcm.testing.mock.aem.junit.AemContext;

public class AdminGetAllBranchTestCase {

	AemContext aemContext = new AemContext();
	BranchesServelet branchesServerletTestObj = new BranchesServelet();

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@Test
	public void test() throws ServletException, IOException {

		MockSlingHttpServletRequest request = aemContext.request();
		MockSlingHttpServletResponse response = aemContext.response();

		String branchCount = "7";

		branchesServerletTestObj.doGet(request, response);

		assertEquals(branchCount, response.getOutputAsString());

	}

}
