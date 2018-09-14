package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ReservationDAO;
import model.ReservationDTO;

public class ReservationView extends HttpServlet
{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String reser_no = req.getParameter("reser_no");
		
		ReservationDAO dao = new ReservationDAO();
		
		ReservationDTO dto = dao.view(reser_no);
		
		dao.close();
		
		req.setAttribute("reser_no", reser_no);
		req.setAttribute("dto", dto);
		
		RequestDispatcher dis = req.getRequestDispatcher("/reservation/reser_view.jsp");
		dis.forward(req, resp);
	}
}
