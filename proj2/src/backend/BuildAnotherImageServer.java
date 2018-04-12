package backend;

import java.io.IOException;
import java.util.Base64;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class BuildAnotherImageServer
 */
@WebServlet("/BuildAnotherImageServer")
public class BuildAnotherImageServer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String querry = (String) request.getParameter("topic");
		String shape = (String) request.getParameter("shape");
		String tempFilterNum = (String) request.getParameter("filterNum");
		System.out.println("FILTER NUMBER:");
		System.out.println(tempFilterNum);
		int filterNum = Integer.parseInt(tempFilterNum);
		String tempBordersValue = (String) request.getParameter("bordersValue");
		System.out.println("BORDERS VALUE:");
		System.out.println(tempBordersValue);
		int bordersValue = Integer.parseInt(tempBordersValue);

		String tempRotationsValue = (String) request.getParameter("rotationsValue");
		System.out.println("ROTATIONS VALUE:");
		System.out.println(tempRotationsValue);
		int rotationsValue = Integer.parseInt(tempRotationsValue);

		String tempWidthValue = (String) request.getParameter("collageWidth");
		System.out.println("WIDTH VALUE:");
		System.out.println(tempWidthValue);
		int collageWidth = Integer.parseInt(tempWidthValue);

		String tempHeightValue = (String) request.getParameter("collageHeight");
		System.out.println("Height VALUE:");
		System.out.println(tempHeightValue);
		int collageHeight = Integer.parseInt(tempWidthValue);

		CollageBuilder cb = new CollageBuilder();
		Collage collage = cb.buildCollage(querry, shape, filterNum, rotationsValue, bordersValue, collageWidth,
				collageHeight);

		byte[] encoded = Base64.getEncoder().encode(collage.getImage());
		String collageImageStr = new String(encoded);
		String collageTitle = collage.getTitle();

		Map<String, String> options = new LinkedHashMap<>();
		options.put("collageTitle", collageTitle);
		options.put("collageImage", collageImageStr);
		options.put("collageValid", String.valueOf(collage.getDisplay()));
		String json = new Gson().toJson(options);

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
	}

}
