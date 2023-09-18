package ptj3_1team;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

@WebServlet("/RUS2.do")
public class P_resvationUpdateServlet2 extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String id = "test01";

		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		p_Service s = new p_Service();

		JSONArray arr = s.selectRes(id);
		resp.getWriter().println(arr);
	}
}
