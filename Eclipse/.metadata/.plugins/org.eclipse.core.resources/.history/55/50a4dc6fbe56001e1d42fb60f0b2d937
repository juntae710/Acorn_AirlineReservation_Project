package prj3_1;


import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/l_join")
public class L_joinServlet extends HttpServlet {
    L_joinDAO dao = new L_joinDAO();
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/views/L_joinus.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");

        String id = req.getParameter("userid");
        String pw = req.getParameter("userpw");
        String name = req.getParameter("username");
        String phone = req.getParameter("userphone");
        String gender = req.getParameter("usergender");
        
        if(id.isEmpty()) {
            resp.getWriter().println("<script>alert('아이디를 입력하지 않았습니다.'); history.go(-1);</script>");
        }else if(pw.isEmpty()){
            resp.getWriter().println("<script>alert('비밀번호를 입력하지 않았습니다.'); history.go(-1);</script>");
        }else if(name.isEmpty()){
            resp.getWriter().println("<script>alert('이름을 입력하지 않았습니다.'); history.go(-1);</script>");
        }else if(phone.isEmpty()){
            resp.getWriter().println("<script>alert('전화번호를 입력하지 않았습니다.'); history.go(-1);</script>");
        }else if(gender == null || gender.isEmpty()){
            resp.getWriter().println("<script>alert('성별를 선택하지 않았습니다.'); history.go(-1);</script>");
        }else {
        	
            boolean isDuplicate = dao.checkId(id);

            if (isDuplicate) {
                resp.getWriter().println("<script>alert('중복된 아이디입니다. 다른 아이디를 사용하세요.'); history.go(-1);</script>");
            } else {
                L_Customer customer = new L_Customer(id, pw, name, phone, gender);
                L_joinService service = new L_joinService();

                try {
                    service.register(customer);
                    req.getRequestDispatcher("WEB-INF/views/h_login.jsp").forward(req, resp);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
}