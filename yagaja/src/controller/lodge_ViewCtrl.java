package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;

import model.LodgeDAO;
import model.LodgeDTO;
import util.PagingUtil;

public class lodge_ViewCtrl extends HttpServlet {
	
	@Override
	public void service(ServletRequest req, ServletResponse resp) throws ServletException, IOException {
		
		String lodge_no = req.getParameter("lodge_no");
		
		LodgeDAO dao = new LodgeDAO();
		
		Map param = new HashMap();
		
		//문자열 검색을 위한 변수선언
		String addQueryString = "";
		
		//검색기능구현
		String searchColumn = req.getParameter("searchColumn");
		String searchWord = req.getParameter("searchWord");
		if(searchColumn!=null) {
			addQueryString = String.format("searchColumn=%s&searchWord=%s&", searchColumn, searchWord);
			
			param.put("Column", searchColumn);
			param.put("Word", searchWord);
		}
		//1. 게시판 테이블의 전체 레코드 개수 구하기
		int totalRecordCount = dao.getTotalRecordCount(param);
		//2. web.xml에 설정된 페이지사이즈와 블럭페이지 가져오기
		int pageSize = Integer.parseInt(this.getInitParameter("PAGE_SIZE"));
		int blockPage = Integer.parseInt(this.getInitParameter("BLOCK_PAGE"));
		
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
		
		System.out.println("전체레코드수 : " +totalRecordCount);
		System.out.println("전체페이지수 : " +totalPage);
		
		int nowPage = (req.getParameter("nowPage")==null || req.getParameter("nowPage").equals("")) ? 1 : Integer.parseInt(req.getParameter("nowPage"));
			
		
		//5. 가져올 레코드의 구간을 결정하기 위한 연산
		int start = (nowPage-1) * pageSize+1;
		int end = nowPage * pageSize;
		
		//6. map에 구간을 추가
		param.put("start", start);
		param.put("end", end);
		param.put("lodge_no", lodge_no);
		//가상번호 계산을 위한 추가
		param.put("totalPage", totalPage); 			//전체페이지수
		param.put("nowPage", nowPage);				//현재페이지
		param.put("totalCount", totalRecordCount);  //전체레코드개수
		param.put("pageSize", pageSize);			//한페이지에 출력
		
		List<LodgeDTO> lists = dao.room_selectpaging(param);
		
		String pagingImg = PagingUtil.pagingImgServlet(totalRecordCount,pageSize,blockPage, nowPage,"../lodge/lodge_list?"+addQueryString);
		
		
		LodgeDTO dto = dao.selectView(lodge_no);
		/*	dto.setLodge_note(dto.getLodge_note().replaceAll("\r\n", "<br/>"));*/
		dao.close();
		
		
		//리퀘스트 영역에 저장하기
		req.setAttribute("lists", lists);//결과 레코드셋
		//페이지번호 출력 문자열 저장
		req.setAttribute("pagingImg", pagingImg);
		req.setAttribute("map", param);//파라미터
				
		req.setAttribute("lodge_no", lodge_no);
		req.setAttribute("dto", dto);	
		
		RequestDispatcher dis = 
		req.getRequestDispatcher("/lodge/lodge_view.jsp");
				dis.forward(req, resp);
	}
}
