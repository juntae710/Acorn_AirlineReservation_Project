package prj0918프로젝트연습;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/sdelete")
public class DeleteServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fcode=req.getParameter("fcode");
		S_flightService s = new S_flightService();
		s.deleteinfo(fcode);
		
		ArrayList<Flight> list = s.getreginfo(fcode);
		
		req.setAttribute("list", list);
		req.getRequestDispatcher("WEB-INF/views/delete.jsp").forward(req, resp);
		
		
		
		 
	}
}
