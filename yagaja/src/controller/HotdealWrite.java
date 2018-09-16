package controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.MultipartRequest;

import util.FileUtil;
import model.HotdealDAO;
import model.HotdealDTO;
import model.LodgeDAO;
import model.LodgeDTO;


public class HotdealWrite extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 글쓰기 페이지로 이동(포워드)
		RequestDispatcher dis = req.getRequestDispatcher("/hotdeal/hotdeal_write.jsp");// 404에러가 뜬다면 제일먼저★ 뷰호출부분 확인하기
		dis.forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 한글처리
		req.setCharacterEncoding("UTF-8");
		
		String hotdeal_stime = req.getParameter("hotdeal_stime");
		String hotdeal_etime = req.getParameter("hotdeal_etime");
		String hotdeal_price = req.getParameter("hotdeal_price");
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
		
		dto.setHotdeal_stime(hotdeal_stime);
		dto.setHotdeal_etime(hotdeal_etime);
		dto.setHotdeal_price(hotdeal_price);
		dto.setHotdeal_sday(hotdeal_sday);
		dto.setHotdeal_eday(hotdeal_eday);
		dto.setHotdeal_sell(hotdeal_sell);
		dto.setHotdeal_date(hotdeal_date);
		dto.setLodge_name(lodge_name);
		dto.setLodge_type(lodge_type);
		dto.setRoom_type(room_type);
		dto.setRoom_no(room_no);
		dto.setLodge_no(lodge_no);
			
		HotdealDAO dao = new HotdealDAO();
		int sucOrFail = dao.insert(dto);
			dao.close();
			
		if (sucOrFail == 1) {
			// DB입력성공일때
			resp.sendRedirect("../HotDeal/HotDealList");
		} else {
			// DB입력실패 혹은 파일업로드 실패시
			req.getRequestDispatcher("/hotdeal/hotdeal_write.jsp").forward(req, resp);// 데이터처리할게 없기 때문에 서블릿을 통해 처리하지 않는다.
		}
	}
}
