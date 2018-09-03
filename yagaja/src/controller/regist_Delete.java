package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.SurroundDAO;




public class regist_Delete extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//폼값받기
		String surround_no = req.getParameter("surround_no");
		String nowPage = req.getParameter("nowPage");
		//삭제후 페이지이동 위해 영역에 저장
		req.setAttribute("nowPage", nowPage);
		System.out.println("여긴 들어옴?");
		//기존게시물의 첨부파일명 가져오기
		SurroundDAO dao = new SurroundDAO();
		
		//레코드 삭제
		int sucOrFail = dao.delete(surround_no); 
		
		//레코드 삭제성공시 파일도 같이 삭제
		if(sucOrFail==1) {
			
			
			/*req.setAttribute("WHEREIS", "DELETE");
			req.setAttribute("SUC_FAIL", sucOrFail);*/
			
			req.getRequestDispatcher("../lodge/registList").forward(req, resp);		
		}
		else {
			//req.getRequestDispatcher(")
			System.out.println("여기들어와서 망가져버렸다");
		}
	}

}
