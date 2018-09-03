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

public class RoomtypeSearch extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 서블릿에서 폼값 한글 처리
		req.setCharacterEncoding("UTF-8");

		// 서블릿에서 즉시 컨텐츠를 출력할 경우 한글처리
		resp.setContentType("text/html;charset=utf-8;");

		String room_type = req.getParameter("room_type");
		resp.getWriter().write("객실타입:" +room_type);

		// 검색어를 파라미터로 DAO호출 후 JSON출력을 담당하는 메소드 호출
		String resultJSON = getJSON(room_type);

		// 화면상에 출력
		resp.getWriter().write(resultJSON);
	}

	public String getJSON( String room_type) {
		// JSON배열을 만들기 위한 선언
		JSONArray Arrjson = new JSONArray();

		// dao에서 회원정보 검색 후 결과 반환
		LodgeDAO dao = new LodgeDAO();
		List<LodgeDTO> types = dao.getType(room_type);

		for (LodgeDTO s : types) {
			JSONObject objJson = new JSONObject();
			
			objJson.put("room_type", s.getRoom_type());
			objJson.put("room_no", s.getRoom_no());
			
			System.out.println(s.getRoom_no());
			
			
			Arrjson.add(objJson);
		}
		return Arrjson.toString();
	}
}
