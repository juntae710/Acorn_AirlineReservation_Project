package prj0918프로젝트연습;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/scheck")
public class S_flightServlet2 extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fcode=req.getParameter("fcode");
		

		S_flightService sservice = new S_flightService();
		ArrayList<Flight> list = sservice.getreginfo(fcode);
		System.out.println(list);
		
		req.setAttribute("list", list);
		req.getRequestDispatcher("WEB-INF/views/check.jsp").forward(req, resp);
		
	}
}
