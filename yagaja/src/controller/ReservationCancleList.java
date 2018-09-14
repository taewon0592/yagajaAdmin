package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ReservationDAO;
import model.ReservationDTO;
import util.PagingUtil;

public class ReservationCancleList extends HttpServlet 
{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		
		//한글 처리
		req.setCharacterEncoding("UTF-8");
		
		//DB연결을 위한 DAO 호출
		ReservationDAO dao = new ReservationDAO();
		
		//파라미터 저장을 위한 Map 타입의 변수생성
		Map param = new HashMap();
		
		//문자열 검색을 위한 변수 선언
		String addQueryString = "";
		
		//검색기능구현
		String searchColumn = req.getParameter("searchColumn");
		String searchWord = req.getParameter("searchWord");
		
		if(searchColumn!=null)
		{
			addQueryString = String.format("searchColumn=%s"+"&searchWord=%s&", searchColumn, searchWord);
			
			//맵에 저장
			param.put("Column", searchColumn);
			param.put("Word", searchWord);
		}
		
		//전체 레코드수 카운트
		//1.게시판 테이블의 전체 레코드 갯수 구하기
		int totalRecordCount = dao.getTotalRecordCount1(param);
		
		//2.web.xml에 설정된 페이지사이즈와 블럭페이지 가져오기
		//서블릿에서 어플리케이션 영역 접근을 위한 설정
		//<context-param> 엘리먼트에 저장된 값을 가져온다.
		ServletContext application = this.getServletContext();
		
		int pageSize = Integer.parseInt(application.getInitParameter("PAGE_SIZE"));
		int blockPage = Integer.parseInt(application.getInitParameter("BLOCK_PAGE"));
		
		System.out.println("pageSize, blockPage = "+pageSize+", "+blockPage);
		
		//3.전체 페이지수 계산
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
		
		//4.페이지번호를 파라미터로 받는다. 최초 접속시 1로 설정
		int nowPage = (req.getParameter("nowPage")==null
				|| req.getParameter("nowPage").equals(""))
				? 1 : Integer.parseInt(req.getParameter("nowPage"));
		
		//5.가져올 레코드의 구간을 결정하기 위한 연산
		int start = (nowPage-1) * pageSize +1;
		int end = nowPage * pageSize;
		
		//6.map 에 구간을 추가
		param.put("start", start);
		param.put("end", end);
		
		//가상번호 계산을 위한 추가
		param.put("totalPage",totalPage);
		param.put("nowPage",nowPage);
		param.put("totalCount", totalRecordCount);
		param.put("pageSize", pageSize);
		
		//DAO 호출하여 레코드 가져오기(페이지처리O)
		List<ReservationDTO> lists = dao.selectPaging1(param);
		
		//페이지 처리를 위한 문자열 생성 
		String pagingImg = 
				PagingUtil.pagingImgServlet(totalRecordCount, pageSize, blockPage, nowPage, "../Reservation/ReservationCancleList?"+addQueryString);
		
		//커넥션풀에 자원반납
		dao.close();
		
		//리퀘스트 영역에 저장하기
		req.setAttribute("lists", lists); //결과 레코드셋
		//페이지번호 출력 문자열 저장
		req.setAttribute("pagingImg", pagingImg);
		req.setAttribute("map", param); //파라미터
		System.out.println("lists="+lists);
		System.out.println("param="+param);
		
		/*resp.sendRedirect("../reservation/reser_cancle_list.jsp");*/
		
		RequestDispatcher dis = req.getRequestDispatcher("/reservation/reser_cancle_list.jsp");
		dis.forward(req, resp);
		
	}
}
