package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.SurroundDAO;

public class check_Delete extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String surround_no = req.getParameter("surround_no");
		String nowPage = req.getParameter("nowPage");
		
		//리스트 체크박스 삭제
		String [] checkDel = req.getParameterValues("checkDel");
		req.setAttribute("surround_no", surround_no);
		
		
		//삭제후 페이지 이동을 위해 영역 저장
		req.setAttribute("nowPage", nowPage);
		
		SurroundDAO dao = new SurroundDAO();
		
		int sucOrFail = 0;
		
			for(int i=0 ; i<checkDel.length ; i++) {
				sucOrFail = dao.ckdelete(checkDel[i]);
				
			}
		
		
		
		
		req.setAttribute("sucOrFail", sucOrFail);
		req.getRequestDispatcher("../lodge/registList").forward(req, resp);
	}

}
