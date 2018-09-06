package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AuctionDAO;
import model.AuctionDTO;



public class Auction_Edit extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 수정페이지 띄워줘야함
		// 한글 처리
		req.setCharacterEncoding("UTF-8");

		String auction_no = req.getParameter("auction_no");

		System.out.println(auction_no);
		AuctionDAO dao = new AuctionDAO();
		AuctionDTO dto = dao.view(auction_no);

		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/auction/auction_edit.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");

		// 수정처리를 위한 핫딜일련번호, 현재페이지 파라미터
		int auction_no = Integer.parseInt(req.getParameter("auction_no"));
		String nowPage = req.getParameter("nowPage");
		System.out.println("옥션넘버:"+auction_no);

		req.setAttribute("auction_no", auction_no);
		req.setAttribute("nowPage", nowPage);

		String auction_stime = req.getParameter("auction_stime");
		String auction_etime = req.getParameter("auction_etime");
		int start_price = Integer.parseInt(req.getParameter("start_Price"));
		String auction_check_in = req.getParameter("auction_check_in");
		String auction_check_out = req.getParameter("auction_check_out");
		
		int auction_unit = Integer.parseInt(req.getParameter("auction_unit"));
		String lodge_name = req.getParameter("lodge_name");
		String lodge_type = req.getParameter("lodge_type");
		String room_type = req.getParameter("room_type");
		String room_no = req.getParameter("room_no");
		int lodge_no = Integer.parseInt(req.getParameter("lodge_no"));

		AuctionDTO dto = new AuctionDTO();
		dto.setAuction_no(auction_no);
		dto.setAuction_stime(auction_stime);
		dto.setAuction_etime(auction_etime);
		dto.setStart_price(start_price);
		dto.setAuction_check_in(auction_check_in);
		dto.setAuction_check_out(auction_check_out);
		dto.setAuction_unit(auction_unit);
		dto.setLodge_name(lodge_name); 
		dto.setLodge_type(lodge_type);
		dto.setRoom_type(room_type);
		dto.setRoom_no(room_no);
		dto.setLodge_no(lodge_no);

		AuctionDAO dao = new AuctionDAO();
		// 수정완료후 상세보기페이지로 이동하므로 hotdeal_no값이 영역에 저장되어야 함.

		int sucOrFail = dao.update(dto);
		dao.close();

		// 게시물 수정이 성공적
		if (sucOrFail == 1) {
			// DB입력성공일때
			resp.sendRedirect("../Yagaja/AuctionView?auction_no=" + auction_no + "&nowPage=" + nowPage);

		} else {
			// DB입력실패 혹은 파일업로드 실패시
			req.getRequestDispatcher("/auction/auction_edit.jsp").forward(req, resp);// 데이터처리할게 없기 때문에 서블릿을 통해 처리하지 않는다.
		}
	}
}
