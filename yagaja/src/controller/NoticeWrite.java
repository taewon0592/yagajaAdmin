package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.NoticeDAO;
import model.NoticeDTO;

public class NoticeWrite extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		
		String title = req.getParameter("notice_title");
		String name = req.getParameter("notice_name");
		String contents = req.getParameter("notice_contents");
		
		NoticeDTO dto = new NoticeDTO();
		
		dto.setNotice_title(title);
		dto.setNotice_name(name);
		dto.setNotice_contents(contents);
		
		NoticeDAO dao = new NoticeDAO();
		
		int affected = dao.insertWrite(dto);
		if(affected==1) {
			resp.setContentType("text/html;charset=UTF-8");
			PrintWriter out = resp.getWriter();
			String str = ""
					+ "<script>"
					+ "  alert('공지사항을 등록했습니다.');"
					+ "  location.href='NoticeList'; "
					+ "</script>"; 
			out.println(str);

		}
		else {
			resp.setContentType("text/html;charset=UTF-8");
			PrintWriter out = resp.getWriter();
			String str = ""
					+ "<script>"
					+ "  alert('공지사항 등록을 실패하셨습니다.');"
					+ "  history.back();"
					+ "</script>"; 
			out.println(str);
		}
		
	}

}
