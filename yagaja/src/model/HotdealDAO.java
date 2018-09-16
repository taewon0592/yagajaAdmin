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

import oracle.net.aso.r;



public class HotdealDAO {
	Connection con; //오라클 서버와 연결할때 사용
	PreparedStatement psmt; //오라클 서버와 쿼리전송 역할
	ResultSet rs; //쿼리의 결과를 받을때 사용	
	/*
	public HotdealDAO() {	
		
		try {
			Context ctx = new InitialContext();
			
			DataSource source=(DataSource)ctx.lookup("java:comp/env/jdbc/myoracle");
			
			con=source.getConnection();
			System.out.println("DB연결성공");
		}
		catch(Exception e) {
			System.out.println("DB연결실패");
			e.printStackTrace();
		}		
	}	*/
	
	public HotdealDAO() {
	      try {
	         Class.forName("oracle.jdbc.OracleDriver");
	         String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	         String id = "yagaja";
	         String pw = "1119";
	         con = DriverManager.getConnection(url, id, pw);
	         System.out.println("DB 연결 성공");
	      } catch (Exception e) {
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
	public int getTotalRecordCount(Map<String,Object> map)
	{
		int totalCount = 0;
		try{
			String sql = "SELECT COUNT(*) FROM hotdeal H inner join lodge L on H.lodge_no = L.lodge_no"
					+ " inner join room R on H.room_no = R.room_no WHERE 1=1";
										
			//검색어가 없고
			if(map.get("Word")=="" || map.get("Word")==null) {
				//검색어 X + 시작 일자
				if(map.get("search_sday")!=null && map.get("search_eday")=="") {
					sql +=" AND hotdeal_date >= TO_DATE('"+map.get("search_sday")+ "', 'yyyy-mm-dd') ";
				}
				//검색어 X + 종료 일자
				else if(map.get("search_sday")=="" && map.get("search_eday")!=null) {
					sql +=" AND hotdeal_date <= TO_DATE('"+map.get("search_eday")+ "', 'yyyy-mm-dd')+0.9 ";
				}		
				//검색어 X + 시작/종료일자
				else if(map.get("search_sday")!=null && map.get("search_eday")!=null) {
				
					sql +=" AND hotdeal_date >= TO_DATE('"+map.get("search_sday")+ "', 'yyyy-mm-dd') "
						+ " AND hotdeal_date <= TO_DATE('"+map.get("search_eday")+ "', 'yyyy-mm-dd')+0.9 ";													
				}
			}
			
			//검색어가 있고
			else if(map.get("Word")!="" || map.get("Word")!=null) {
				//단어 전체 검색(검색 컬럼 전체) + 시작/종료기간
				if(map.get("Column").equals("direct_input")) {
					sql +=" AND (lodge_name LIKE '%" + map.get("Word")+ "%' "
						+ " OR "
						+ " lodge_type LIKE '%" + map.get("Word")+ "%' "
						+ " OR"
						+ " room_type LIKE '%" + map.get("Word")+ "%') "
						+ " AND (hotdeal_date >= "
						+ " TO_DATE('"+map.get("search_sday")+ "', 'yyyy-mm-dd') "
						+ " AND hotdeal_date <= "
						+ " TO_DATE('"+map.get("search_eday")+ "', 'yyyy-mm-dd')+0.9) ";
				}	
				//검색어  + 시작 일자
				else if(map.get("search_sday")!="" && map.get("search_eday")=="" ) {
					sql +=" AND "+map.get("Column")+" "
						+ " LIKE '%"+map.get("Word")+"%' "
						+ " AND hotdeal_date >= "
						+ " TO_DATE('"+map.get("search_sday")+ "', 'yyyy-mm-dd') ";
				}
				//검색어  + 종료 일자 
				else if(map.get("search_sday")=="" && map.get("search_eday")!="") {
					sql +=" AND "+map.get("Column")+" "
						+ " LIKE '%"+map.get("Word")+"%' "
						+ " AND hotdeal_date <= "
						+ " TO_DATE('"+map.get("search_eday")+ "', 'yyyy-mm-dd')+0.9 ";
				}				
				//검색어 + 시작/종료일자
				else if(map.get("search_sday")!="" && map.get("search_eday")!="") {
					sql +=" AND "+map.get("Column")+" "
						+ " LIKE '%"+map.get("Word")+"%' "
						+ " AND hotdeal_date >= "
						+ " TO_DATE('"+map.get("search_sday")+ "', 'yyyy-mm-dd') "
						+ " AND hotdeal_date <= "
						+ " TO_DATE('"+map.get("search_eday")+ "', 'yyyy-mm-dd')+0.9 ";
				}							
				//검색어 + 기간 없음(전체검색)
				else {
					sql +=" AND "+map.get("Column")+" "
						+ " LIKE '%"+map.get("Word")+"%' ";				
				}
			}
			
			sql += " and (hotdeal_etime-sysdate) > 0 ";
			
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);
		}
		catch(Exception e){}
		return totalCount; 
	}
	
	//페이징처리를 위한 select 메소드
	public List<HotdealDTO> selectPaging(Map<String,Object> map)
	{
		List<HotdealDTO> bbs = new Vector<HotdealDTO>();
		
		String sql = ""
				+" SELECT * FROM ("
				+"    SELECT Tb.*, trunc((hotdeal_stime-sysdate)*24*60*60) AS remain_time_sec, "
				+ "					trunc((hotdeal_etime-sysdate)*24*60*60) AS start_remain_time_sec, rownum rNum FROM ("
				+"        SELECT H.*, L.lodge_name,L.lodge_type,R.room_type FROM "
				+ "			hotdeal H INNER JOIN lodge L"
				+ "				ON H.lodge_no=L.lodge_no"
				+ "					INNER JOIN room R"
				+ "						ON H.room_no = r.room_no WHERE 1=1";
		
				//검색어가 없고
				if(map.get("Word")=="" || map.get("Word")==null) {
					//검색어 X + 시작 일자
					if(map.get("search_sday")!=null && map.get("search_eday")=="") {
						sql +=" AND hotdeal_date >= TO_DATE('"+map.get("search_sday")+ "', 'yyyy-mm-dd') ";
					}
					//검색어 X + 종료 일자
					else if(map.get("search_sday")=="" && map.get("search_eday")!=null) {
						sql +=" AND hotdeal_date <= TO_DATE('"+map.get("search_eday")+ "', 'yyyy-mm-dd')+0.9 ";
					}		
					//검색어 X + 시작/종료일자
					else if(map.get("search_sday")!=null && map.get("search_eday")!=null) {
					
						sql +=" AND hotdeal_date >= TO_DATE('"+map.get("search_sday")+ "', 'yyyy-mm-dd') "
							+ " AND hotdeal_date <= TO_DATE('"+map.get("search_eday")+ "', 'yyyy-mm-dd')+0.9 ";													
					}
				}
				
				//검색어가 있고
				else if(map.get("Word")!="" || map.get("Word")!=null) {
					//단어 전체 검색(검색 컬럼 전체) + 시작/종료기간
					if(map.get("Column").equals("direct_input")) {
						sql +=" AND (lodge_name LIKE '%" + map.get("Word")+ "%' "
							+ " OR "
							+ " lodge_type LIKE '%" + map.get("Word")+ "%' "
							+ " OR"
							+ " room_type LIKE '%" + map.get("Word")+ "%') "
							+ " AND (hotdeal_date >= "
							+ " TO_DATE('"+map.get("search_sday")+ "', 'yyyy-mm-dd') "
							+ " AND hotdeal_date <= "
							+ " TO_DATE('"+map.get("search_eday")+ "', 'yyyy-mm-dd')+0.9) ";
					}	
					//검색어  + 시작 일자
					else if(map.get("search_sday")!="" && map.get("search_eday")=="" ) {
						sql +=" AND "+map.get("Column")+" "
							+ " LIKE '%"+map.get("Word")+"%' "
							+ " AND hotdeal_date >= "
							+ " TO_DATE('"+map.get("search_sday")+ "', 'yyyy-mm-dd') ";
					}
					//검색어  + 종료 일자 
					else if(map.get("search_sday")=="" && map.get("search_eday")!="") {
						sql +=" AND "+map.get("Column")+" "
							+ " LIKE '%"+map.get("Word")+"%' "
							+ " AND hotdeal_date <= "
							+ " TO_DATE('"+map.get("search_eday")+ "', 'yyyy-mm-dd')+0.9 ";
					}				
					//검색어 + 시작/종료일자
					else if(map.get("search_sday")!="" && map.get("search_eday")!="") {
						sql +=" AND "+map.get("Column")+" "
							+ " LIKE '%"+map.get("Word")+"%' "
							+ " AND hotdeal_date >= "
							+ " TO_DATE('"+map.get("search_sday")+ "', 'yyyy-mm-dd') "
							+ " AND hotdeal_date <= "
							+ " TO_DATE('"+map.get("search_eday")+ "', 'yyyy-mm-dd')+0.9 ";
					}							
					//검색어 + 기간 없음(전체검색)
					else {
						sql +=" AND "+map.get("Column")+" "
							+ " LIKE '%"+map.get("Word")+"%' ";				
					}
				}				
				
				
				sql += "					AND (hotdeal_etime-sysdate) > 0"
					+ " 					ORDER BY hotdeal_no DESC"
					+"    ) Tb"
					+" )"
					+" WHERE rNum BETWEEN ? and ?";
		
		
		
		try{
			//3.prepare 객체생성 및 실행
			psmt = con.prepareStatement(sql);
		
			psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
			psmt.setInt(2, Integer.parseInt(map.get("end").toString()));	
			
			rs = psmt.executeQuery();
			
			while(rs.next())
			{
				//4.결과셋을 DTO객체에 담는다.
				HotdealDTO dto = new HotdealDTO();
				
				dto.setHotdeal_no(rs.getString("hotdeal_no"));
				dto.setHotdeal_stime(rs.getString("hotdeal_stime"));
				dto.setHotdeal_etime(rs.getString("hotdeal_etime"));
				dto.setHotdeal_price(rs.getString("hotdeal_price"));
				dto.setHotdeal_sell(rs.getString("hotdeal_sell"));
				dto.setHotdeal_date(rs.getString("hotdeal_date"));
				dto.setHotdeal_sday(rs.getString("hotdeal_sday"));
				dto.setHotdeal_eday(rs.getString("hotdeal_eday"));
				dto.setLodge_no(rs.getString("lodge_no"));
				dto.setLodge_type(rs.getString("lodge_type"));
				dto.setLodge_name(rs.getString("lodge_name"));
				dto.setRoom_type(rs.getString("room_type"));
				dto.setRoom_no(rs.getString("room_no"));
				dto.setRemain_time_sec(rs.getString("remain_time_sec"));
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
			System.out.println("Select시 예외발생함");
			e.printStackTrace();
		}
		return bbs;
	}
// 게시물 작성하기(write)
	public int insert(HotdealDTO dto) {
		
		int affected = 0;// 적용된 행의갯수
		
		try {
			
			String sql = " INSERT INTO hotdeal (hotdeal_no, hotdeal_stime, hotdeal_etime, hotdeal_price, "
					+ " hotdeal_sell, hotdeal_date,hotdeal_sday, hotdeal_eday,lodge_no,room_no) "
					+ " VALUES ("
					+ " hotdeal_no_seq.NEXTVAL,"
					+ " TO_DATE('"+dto.getHotdeal_stime()+"','yyyy-mm-dd hh24:mi:ss'),"
					+ " TO_DATE('"+dto.getHotdeal_etime()+"','yyyy-mm-dd hh24:mi:ss'),"
					+ " ?,?,"
					+ " TO_DATE('"+dto.getHotdeal_date()+"','yyyy-mm-dd'),"
					+ " TO_DATE('"+dto.getHotdeal_sday()+"','yyyy-mm-dd'),"
					+ " TO_DATE('"+dto.getHotdeal_eday()+"','yyyy-mm-dd'), ?,?)";
		
			//System.out.println("롯지넘버:"+dto.getLodge_no());
			//System.out.println("룸넘버:"+dto.getRoom_no());
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getHotdeal_price());
			psmt.setString(2, dto.getHotdeal_sell());
			psmt.setString(3, dto.getLodge_no());
			psmt.setString(4, dto.getRoom_no());
			affected = psmt.executeUpdate();
			
			System.out.println(affected);
			
		} catch (Exception e) {
			System.out.println("insert중 예외발생");
			e.printStackTrace();
		}
		return affected;
	}

//게시물 상세보기(view)
	public HotdealDTO view(String hotdeal_no) {
		
		HotdealDTO dto = new HotdealDTO();
		
		String sql = " "
				+ " SELECT H.*, L.lodge_name, L.lodge_type, L.lodge_photo,R.room_type,R.room_no FROM "
				+ "	hotdeal H INNER JOIN lodge L"
				+ "	ON H.lodge_no = L.lodge_no"
				+ "	INNER JOIN room R"
				+ "	ON H.lodge_no = R.lodge_no"
				+ " WHERE hotdeal_no=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, hotdeal_no);
			rs = psmt.executeQuery();
			if (rs.next()) {
				
				dto.setHotdeal_no(rs.getString("hotdeal_no"));
				dto.setHotdeal_stime(rs.getString("hotdeal_stime"));
				dto.setHotdeal_etime(rs.getString("hotdeal_etime"));
				dto.setHotdeal_price(rs.getString("hotdeal_price"));
				dto.setHotdeal_sell(rs.getString("hotdeal_sell"));
				dto.setHotdeal_date(rs.getString("hotdeal_date").substring(0, 10));
				dto.setHotdeal_sday(rs.getString("hotdeal_sday").substring(0, 10));
				dto.setHotdeal_eday(rs.getString("hotdeal_eday").substring(0, 10));
				dto.setLodge_no(rs.getString("lodge_no"));
				//join에 의한 lodge테이블 필드추가
				dto.setLodge_name(rs.getString("lodge_name"));
				dto.setLodge_type(rs.getString("lodge_type"));
				dto.setLodge_photo(rs.getString("lodge_photo"));
				//join에 의한 room테이블 필드추가
				dto.setRoom_type(rs.getString("room_type"));
				dto.setRoom_no(rs.getString("room_no"));
				
			}
		} 
		catch (Exception e) {
			System.out.println("View 중 예외발생");
			e.printStackTrace();
		}
		return dto;
	}
	// 수정하기
	public int update(HotdealDTO dto) {
		int affected = 0;// 적용된 행의갯수
		String sql = " " + " UPDATE hotdeal SET" + " hotdeal_stime=TO_DATE('" + dto.getHotdeal_stime()
				+ "','yyyy-mm-dd hh24:mi:ss')," + " hotdeal_etime=TO_DATE('" + dto.getHotdeal_etime()
				+ "','yyyy-mm-dd hh24:mi:ss')," + " hotdeal_price=?, hotdeal_sell=?, "
				+ " hotdeal_date=TO_DATE('" + dto.getHotdeal_date() + "','yyyy-mm-dd')," + " hotdeal_sday=TO_DATE('"
				+ dto.getHotdeal_sday() + "','yyyy-mm-dd'), " + " hotdeal_eday=TO_DATE('" + dto.getHotdeal_eday()
				+ "','yyyy-mm-dd')" + " WHERE hotdeal_no=? ";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getHotdeal_price());
			psmt.setString(2, dto.getHotdeal_sell());
			psmt.setString(3, dto.getHotdeal_no());

