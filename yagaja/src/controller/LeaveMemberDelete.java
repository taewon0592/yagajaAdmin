package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.YagajaLeaveMemberDAO;


public class LeaveMemberDelete extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String member_no = req.getParameter("member_no");
		String nowPage = req.getParameter("nowPage");
		
		//리스트 체크박스 
		String[] checkDel = req.getParameterValues("checkDel");
		
		//삭제후 페이지이동 위해 영역에 저장
		req.setAttribute("nowPage", nowPage);
		
		YagajaLeaveMemberDAO dao = new YagajaLeaveMemberDAO();
		System.out.println("leave member delete controller : "+member_no);
		
		
		//System.out.println("member_no?"+member_no);
		int sucOrFail = 0;
		if(checkDel!=null) {
			for(int i=0; i<checkDel.length; i++) {
				System.out.println("check는?"+checkDel[i]);	
				
				//레코드 삭제
				sucOrFail = dao.delete(checkDel[i]);
			}
		}
		else {
			sucOrFail = dao.delete(member_no);
		}
		
		/*
		//리퀘스트영역에 데이터저장
		req.setAttribute("WHEREIS", "DELETE");*/
		req.setAttribute("sucOrFail", sucOrFail);
		
		req.getRequestDispatcher("../Member/LeaveMemberList").forward(req, resp);
	}

}
