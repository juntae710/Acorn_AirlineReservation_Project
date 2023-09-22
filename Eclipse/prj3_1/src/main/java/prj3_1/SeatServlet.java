package prj3_1;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/seat.do")
public class SeatServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		AirlineService as = new AirlineService();
		String fList = (String) req.getParameter("selectFlight");
		String grade = (String) req.getParameter("selectGrade");
		
		System.out.println(grade);
		System.out.println(fList);
		
		HttpSession session  = req.getSession();
		session.setAttribute("selectFlight", fList);
		session.setAttribute("selectGrade", grade);
		H_AirplaneService a = new H_AirplaneService();
		String id = (String) session.getAttribute("id");
		ArrayList<Seat> ECO = as.getEconomy(fList);
		
		
		
		session.setAttribute("ECO", ECO);
		ArrayList<Seat> BSN = as.getBsn(fList);
		session.setAttribute("BSN", BSN);
	    System.out.println(ECO);
	    System.out.println(BSN);
		if (id!=null) {
			if(grade.equals("이코노미석")) {
				req.getRequestDispatcher("WEB-INF/views/seatEconomy.jsp").forward(req, resp);
			}
			else{
				req.getRequestDispatcher("WEB-INF/views/seatBusiness.jsp").forward(req, resp);
			}
	    } else {
	        String failMessage = "로그인이 필요합니다.";
	        req.setAttribute("failMessage", failMessage);
	        req.getRequestDispatcher("WEB-INF/views/h_login.jsp").forward(req, resp);
	    }
		
		
	}
	
}
