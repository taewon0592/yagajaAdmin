package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import model.LodgeDAO;
import model.LodgeDTO;
import util.FileUtil;

public class lodge_ModifyCtrl extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String lodge_no = req.getParameter("lodge_no");
		
		LodgeDAO dao = new LodgeDAO();
		LodgeDTO dto;
		dto = dao.edit(lodge_no);
		
		req.setAttribute("dto", dto);
		
		req.getRequestDispatcher("/lodge/lodge_modify.jsp").forward(req, resp);
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
				int sucOfFail2 = 0;
				
				if(mr != null){
					//수정처리를 위한 파라미터
					String lodge_no = mr.getParameter("lodge_no");
					String nowPage = mr.getParameter("nowPage");
					String originalfile = 
						mr.getParameter("originalfile");
					
					//수정처리후 상세보기로 이동하므로 idx저장해야함
					req.setAttribute("lodge_no", lodge_no);
					req.setAttribute("nowPage", nowPage);
					
					//나머지 파라미터를 MultipartRequest객체를 통해받음
					String lodge_name = mr.getParameter("lodge_name");
					String lodge_type = mr.getParameter("lodge_type");
					String lodge_tel = mr.getParameter("tel1")+"-"+mr.getParameter("tel2")+"-"+mr.getParameter("tel3");
					String lodge_roomcount = mr.getParameter("lodge_roomcount");
					String lodge_tag = mr.getParameter("lodge_tag");
					String lodge_note = mr.getParameter("lodge_note");
					String lodge_photo = mr.getFilesystemName("lodge_photo");
					String addr_num = mr.getParameter("addr_num");
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
					
					
					//만약 첨부한 파일이 없다면 기존파일 유지
					if(lodge_photo==null) {
						lodge_photo = originalfile;
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
					dto.setADDR_NUM(addr_num);
					dto.setADDR_common(addr_common);
					//dto.setADDR_GUGUN(addr_gugun);
					dto.setADDR_DETAIL(addr_detail);
					dto.setLodge_no(lodge_no);
					
					LodgeDAO dao = new LodgeDAO();
					sucOrFail = dao.lodge_update(dto);
					sucOfFail2 = dao.addr_update(dto);
					
					//업데이트가 성공이고, 새로운 파일을 업로드 했다면
					if(sucOrFail==1 && sucOfFail2==1 &&
						mr.getFilesystemName("attachedfile")!=null)
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
				
				//리퀘스트영역에 메세지 출력을 위한 저장
				req.setAttribute("SUC_FAIL", sucOrFail);
				req.setAttribute("WHEREIS", "UPDATE");
						
				
				req.getRequestDispatcher("/lodge/lodge_list.jsp").forward(req, resp);
	}
}
