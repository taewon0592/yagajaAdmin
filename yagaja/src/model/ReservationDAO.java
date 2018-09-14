package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;
import java.util.Vector;


public class ReservationDAO {
	Connection con; //오라클 서버와 연결할때 사용
	PreparedStatement psmt; //오라클 서버와 쿼리전송 역할
	ResultSet rs; //쿼리의 결과를 받을때 사용
	public ReservationDAO() {
		try
		{
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			String id = "yagaja";
			String pw = "1119";
			con = DriverManager.getConnection(url, id, pw);
			System.out.println("DB연결성공");
		}
		catch(Exception e)
		{
			System.out.println("DB연결실패");
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
	//전체 레코드 갯수 얻기
	public int getTotalRecordCount(Map map)
	{
		int totalCount = 0;
		try
		{
			String sql = " SELECT COUNT(*) FROM "
					+ " reservation ye inner join lodge l on l.lodge_no=ye.lodge_no"
					+ " where ";

				if (map.get("Word") != null) {
					
					if(map.get("Column").equals("direct_input")) 
					{
						sql +=" "
							+ " reser_name LIKE '%" + map.get("Word")+ "%' "
							+ " OR "
							+ " payment_type LIKE '%" + map.get("Word")+ "%' "
							+ " OR "
							+ " lodge_type LIKE '%" + map.get("Word")+ "%' "
							+ " OR"
							+ " reser_type LIKE '%" + map.get("Word")+ "%' ";
					}	
					else
					{					
						sql += " " + map.get("Column") + " LIKE '%" + map.get("Word") + "%' ";
					}
				}
				else {
					sql +=" cancle_date is null or cancle_fee is null  ";
				}
				sql += "  ORDER BY reser_date DESC ";
			
			System.out.println("count sql = "+sql);
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return totalCount;
	}
	//페이지처리를 위한 select 메소드
	public List<ReservationDTO> selectPaging(Map map)
	{
		List<ReservationDTO> ygj = new Vector<ReservationDTO>();
		
		String sql = " SELECT * FROM "
				+ " (SELECT Tb.*,  rownum rNum FROM "
				+ " ( "
				+ " SELECT * "
				+ " from reservation ye inner join lodge l on l.lodge_no=ye.lodge_no"
				+ "  where ";
		
			if (map.get("Word") != null) {
				
				if(map.get("Column").equals("direct_input")) 
				{
					sql +=" "
						+ " reser_name LIKE '%" + map.get("Word")+ "%' "
						+ " OR "
						+ " payment_type LIKE '%" + map.get("Word")+ "%' "
						+ " OR "
						+ " lodge_type LIKE '%" + map.get("Word")+ "%' "
						+ " OR"
						+ " reser_type LIKE '%" + map.get("Word")+ "%' ";
				}	
				else
				{					
					sql += " " + map.get("Column") + " LIKE '%" + map.get("Word") + "%' ";
				}
			}
			else
			{
				sql += "  cancle_date is null or cancle_fee is null  ";
			}
				/*
				if(map.get("mode")=="reser")
				{
					sql += " where cancle_date is null and cancle_fee is null ";
				}
				else if(map.get("mode")=="cancle")
				{
					sql += " where cancle_date is not null and cancle_fee is not null ";
				}*/
				/*if (map.get("Word") != null) {
					
					sql += " AND " + map.get("Column") + " " + " LIKE '%" + map.get("Word") + "%' ";
				}*/
			sql += " order by ye.reser_no desc) Tb ) WHERE rNum BETWEEN ? and ? ";
		
		System.out.println("쿼리문 : "+sql);
		try
		{
			psmt = con.prepareStatement(sql);
			
			psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
			psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
			
			rs=psmt.executeQuery();
			while(rs.next())
			{
				ReservationDTO dto = new ReservationDTO();
				
				dto.setReser_no(rs.getString("reser_no"));
				dto.setReser_name(rs.getString("reser_name"));
				dto.setReser_phone(rs.getString("reser_phone"));
				dto.setVisit_type(rs.getString("visit_type"));
				dto.setReser_date(rs.getString("reser_date").substring(0,10));
				dto.setReser_type(rs.getString("reser_type"));
				dto.setPayment_type(rs.getString("payment_type"));
				dto.setPayment_price(rs.getString("payment_price"));
				dto.setAuction_no(rs.getString("auction_no"));
				dto.setHotdeal_no(rs.getString("hotdeal_no"));
				dto.setLodge_no(rs.getString("lodge_no"));
				dto.setMember_no(rs.getString("member_no"));
				dto.setLodge_type(rs.getString("lodge_type"));
				dto.setLodge_name(rs.getString("lodge_name"));
				
				ygj.add(dto);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return ygj;
	}
	public ReservationDTO view(String reser_no)
	{
		ReservationDTO dto = new ReservationDTO();
		
		String sql = " select ye.*, l.lodge_no, l.lodge_type, "
				+ " l.lodge_name, ye.reser_no from "
				+ " reservation ye inner join lodge l "
				+ " on l.lodge_no=ye.lodge_no where ye.reser_no=? ";
		
		try 
		{
			psmt = con.prepareStatement(sql);
			psmt.setString(1, reser_no);
			rs = psmt.executeQuery();
			if(rs.next())
			{
				dto.setReser_no(rs.getString("reser_no"));
				dto.setCheck_in(rs.getString("check_in"));
				dto.setCheck_out(rs.getString("check_out"));
				dto.setReser_name(rs.getString("reser_name"));
				dto.setReser_phone(rs.getString("reser_phone"));
				dto.setVisit_type(rs.getString("visit_type"));
				dto.setReser_date(rs.getString("reser_date").substring(0,10));
				dto.setReser_type(rs.getString("reser_type"));
				dto.setPayment_type(rs.getString("payment_type"));
				dto.setPayment_price(rs.getString("payment_price"));
				dto.setAuction_no(rs.getString("auction_no"));
				dto.setHotdeal_no(rs.getString("hotdeal_no"));
				dto.setLodge_no(rs.getString("lodge_no"));
				dto.setMember_no(rs.getString("member_no"));
				dto.setLodge_type(rs.getString("lodge_type"));
				dto.setLodge_name(rs.getString("lodge_name"));
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return dto;
	}
	public int delete(String reser_no)
	{
		int affected = 0;
		try
		{
			String query = " delete from reservation where reser_no=? ";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, reser_no);
			
			affected = psmt.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return affected;
	}
	//전체 레코드 갯수 얻기
	public int getTotalRecordCount1(Map map)
	{
		int totalCount = 0;
		try
		{
			String sql = " SELECT COUNT(*) FROM "
					+ " reservation ye inner join lodge l on l.lodge_no=ye.lodge_no "
					+ " where ";
				if (map.get("Word") != null) {
					
					if(map.get("Column").equals("direct_input")) 
					{
						sql +=" "
							+ " reser_name LIKE '%" + map.get("Word")+ "%' "
							+ " OR "
							+ " payment_type LIKE '%" + map.get("Word")+ "%' "
							+ " OR "
							+ " lodge_type LIKE '%" + map.get("Word")+ "%' ";
					}	
					else
					{					
						sql += "  " + map.get("Column") + " LIKE '%" + map.get("Word") + "%' ";
					}					
				}
				else
				{
					sql += " cancle_date is not null or cancle_fee is not null ";
				}
			System.out.println("count sql = "+sql);
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return totalCount;
	}
	//페이지처리를 위한 select 메소드
	public List<ReservationDTO> selectPaging1(Map map)
	{
		List<ReservationDTO> ygj = new Vector<ReservationDTO>();
		
		String sql = " SELECT * FROM "
				+ " (SELECT Tb.*,  rownum rNum FROM "
				+ " ( "
				+ " SELECT * "
				+ " from reservation ye inner join lodge l on l.lodge_no=ye.lodge_no "
				+ " where ";

			if (map.get("Word") != null) {
				
				if(map.get("Column").equals("direct_input")) 
				{
					sql +="  "
						+ " reser_name LIKE '%" + map.get("Word")+ "%' "
						+ " OR "
						+ " payment_type LIKE '%" + map.get("Word")+ "%' "
						+ " OR "
						+ " lodge_type LIKE '%" + map.get("Word")+ "%' ";
				}	
				else
				{					
					sql += " " + map.get("Column") + " LIKE '%" + map.get("Word") + "%' ";
				}
			}
			else
			{
				sql += " cancle_date is not null or cancle_fee is not null  ";
			}
				sql += " order by ye.reser_no desc) Tb ) WHERE rNum BETWEEN ? and ? ";
		
		System.out.println("쿼리문 : "+sql);
		try
		{
			psmt = con.prepareStatement(sql);
			
			psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
			psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
			
			rs=psmt.executeQuery();
			while(rs.next())
			{
				ReservationDTO dto = new ReservationDTO();
				
				dto.setReser_no(rs.getString("reser_no"));
				dto.setReser_name(rs.getString("reser_name"));
				dto.setReser_phone(rs.getString("reser_phone"));
				dto.setVisit_type(rs.getString("visit_type"));
				dto.setReser_date(rs.getString("reser_date").substring(0,10));
				dto.setCancle_date(rs.getString("cancle_date").substring(0,10));
				dto.setCancle_fee(rs.getString("cancle_fee"));
				dto.setReser_type(rs.getString("reser_type"));
				dto.setPayment_type(rs.getString("payment_type"));
				dto.setPayment_price(rs.getString("payment_price"));
				dto.setAuction_no(rs.getString("auction_no"));
				dto.setHotdeal_no(rs.getString("hotdeal_no"));
				dto.setLodge_no(rs.getString("lodge_no"));
				dto.setMember_no(rs.getString("member_no"));
				dto.setLodge_type(rs.getString("lodge_type"));
				dto.setLodge_name(rs.getString("lodge_name"));
				
				ygj.add(dto);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return ygj;
	}
	public ReservationDTO view1(String reser_no)
	{
		ReservationDTO dto = new ReservationDTO();
		
		String sql = " select ye.*, l.lodge_no, l.lodge_type, "
				+ " l.lodge_name, ye.reser_no from "
				+ " reservation ye inner join lodge l "
				+ " on l.lodge_no=ye.lodge_no where ye.reser_no=? "
				+ "  ";
		System.out.println("view sql = "+sql);
		try 
		{
			psmt = con.prepareStatement(sql);
			psmt.setString(1, reser_no);
			rs = psmt.executeQuery();
			if(rs.next())
			{
				dto.setReser_no(rs.getString("reser_no"));
				dto.setCheck_in(rs.getString("check_in"));
				dto.setCheck_out(rs.getString("check_out"));
				dto.setReser_name(rs.getString("reser_name"));
				dto.setReser_phone(rs.getString("reser_phone"));
				dto.setVisit_type(rs.getString("visit_type"));
				dto.setReser_date(rs.getString("reser_date").substring(0,10));
				dto.setCancle_date(rs.getString("cancle_date").substring(0,10));
				dto.setCancle_fee(rs.getString("cancle_fee"));
				dto.setReser_type(rs.getString("reser_type"));
				dto.setPayment_type(rs.getString("payment_type"));
				dto.setPayment_price(rs.getString("payment_price"));
				dto.setAuction_no(rs.getString("auction_no"));
				dto.setHotdeal_no(rs.getString("hotdeal_no"));
				dto.setLodge_no(rs.getString("lodge_no"));
				dto.setMember_no(rs.getString("member_no"));
				dto.setLodge_type(rs.getString("lodge_type"));
				dto.setLodge_name(rs.getString("lodge_name"));
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return dto;
	}
	//예약금액합계
	public int getTotalPaymentPrice(Map map)
	{
		int totalCount = 0;
		try
		{
			String sql = " SELECT sum(payment_price) FROM reservation ";

			System.out.println("count sql = "+sql);
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return totalCount;
	}
	public int getTotalRecordCount(String lodge_type) {
        
      int totalCount = 0;
      
      try {
         String sql = " select count(*) from reservation r inner join lodge l on l.lodge_no=r.lodge_no where lodge_type like '%"+lodge_type+"%' ";
            
         System.out.println("메인차트 예약숙소종류 카운트 sql = "+sql);
         psmt = con.prepareStatement(sql);
         rs = psmt.executeQuery();
         rs.next();
         totalCount = rs.getInt(1);
      }
      catch(Exception e) {
         
      }
      return totalCount;
   }	
}

