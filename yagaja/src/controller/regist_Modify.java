package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.SurroundDAO;
import model.SurroundDTO;


public class regist_Modify extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//수정페이지 띄워주기
		
		String surround_no = req.getParameter("surround_no");
		
		SurroundDAO dao = new SurroundDAO();
		SurroundDTO dto = dao.selectView(surround_no);
		
		
		req.setAttribute("dto", dto);
		
		
		req.getRequestDispatcher("/lodge/registModify.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				
		//한글처리
		req.setCharacterEncoding("UTF-8");
		
		
		//DB입력성공시:1, 실패시:0, 파일용량초과시:-1
		int sucOrFail;
		
		//수정처리후 상세보기로 이동하므로 idx저장해야함
		//수정처리를 위한 파라미터
		int surround_no = Integer.parseInt(req.getParameter("surround_no"));
		String nowPage = req.getParameter("nowPage");
		
		req.setAttribute("surround_no", surround_no);
		req.setAttribute("nowPage", nowPage);
		
		//나머지 파라미터를 MultipartRequest객체를 통해받음
		String surround_type = req.getParameter("surround_type");
		String surround_name = req.getParameter("surround_name");
		String surround_tel = req.getParameter("surround_tel");
		String surround_zipcode = req.getParameter("surround_zipcode");
		String surround_addr = req.getParameter("surround_addr");
		String surround_detail = req.getParameter("surround_detail");
		String surround_lat = req.getParameter("surround_lat");
		String surround_long = req.getParameter("surround_long");
		
		//만약 첨부한 파일이 없다면 기존파일 유지
		SurroundDTO dto = new SurroundDTO();
		dto.setSurround_type(surround_type);
		dto.setSurround_name(surround_name);
		dto.setSurround_tel(surround_tel);
		dto.setSurround_zipcode(surround_zipcode);
		dto.setSurround_addr(surround_addr);
		dto.setSurround_detail(surround_detail);
		dto.setSurround_lat(surround_lat);
		dto.setSurround_long(surround_long);
		//게시물 수정을 위한 idx 세팅
		dto.setSurround_no(surround_no);
		
		SurroundDAO dao = new SurroundDAO();
		sucOrFail = dao.update(dto);
		
		//업데이트가 성공이면
		if(sucOrFail==1)
		{
			
		}
		else {
			
		}
		dao.close();
		
		
		//리퀘스트영역에 메세지 출력을 위한 저장
		req.setAttribute("SUC_FAIL", sucOrFail);
		req.setAttribute("WHEREIS", "UPDATE");
				
		
		req.getRequestDispatcher("/lodge/Message_Surround.jsp").forward(req, resp);	
	}

}
