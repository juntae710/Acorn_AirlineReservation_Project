package prj3_1;

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
		
		String resno= req.getParameter("resno");
		//System.out.println(resno);
		int resNo = Integer.parseInt(resno);
		S_flightService sservice = new S_flightService();
		//ArrayList<Flight> list = sservice.getreginfo(fcode);
		
		
		
		//System.out.println( "F="  + f);
		
		AirlineService as = new AirlineService();
		as.deleteSeatInfo(resNo);
		Flight2 f = sservice.getreginfo(resno);
		as.deleteCusInfo(resNo);
	 
		
		req.setAttribute("flight", f);
		req.getRequestDispatcher("WEB-INF/views/S_check2.jsp").forward(req, resp);
		
	}
}
