package backendTests;

import static org.junit.Assert.assertEquals;

import java.io.IOException;

import javax.servlet.ServletException;

import org.junit.Test;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;

import backend.BuildAnotherImageServer;
import backend.LoginServlet;

public class ServletsTest {

	@Test
	public void testBuildAnotherImageServer() throws ServletException, IOException {
		MockHttpServletRequest request = new MockHttpServletRequest();
		MockHttpServletResponse response = new MockHttpServletResponse();

		request.addParameter("topic", "usc");
		request.addParameter("shape", "fight on");
		request.addParameter("filterNum", "0");
		request.addParameter("bordersValue", "1");
		request.addParameter("rotationsValue", "1");
		request.addParameter("collageWidth", "200");
		request.addParameter("collageHeight", "200");

		new BuildAnotherImageServer().service(request, response);

		assertEquals("application/json", response.getContentType());
	}

	@Test
	public void testLoginServlet() throws ServletException, IOException {
		MockHttpServletRequest request = new MockHttpServletRequest();
		MockHttpServletResponse response = new MockHttpServletResponse();

		new LoginServlet().doGet(request, response);

		assertEquals(response.getRedirectedUrl().substring(0, 125),
				"https://accounts.google.com/o/oauth2/auth?client_id="
						+ "727805399128-v3f41h7dabpqi7pfrnfnj4veoij6j7dg.apps.googleusercontent.com&");
	}
}