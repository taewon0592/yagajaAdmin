package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.YagajaMemberDAO;

public class AdminLogin extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		String id_save = req.getParameter("id_save");
		
		YagajaMemberDAO dao = new YagajaMemberDAO();
		
		Map<String, String> adminInfo = dao.adminLogin(id, pass);
		
		if(adminInfo.get("id")!=null) {
			
			HttpSession session = req.getSession();
			
			session.setAttribute("id", adminInfo.get("id"));
			session.setAttribute("nickname", adminInfo.get("nickname"));
			
			if(id_save==null) {
				Cookie cookie = new Cookie("id", "");
				cookie.setPath(req.getContextPath());
				cookie.setMaxAge(0);
				resp.addCookie(cookie);
			}
			else {
				Cookie cookie = new Cookie("id", id);
				
				System.out.println(req.getContextPath());
				cookie.setPath(req.getContextPath());
				
				cookie.setMaxAge(60*60*24*100);
				resp.addCookie(cookie);	
				
			}
			
			resp.setContentType("text/html;charset=UTF-8");
			PrintWriter out = resp.getWriter();
			String str = ""
					+ "<script>"
					+ "  location.href='../Ex/index.jsp'; "
					+ "</script>"; 
			out.println(str);
			
		}
		else {
			
			resp.setContentType("text/html;charset=UTF-8");
			PrintWriter out = resp.getWriter();
			String str = ""
					+ "<script>"
					+ "  alert('로그인에 실패하셨습니다.');"
					+ "  history.back();"
					+ "</script>"; 
			out.println(str);
		}
	}
	
}
