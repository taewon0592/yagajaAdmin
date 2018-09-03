package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.HotdealDAO;
import model.HotdealDTO;

public class HotdealEdit extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//수정페이지 띄워줘야함
		
		String hotdeal_no = req.getParameter("hotdeal_no");
		
		System.out.println(hotdeal_no);
		HotdealDAO dao = new HotdealDAO();
		HotdealDTO dto = dao.view(hotdeal_no);
		
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/hotdeal/hotdeal_edit.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
	
		// 수정처리를 위한 핫딜일련번호, 현재페이지 파라미터
		String hotdeal_no = req.getParameter("hotdeal_no");
		String nowPage = req.getParameter("nowPage");
		
		req.setAttribute("hotdeal_no",hotdeal_no);
		req.setAttribute("nowPage", nowPage);
		

		String hotdeal_stime = req.getParameter("hotdeal_stime");
		String hotdeal_etime = req.getParameter("hotdeal_etime");
		String hotdeal_price = req.getParameter("hotdeal_price");
		String hotdeal_buy = req.getParameter("hotdeal_buy");
		String hotdeal_sell = req.getParameter("hotdeal_sell");
		String hotdeal_date = req.getParameter("hotdeal_date");
		String hotdeal_sday = req.getParameter("hotdeal_sday");
		String hotdeal_eday = req.getParameter("hotdeal_eday");
		String lodge_name = req.getParameter("lodge_name");
		String lodge_type = req.getParameter("lodge_type");
		String room_type = req.getParameter("room_type");
		String room_no = req.getParameter("room_no");
		String lodge_no = req.getParameter("lodge_no");
	
		HotdealDTO dto = new HotdealDTO();
		dto.setHotdeal_no(hotdeal_no);
		dto.setHotdeal_stime(hotdeal_stime);
		dto.setHotdeal_etime(hotdeal_etime);
		dto.setHotdeal_price(hotdeal_price);
		dto.setHotdeal_buy(hotdeal_buy);
		dto.setHotdeal_sell(hotdeal_sell);
		dto.setHotdeal_date(hotdeal_date);
		dto.setHotdeal_sday(hotdeal_sday);
		dto.setHotdeal_eday(hotdeal_eday);
		dto.setLodge_name(lodge_name);
		dto.setLodge_type(lodge_type);
		dto.setRoom_type(room_type);
		dto.setRoom_no(room_no);
		dto.setLodge_no(lodge_no);

		HotdealDAO dao = new HotdealDAO();
		// 수정완료후 상세보기페이지로 이동하므로 hotdeal_no값이 영역에 저장되어야 함.
		
		int sucOrFail = dao.update(dto);
		dao.close();

		
		// 게시물 수정이 성공적
		if (sucOrFail == 1) {
			// DB입력성공일때
			req.getRequestDispatcher("/HotDeal/HotdealView?hotdeal_no="+hotdeal_no+"&nowPage="+nowPage).forward(req, resp);
		}
		else {
			// DB입력실패 혹은 파일업로드 실패시
			req.getRequestDispatcher("/hotdeal/hotdeal_edit.jsp").forward(req, resp);// 데이터처리할게 없기 때문에 서블릿을 통해 처리하지 않는다.
		}
	}
}
