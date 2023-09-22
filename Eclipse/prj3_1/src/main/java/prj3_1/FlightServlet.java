package prj3_1;

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
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		String fromData = req.getParameter("fromData");
		String toData = req.getParameter("toData");
		String dateData = req.getParameter("dateData");
		String selectedGrade = req.getParameter("selectedGrade");
		
		AirlineService schedule = new AirlineService();
		AirlineDAO dao = new AirlineDAO();
		String[] splitFrom = schedule.splitList(fromData);
		String[] splitTo = schedule.splitList(toData);
		ArrayList<Schedule> flightList = schedule.getSchedule(splitFrom[1], splitTo[1], dateData);
		HttpSession session  = req.getSession();
		session.setAttribute("scheduleList", flightList);
		session.setAttribute("grade", selectedGrade);
		session.setAttribute("fromCode", splitFrom[0]);
		session.setAttribute("toCode", splitTo[0]);
		
			if(selectedGrade.equals("이코노미석")) {
				
				req.getRequestDispatcher("WEB-INF/views/flight.jsp").forward(req, resp);
			}
			else{
				req.getRequestDispatcher("WEB-INF/views/flightBsn.jsp").forward(req, resp);
			}
		
		

	}

}
