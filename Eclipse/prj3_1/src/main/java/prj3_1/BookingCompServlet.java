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
@WebServlet("/bookingcheck.do")
public class BookingCompServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		HttpSession session  = req.getSession();
		String id = (String)session.getAttribute("id");
		String pass = req.getParameter("passport");
		String seatnum = (String)session.getAttribute("seatnum");
		String fcode= (String)session.getAttribute("selectFlight");
		String grade= (String)session.getAttribute("selectGrade");
		AirlineService as = new AirlineService();
		as.insertRes(fcode, id, seatnum);
		int resno = as.findresNo(fcode, id);
		as.updatecs(pass, resno, id);
		if(grade.equals("이코노미석")){
			as.updateEcoNum(fcode);
		}
		else {
			as.updateBsnNum(fcode);
		}
		as.seatState(seatnum);
		session.setAttribute("resno", resno);
		req.getRequestDispatcher("WEB-INF/views/bookingComp.jsp").forward(req, resp);
		

	}

}
