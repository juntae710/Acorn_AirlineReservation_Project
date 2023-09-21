package prj3_1;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/h_logOut")
public class H_LogOut  extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 		
		   HttpSession session  = req.getSession();
		   session.invalidate();		   
		   resp.sendRedirect("/prj3_1/index.do");
		   
	}

}
