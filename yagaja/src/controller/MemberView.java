package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.YagajaMemberDAO;
import model.YagajaMemberDTO;

public class MemberView extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//member_no 받기
		String member_no = req.getParameter("member_no");
		
		
		YagajaMemberDAO dao = new YagajaMemberDAO();
		YagajaMemberDTO dto = new YagajaMemberDTO();
		
		dto = dao.selectView(member_no);
		
		//자원해제
		dao.close();		
		
		//리퀘스트 영역에 저장
		req.setAttribute("member_no", member_no);
		req.setAttribute("dto", dto);
		
		RequestDispatcher dis = req.getRequestDispatcher("/member/member_view.jsp");
		dis.forward(req, resp);
	}
}
