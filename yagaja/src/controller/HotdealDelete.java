package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.HotdealDAO;
import model.HotdealDTO;

public class HotdealDelete extends HttpServlet {

	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//폼값받기
		String hotdeal_no = req.getParameter("hotdeal_no");
		String nowPage = req.getParameter("nowPage");
		//리스트 체크박스 삭제
		String[] checkDel = req.getParameterValues("checkDel");
		
		
	
		//삭제 후 페이지 이동을 위해 영역에 저장
		req.setAttribute("hotdeal_no", hotdeal_no);
		req.setAttribute("nowPage",	nowPage);
		
		//기존 게시물의 첨부파일명 가져오기 - 게시물을 삭제하면 파일은 삭제되면 안됨
		HotdealDAO dao = new HotdealDAO();
	

		HotdealDTO dto = dao.view(hotdeal_no);
		
		//레코드 삭제
		int sucOrFail = 0;
		if(checkDel!=null) {
			for(int i=0; i<checkDel.length; i++) {
				System.out.println("check는?"+checkDel[i]);	
				System.out.println("hotdeal_no는?"+hotdeal_no);
				//레코드 삭제
				sucOrFail = dao.delete(checkDel[i]);		
			}
		}
		else {
			 sucOrFail = dao.delete(hotdeal_no);

		}
		
		//컬렉션풀에 자원반납
		dao.close();
		
		req.getRequestDispatcher("/HotDeal/HotDealList").forward(req, resp);
	}
}
