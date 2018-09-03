package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.NoticeDAO;
import model.NoticeDTO;

public class NoticeEdit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String notice_no = req.getParameter("notice_no");

		NoticeDAO dao = new NoticeDAO();
		NoticeDTO dto = dao.selectView(notice_no);

		req.setAttribute("dto", dto);

		req.getRequestDispatcher("/notice/notice_edit.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");

		String notice_no = req.getParameter("notice_no");
		String nowPage = req.getParameter("nowPage");

		req.setAttribute("notice_no", notice_no);
		req.setAttribute("nowPage", nowPage);

		String notice_title = req.getParameter("notice_title");
		String notice_contents = req.getParameter("notice_contents");
		String notice_name = req.getParameter("notice_name");

		NoticeDTO dto = new NoticeDTO();
		
		dto.setNotice_title(notice_title);
		dto.setNotice_contents(notice_contents);
		dto.setNotice_name(notice_name);
		dto.setNotice_no(notice_no);

		NoticeDAO dao = new NoticeDAO();
		
		int affected = dao.updateEdit(dto);
		if (affected == 1) {
			resp.setContentType("text/html;charset=UTF-8");
			PrintWriter out = resp.getWriter();
			String str = "" + "<script>" + "  alert('공지사항을 수정했습니다.');" + "  location.href='NoticeList'; " + "</script>";
			out.println(str);

		} else {
			resp.setContentType("text/html;charset=UTF-8");
			PrintWriter out = resp.getWriter();
			String str = "" + "<script>" + "  alert('공지사항 수정을 실패하셨습니다.');" + "  history.back();" + "</script>";
			out.println(str);
		}
	}

}
