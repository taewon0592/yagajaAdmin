package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class LodgeDAO {
	
	Connection con;
	PreparedStatement psmt;
	ResultSet rs;
	
	public LodgeDAO() {
		try {
			Context ctx = new InitialContext();
			
		
			DataSource source = (DataSource)ctx.lookup("java:comp/env/jdbc/myoracle");
			
			con = source.getConnection();
			System.out.println("DBCP연결성공");
		}
		catch(Exception e) {
			System.out.println("DBCP연결실패");
			e.printStackTrace();
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
	
	//게시판테이블의 전체 레코드 개수 얻기
	public int getTotalRecordCount(Map map) {
			
		int totalCount = 0;
		
		try {
			String sql = "SELECT COUNT(*) FROM lodge ";
			
			if(map.get("Word")!=null) {
				sql += "WHERE " + map.get("Column")+" LIKE '%"+map.get("Word")+"%' ";
			}
			
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);
		}
		catch(Exception e) {
			
		}
		return totalCount;
	}
	
		
	
	//페이징처리를 위한 select 메소드
	public List<LodgeDTO> selectpaging(Map map){
		
		List<LodgeDTO> bbs = new Vector<LodgeDTO>();
		
		String sql = "SELECT * FROM ("
				+ " SELECT Tb.*, rownum rNum FROM ( "  
				+ "      SELECT * FROM lodge " ;  
				
		if(map.get("Word")!=null) {
			sql += " WHERE "+map.get("Column")+" "
					+ "LIKE '%"+map.get("Word")+"%' ";
		}
		//sql += " ORDER BY bgroup DESC, bstep ASC"
		sql += " ORDER BY lodge_no DESC "
				 +"    ) Tb"
                 +" ) "
                 +" WHERE rNum BETWEEN ? and ?";
		
		System.out.println("쿼리문 : "+sql);
		
		
		
		
		// prepare 객체생성 및 실행
		try {
			psmt = con.prepareStatement(sql);
			
			psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
			psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
			
			rs = psmt.executeQuery();
			while(rs.next()) {
				// 결과셋을 DTO객체에 담는다.
				LodgeDTO dto = new LodgeDTO();
				
				
				
				
				dto.setLodge_no(rs.getString(1));
				dto.setLodge_type(rs.getString(2));
				dto.setLodge_name(rs.getString(3));
				dto.setLodge_tel(rs.getString(4));
				dto.setLodge_roomcount(rs.getString(5));
				dto.setLodge_tag(rs.getString(6));
				dto.setLodge_photo(rs.getString(7));
				dto.setLodge_thema(rs.getString(8));
				dto.setLodge_note(rs.getString(9));
		
				
				//DTO객체를 컬렉션에 추가
				bbs.add(dto);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return bbs;
	}
	
	
	//view
	
	public LodgeDTO selectView(String lodge_no){
		LodgeDTO dto = null;
		
		String sql = "SELECT * FROM lodge l inner join lodge_addr a"
				+ " on  l.lodge_no = a.lodge_no "
			+ " WHERE l.lodge_no=?";
		try{
			psmt = con.prepareStatement(sql);
			psmt.setString(1, lodge_no);
			rs = psmt.executeQuery();
			if(rs.next()){
				dto = new LodgeDTO();
				
				dto.setLodge_name(rs.getString("lodge_name"));
				dto.setLodge_type(rs.getString("lodge_type"));
				dto.setAddr_common(rs.getString("addr_common"));
				dto.setAddr_detail(rs.getString("addr_detail"));
				dto.setLodge_tel(rs.getString("lodge_tel"));
				dto.setLodge_roomcount(rs.getString("lodge_roomcount"));
				dto.setLodge_tag(rs.getString("lodge_tag"));
				dto.setLodge_thema(rs.getString("lodge_thema"));
				dto.setLodge_feature(rs.getString("lodge_feature"));
				dto.setLodge_note(rs.getString("lodge_note"));
				dto.setLodge_photo(rs.getString("lodge_photo"));
				System.out.println("lodge_name"+dto.getLodge_name());
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return dto;
		
	}
	
	//업소삭제
	public int delete_lodge(String lodge_no){
		int affected = 0;
		try{
			String query = " delete from lodge  where lodge_no=? ";
 
			 psmt = con.prepareStatement(query);
			 psmt.setString(1, lodge_no);
 
			 affected = psmt.executeUpdate();
			 System.out.println("lodge_no="+lodge_no);
			 System.out.println("query="+query);
			}
		catch(Exception e){
			System.out.println("DAO 삭제하기 오류");
			e.printStackTrace();
			}
		return affected;
	}
	//주소삭제
	public int delete_addr(String lodge_no) {
		int affected = 0;
		try{
			String query = " delete from lodge_addr where lodge_no=? ";
 
			 psmt = con.prepareStatement(query);
			 psmt.setString(1, lodge_no);
 
			 affected = psmt.executeUpdate();
			 System.out.println("lodge_no="+lodge_no);
			 System.out.println("query="+query);
			}
		catch(Exception e){
			System.out.println("DAO 삭제하기 오류");
			e.printStackTrace();
			}
		return affected;
	}
	//방삭제
	public int delete_room(String lodge_no){
		int affected = 0;
		try{
			String query = " delete from room where lodge_no=? ";
 
			 psmt = con.prepareStatement(query);
			 psmt.setString(1, lodge_no);
 
			 affected = psmt.executeUpdate();
			 System.out.println("lodge_no="+lodge_no);
			 System.out.println("query="+query);
			}
		catch(Exception e){
			System.out.println("DAO 삭제하기 오류");
			e.printStackTrace();
			}
		return affected;
	}
	//숙박등록
	public int insert(LodgeDTO dto) {
		int affected = 0;
		try {
			String sql = "INSERT INTO lodge ( "
					+ " lodge_no , lodge_type, lodge_name, lodge_tel, lodge_roomcount,"
					+ " lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature) "
					+ " VALUES ( "
					+ " lodge_no_seq.NEXTVAL,?,?,?,?,?,?,?,?,?)";
			System.out.println("숙박쿼리문 : "+sql);
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getLodge_type());
			psmt.setString(2, dto.getLodge_name());
			psmt.setString(3, dto.getLodge_tel());
			psmt.setString(4, dto.getLodge_roomcount());
			psmt.setString(5, dto.getLodge_tag());
			psmt.setString(6, dto.getLodge_photo());
			psmt.setString(7, dto.getLodge_thema());
			psmt.setString(8, dto.getLodge_note());
			psmt.setString(9, dto.getLodge_feature());
			
			affected = psmt.executeUpdate();	
			System.out.println(affected);
		}
		
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("숙박놉");
		}
		System.out.println("숙박등록이욥!!");
		return affected;
	}
	//주소등록
	public int insertaddr(LodgeDTO dto) {
		int affected = 0;
		try {
			String sql = "INSERT INTO LODGE_ADDR ( "
					+ " lodge_no,addr_zipcode, addr_common, addr_detaiL ) "
					+ " VALUES ( "
					+ " lodge_no_seq.currval,?,?,?)";
			System.out.println("주소쿼리문 : "+sql);
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getAddr_zipcode());
			psmt.setString(2, dto.getAddr_common());
			psmt.setString(3, dto.getAddr_detail());
			affected = psmt.executeUpdate();		
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("주소놉");
		}
		System.out.println("주소등록이욥!!");
		return affected;
	}
	
	
	//방등록
	public int insertroom(LodgeDTO dto) {
		int affected = 0;
		try {
			String sql = "INSERT INTO ROOM ( "
					+ " room_no, room_type, room_person, d_sleep_price, d_rent_price, "
					+ "  w_rent_price, w_sleep_price, room_photo, lodge_no  ) "
					+ " VALUES ( "
					+ " room_no_seq.NEXTVAL, ?,?,?,?,?,?,?,? )";
			System.out.println("주소쿼리문 : "+sql);
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getRoom_type());
			psmt.setString(2, dto.getRoom_person());
			psmt.setString(3, dto.getD_sleep_price());
			psmt.setString(4, dto.getD_rent_price());
			psmt.setString(5, dto.getW_sleep_price());
			psmt.setString(6, dto.getW_rent_price());
			psmt.setString(7, dto.getRoom_photo());
			psmt.setString(8, dto.getLodge_no());
			
			
			affected = psmt.executeUpdate();		
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("방놉");
		}
		System.out.println("방등록이욥!!");
		return affected;
	}
	
	//방 연속등록을 위한 쿼리
	public LodgeDTO selectLodge_No(String lodge_name)
	{
		System.out.println("lodge_name="+lodge_name);
		LodgeDTO dto = new LodgeDTO();
		
		String sql = "select lodge_no from lodge where lodge_name=?";
		try
		{
			psmt = con.prepareStatement(sql);
			psmt.setString(1, lodge_name);
			rs = psmt.executeQuery();
			while(rs.next())
			{
				dto.setLodge_no(rs.getString(1));
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("lodge_no셀렉트 오류");
		}
		System.out.println(dto.getLodge_no());
		return dto;
	}
	
	//수정하기
	public LodgeDTO edit(String lodge_no){
		LodgeDTO dto = null;
		
		String sql = "SELECT * FROM lodge l inner join lodge_addr a"
				+ " on  l.lodge_no = a.lodge_no "
			+ " WHERE l.lodge_no=?";
		try{
			psmt = con.prepareStatement(sql);
			psmt.setString(1, lodge_no);
			rs = psmt.executeQuery();
			if(rs.next()){
				dto = new LodgeDTO();
				dto.setLodge_name(rs.getString("lodge_name"));
				dto.setLodge_type(rs.getString("lodge_type"));
				dto.setAddr_common(rs.getString("addr_common"));
				dto.setAddr_detail(rs.getString("addr_detail"));
				dto.setLodge_tel(rs.getString("lodge_tel"));
				dto.setLodge_roomcount(rs.getString("lodge_roomcount"));
				dto.setLodge_tag(rs.getString("lodge_tag"));
				dto.setLodge_thema(rs.getString("lodge_thema"));
				dto.setLodge_feature(rs.getString("lodge_feature"));
				dto.setLodge_note(rs.getString("lodge_note"));
				dto.setLodge_photo(rs.getString("lodge_photo"));
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return dto;
		}
	
	//숙박업소 수정
	public int lodge_update(LodgeDTO dto) {
		int affected = 0;
		try {
			String sql =" UPDATE lodge SET "
					+ " lodge_type=?, lodge_name=?, lodge_tel=?, "
					+ " lodge_roomcount=?, lodge_tag=?, lodge_photo=?, "
					+ " lodge_thema=?, lodge_note=?, lodge_feature=? "
					+ " WHERE lodge_no=?";
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getLodge_type());
			psmt.setString(2, dto.getLodge_name());
			psmt.setString(3, dto.getLodge_tel());
			psmt.setString(4, dto.getLodge_roomcount());
			psmt.setString(5, dto.getLodge_tag());
			psmt.setString(6, dto.getLodge_photo());
			psmt.setString(7, dto.getLodge_thema());
			psmt.setString(8, dto.getLodge_note());
			psmt.setString(9, dto.getLodge_feature());
			psmt.setString(10, dto.getLodge_no());
			
			affected = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("update중(숙박) 예외발생");
			e.printStackTrace();
		}
		return affected;
	}
	
	//주소수정
	public int addr_update(LodgeDTO dto) {
		int affected = 0;
		String sql = "UPDATE LODGE_ADDR SET "
				+ " addr_=?, addr_common=?, addr_detail=? "
				+ " where lodge_no=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getAddr_zipcode());
			psmt.setString(2, dto.getAddr_common());
			psmt.setString(3, dto.getAddr_detail());
			psmt.setString(4, dto.getLodge_no());
			
			affected = psmt.executeUpdate();		
		}
		catch(Exception e) {
			System.out.println("update중(주소) 예외발생");
			e.printStackTrace();
		}
		return affected;
	}
	
	//방수정하기
	public LodgeDTO room_edit(String lodge_no, String room_no) {
		LodgeDTO dto = new LodgeDTO();
		try {
			String query="SELECT * FROM room WHERE lodge_no=? and room_no=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, lodge_no);
			psmt.setString(2, room_no);
			rs=psmt.executeQuery();
			if(rs.next()) {
				dto.setRoom_no(rs.getString("room_no"));
				dto.setLodge_no(rs.getString("lodge_no"));
				dto.setRoom_type(rs.getString("room_type"));
				dto.setRoom_person(rs.getString("room_person"));
				dto.setD_sleep_price(rs.getString("d_sleep_price"));
				dto.setD_rent_price(rs.getString("d_rent_price"));
				dto.setW_sleep_price(rs.getString("w_sleep_price"));
				dto.setW_rent_price(rs.getString("w_rent_price"));
				dto.setRoom_photo(rs.getString("room_photo"));
			}
			
		}
		catch (Exception e) {
			
		}
		return dto;
	}
	
	//방수정
	public int room_update(LodgeDTO dto) {
		
		int affected = 0;
		try {
			String query = "UPDATE room SET"
					+ " room_type=?, room_person=?, d_sleep_price=?,"
					+ " d_rent_price=?, w_sleep_price=?, w_rent_price=?,  "
					+ " room_photo=? "
					+ " WHERE lodge_no=?";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getRoom_type());
			psmt.setString(2, dto.getRoom_person());				
			psmt.setString(3, dto.getD_sleep_price());
			psmt.setString(4, dto.getD_rent_price());
			psmt.setString(5, dto.getW_sleep_price());
			psmt.setString(6, dto.getW_rent_price());
			psmt.setString(7, dto.getRoom_photo());
			psmt.setString(8, dto.getLodge_no());
			
			affected = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("update중 (방)예외발생");
			e.printStackTrace();
		}
		return affected;		
	}
	
	//room페이지
	public List<LodgeDTO> room_selectpaging(Map map){
		
		List<LodgeDTO> bbs = new Vector<LodgeDTO>();
		
		String sql = "SELECT * FROM ("
				+ " SELECT Tb.*, rownum rNum FROM ( "  
				+ "      SELECT * FROM room  " ;  
				
		sql += " ORDER BY lodge_no DESC "
				 +"    ) Tb"
                 +" ) "
                 + " WHERE lodge_no=? order by room_no desc ";
		
		System.out.println("쿼리문 : "+sql);
		
		// prepare 객체생성 및 실행
		try {
			psmt = con.prepareStatement(sql);
			
			psmt.setString(1, map.get("lodge_no").toString());
			rs = psmt.executeQuery();
			while(rs.next()) {
				// 결과셋을 DTO객체에 담는다.
				LodgeDTO dto = new LodgeDTO();
				
				dto.setRoom_no(rs.getString(1));
				dto.setRoom_type(rs.getString(2));
				dto.setRoom_person(rs.getString(3));
				dto.setD_rent_price(rs.getString(4));
				dto.setD_sleep_price(rs.getString(5));
				dto.setW_rent_price(rs.getString(6));
				dto.setW_sleep_price(rs.getString(7));
				dto.setRoom_photo(rs.getString(8));
				
				//DTO객체를 컬렉션에 추가
				bbs.add(dto);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return bbs;
	}
	//방 보여주기
	public LodgeDTO selectRoomView(String lodge_no, String room_no){
		LodgeDTO dto = null;
		
		String sql = "SELECT * FROM room "
			+ " WHERE lodge_no=? and room_no=?";
		try{
			psmt = con.prepareStatement(sql);
			psmt.setString(1, lodge_no);
			psmt.setString(2, room_no);
			
			rs = psmt.executeQuery();
			if(rs.next()){
				dto = new LodgeDTO();
				
				dto.setRoom_type(rs.getString("room_type"));
				dto.setRoom_person(rs.getString("room_person"));
				dto.setD_sleep_price(rs.getString("d_sleep_price"));
				dto.setD_rent_price(rs.getString("d_rent_price"));
				dto.setW_sleep_price(rs.getString("W_sleep_price"));
				dto.setW_rent_price(rs.getString("W_rent_price"));
				dto.setRoom_photo(rs.getString("room_photo"));
				dto.setRoom_no(rs.getString("room_no"));
				dto.setLodge_no(rs.getString("lodge_no"));
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return dto;
	}
	
	//방상세보기 삭제
	public int delete_room_detail(String lodge_no, String room_no){
		int affected = 0;
		try{
			String query = " delete from room where lodge_no=? and room_no=? ";
 
			 psmt = con.prepareStatement(query);
			 psmt.setString(1, lodge_no);
			 psmt.setString(2, room_no);
 
			 affected = psmt.executeUpdate();
			 System.out.println("lodge_no="+lodge_no);
			 System.out.println("query="+query);
			}
		catch(Exception e){
			System.out.println("DAO 삭제하기 오류");
			e.printStackTrace();
			}
		return affected;
	}
	// 객실타입가져오기
	public List<LodgeDTO> getType(String room_type) {

		List<LodgeDTO> type = new Vector<LodgeDTO>();

		String sql = "SELECT room_no FROM room WHERE room_type=?";

		try {
			psmt = con.prepareStatement(sql);
			// 파라미터로 넘어온 sido값 세팅
			psmt.setString(1,room_type);
			rs = psmt.executeQuery();
			while (rs.next()) {
				LodgeDTO dto = new LodgeDTO();
				dto.setRoom_no(rs.getString("room_no"));
				
				type.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return type;
	}
	
	// 숙소명으로 검색하기
	public List<LodgeDTO> searchLodge(String lodgename) {
		List<LodgeDTO> lodge = new Vector<LodgeDTO>();

		String sql = " SELECT L.*, R.room_no, R.room_type FROM lodge L"
				+ " INNER JOIN room R on L.lodge_no = R.lodge_no " + " WHERE lodge_name LIKE ? "
				+ " ORDER BY room_type ASC";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, "%" + lodgename + "%");
			//System.out.println("lodgename="+lodgename);
			rs = psmt.executeQuery();

			while (rs.next()) {
				LodgeDTO dto = new LodgeDTO();

				dto.setLodge_no(rs.getString("lodge_no"));
				dto.setLodge_name(rs.getString("lodge_name"));
				dto.setLodge_type(rs.getString("lodge_type"));
				dto.setLodge_tel(rs.getString("lodge_tel"));
				dto.setRoom_no(rs.getString("room_no"));
				dto.setRoom_type(rs.getString("room_type"));
				System.out.println(rs.getString("room_type"));
				lodge.add(dto);
			}
		} catch (Exception e) {
			System.out.println("예외발생");
			e.printStackTrace();
		}
		// 콘솔에서 반드시 확인(쿼리문 오류 체크)
		System.out.println("쿼리문:" + sql);

		return lodge;
		}

}
