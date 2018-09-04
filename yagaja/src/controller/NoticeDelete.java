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
		
		// 리스트 전체체크 삭제
		String[] checkDel = req.getParameterValues("checkDel");
		req.setAttribute("notice_no", idx);
		
		int affected = 0;
		
		req.setAttribute("nowPage", nowPage);
		
		System.out.println(nowPage);
		
		NoticeDAO dao = new NoticeDAO();
		NoticeDTO dto = new NoticeDTO();
		
		for(int i=0 ; i<checkDel.length ; i++) {
			
			affected = dao.delete(checkDel[i]);
			System.out.println(checkDel[i]);
			if(affected>0) {
				resp.setContentType("text/html;charset=UTF-8");
				PrintWriter out = resp.getWriter();
				String str = ""
						+ "<script>"
						+ "  alert('공지사항을 삭제했습니다.');"
						+ "  location.href='NoticeList?nowPage="+nowPage+"'; "
						+ "</script>"; 
				out.println(str);
	
			}
			else {
				resp.setContentType("text/html;charset=UTF-8");
				PrintWriter out = resp.getWriter();
				String str = ""
						+ "<script>"
						+ "  alert('공지사항 삭제를 실패하였습니다.');"
						+ "  history.back();"
						+ "</script>"; 
				out.println(str);
			}
		}
		
	}

}
