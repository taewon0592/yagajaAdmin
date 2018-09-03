package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.SurroundDAO;
import model.SurroundDTO;

public class regist_Write extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//글쓰기 페이지로 이동(포워드)
		RequestDispatcher dis = 
		req.getRequestDispatcher("/lodge/registWrite.jsp");
		dis.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//글쓰기 관련 폼값 받은후 처리
		
		//한글처리
		req.setCharacterEncoding("UTF-8");
		
		//DB입력성공시:1, 실패시:0, 파일용량초과시:-1
		int sucOrFail;
		
		String surround_name = req.getParameter("surround_name");
		String surround_tel = req.getParameter("tel1")+"-"+req.getParameter("tel2")+"-"+req.getParameter("tel3");
		String surround_type = req.getParameter("surround_type");
		String surround_zipcode = req.getParameter("surround_zipcode");
		String surround_addr = req.getParameter("surround_addr");
		String surround_detail = req.getParameter("surround_detail");
		String surround_lat = req.getParameter("surround_lat");
		String surround_long = req.getParameter("surround_long");
		
		SurroundDTO dto = new SurroundDTO();
		dto.setSurround_name(surround_name);
		dto.setSurround_tel(surround_tel);
		dto.setSurround_type(surround_type);
		dto.setSurround_zipcode(surround_zipcode);
		dto.setSurround_addr(surround_addr);
		dto.setSurround_detail(surround_detail);
		dto.setSurround_lat(surround_lat);
		dto.setSurround_long(surround_long);
		
		SurroundDAO dao = new SurroundDAO();
		sucOrFail = dao.insertWrite(dto);
		dao.close();
		
		
		if(sucOrFail==1){
			//DB입력성공일때
			//req.getRequestDispatcher("/controller/regist_List").forward(req,resp);
			resp.sendRedirect("../lodge/registList");
		}
		else{
			//DB입력실패 혹은 파일업로드 실패시
			req.getRequestDispatcher("/lodge/registWrite.jsp").forward(req,resp);
		}
	}
	
	

}
