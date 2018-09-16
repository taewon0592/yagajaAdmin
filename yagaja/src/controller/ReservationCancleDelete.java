package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ReservationDAO;

public class ReservationCancleDelete extends HttpServlet
{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String reser_no = req.getParameter("reser_no");
		String nowPage = req.getParameter("nowPage");
		//체크박스 삭제
		String[] checkDel = req.getParameterValues("checkDel");
		
		//삭제후 페이지 이동 위해 영역 저장
		req.setAttribute("nowPage", nowPage);
		
		ReservationDAO dao = new ReservationDAO();
		
		int sucOrFail = 0;
		if(checkDel!=null) {
			for(int i=0; i<checkDel.length; i++) {
				System.out.println("check는?"+checkDel[i]);	
				
				//레코드 삭제
				sucOrFail = dao.cancleDelete(checkDel[i]);
			}
		}
		else {
			sucOrFail = dao.cancleDelete(reser_no);
		}
		req.setAttribute("sucOrFail", sucOrFail);
		
		req.getRequestDispatcher("../Reservation/ReservationCancleList").forward(req, resp);
	}
}
