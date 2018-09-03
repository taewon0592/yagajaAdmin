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


import util.PagingUtil;
import model.HotdealDAO;
import model.HotdealDTO;

public class HotdealList extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	HotdealDAO dao = new HotdealDAO();	
	
	Map<String, Object> param = new HashMap<String, Object>();
	
	//문자열 검색을 위한 변수선언
	String addQueryString = "";
	
	//검색기능 구현
	String searchColumn = req.getParameter("searchColumn");
	String searchWord = req.getParameter("searchWord");
	
	if (searchColumn != null) {
		addQueryString = String.format("searchColumn=%s" + "&searchWord=%s&", searchColumn, searchWord);

		// 맵에 저장
		param.put("Column", searchColumn);
		param.put("Word", searchWord);

	}
	
	
	//전체 레코드수를 카운트하기
	//1. 게시판 테이블의 전체 레코드 개수 구하기
	int totalRecordCount = dao.getTotalRecordCount(param);
	
	int pageSize =Integer.parseInt(this.getInitParameter("PAGE_SIZE"));
	int blockPage = Integer.parseInt(this.getInitParameter("BLOCK_PAGE"));

	
	// 2. 전체 페이지수 계산하기
	int totalPage = (int) Math.ceil((double) totalRecordCount / pageSize);

	System.out.println("전체레코드수:" + totalRecordCount);
	System.out.println("전체페이지수:" + totalPage);

	/*
	3. 페이지번호를 파라미터로 받는다. 단, 최초 접속시에는
	페이지번호가 없으므로 무조건 1페이지로 설정한다.
	*/
	int nowPage = (req.getParameter("nowPage") == null || req.getParameter("nowPage").equals("")) ? 1 : Integer.parseInt(req.getParameter("nowPage"));
	
	/*
	4. 가져올 레코드의 구간을 결정하기 위한 연산
	*/
	int start = (nowPage-1) * pageSize + 1;
	int end = nowPage * pageSize;
	
	/*
	5. map에 구간을 추가
	*/
	param.put("start", start);
	param.put("end", end);

	/*
	 * 가상번호 계산을 위한 추가
	 */
	param.put("totalPage", totalPage);//전체페이지수
	param.put("nowPage", nowPage);//현재페이지수
	param.put("totalCount", totalRecordCount);
	param.put("pageSize", pageSize);
	

	List<HotdealDTO> lists = dao.selectPaging(param);
	
	
	
	// 페이지 처리를 위한 문자열 생성
	String pagingImg = PagingUtil.pagingImgServlet(totalRecordCount, pageSize, blockPage, nowPage,
			"../HotDeal/HotDealList?" + addQueryString);
	
	dao.close();
	
	req.setAttribute("lists", lists);// 결과 레코드셋
	req.setAttribute("pagingImg", pagingImg);
	req.setAttribute("map", param);// 파라미터
	
	// 뷰호출
	RequestDispatcher dis = req.getRequestDispatcher("/hotdeal/hotdeal_list.jsp");
	dis.forward(req, resp);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	//POST로 들어온 요청도 doGet()메소드에서 처리할 수 있도록 호출해준다.
		doGet(req, resp);
	}
}
