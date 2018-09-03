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

public class AuctionDAO 
{
	// DB연결
	Connection con; 
	PreparedStatement psmt;  
	ResultSet rs; 
	
	public AuctionDAO() 
	{ 
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
	public void close() 
	{
		try
		{
			if(rs!=null) rs.close();
			if(psmt!=null) psmt.close();
			if(con!=null) con.close();
		}
		catch(Exception e)
		{
			System.out.println("자원반납시 예외발생");
				e.printStackTrace();
		}
	}
	
	//Auction 등록하기
	public int auction_insert(AuctionDTO dto)
	{
		int sucOrFail = 0;
		
		String query = "INSERT INTO auction "
				+ " (auction_no, start_price, lodge_no, auction_stime, auction_etime, "
				+ "  auction_unit, check_in, check_out, room_no) "
				+ " VALUES("
				+ " auction_no_seq.nextval, ?, ?, "
				+ " TO_DATE('"+dto.getAuction_stime()+"','yyyy-mm-dd hh24:mi:ss'),"
				+ " TO_DATE('"+dto.getAuction_etime()+"','yyyy-mm-dd hh24:mi:ss'),"
				+ " ?,"
				+ " TO_DATE('"+dto.getAuction_check_in()+"','yyyy-mm-dd hh24:mi:ss'),"
				+ " TO_DATE('"+dto.getAuction_check_out()+"','yyyy-mm-dd hh24:mi:ss'), "
				+ " ?)";
		
		try
		{
			psmt = con.prepareStatement(query);
			
			psmt.setInt(1, dto.getStart_price());
			psmt.setInt(2, dto.getLodge_no());
			psmt.setInt(3, dto.getAuction_unit());
			psmt.setString(4, dto.getRoom_no());
			
			sucOrFail = psmt.executeUpdate();
		}
		catch(Exception e)
		{
			System.out.println("auction_insert시 오류");
			e.printStackTrace();
		}
		
		return sucOrFail;
	}
	
	//옥션게시판 전체 레코드수 얻기
	public int getTotalRecordCount(Map map)
	{
		int totalCount = 0;
		try{
			String sql = "SELECT COUNT(*) FROM auction WHERE 1=1";
										
			if(map.get("Word")!=null){
				sql +=" AND "+map.get("Column")+" "
					+ " LIKE '%"+map.get("Word")+"%' ";				
			}
			
			sql += " and (auction_etime-sysdate) > 0 ";

			System.out.println("전체페이지수얻기:"+sql);
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);
		
		}
		catch(Exception e){}
		return totalCount;
	}
	
