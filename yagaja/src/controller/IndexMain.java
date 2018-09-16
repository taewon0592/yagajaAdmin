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
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import model.AuctionDAO;
import model.AuctionDTO;
import model.HotdealDAO;
import model.HotdealDTO;
import model.LodgeDAO;
import model.LodgeDTO;
import model.ReservationDAO;
import model.ReservationDTO;
import model.YagajaMemberDAO;
import model.YagajaMemberDTO;

public class IndexMain extends HttpServlet
{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{	
		//한글처리
		req.setCharacterEncoding("UTF-8");
		
		YagajaMemberDAO dao = new YagajaMemberDAO();
		YagajaMemberDTO dto = new YagajaMemberDTO();
		
		LodgeDAO ldao = new LodgeDAO();
		LodgeDTO ldto = new LodgeDTO();
		
		//총 보유 방에서 예약수를 빼자.
		
		ReservationDAO rdao = new ReservationDAO();
		ReservationDTO rdto = new ReservationDTO();
		
		AuctionDAO adao = new AuctionDAO();
		AuctionDTO adto = new AuctionDTO();
		
		HotdealDAO hdao = new HotdealDAO();
		HotdealDTO hdto = new HotdealDTO();
		
		//파라미터 저장을 위한 Map타입의 변수생성
		Map param = new HashMap();
		
		//필요 변수 선언
		String mc = "모텔";
		String hc = "호텔";
		String pc = "펜션";
		String gc = "게스트하우스";
		
		//가입된 멤버 카운트
		int memberCount = dao.getTotalRecordCount(param);
		//보유 숙소 카운트
		int lodgeCount = ldao.getTotalRecordCount(param);
		//숙소 타입별 카운트
		int motelCount = ldao.getTotalRecordCount(mc);
		int hotelCount = ldao.getTotalRecordCount(hc);
		int pensionCount = ldao.getTotalRecordCount(pc);
		int guesthouseCount = ldao.getTotalRecordCount(gc);
		//보유 숙소의 방 카운트
		int roomCount = ldao.getTotalRoomCount(param);
		//예약 카운트
		int reservationCount = rdao.getTotalRecordCount(param);			
		//예약 금액 합계
		int reservationSum = rdao.getTotalPaymentPrice(param);
		//예약된 숙소 카운트
		int reservationMotelCount = rdao.getTotalRecordCount(mc);
		int reservationHotelCount = rdao.getTotalRecordCount(hc);
		int reservationPensionCount = rdao.getTotalRecordCount(pc);
		int reservationGuestHouseCount = rdao.getTotalRecordCount(gc);
		
		//경매관리
		List<AuctionDTO> aLists = adao.mainAuction(param);
		System.out.println("aLists="+aLists);
		
		//핫딜관리		
		List<HotdealDTO> hLists = hdao.mainHotdeal(param);
		System.out.println("hLists="+hLists);
		
		
		//map 추가
		param.put("memberCount", memberCount);
		param.put("lodgeCount", lodgeCount);
		param.put("motelCount", motelCount);
		param.put("hotelCount", hotelCount);
		param.put("pensionCount", pensionCount);
		param.put("guesthouseCount", guesthouseCount);
		param.put("roomCount", roomCount);
		param.put("reservationCount", reservationCount);
		param.put("reservationSum", reservationSum);
		param.put("reservationMotelCount", reservationMotelCount);
		param.put("reservationHotelCount", reservationHotelCount);
		param.put("reservationPensionCount", reservationPensionCount);
		param.put("reservationGuestHouseCount", reservationGuestHouseCount);
		
		//자원해제
		dao.close();
		ldao.close();
		rdao.close();
		adao.close();
		//hdao.close();
		
		//리퀘스트 영역에 저장
		req.setAttribute("main", param);
		req.setAttribute("aList", aLists);
		req.setAttribute("hList", hLists);
		//요청명/Main/Index
		//메인주소 /Ex/index.jsp
		RequestDispatcher dis = req.getRequestDispatcher("/Ex/index.jsp");
		dis.forward(req, resp);		
	}
}
