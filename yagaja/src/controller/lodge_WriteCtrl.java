package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import model.LodgeDAO;
import model.LodgeDTO;
import util.FileUtil;

public class lodge_WriteCtrl extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dis = req.getRequestDispatcher("/lodge/lodge_write.jsp");
		dis.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		
		

		//파일업로드를 위한 로직
		MultipartRequest mr = FileUtil.upload(req, req.getServletContext().getRealPath("/Upload"));
		
		int sucOrFail =0;
		int sucOrFail2 =0;
		
		if(mr != null) {
			String lodge_name = mr.getParameter("lodge_name");
			String lodge_type = mr.getParameter("lodge_type");
			String lodge_tel = mr.getParameter("tel1")+"-"+mr.getParameter("tel2")+"-"+mr.getParameter("tel3");
			String lodge_roomcount = mr.getParameter("lodge_roomcount");
			String lodge_tag = mr.getParameter("lodge_tag");
			String lodge_note = mr.getParameter("lodge_note");
			String lodge_photo = mr.getFilesystemName("lodge_photo");
			String addr_zipcode = mr.getParameter("addr_zipcode");
			String addr_common = mr.getParameter("addr_common");
			//String addr_gugun = mr.getParameter("addr_gugun");
			String addr_detail = mr.getParameter("addr_detail");
			String[] frature = mr.getParameterValues("lodge_feature");
			String lodge_feature = "";
			if(lodge_feature != null)
			{
				for(int i=0; i<frature.length; i++){
					if(i==frature.length-1){
						lodge_feature += frature[i];
					}
					else{
						lodge_feature += frature[i]+",";
					}
				}
			}
			
			String[] lodge = mr.getParameterValues("lodge_thema");
			String lodge_thema="";
			
			if(lodge_thema != null) {
				for(int i=0; i<lodge.length; i++){
					if(i==lodge.length-1){
						lodge_thema += lodge[i];
					}
					else{
						lodge_thema += lodge[i]+",";
					}
				}
			}
			
			
			LodgeDTO dto = new LodgeDTO();
			dto.setLodge_name(lodge_name);
			dto.setLodge_type(lodge_type);
			dto.setLodge_tel(lodge_tel);
			dto.setLodge_roomcount(lodge_roomcount);
			dto.setLodge_tag(lodge_tag);
			dto.setLodge_thema(lodge_thema);
			dto.setLodge_feature(lodge_feature);
			dto.setLodge_note(lodge_note);
			dto.setLodge_photo(lodge_photo);
			dto.setAddr_zipcode(addr_zipcode);
			dto.setAddr_common(addr_common);
			//dto.setADDR_GUGUN(addr_gugun);
			dto.setAddr_detail(addr_detail);
			/*dto.setLodge_no(lodge_no);*/
			
			LodgeDAO dao = new LodgeDAO();
			sucOrFail = dao.insert(dto);
			sucOrFail2 = dao.insertaddr(dto);
			
			req.setAttribute("lodge_name", lodge_name);
			dao.close();
			
			
			
		}
		else {
			sucOrFail =-1;
		}
		
		
		if(sucOrFail==1 && sucOrFail2 ==1) 
		{
			resp.sendRedirect("../lodge/room_write");
		}
		else {
			req.getRequestDispatcher("../lodge/lodge_write.jsp").forward(req, resp);
		}
	}
	
	
	
}