	//페이징처리를 위한 select 메소드
	public List<AuctionDTO> selectPaging(Map map)
	{
		List<AuctionDTO> bbs = new Vector<AuctionDTO>();
		
		String sql = ""
			+"SELECT *  FROM ("
			+"    SELECT Tb.*, trunc((auction_stime-sysdate)*24*60*60) AS remain_time_sec, "
			+"					trunc((auction_etime-sysdate)*24*60*60) AS start_remain_time_sec, rownum rNum FROM ("
			+"        SELECT * FROM auction A inner join lodge L on A.lodge_no=L.lodge_no "
			+"			inner join room R on A.room_no=R.room_no";
			
		if((Integer.parseInt(map.get("mode").toString()))==2){
			sql +=" ORDER BY tender_count DESC ";				
		}
		else if((Integer.parseInt(map.get("mode").toString()))==3)
		{
			sql +=" ORDER BY ((auction_etime-sysdate)*24*60*60) DESC ";
		}
		else
		{
			sql += " where (auction_etime-sysdate) > 0 ORDER BY auction_no DESC ";
		}
		
		sql += "    ) Tb"
			+")"
			+" WHERE rNum BETWEEN ? and ? ";
		
			
		System.out.println("쿼리문:"+sql);
						
		try{
			//3.prepare 객체생성 및 실행
			psmt = con.prepareStatement(sql);
			System.out.println("start:"+Integer.parseInt(map.get("start").toString()));
			System.out.println("end:"+Integer.parseInt(map.get("end").toString()));
			psmt.setInt(1, 
				Integer.parseInt(map.get("start").toString()));
			psmt.setInt(2, 
				Integer.parseInt(map.get("end").toString()));			

			rs = psmt.executeQuery();
			while(rs.next())
			{
				//4.결과셋을 DTO객체에 담는다.
				AuctionDTO dto = new AuctionDTO();
				 
				dto.setAuction_no(rs.getInt(1));
				dto.setStart_price(rs.getInt("start_price"));				
				dto.setEnd_price(rs.getInt(3));
				dto.setFinal_bidder(rs.getString(4));
				dto.setTender_count(rs.getInt(5));
				dto.setRemain_time_sec(rs.getString("remain_time_sec"));
				dto.setW_sleep_price(rs.getInt("W_sleep_price"));
				dto.setLodge_name(rs.getString("Lodge_name"));
				dto.setStart_remain_time_sec(rs.getString("start_remain_time_sec"));
				
				//처음에 남은시간을 보여주기
				int dateVal = (Integer.parseInt(dto.getRemain_time_sec())/(24*60*60)); //총 초에서 날짜뽑기
				int tempVal = Integer.parseInt(dto.getRemain_time_sec())%(24*60*60); //남은 초 담기
				int hourVal = tempVal/(60*60);  //남은 총 초에서 시간 뽑기
				tempVal = tempVal%(60*60);  //남은 초 담기
				int minVal = tempVal/60; //남은 총 초에서 분 뽑기
				int secVal = tempVal%60; //남은 초 담기
				
				String remain_time = dateVal+"일 "+hourVal+"시간 "+minVal+"분 "+secVal+"초";
				
				dto.setTimeView(remain_time);
				
				//진행중 경매 처음에 남은시간 보여주기
				int s_dateVal = (Integer.parseInt(dto.getStart_remain_time_sec())/(24*60*60)); //총 초에서 날짜뽑기
				int s_tempVal = Integer.parseInt(dto.getStart_remain_time_sec())%(24*60*60); //남은 초 담기
				int s_hourVal = s_tempVal/(60*60);  //남은 총 초에서 시간 뽑기
				s_tempVal = s_tempVal%(60*60);  //남은 초 담기
				int s_minVal = s_tempVal/60; //남은 총 초에서 분 뽑기
				int s_secVal = s_tempVal%60; //남은 초 담기
				
				String s_remain_time = s_dateVal+"일 "+s_hourVal+"시간 "+s_minVal+"분 "+s_secVal+"초";
				
				dto.setStart_timeView(s_remain_time);
 
				//5.DTO객체를 컬렉션에 추가한다.
				bbs.add(dto);
			
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}	
		return bbs;
	}
	
	//마감된 옥션 게시판 전체 레코드수 얻기
	public int EndListgetTotalRecordCount(Map map)
	{
		int totalCount = 0;
		try{
			String sql = "SELECT COUNT(*) FROM auction WHERE 1=1";
										
			if(map.get("Word")!=null){
				sql +=" AND "+map.get("Column")+" "
					+ " LIKE '%"+map.get("Word")+"%' ";				
			}
			
			sql += " AND (auction_etime-sysdate) <= 0 ";

			System.out.println("전체페이지수얻기:"+sql);
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);
		
		}
		catch(Exception e){}
		return totalCount;
	}
	
	//마감된 옥션게시판
	public List<AuctionDTO> selectEndList(Map map)
	{
		List<AuctionDTO> bbs = new Vector<AuctionDTO>();
		
		String sql = ""
			+"SELECT *  FROM ("
			+"    SELECT Tb.*, trunc((auction_stime-sysdate)*24*60*60) AS remain_time_sec, rownum rNum FROM ("
			+"        SELECT * FROM auction A inner join lodge L on A.lodge_no=L.lodge_no "
			+"			inner join room R on A.room_no=R.room_no";
			
		sql += " where (auction_etime-sysdate) <= 0 ORDER BY auction_no DESC ) Tb"
			+")"
			+" WHERE rNum BETWEEN ? and ? ";		
			
		System.out.println("쿼리문:"+sql);
						
		try{
			//3.prepare 객체생성 및 실행
			psmt = con.prepareStatement(sql);

			psmt.setInt(1, 
				Integer.parseInt(map.get("start").toString()));
			psmt.setInt(2, 
				Integer.parseInt(map.get("end").toString()));			

			rs = psmt.executeQuery();
			while(rs.next())
			{
				//4.결과셋을 DTO객체에 담는다.
				AuctionDTO dto = new AuctionDTO();
				 
				dto.setAuction_no(rs.getInt(1));
				dto.setStart_price(rs.getInt("start_price"));				
				dto.setEnd_price(rs.getInt(3));
				dto.setFinal_bidder(rs.getString(4));
				dto.setTender_count(rs.getInt(5));
				dto.setRemain_time_sec(rs.getString("remain_time_sec"));
				dto.setW_sleep_price(rs.getInt("W_sleep_price"));
				dto.setLodge_name(rs.getString("Lodge_name"));
				
				 
				//5.DTO객체를 컬렉션에 추가한다.
				bbs.add(dto);
			
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}	
		return bbs;
	}
}











