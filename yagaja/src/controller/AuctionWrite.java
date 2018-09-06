package controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import model.AuctionDAO;
import model.AuctionDTO;
import util.FileUtil;


public class AuctionWrite extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{//등록 페이지로 이동(포워드)
		RequestDispatcher dis = 
		req.getRequestDispatcher("/auction/auction_write.jsp");
		dis.forward(req, resp);		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		//등록 관련 폼값을 받은 후 처리
		req.setCharacterEncoding("UTF-8");
		
		int sucOrFail;

		String auction_check_in = req.getParameter("auction_check_in");
		String auction_check_out = req.getParameter("auction_check_out");
		int start_price = Integer.parseInt(req.getParameter("start_Price"));
		int auction_unit = Integer.parseInt(req.getParameter("auction_unit"));
		String auction_stime = req.getParameter("auction_stime");
		String auction_etime = req.getParameter("auction_etime");
		String auction_regidate = req.getParameter("nowDate");
		String lodge_name = req.getParameter("lodge_name");
		String lodge_type = req.getParameter("lodge_type");
		String room_type = req.getParameter("room_type");
		String room_no = req.getParameter("room_no");
		int lodge_no = Integer.parseInt(req.getParameter("lodge_no"));
		
		System.out.println(auction_check_in);
		System.out.println(auction_check_out);
		System.out.println(start_price);
		System.out.println(auction_unit);
		System.out.println(auction_stime);
		System.out.println(auction_etime);
		System.out.println(auction_regidate);
		
		AuctionDTO dto = new AuctionDTO();
		
		
		dto.setStart_price(start_price);
		dto.setAuction_stime(auction_stime);
		dto.setAuction_etime(auction_etime);
		dto.setAuction_unit(auction_unit);
		dto.setAuction_check_in(auction_check_in);
		dto.setAuction_check_out(auction_check_out);
		dto.setAuction_regidate(auction_regidate);
		dto.setLodge_name(lodge_name);
		dto.setLodge_type(lodge_type);
		dto.setRoom_type(room_type);
		dto.setRoom_no(room_no);
		dto.setLodge_no(lodge_no);
		
		AuctionDAO dao = new AuctionDAO();
		sucOrFail = dao.auction_insert(dto);
		dao.close();
		
		
		if(sucOrFail==1)
		{
			resp.sendRedirect("../Yagaja/AuctionList?mode=1");
		}
		else
		{
			req.getRequestDispatcher("/auction/auction_write.jsp").forward(req, resp);
		}
		
	}
	
	
}
