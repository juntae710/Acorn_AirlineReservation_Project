package ptj3_1team;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
@WebServlet("/RUS.do")
public class P_resvationUpdateServlet extends HttpServlet{
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//	p_Service s = new p_Service();
//	String id = "test01";
//	ArrayList<P_ResUD> Res = s.selectRes2(id);
//	System.out.println(Res);
//	req.setAttribute("Res", Res);
	req.getRequestDispatcher("WEB-INF/views/P_resvationUpdateview.jsp").forward(req, resp);

}
}
