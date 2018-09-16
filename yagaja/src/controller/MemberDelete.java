package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.YagajaMemberDAO;

public class MemberDelete extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("id");
		String member_no = req.getParameter("member_no");
		String nowPage = req.getParameter("nowPage");
		
		//리스트 체크박스 삭제
		String[] checkDel = req.getParameterValues("checkDel");
		req.setAttribute("member_no", member_no);
		req.setAttribute("id", id);

		//삭제후 페이지이동 위해 영역에 저장
		req.setAttribute("nowPage", nowPage);		
		
		YagajaMemberDAO dao = new YagajaMemberDAO();
		System.out.println("memberdelete controller : "+member_no);
		
		int sucOrFail = 0;
		int sucOrFail2 = 0;
		
		if(checkDel!=null) {
			for(int i=0; i<checkDel.length; i++) {
				System.out.println("check는?"+checkDel[i]);	
				System.out.println("id는?"+id);
				//레코드 삭제				
				sucOrFail = dao.delete(checkDel[i]);		
				sucOrFail2 = dao.deleteAdmin(checkDel[i]);				
			}
		}
		else {
			sucOrFail = dao.delete1(member_no);
			sucOrFail2 = dao.deleteAdmin1(member_no, id);
		}
		req.setAttribute("sucOrFail", sucOrFail);
		
		req.getRequestDispatcher("../Member/MemberList").forward(req, resp);
	}	
}
