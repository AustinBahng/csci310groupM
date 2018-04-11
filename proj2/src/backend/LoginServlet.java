package backend;

import java.io.IOException;
import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.Arrays;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson.JacksonFactory;

@WebServlet(name = "login", value = "/login")
public class LoginServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;
  
  private static final Collection<String> SCOPES = Arrays.asList("email");
  private static final JsonFactory JSON_FACTORY = new JacksonFactory();
  private static final HttpTransport HTTP_TRANSPORT = new NetHttpTransport();

  private GoogleAuthorizationCodeFlow flow;

  @Override
  public void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws IOException, ServletException {

    String state = new BigInteger(130, new SecureRandom()).toString(32);  // prevent request forgery
    req.getSession().setAttribute("state", state);
    req.getSession().setAttribute("loginDestination", "/displayPage.jsp");

    flow = new GoogleAuthorizationCodeFlow.Builder(
        HTTP_TRANSPORT,
        JSON_FACTORY,
        "727805399128-v3f41h7dabpqi7pfrnfnj4veoij6j7dg.apps.googleusercontent.com",
        "OZBG93A7xsk6xR6os2TB8qiI",
        SCOPES)
        .build();
    // Callback url should be the one registered in Google Developers Console
    String url =
        flow.newAuthorizationUrl()
            .setRedirectUri("http://localhost:8080/proj2/displayPage.jsp")
            .setState(state)            // Prevent request forgery
            .build();
    resp.sendRedirect(url);
  }
}