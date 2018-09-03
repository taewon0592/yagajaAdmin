package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.HotdealDAO;
import model.HotdealDTO;

public class HotdealView extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String hotdeal_no = req.getParameter("hotdeal_no");

		HotdealDAO dao = new HotdealDAO();
		
		HotdealDTO dto = dao.view(hotdeal_no);
		
		dao.close();
		
		req.setAttribute("hotdeal_no", hotdeal_no);

		req.setAttribute("dto", dto);
	
		
		//쓰기폼으로 포워드
		RequestDispatcher dis = req.getRequestDispatcher("/hotdeal/hotdeal_view.jsp");
		dis.forward(req, resp);
	}
}
