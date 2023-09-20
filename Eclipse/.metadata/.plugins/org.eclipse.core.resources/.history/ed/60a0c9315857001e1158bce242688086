package prj_airline;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
@WebServlet("/flight.do")
public class FlightServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		req.getRequestDispatcher("WEB-INF/views/flight.jsp").forward(req, resp);
		 
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		String fromData = req.getParameter("fromData");
		String toData = req.getParameter("toData");
		String dateData = req.getParameter("dateData");
	
		AirlineService schedule = new AirlineService();
		AirlineDAO dao = new AirlineDAO();
		String[] splitFrom = schedule.splitList(fromData);
		String[] splitTo = schedule.splitList(toData);
		ArrayList<Flight> flightList = schedule.getSchedule(splitFrom[1], splitTo[1], dateData);
		PrintWriter ws = resp.getWriter();
		ws.println(splitFrom[1]+splitTo[1]+dateData);
		System.out.println(splitFrom[1]+splitTo[1]+dateData);
		ws.println(flightList);

	}

}
