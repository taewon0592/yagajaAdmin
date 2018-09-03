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


public class YagajaLeaveMemberDAO {
	Connection con; //오라클 서버와 연결할때 사용
	PreparedStatement psmt; //오라클 서버와 쿼리전송 역할
	ResultSet rs; //쿼리의 결과를 받을때 사용
	public YagajaLeaveMemberDAO() {
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
			String sql = "SELECT COUNT(*) FROM leave_member ";
										
			if(map.get("Word")!=null)
			{
				if(map.get("Column").equals("direct_input"))
				{
					sql +=" WHERE "
							+ " id LIKE '%" + map.get("Word")+ "%' "
							+ " OR "
							+ " leave_reason LIKE '%" + map.get("Word")+ "%' "
							+ " OR"
							+ " leave_reason2 LIKE '%" + map.get("Word")+ "%' "
							+ " OR "
							+ " leave_date LIKE '%" + map.get("Word")+ "%' ";
	
				}					
			}
			sql +=" ORDER BY leave_date DESC ";
			
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);
		}
		catch(Exception e){}
		return totalCount; 
	}
	public List<YagajaLeaveMemberDTO> selectPaging(Map map)
	{
		List<YagajaLeaveMemberDTO> ygj = new Vector<YagajaLeaveMemberDTO>();
	
		String sql = " "
				+" SELECT * FROM ( SELECT * FROM ( "
				+"    SELECT Tb.*, rownum rNum FROM ("
				+"        SELECT * FROM leave_member ";
			
			if(map.get("Word")!=null){
				sql +=" WHERE "+map.get("Column")+" "
					+ " LIKE '%"+map.get("Word")+"%'"							
					+ " ORDER BY member_no DESC "
					+"    ) Tb"
					+" ) "
					+" WHERE rNum BETWEEN ? and ? "	;
					//기간 검색
					if(map.get("search_sday")!="" && map.get("search_eday")!=""){ 
						sql +=" ) WHERE leave_date >= "
								+ " TO_DATE('"+map.get("search_sday")+ "', 'yyyy-mm-dd') "
										+ " AND leave_date <= "
										+ " TO_DATE('"+map.get("search_eday")+ "', 'yyyy-mm-dd') ";
					}
					//전체 기간 검색
					else {
						sql +=" ) WHERE 1=1 ";
					}					
			}	
			else {
				sql += " ORDER BY leave_date DESC, member_no DESC "
						+"    ) Tb"
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
				YagajaLeaveMemberDTO dto = new YagajaLeaveMemberDTO();							 
				
				dto.setLeave_reason(rs.getString("leave_reason"));
				dto.setLeave_reason2(rs.getString("leave_reason2"));
				dto.setLeave_date(rs.getString("leave_date").substring(0,10));
				dto.setMember_no(rs.getString("member_no"));
				dto.setId(rs.getString("id"));
				dto.setAuthority(rs.getString("authority"));									
			
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
	public YagajaLeaveMemberDTO selectView(String member_no)
	{
		YagajaLeaveMemberDTO dto = null;
		
		String sql = " select * from leave_member where member_no=? ";
		
		try
		{
			psmt = con.prepareStatement(sql);
			psmt.setString(1, member_no);
			rs = psmt.executeQuery();
			
			if(rs.next())
			{
				dto = new YagajaLeaveMemberDTO();
				
				dto.setLeave_reason(rs.getString("leave_reason"));
				dto.setLeave_reason2(rs.getString("leave_reason2"));
				dto.setLeave_date(rs.getString("leave_date").substring(0,10));
				dto.setMember_no(rs.getString("member_no"));
				dto.setId(rs.getString("id"));
				dto.setAuthority(rs.getString("authority"));	
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
	public int delete(String member_no)
	{
		int affected = 0;
		try
		{
			String query = " delete from leave_member where member_no=? ";
			
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
	
	

}
