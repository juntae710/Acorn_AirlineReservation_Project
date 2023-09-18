package join;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/join.do")
public class joinServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("WEB-INF/views/joinus.jsp").forward(req, resp);
		
	}
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//사용자 정보 가져오기
		
		//사용자 정보 한글로 번역하여 넣기
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String name = req.getParameter("name");
		String phone = req.getParameter("phone");
		String gender = req.getParameter("gender");
		
		
		Customer customer = new Customer(id, pw, name, phone, gender);
		joinService service = new joinService();
		
		
		try {
			service.register(customer);
			req.getRequestDispatcher("WEB-INF/views/regOk.jsp").forward(req, resp);	
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			req.getRequestDispatcher("WEB-INF/views/dberr.jsp").forward(req, resp);
		}
		
		
		
		
		
	}
	

}
