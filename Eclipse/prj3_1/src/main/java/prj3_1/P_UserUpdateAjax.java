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
@WebServlet("/UUA.do")
public class P_UserUpdateAjax extends HttpServlet{
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	req.getRequestDispatcher("WEB-INF/views/P_UserUpdateView2.jsp").forward(req, resp);

}
//@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//	String id = null;
//	HttpSession session = req.getSession();
//	session.setAttribute("id", id);
//	 resp.sendRedirect("/prj3_1/UUA2.do");
//	 System.out.println(id);
//	}
}
