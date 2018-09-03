package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import model.LodgeDAO;
import model.LodgeDTO;
import util.FileUtil;
import util.PagingUtil;

public class room_WriteCtrl extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		System.out.println("여기로못오니??");
		String lodge_no = req.getParameter("lodge_no");
		LodgeDAO dao = new LodgeDAO();
		
		Map param = new HashMap();
		
	
		//1. 게시판 테이블의 전체 레코드 개수 구하기
		int totalRecordCount = dao.getTotalRecordCount(param);
	
		param.put("lodge_no", lodge_no);
		//가상번호 계산을 위한 추가

		List<LodgeDTO> lists = dao.room_selectpaging(param);
		for(LodgeDTO dto : lists)
		{
			System.out.println("dto.getRoom_type()"+dto.getRoom_type());
		}
		
		RequestDispatcher dis = req.getRequestDispatcher("../lodge/room_write.jsp");
		dis.forward(req, resp);
				
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		MultipartRequest mr = FileUtil.upload(req, req.getServletContext().getRealPath("/Upload"));
		
		int sucOrFail;
		//String lodge_name = req.getParameter("lodge_name");
		if(mr != null) {
			
			String room_type = mr.getParameter("room_type");
			String room_person = mr.getParameter("room_person");
			String d_sleep_price = mr.getParameter("d_sleep_price");
			String w_sleep_price = mr.getParameter("w_sleep_price");
			String d_rent_price = mr.getParameter("d_rent_price");
			String w_rent_price = mr.getParameter("w_rent_price");
			String room_photo = mr.getFilesystemName("room_photo");
			String lodge_no = mr.getParameter("lodge_no");
			String lodge_name = mr.getParameter("lodge_name");
			System.out.println(lodge_no);
			System.out.println("WirteCtrl에서 lodge_name="+lodge_name);

			LodgeDTO dto = new LodgeDTO();
			dto.setRoom_type(room_type);
			dto.setRoom_person(room_person);
			dto.setD_sleep_price(d_sleep_price);
			dto.setD_rent_price(d_rent_price);
			dto.setW_rent_price(w_rent_price);
			dto.setW_sleep_price(w_sleep_price);
			dto.setRoom_photo(room_photo);
			dto.setLodge_no(lodge_no);
					
			LodgeDAO dao = new LodgeDAO();
			sucOrFail = dao.insertroom(dto);
			req.setAttribute("lodge_name", lodge_name);
		}else {
			sucOrFail =-1;
		}
		
		if(sucOrFail==1) {
			RequestDispatcher dis = req.getRequestDispatcher("../lodge/room_write.jsp");
			dis.forward(req, resp);
			// req.getRequestDispatcher("../lodge/room_write.jsp").forward(req, resp);
		}
		else {
			req.getRequestDispatcher("../lodge/lodge_list.jsp").forward(req, resp);
		}
	}
}
