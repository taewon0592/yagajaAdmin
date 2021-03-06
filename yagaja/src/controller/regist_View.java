package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;

import model.SurroundDAO;
import model.SurroundDTO;

public class regist_View extends HttpServlet {
	/*
	서블릿에서 요청을 받을때 doGet() 혹은 doPost()로
	처리할것을 service()메소드 하나로 대체할수 있다.		
	*/
	@Override
	public void service(ServletRequest req, ServletResponse resp) throws ServletException, IOException {
		
		//idx값 받기
		String surround_no = req.getParameter("surround_no");
		System.out.println(surround_no+"너 맞아?");
		SurroundDAO dao = new SurroundDAO();
		SurroundDTO dto = dao.selectView(surround_no);
		
		String[] telArr = dto.getSurround_tel().split("-");
		
		for(int i = 0 ; i<telArr.length ; i++)
		{
			dto.setSurround_tel(telArr[0]);
			dto.setSurround_tel2(telArr[1]);
			dto.setSurround_tel3(telArr[2]);
		}
		
		
		//리퀘스트 영역에 저장
		req.setAttribute("dto", dto);		
		
		//상세보기 페이지로 포워드
		RequestDispatcher dis = req.getRequestDispatcher("/lodge/registView.jsp");
		dis.forward(req, resp);
	}
}

