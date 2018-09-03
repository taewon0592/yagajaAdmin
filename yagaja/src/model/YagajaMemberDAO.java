package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class YagajaMemberDAO {
	Connection con; //오라클 서버와 연결할때 사용
	PreparedStatement psmt; //오라클 서버와 쿼리전송 역할
	ResultSet rs; //쿼리의 결과를 받을때 사용	
	public YagajaMemberDAO() {		
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
	//자원반납하기
	public void close() {
		try {
			if(rs!=null) rs.close();
			if(psmt!=null) psmt.close();
			if(con!=null) con.close();
		}
		catch(Exception e) {
			System.out.println("자원반납시 예외발생");
			e.printStackTrace();
		}
	}
	
	//게시판테이블의 전체 레코드 갯수 얻기
	public int getTotalRecordCount(Map map)
	{
		int totalCount = 0;
		try{
			String sql 
			
			= "SELECT COUNT(*) FROM member ";
										
			if(map.get("Word")!=null){
				sql +=" WHERE "+map.get("Column")+" "
					+ " LIKE '%"+map.get("Word")+"%' AND authority LIKE 'user' ";				
			}
			else {
				sql += " WHERE authority LIKE 'user' ";
			}
			
			sql +=" ORDER BY member_no DESC ";
			
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);
		}
		catch(Exception e){}
		return totalCount; 
	}
	
	//페이징처리를 위한 select 메소드
	public List<YagajaMemberDTO> selectPaging(Map map)
	{
		List<YagajaMemberDTO> ygj = new Vector<YagajaMemberDTO>();		
		
			String sql = " SELECT * FROM ( SELECT * FROM ("
						+"    SELECT Tb.*, rownum rNum FROM ( "
						+ " SELECT * FROM member ";
				
			if(map.get("Word")!=null){
				sql +=" WHERE "+map.get("Column")+" "
					+ " LIKE '%"+map.get("Word")+"%' AND authority LIKE 'user' "							
					+ " ORDER BY member_no DESC "
					+"    ) Tb"
					+" ) "
					+" WHERE rNum BETWEEN ? and ? "	;
					//기간 검색
					if(map.get("search_sday")!="" && map.get("search_eday")!=""){ 
						sql +=" ) WHERE regidate >= "
								+ " TO_DATE('"+map.get("search_sday")+ "', 'yyyy-mm-dd') "
										+ " AND regidate <= "
										+ " TO_DATE('"+map.get("search_eday")+ "', 'yyyy-mm-dd') ";
					}
					//전체 기간 검색
					else {
						sql +=" ) WHERE 1=1 ";
					}					
			}
			
			else {
				sql += " WHERE authority LIKE 'user' "
						+ " ORDER BY member_no DESC "
						+"    ) Tb "
						+" ) WHERE rNum BETWEEN ? and ? "
						+ " ) WHERE 1=1 ";							
			}					
	
				System.out.println("쿼리문:"+sql);

		try{
			//3.prepare 객체생성 및 실행
			psmt = con.prepareStatement(sql);
			
			
			if(map.get("Word")!=null){
				psmt.setInt(1, 
					Integer.parseInt(map.get("start").toString()));
				psmt.setInt(2, 
					Integer.parseInt(map.get("end").toString()));

			}
			else {
				psmt.setInt(1, 
					Integer.parseInt(map.get("start").toString()));
				psmt.setInt(2, 
					Integer.parseInt(map.get("end").toString()));
			}
			
			
			rs = psmt.executeQuery();
			while(rs.next())
			{
				//4.결과셋을 DTO객체에 담는다.
				YagajaMemberDTO dto = new YagajaMemberDTO();							 
				
				dto.setMember_no(rs.getString(1));
				dto.setId(rs.getString(2));
				dto.setPass(rs.getString(3));
				dto.setNickname(rs.getString(4));
				dto.setPhone(rs.getString(5));
				dto.setM_point(rs.getString(6));
				dto.setEmail(rs.getString(7));
				dto.setRegidate(rs.getString(8).substring(0,10));
				dto.setAuthority(rs.getString(9));

				
				//5.DTO객체를 컬렉션에 추가한다.
				ygj.add(dto);

			}
		}
		catch(Exception e){
			e.printStackTrace();
		}		
		return ygj;
	}
		
	//회원 상세보기
	public YagajaMemberDTO selectView(String member_no)
	{
		YagajaMemberDTO dto = null;
		
		String sql = " select * from member where member_no=? ";
		
		try
		{
			psmt = con.prepareStatement(sql);
			psmt.setString(1, member_no);
			rs = psmt.executeQuery();
			
			if(rs.next())
			{
				dto = new YagajaMemberDTO();
				
				dto.setMember_no(rs.getString(1));
				dto.setId(rs.getString(2));
				dto.setPass(rs.getString(3));
				dto.setNickname(rs.getString(4));
				dto.setPhone(rs.getString(5));
				dto.setM_point(rs.getString(6));
				dto.setEmail(rs.getString(7));
				dto.setRegidate(rs.getString(8).substring(0,10));
				dto.setAuthority(rs.getString(9));
				System.out.println("selectView -> member_no:"+member_no);
				System.out.println("rs.getString:"+rs.getString(1));
				System.out.println("sql:"+sql);
			}
		}
		catch(Exception e) 
		{
			System.out.println("DAO 상세보기 오류");
			e.printStackTrace();
		}
		
		return dto;
	}
		
	//회원 삭제하기 : DELETE 문
	public int delete(String checkDel)
	{
		String[] noAndId = checkDel.split(",");
		
		int affected = 0;
		try
		{
			String query = " delete from member where member_no=? ";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, noAndId[0]);
			
			affected = psmt.executeUpdate();
			System.out.println("member_no="+noAndId);
			System.out.println("query="+query);
		}
		catch(Exception e)
		{
			System.out.println("DAO 삭제하기 오류");
			e.printStackTrace();
		}
		return affected;
	}
		
	public int deleteAdmin(String checkDel)
	{
		String[] noAndId = checkDel.split(",");

		int affected = 0;
		try
		{
			String query = " insert into leave_member (id, member_no,leave_reason,leave_reason2,leave_date,authority) values (?,?,?,?,sysdate,?)";
			
			psmt = con.prepareStatement(query);
			psmt.setString(3, "관리자삭제");
			psmt.setString(4, "예약취소 10회");
			psmt.setString(1, noAndId[1]);
			psmt.setString(2, noAndId[0]);
			psmt.setString(5, "dropuser");
			
			affected = psmt.executeUpdate();
						
			System.out.println("member_no="+noAndId[0]);
			System.out.println("id="+noAndId[1]);
			System.out.println("query="+query);
		}
		catch(Exception e)
		{
			System.out.println("DAO 삭제하기 오류");
			e.printStackTrace();
		}
		return affected;
	}
		
	//회원 삭제하기 : DELETE 문
	public int delete1(String member_no)
	{		
		int affected = 0;
		try
		{
			String query = " delete from member where member_no=? ";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, member_no);
			
			affected = psmt.executeUpdate();
			System.out.println("member_no="+member_no);
			System.out.println("query="+query);
		}
		catch(Exception e)
		{
			System.out.println("DAO 삭제하기 오류");
			e.printStackTrace();
		}
		return affected;
	}
		
	public int deleteAdmin1(String member_no, String id)
	{
		int affected = 0;
		try
		{
			String query = " insert into leave_member (id, member_no,leave_reason,leave_reason2,leave_date,authority) values (?,?,?,?,sysdate,?)";
			
			psmt = con.prepareStatement(query);
			psmt.setString(3, "관리자삭제");
			psmt.setString(4, "예약취소 10회");
			psmt.setString(1, id);
			psmt.setString(2, member_no);
			psmt.setString(5, "dropuser");
			
			affected = psmt.executeUpdate();
						
			System.out.println("member_no="+member_no);
			System.out.println("id="+id);
			System.out.println("query="+query);
		}
		catch(Exception e)
		{
			System.out.println("DAO 삭제하기 오류");
			e.printStackTrace();
		}
		return affected;
	}

	public int adminRegist(YagajaMemberDTO dto) {
		
		int affected = 0;
		try {
			String sql = " insert into member (member_no, id, pass, nickname, phone, email, authority) "
					+ " values (member_no_seq.nextval, ?, ?, ?, ?, ?, 'admin') ";
			
			psmt = con.prepareStatement(sql);
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getNickname());
			psmt.setString(4, dto.getPhone());
			psmt.setString(5, dto.getEmail());
			
			affected = psmt.executeUpdate();
			
		}
		catch(Exception e) {
			System.out.println("insert 중 예외발생");
			e.printStackTrace();
		}
		
		return affected;
		
	}
	
	
	// 관리자 로그인
	public Map<String, String> adminLogin(String id, String pass) {
		
		Map<String, String> info = new HashMap<String, String>();
		
		String sql = "select * from member where id=? and pass=? ";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pass);
			rs = psmt.executeQuery();
			
			if(rs.next())
			{
				info.put("id", rs.getString("id"));
				info.put("pass", rs.getString("pass"));
				info.put("nickname", rs.getString("nickname"));
			}
			else
			{
				System.out.println("결과셋이 없습니다.");
			}			 
		}
		catch(Exception e) {
			System.out.println("Select 시 오류발생");
			e.printStackTrace();
		}
		
		return info;
	}
}
