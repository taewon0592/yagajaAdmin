package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AuctionDAO;
import model.AuctionDTO;
import model.HotdealDAO;
import model.HotdealDTO;

public class Auction_Delete extends HttpServlet {

	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//폼값받기
		String auction_no = req.getParameter("auction_no");
		String nowPage = req.getParameter("nowPage");
		int mode = Integer.parseInt(req.getParameter("mode"));
		//리스트 체크박스 삭제
		String[] checkDel = req.getParameterValues("checkDel");
		
		
	
		//삭제 후 페이지 이동을 위해 영역에 저장
		req.setAttribute("auction_no", auction_no);
		req.setAttribute("nowPage",	nowPage);
		
		//기존 게시물의 첨부파일명 가져오기 - 게시물을 삭제하면 파일은 삭제되면 안됨
		AuctionDAO dao = new AuctionDAO();
	

		AuctionDTO dto = dao.view(auction_no);
		
		//레코드 삭제
		int sucOrFail = 0;
		if(checkDel!=null) {
			for(int i=0; i<checkDel.length; i++) {
				System.out.println("check는?"+checkDel[i]);	
				System.out.println("hotdeal_no는?"+auction_no);
				//레코드 삭제
				sucOrFail = dao.delete(checkDel[i]);		
			}
		}
		else {
			 sucOrFail = dao.delete(auction_no);

		}
		
		//컬렉션풀에 자원반납
		dao.close();
		if(mode!=0)
		{
			resp.sendRedirect("../Yagaja/AuctionList?nowPage="+nowPage+"&mode=1");
		}
		else
		{
			resp.sendRedirect("../Yagaja/Auction_EndList?nowPage="+nowPage+"&mode=0");
		}
		
		
	}
}
