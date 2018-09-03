package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.YagajaLeaveMemberDAO;
import model.YagajaLeaveMemberDTO;


public class LeaveMemberView extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//member_no 받기
		String member_no = req.getParameter("member_no");
		
		
		YagajaLeaveMemberDAO dao = new YagajaLeaveMemberDAO();
		YagajaLeaveMemberDTO dto = new YagajaLeaveMemberDTO();
		
		dto = dao.selectView(member_no);
		
		dto.setLeave_reason2(dto.getLeave_reason2().replaceAll("\r\n", "<br/>"));
		
		//자원해제
		dao.close();		
		
		//리퀘스트 영역에 저장
		req.setAttribute("member_no", member_no);
		req.setAttribute("dto", dto);
		
		RequestDispatcher dis = req.getRequestDispatcher("/member/leave_member_view.jsp");
		dis.forward(req, resp);
	}
}