			System.out.println(sql);
			affected = psmt.executeUpdate();

			System.out.println(affected);

		} catch (Exception e) {
			System.out.println("글 수정 중 오류발생.");
			e.printStackTrace();
		}
		return affected;
	}
		
	//EndList 핫딜게시판 총레코드 수 가져오기
	public int endListgetTotalRecordCount(Map<String,Object> map)
	{
		int totalCount = 0;
		try{
			String sql = "SELECT COUNT(*) FROM hotdeal WHERE 1=1";
										
			if(map.get("Word")!=null){
				sql +=" AND "+map.get("Column")+" "
					+ " LIKE '%"+map.get("Word")+"%' ";				
			}
			
			sql += " AND (hotdeal_etime-sysdate) <= 0 ";
			
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);
		}
		catch(Exception e){}
		return totalCount; 
	}
		
	//EndList 핫딜게시판 가져오기
	public List<HotdealDTO> endListselectPaging(Map<String,Object> map)
	{
		List<HotdealDTO> bbs = new Vector<HotdealDTO>();
		
		String sql = ""
				+" SELECT * FROM ("
				+"    SELECT Tb.*, trunc((hotdeal_stime-sysdate)*24*60*60) AS remain_time_sec, rownum rNum FROM ("
				+"        SELECT H.*, L.lodge_name,L.lodge_type,R.room_type FROM "
				+ "			hotdeal H INNER JOIN lodge L"
				+ "				ON H.lodge_no=L.lodge_no"
				+ "					INNER JOIN room R"
				+ "						ON H.room_no = r.room_no"
				+ "					WHERE 1=1 and (hotdeal_etime-sysdate) <= 0"
				+ " 					ORDER BY hotdeal_no DESC"
				+"    ) Tb"
				+" )"
				+" WHERE rNum BETWEEN ? and ?";
		
		
		
		try{
			//3.prepare 객체생성 및 실행
			psmt = con.prepareStatement(sql);
		
			psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
			psmt.setInt(2, Integer.parseInt(map.get("end").toString()));	
			
			rs = psmt.executeQuery();
			
			while(rs.next())
			{
				//4.결과셋을 DTO객체에 담는다.
				HotdealDTO dto = new HotdealDTO();
				
				dto.setHotdeal_no(rs.getString("hotdeal_no"));
				dto.setHotdeal_stime(rs.getString("hotdeal_stime"));
				dto.setHotdeal_etime(rs.getString("hotdeal_etime"));
				dto.setHotdeal_price(rs.getString("hotdeal_price"));
				dto.setHotdeal_sell(rs.getString("hotdeal_sell"));
				dto.setHotdeal_date(rs.getString("hotdeal_date"));
				dto.setHotdeal_sday(rs.getString("hotdeal_sday"));
				dto.setHotdeal_eday(rs.getString("hotdeal_eday"));
				dto.setLodge_no(rs.getString("lodge_no"));
				dto.setLodge_type(rs.getString("lodge_type"));
				dto.setLodge_name(rs.getString("lodge_name"));
				dto.setRoom_type(rs.getString("room_type"));
				dto.setRoom_no(rs.getString("room_no"));
				dto.setRemain_time_sec(rs.getString("remain_time_sec"));
				
			
				//5.DTO객체를 컬렉션에 추가한다.
				bbs.add(dto);
			}
		}
		catch(Exception e){
			System.out.println("Select시 예외발생함");
			e.printStackTrace();
		}
		return bbs;
	}
	
	// 삭제하기 (delete)
	public int delete(String hotdeal_no) {
		int affected = 0;// 적용된 행의갯수
	
		try {
			String sql = "DELETE FROM hotdeal WHERE hotdeal_no=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, hotdeal_no);
			affected = psmt.executeUpdate();
			System.out.println("-----------------------dao");
			System.out.println("hotdeal_no:" + hotdeal_no);
			System.out.println("sql" + sql);
	
		} catch (Exception e) {
			System.out.println("글 삭제중 오류가 발생했습니다.");
			e.printStackTrace();
	
		}
		return affected;
	}
	//메인
	public List<HotdealDTO> mainHotdeal(Map map)
	{
		List<HotdealDTO> mh = new Vector<HotdealDTO>();
		
		String sql = " "
				+ "    SELECT Tb.*, trunc((hotdeal_stime-sysdate)*24*60*60) AS remain_time_sec, "
				+ "					trunc((hotdeal_etime-sysdate)*24*60*60) AS start_remain_time_sec, rownum rNum FROM ("					
				+ "  select h.*, l.lodge_name from hotdeal h "
				+ " inner join lodge l on h.lodge_no=l.lodge_no "
				+ " where (hotdeal_etime-sysdate) > -1 and (hotdeal_stime-sysdate) < 0  "
				+ "  order BY hotdeal_no DESC "
				+"    ) Tb ";
		System.out.println("hotdeal main sql: "+sql);
		try{
			//3.prepare 객체생성 및 실행
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next())
			{
				//4.결과셋을 DTO객체에 담는다.
				HotdealDTO dto = new HotdealDTO();
				
				dto.setHotdeal_no(rs.getString("hotdeal_no"));
				dto.setHotdeal_price(rs.getString("hotdeal_price"));
				dto.setHotdeal_sell(rs.getString("hotdeal_sell"));
				dto.setLodge_no(rs.getString("lodge_no"));
				dto.setLodge_name(rs.getString("lodge_name"));				
		
				//5.DTO객체를 컬렉션에 추가한다.
				mh.add(dto);
			}
		}
		catch(Exception e){
			System.out.println("Select시 예외발생함");
			e.printStackTrace();
		}
		return mh;
	}
}
