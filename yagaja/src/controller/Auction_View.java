package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AuctionDAO;
import model.AuctionDTO;

public class Auction_View extends HttpServlet
{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String auction_no = req.getParameter("auction_no");

		AuctionDAO dao = new AuctionDAO();
		
		AuctionDTO dto = dao.view(auction_no);
		
		dao.close();
		
		req.setAttribute("auction_no", auction_no);

		req.setAttribute("dto", dto);
	
		
		//쓰기폼으로 포워드
		RequestDispatcher dis = req.getRequestDispatcher("/auction/auction_view.jsp");
		dis.forward(req, resp);
	}
}
