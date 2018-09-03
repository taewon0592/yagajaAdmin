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


public class SurroundDAO {
	
	Connection con; 
	PreparedStatement psmt;
	ResultSet rs;
	
	public SurroundDAO() {		
		
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
	//자원반납인가?
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
	
	//주변시설 리스트 띄우기
	public List<SurroundDTO> selectList(Map<String,Object> map){
		
		 
		List<SurroundDTO> sur = new Vector<SurroundDTO>();
		
		
		String query = "SELECT * FROM surround ORDER BY surround_no ASC";		
		
		System.out.println("이게 뭐죠?:"+ query);			
			
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, (int) map.get("surround_no"));
			psmt.setString(2, map.get("surround_name").toString());
			psmt.setString(3, map.get("surround_tel").toString());			
			psmt.setString(4, map.get("surround_addr").toString());			
			psmt.setString(5, map.get("surround_type").toString());					
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				
				SurroundDTO dto = new SurroundDTO();
				
				dto.setSurround_no(rs.getInt(1));
				dto.setSurround_name(rs.getString(2));
				dto.setSurround_tel(rs.getString(3));
				dto.setSurround_addr(rs.getString(4));
				dto.setSurround_type(rs.getString(5));
				
				sur.add(dto);
			}
		}
		catch(Exception e) {
			System.out.println("Select예외발생");
			e.printStackTrace();
		}
		
		return sur;
	}
	
	
	//개빡치게 여기 쿼리문부터 에러
	//게시물의 개수를 카운트하는 메소드
	//게시물 개수를 카운트하기 위한 메소드
	public int getTotalRecordCount(Map<String,Object> map) {		
		int totalCount = 0;
		
		String query = "SELECT COUNT(*) FROM surround where 1=1 ";
		if(map.get("Word")!=null) 
		{
			if(map.get("Column").equals("both")) 
			{
				query +=" and "
				  +" title LIKE '%"+ map.get("Word") +"%' "
				  +" OR "
				  +" content LIKE '%"+ map.get("Word") +"%' ";
			}
			else {
				query +=" and "+ map.get("Column") +" "
				  +" LIKE '%"+ map.get("Word") +"%' ";
			}			
		}
		
		try {
			psmt = con.prepareStatement(query);
			
			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);
			System.out.println(totalCount);
		}
		catch(Exception e) {
			
		}
		return totalCount;
	}
	
	
	public List<SurroundDTO> selectPaging(Map<String,Object> map)
	{
		List<SurroundDTO> sur = new Vector<SurroundDTO>();
		
		String sql = "SELECT * FROM ("
			+"    SELECT Tb.*, rownum rNum FROM ("
			+"        SELECT * FROM surround ";
			
		if(map.get("Word")!=null){
			sql +=" WHERE "+map.get("Column")+" "
				+ " LIKE '%"+map.get("Word")+"%' ";				
		}
		
		//sql += " ORDER BY bgroup DESC, bstep ASC"
		sql += " ORDER BY surround_no DESC"
		+"    ) Tb"
		+" )"
		+" WHERE rNum BETWEEN ? and ?";
			
		System.out.println("쿼리 잘 나옴?:"+sql);
						
		try{
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
			psmt.setInt(2, Integer.parseInt(map.get("end").toString())); 
			
			System.out.println(map.get("start"));
			System.out.println(map.get("end"));
	

			System.out.println(sql);

			rs = psmt.executeQuery();
			while(rs.next())
			{
				SurroundDTO dto = new SurroundDTO();
				
				/*int indentNum = rs.getInt(10);
				String spacer = "";
				
				dto.setBgroup(rs.getInt(8));
				dto.setBstep(rs.getInt(9));
				dto.setBindent(indentNum);
				if(indentNum>0){
					for(int i=1 ; i<=indentNum ; i++){
						spacer += "&nbsp;&nbsp;";
					}
					spacer += spacer+"<img src='../images/re2.gif'>";
				}*/
				
				dto.setSurround_no(rs.getInt("surround_no"));
				dto.setSurround_name(rs.getString("surround_name"));
				dto.setSurround_tel(rs.getString("surround_tel"));
				dto.setSurround_addr(rs.getString("surround_addr"));
				dto.setSurround_type(rs.getString("surround_type"));
			
				
				
				System.out.println(rs.getInt(1));
				System.out.println(rs.getString(3));
				
				System.out.println(dto.getSurround_no());
				System.out.println(dto.getSurround_name());
				
				
				sur.add(dto);
			}
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("아님 여기문제니???????????");
		}	
		
		return sur;
	}
	
	//시설 등록
	public int insertWrite(SurroundDTO dto) {
		//적용된 행의 개수 확인을 위한 변수
		int affected = 0;
		try {
			String query = "INSERT INTO surround ( "
				+ " surround_no, surround_name, surround_tel, surround_type, surround_zipcode, surround_addr, surround_detail, surround_lat, surround_long) "
				+ " VALUES ( "
				+ " surround_no_seq.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?)";

			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getSurround_name());
			psmt.setString(2, dto.getSurround_tel());
			psmt.setString(3, dto.getSurround_type());
			psmt.setString(4, dto.getSurround_zipcode());
			psmt.setString(5, dto.getSurround_addr());
			psmt.setString(6, dto.getSurround_detail());
			psmt.setString(7, dto.getSurround_lat());
			psmt.setString(8, dto.getSurround_long());
			
			System.out.println(query);
			affected = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("시설 등록중 예외발생 윽...");
			e.printStackTrace();
		}
		
		return affected;
	}
	
	//주변시설 게시판 상세보기
	public SurroundDTO selectView(String surround_no) {
		
		SurroundDTO dto = new SurroundDTO();
		
		String query = "SELECT surround_name, surround_tel, surround_zipcode, surround_type, surround_addr, surround_detail, surround_lat, surround_long FROM surround WHERE surround_no=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, surround_no);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setSurround_name(rs.getString(1));
				dto.setSurround_tel(rs.getString(2));
				dto.setSurround_zipcode(rs.getString(3));
				dto.setSurround_type(rs.getString(4));
				dto.setSurround_addr(rs.getString(5));
				dto.setSurround_detail(rs.getString(6));
				dto.setSurround_lat(rs.getString(7));
				dto.setSurround_long(rs.getString(8));
				
				
				System.out.println("이거 나옴?");
				
			}
		}
		catch(Exception e) {
			System.out.println("상세보기시 예외발생함 윽...........");
			e.printStackTrace();
		}				
				
		return dto;
	}
	
	//시설게시물 수정하기
	public int update(SurroundDTO dto) {
		
		int affected = 0;
		try {
			String query = "UPDATE surround SET"
					+ " surround_type=?, surround_name=?, surround_tel=?, surround_zipcode=?, surround_addr=? "
					+ " , surround_detail=?, surround_lat=?, surround_long=? "
					+ " WHERE surround_no=?";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getSurround_type());
			psmt.setString(2, dto.getSurround_name());				
			psmt.setString(3, dto.getSurround_tel());
			psmt.setString(4, dto.getSurround_zipcode());
			psmt.setString(5, dto.getSurround_addr());
			psmt.setString(6, dto.getSurround_detail());
			psmt.setString(7, dto.getSurround_lat());
			psmt.setString(8, dto.getSurround_long());
			System.out.println(dto.getSurround_tel());
			//게시물수정을 위한 추가부분
			psmt.setInt(9, dto.getSurround_no());
			
			affected = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("게시물 수정중 으악!!");
			e.printStackTrace();
		}
		
		return affected;		
	}
	
	//게시물 삭제하기
	public int delete(String surround_no) {
		int affected = 0;
		try {
			String query = "DELETE FROM surround "
					+ " WHERE surround_no=? ";
			
			psmt = con.prepareStatement(query);			
			psmt.setString(1, surround_no);
			 
			affected = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("게시물 삭제중 예외발생 으억!!!!!!!!!!!!!!!!");
			e.printStackTrace();
		}
		System.out.println(affected);
		return affected;	
	}
	
	//게시물 체크박스 삭제하기
	public int ckdelete(String checkDel)
	{
		String[] noAndId = checkDel.split(",");
		
		int affected = 0;
		try
		{
			String query = " delete from surround where surround_no=? ";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, noAndId[0]);
			
			affected = psmt.executeUpdate();
			System.out.println("member_no="+noAndId);
			System.out.println("query="+query);
		}
		catch(Exception e)
		{
			System.out.println("삭제하기중 예외발생...으으으으으으");
			e.printStackTrace();
		}
		return affected;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
