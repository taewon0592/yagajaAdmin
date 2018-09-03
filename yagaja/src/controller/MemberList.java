package controller;

import java.io.IOException;
import java.text.NumberFormat;
import java.util.Currency;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.YagajaMemberDAO;
import model.YagajaMemberDTO;
import util.PagingUtil;

public class MemberList extends HttpServlet
{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//한글 처리
		req.setCharacterEncoding("UTF-8");
		
		//게시판 리스트 비즈니스 로직 작성
		
		//DB연결을 위한 DAO 호출
		YagajaMemberDAO dao = new YagajaMemberDAO();
		//파라미터 저장을 위한 Map타입의 변수생성
		Map param = new HashMap();		
		
		//문자열 검색을 위한 변수선언
		String addQueryString = "";

		//검색기능구현
		String searchColumn = req.getParameter("searchColumn");
		String searchWord = req.getParameter("searchWord");
		
		//기간검색 추가
		String search_sday = req.getParameter("search_sday");
		String search_eday = req.getParameter("search_eday");
		
			
		if(searchColumn!=null)
		{
			//파라미터 추가(문자열 검색 파라미터를 페이지 처리)
			/*addQueryString = String.format("searchColumn=%s"
				+"&searchWord=%s&",
				searchColumn, searchWord);*/
						
			addQueryString = String.format("searchColumn=%s"
					+"&searchWord=%s&"
					+ "search_sday=%s" 
					+ "&search_eday=%s&",
					searchColumn, searchWord,search_sday,search_eday);
			
			//입력된 검색어가 있다면 맵에 저장
			param.put("Column", searchColumn);
			param.put("Word", searchWord);
			param.put("search_sday", search_sday);
			param.put("search_eday", search_eday);
		}
		
		//전체 레코드수를 카운트하기
		//1.게시판 테이블의 전체 레코드 갯수 구하기
		int totalRecordCount = 
			dao.getTotalRecordCount(param);		
		
		//2.해당 매핑정보가 있는 위치에서 꺼내오기
		int pageSize = 
			Integer.parseInt(this.getInitParameter("PAGE_SIZE"));
		int blockPage = 
			Integer.parseInt(this.getInitParameter("BLOCK_PAGE"));
					
		//3.전체 페이지수 계산하기
		int totalPage = 
			(int)Math.ceil((double)totalRecordCount/pageSize);

		System.out.println("전체레코드수:"+ totalRecordCount);
		System.out.println("전체페이지수:"+ totalPage);
		
		
		/*
		4.페이지번호를 파라미터로 받는다. 단, 최초 접속시에는
		페이지번호가 없으므로 무조건 1페이지로 설정한다.
		*/
		int nowPage = (req.getParameter("nowPage")==null
			|| req.getParameter("nowPage").equals(""))
			?
			1 
			: 
			Integer.parseInt(req.getParameter("nowPage"));

		/*
		5.가져올 레코드의 구간을 결정하기 위한 연산
		*/
		int start = (nowPage-1) * pageSize + 1;
		int end = nowPage * pageSize;

		/*
		6.파라미터 전달을 위해 map에 구간을 추가
		*/
		param.put("start", start);
		param.put("end", end);		
		
		/*
		가상번호 계산을 위한 추가
		*/
		param.put("totalPage", totalPage);//전체페이지수
		param.put("nowPage", nowPage);//현재페이지
		param.put("totalCount", totalRecordCount);//전체레코드갯수
		param.put("pageSize", pageSize);//한페이지에 출력할 게시물갯수	
		
		/*
		레코드를 가져올때 반드시 List 계열의 컬렉션 사용
		Set계열의 컬렉션은 저장된 요소의 순서를 보장하지 않기때문에
		게시판 목록을 구현할때 문제가 될 수 있음
		*/
		//DAO호출하여 레코드 가져오기(페이지처리O)
		List<YagajaMemberDTO> lists = dao.selectPaging(param);	
		
		//페이지 처리를 위한 문자열 생성
		String pagingImg = PagingUtil.pagingImgServlet(
			totalRecordCount,pageSize,
			blockPage, nowPage, 
			"../Member/MemberList?"+addQueryString);		
		
		//커넥션풀에 자원반납
		dao.close();
		
		//리퀘스트 영역에 저장하기
		req.setAttribute("lists", lists);//결과 레코드셋
		//페이지번호 출력 문자열 저장
		req.setAttribute("pagingImg", pagingImg);
		req.setAttribute("map", param);//파라미터		
		
		RequestDispatcher dis = req.getRequestDispatcher("/member/member_list.jsp");
		dis.forward(req, resp);
	}
}
