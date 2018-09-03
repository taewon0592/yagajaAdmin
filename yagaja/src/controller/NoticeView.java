package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.NoticeDAO;
import model.NoticeDTO;


public class NoticeView extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// notice_no 값 받기
		String idx = req.getParameter("notice_no");

		NoticeDAO dao = new NoticeDAO();
		NoticeDTO dto = dao.selectView(idx);

		// 줄바꿈처리
		dto.setNotice_contents(dto.getNotice_contents().replaceAll("\r\n", "<br/>"));
		dao.close();

		// 리퀘스트 영역에 저장
		req.setAttribute("dto", dto);

		// 상세보기 페이지로 포워드
		RequestDispatcher dis = req.getRequestDispatcher("/notice/notice_view.jsp");
		dis.forward(req, resp);
	}

}
