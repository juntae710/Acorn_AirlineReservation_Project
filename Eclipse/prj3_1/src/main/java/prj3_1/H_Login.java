package prj3_1;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/h_login")
public class H_Login extends HttpServlet {

	// 로그인화면
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("WEB-INF/views/h_login.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    H_AirplaneService a = new H_AirplaneService();
	    String id = req.getParameter("id");
	    String pw = req.getParameter("pw");

	    boolean result = a.login(id, pw);

	    if (result) {
	        HttpSession session = req.getSession();
	        session.setAttribute("id", id);
	        resp.sendRedirect("/prj3_1/index.do");
	    } else {
	        String failMessage = "로그인 실패! 아이디 또는 비밀번호를 확인하세요.";
	        req.setAttribute("failMessage", failMessage);
	        req.getRequestDispatcher("WEB-INF/views/h_login.jsp").forward(req, resp);
	    }
	}
	}

