package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.NoticeDAO;
import model.NoticeDTO;

public class NoticeDelete extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		
		String idx = req.getParameter("notice_no");
		String nowPage = req.getParameter("nowPage");
		
		req.setAttribute("nowPage", nowPage);

		NoticeDAO dao = new NoticeDAO();
		NoticeDTO dto = new NoticeDTO();
		
		dto = dao.selectView(idx);
		
		int affected = 0;
		
		affected = dao.delete(idx);
		
		if(affected==1) {
			resp.setContentType("text/html;charset=UTF-8");
			PrintWriter out = resp.getWriter();
			String str = ""
					+ "<script>"
					+ "  alert('공지사항을 삭제했습니다.');"
					+ "  location.href='NoticeList'; "
					+ "</script>"; 
			out.println(str);

		}
		else {
			resp.setContentType("text/html;charset=UTF-8");
			PrintWriter out = resp.getWriter();
			String str = ""
					+ "<script>"
					+ "  alert('공지사항 삭제를 실패하셨습니다.');"
					+ "  history.back();"
					+ "</script>"; 
			out.println(str);
		}
		
		
	}

}
