package prj3_1;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/sdelete")
public class S_DeleteServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String resno = req.getParameter("resno");
		System.out.println(resno);
		
		S_flightService s = new S_flightService();
		s.deleteinfo(resno);
		
		
	//	ArrayList<Flight> list = s.getreginfo(fcode);
		Flight2 list = s.getreginfo(resno);
		
		req.setAttribute("list", list);
		req.getRequestDispatcher("WEB-INF/views/main.jsp").forward(req, resp);
		
		//String Stringresult  = URLEncoder.encode("취소확인","utf-8"); //직접 인코딩 해야함
		//resp.sendRedirect("/prj0918프로젝트연습/S_flightServlet?Stringresult"+Stringresult);
		
		 
	}
}
