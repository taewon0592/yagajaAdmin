package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import model.LodgeDAO;
import model.LodgeDTO;

public class LodgeSearch extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 서블릿에서 폼값 한글 처리
		req.setCharacterEncoding("UTF-8");

		// 서블릿에서 즉시 컨텐츠를 출력할 경우 한글처리
		resp.setContentType("text/html;charset=utf-8;");

		String lodgename = req.getParameter("lodgename");
		System.out.println("lodgename:"+lodgename);

		// 검색어를 파라미터로 DAO호출 후 JSON출력을 담당하는 메소드 호출
		String resultJSON = getJSON(lodgename);

		// 화면상에 출력
		resp.getWriter().write(resultJSON);
	}

	public String getJSON(String lodgename) {
		// JSON배열을 만들기 위한 선언
		JSONArray jsonArr = new JSONArray();
		
		//dao에서 회원정보 검색 후 결과 반환
		LodgeDAO dao = new LodgeDAO();
		List<LodgeDTO> lodges = dao.searchLodge(lodgename);
		
		for(LodgeDTO l : lodges) {
			JSONObject jsonObj = new JSONObject();
			
			jsonObj.put("lodge_no", l.getLodge_no());
			jsonObj.put("lodge_name", l.getLodge_name());
			jsonObj.put("lodge_type", l.getLodge_type());
			jsonObj.put("lodge_tel", l.getLodge_tel());
			jsonObj.put("room_no", l.getRoom_no());
			jsonObj.put("room_type", l.getRoom_type());
			
			jsonArr.add(jsonObj);
		}
		return jsonArr.toString();
	}
}
