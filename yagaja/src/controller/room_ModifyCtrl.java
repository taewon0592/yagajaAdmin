package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import model.LodgeDAO;
import model.LodgeDTO;
import util.FileUtil;

public class room_ModifyCtrl extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String lodge_no = req.getParameter("lodge_no");
		String room_no = req.getParameter("room_no");
		LodgeDAO dao = new LodgeDAO();
		LodgeDTO dto ;
		dto = dao.room_edit(lodge_no,room_no);
		
		req.setAttribute("dto", dto);
		
		req.getRequestDispatcher("/lodge/room_modify.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//한글처리
		req.setCharacterEncoding("UTF-8");
		
		//파일업로드를 위한 모델(비즈니스로직) 호출
		MultipartRequest mr = FileUtil.upload(req,
			req.getServletContext().getRealPath("/Upload"));
		
		//파일업로드 성공여부 체크위한 변수
		//DB입력성공시:1, 실패시:0, 파일용량초과시:-1
		int sucOrFail = 0;
		
		if(mr != null){
			//수정처리를 위한 파라미터
			String lodge_no = mr.getParameter("lodge_no");
			String room_no = mr.getParameter("room_no");
			String originalfile = 
				mr.getParameter("originalfile");
			
			//수정처리후 상세보기로 이동하므로 idx저장해야함
			req.setAttribute("lodge_no", lodge_no);
			req.setAttribute("room_no", room_no);
			
			//나머지 파라미터를 MultipartRequest객체를 통해받음
			String room_type = mr.getParameter("room_type");
			String room_person = mr.getParameter("room_person");
			String d_sleep_price = mr.getParameter("d_sleep_price");
			String d_rent_price = mr.getParameter("d_rent_price");
			String w_sleep_price = mr.getParameter("w_sleep_price");
			String w_rent_price = mr.getParameter("w_rent_price");
			String room_photo = mr.getFilesystemName("room_photo");
			
			//만약 첨부한 파일이 없다면 기존파일 유지
			if(room_photo==null) {
				room_photo = originalfile;
			}
			
			LodgeDTO dto = new LodgeDTO();
			dto.setRoom_type(room_type);
			dto.setRoom_person(room_person);
			dto.setD_sleep_price(d_sleep_price);
			dto.setD_rent_price(d_rent_price);
			dto.setW_sleep_price(w_sleep_price);
			dto.setW_rent_price(w_rent_price);
			dto.setRoom_photo(room_photo);
			dto.setLodge_no(lodge_no);
			dto.setRoom_no(room_no);
			
			LodgeDAO dao = new LodgeDAO();
			sucOrFail = dao.room_update(dto);
			
			//업데이트가 성공이고, 새로운 파일을 업로드 했다면
			if(sucOrFail==1 && 
				mr.getFilesystemName("room_photo")!=null)
			{
				//기존 업로드된 파일을 삭제처리
				FileUtil.deleteFile(req, "/Upload",
					originalfile);
			}
			
			dao.close();
		}
		else{
			sucOrFail = -1;
		}
		
		req.setAttribute("SUC_FAIL", sucOrFail);
		req.setAttribute("WHEREIS", "UPDATE");
		
		req.getRequestDispatcher("/lodge/Message2.jsp").forward(req, resp);
	}
}
