package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminLogout extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		session.removeAttribute("id");
		session.removeAttribute("nickname");
		session.invalidate();
		
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		String str = ""
				+ "<script>"
				+ "  alert('로그아웃되셨습니다.');"
				+ "  location.href='../Ex/main.jsp'; "
				+ "</script>"; 
		out.println(str);
		
		
	}

}
