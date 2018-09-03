package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;

import model.LodgeDAO;
import model.LodgeDTO;
import util.PagingUtil;

public class room_ViewCtrl extends HttpServlet {
	
	@Override
	public void service(ServletRequest req, ServletResponse resp) throws ServletException, IOException {
		
		String lodge_no = req.getParameter("lodge_no");
		String room_no = req.getParameter("room_no");
		LodgeDAO dao = new LodgeDAO();
		LodgeDTO dto = dao.selectRoomView(lodge_no,room_no);
		/*	dto.setLodge_note(dto.getLodge_note().replaceAll("\r\n", "<br/>"));*/
		dao.close();
		
		
		//리퀘스트 영역에 저장하기
		
		req.setAttribute("lodge_no", lodge_no);
		req.setAttribute("dto", dto);	
		
		RequestDispatcher dis = 
		req.getRequestDispatcher("/lodge/room_view.jsp");
				dis.forward(req, resp);
	}
}
