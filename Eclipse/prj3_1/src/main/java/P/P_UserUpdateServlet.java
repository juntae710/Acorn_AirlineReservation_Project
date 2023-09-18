package ptj3_1team;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UUS.do")
public class P_UserUpdateServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// String id=req.getParameter("id");

		String id = "test02";
		p_Service s = new p_Service();
		P_Customer userinfo = s.selectidpw(id);
		System.out.println(userinfo);
		req.setAttribute("userinfo", userinfo);
		req.getRequestDispatcher("WEB-INF/views/P_UserUpdateView.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id =req.getParameter("id");
		String pw =req.getParameter("pw");
		String name =req.getParameter("name");
		String phone =req.getParameter("phone");
		String gender =req.getParameter("gender");
		p_Service s = new p_Service();
		P_Customer c =new P_Customer(id, pw, name, phone, gender);
		
		s.updateMember(c);
		//req.getRequestDispatcher("WEB-INF/views/P_UserUpdateView.jsp").forward(req, resp);
		resp.sendRedirect("/ptj3_1team/UUS.do?m=수정되었습니다.");
	}
}
