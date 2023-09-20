package prj3_1;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet("/UUA2.do")
public class P_UserUpdateAjax2 extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");

		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		p_Service s = new p_Service();

		JSONObject o = s.selectidpw2(id);
		resp.getWriter().println(o);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String name = req.getParameter("name");
		String phone = req.getParameter("phone");
		String gender = req.getParameter("gender");

		System.out.println(id);
		System.out.println(pw);
		System.out.println(name);
		System.out.println(phone);
		System.out.println(gender);

		p_Service s = new p_Service();
		P_Customer c = new P_Customer(id, pw, name, phone, gender);

		s.updateMember(c);
		resp.getWriter().print("수정되었습니다.");
		// req.getRequestDispatcher("WEB-INF/views/P_UserUpdateView.jsp").forward(req,
		// resp);
		// resp.sendRedirect("/ptj3_1team/UUS.do?m=수정되었습니다.");
	}
}
