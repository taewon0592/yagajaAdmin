package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.LodgeDAO;
import model.LodgeDTO;
import util.FileUtil;

public class room_DeleteCtrl extends HttpServlet{
	   
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 String lodge_no = req.getParameter("lodge_no");
	     String nowPage = req.getParameter("nowPage");
	     String room_no = req.getParameter("room_no"); 
	      //삭제후 페이지이동 위해 영역에 저장
	      req.setAttribute("nowPage", nowPage);
	      System.out.println(req.getParameter("lodge_no"));
	      LodgeDAO dao = new LodgeDAO();
	      LodgeDTO dto = dao.selectView(lodge_no);
	      //System.out.println("memberdelete controller : "+lodge_no);
	      //레코드 삭제
	      int sucOrFail = dao.delete_room_detail(lodge_no,room_no);
	      
	      /*
	      //리퀘스트영역에 데이터저장
	      req.setAttribute("WHEREIS", "DELETE");*/
	      if(sucOrFail==1 ) {
				String file = dto.getLodge_photo();
				FileUtil.deleteFile(req, "/Upload", file);
			}
		
	      req.setAttribute("WHEREIS", "DELETE");
	      req.setAttribute("SUC_FAIL", sucOrFail);
	      
	      req.getRequestDispatcher("/lodge/Message.jsp").forward(req, resp);

	}

}
