package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.LodgeDAO;
import model.LodgeDTO;

public class WriteChange extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String lodge_name = req.getAttribute("lodge_name").toString();
		
		LodgeDAO dao = new LodgeDAO();
		LodgeDTO dto =dao.selectLodge_No(lodge_name);
		
		System.out.println("lodge_no "+dto.getLodge_no());
		
		req.setAttribute("lodge_no", dto.getLodge_no());
		dao.close();
		

		RequestDispatcher dis = req.getRequestDispatcher("/lodge/room_write.jsp");
		dis.forward(req, resp);

	}
}