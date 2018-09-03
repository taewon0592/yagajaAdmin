package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class NoticeDAO {

	Connection con;
	PreparedStatement psmt;
	ResultSet rs;

	public NoticeDAO() {
		
		try 
		{
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			String id = "yagaja";
			String pw = "1119";
			con = DriverManager.getConnection(url, id, pw);
			System.out.println("DB 연결 성공");
		    
		} 
		catch (Exception e) 
		{
			System.out.println("DB 연결 실패");
		}
	}

	// 자원반납하기
	public void close() {
		
		try {
			
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (con != null)
				con.close();
		} 
		catch (Exception e) {
			
			System.out.println("자원반납시 예외발생");
			e.printStackTrace();
		}
	}
	
	// 공지사항 테이블의 전체 레코드 갯수 얻기
	public int getTotalRecordCount(Map map) {
		
		int totalCount = 0;
		
		try {
			
			String sql = "SELECT COUNT(*) FROM notice ";

			if (map.get("Word") != null) {
				
				sql += " WHERE " + map.get("Column") + " " + " LIKE '%" + map.get("Word") + "%' ";
			}

			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);
			
		} 
		catch (Exception e) {}
		
		return totalCount;
	}
	
	// 공지사항 게시물 리스트 출력하기(list)
	public List<NoticeDTO> selectList() {
		
		// 1.결과 레코드셋을 담기위한 컬렉션 생성
		List<NoticeDTO> noti = new Vector<NoticeDTO>();

		// 2.게시물을 가져오기 위한 쿼리작성
		String sql = "SELECT * FROM notice " + " WHERE 1=1 " + " ORDER BY notice_no DESC";
		
		try {
			
			// 3.prepare 객체생성 및 실행
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				
				// 4.결과셋을 DTO객체에 담는다.
				NoticeDTO dto = new NoticeDTO();

				dto.setNotice_no(rs.getString(1));	
				dto.setNotice_title(rs.getString(2));
				dto.setNotice_contents(rs.getString(3));
				dto.setNotice_regidate(rs.getDate(4));
				dto.setNotice_name(rs.getString(5));

				// 5.DTO객체를 컬렉션에 추가한다.
				noti.add(dto);
			}
		} 
		catch (Exception e) {
			
			e.printStackTrace();
		}
		// 6.DTO객체를 담은 List컬렉션을 반환
		return noti;
	}
	
	// 페이징처리를 위한 select 메소드
	public List<NoticeDTO> selectPaging(Map map) {
		
		List<NoticeDTO> noti = new Vector<NoticeDTO>();
		String sql = "" 
					+ "SELECT * FROM (" 
					+ "    SELECT Tb.*, rownum rNum FROM ("
					+ "        SELECT * FROM notice ";

		if (map.get("Word") != null) {
			sql += " WHERE " + map.get("Column") + " " 
				+ " LIKE '%" + map.get("Word") + "%' ";
		}

				sql += " ORDER BY notice_no DESC"
				+ "    ) Tb" 
				+ ")" 
				+ " WHERE rNum BETWEEN ? and ?";

		System.out.println("쿼리문:" + sql);

		try {
			// 3.prepare 객체생성 및 실행
			psmt = con.prepareStatement(sql);

			psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
			psmt.setInt(2, Integer.parseInt(map.get("end").toString()));

			rs = psmt.executeQuery();
			while (rs.next()) {
				// 4.결과셋을 DTO객체에 담는다.
				NoticeDTO dto = new NoticeDTO();

				dto.setNotice_no(rs.getString(1));
				dto.setNotice_title(rs.getString(2));
				dto.setNotice_contents(rs.getString(3));
				dto.setNotice_regidate(rs.getDate(4));
				dto.setNotice_name(rs.getString(5));

				// 5.DTO객체를 컬렉션에 추가한다.
				noti.add(dto);
			}
		} 
		catch (Exception e) {
			
			e.printStackTrace();
		}

		return noti;
	}
	
	// 공지사항 작성하기(write)
	public int insertWrite(NoticeDTO dto) {
		
		int affected = 0;	// 적용된 행의갯수
		
		try {
			
			String sql = " INSERT INTO notice ( " 
					+ " notice_no, " 
					+ " notice_title, notice_contents, notice_name) "
					+ " VALUES (" 
					+ " notice_no_seq.NEXTVAL, ?, ?, ?) ";
			
			psmt = con.prepareStatement(sql);
			
			psmt.setString(1, dto.getNotice_title());
			psmt.setString(2, dto.getNotice_contents());
			psmt.setString(3, dto.getNotice_name());

			affected = psmt.executeUpdate();
		} 
		catch (Exception e) {
			
			e.printStackTrace();
		}
		return affected;
	}
	
	// 공지사항 상세보기(view)
	public NoticeDTO selectView(String idx) {
		
		NoticeDTO dto = null;

		String sql = "SELECT * FROM notice " + " WHERE notice_no=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, idx);
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				dto = new NoticeDTO();

				dto.setNotice_no(rs.getString(1));
				dto.setNotice_title(rs.getString(2));
				dto.setNotice_contents(rs.getString(3));
				dto.setNotice_regidate(rs.getDate(4));
				dto.setNotice_name(rs.getString(5));

			}
		} 
		catch (Exception e) {
			
			e.printStackTrace();
		}

		return dto;
	}
	
	// 공지사항 게시물 수정하기
	public int updateEdit(NoticeDTO dto) {

		int affected = 0;
		
		try {
			String sql = " UPDATE notice SET " 
					+ " notice_title=?, notice_contents=?, notice_name=? " 
					+ " WHERE notice_no=? ";

			psmt = con.prepareStatement(sql);
			
			psmt.setString(1, dto.getNotice_title());
			psmt.setString(2, dto.getNotice_contents());
			psmt.setString(3, dto.getNotice_name());
			psmt.setString(4, dto.getNotice_no());

			affected = psmt.executeUpdate();
		} 
		catch (Exception e) {
			
			e.printStackTrace();
		}

		return affected;
	}
	
	// 게시물 삭제하기
	public int delete(String idx) {
		
		int affected = 0;
		
		try {
			
			String sql = "DELETE FROM notice " + " WHERE notice_no=?";

			psmt = con.prepareStatement(sql);
			psmt.setString(1, idx);

			affected = psmt.executeUpdate();
			
		} 
		catch (Exception e) {
			
			System.out.println("delete중 예외발생");
			e.printStackTrace();
		}

		return affected;
	}
	
}
