package model;

import java.sql.Date;

public class AuctionDTO 
{
	//옥션 테이블 멤버변수
	private int auction_no;
	private int start_price;
	private int end_price;
	private String final_bidder;
	private int tender_count;
	private int auction_hits;
	private int lodge_no;
	private String auction_stime;
	private String auction_etime;
	private String auction_regidate;
	private int member_no;
	private int auction_unit;
	private String auction_check_in;
	private String auction_check_out;
	//호텔이름
	
	//룸가격
	private int d_sleep_price; //주중숙박가격
	private int w_sleep_price; //주말숙박가격
	private int d_rent_price; //주중대실가격
	private int w_rent_price; //주말대실가격
	private String remain_time_sec; //경매까지 남은시간
	private String timeView; //보여주기위해 필요한 남은시간
	private String start_remain_time_sec; //경매종료 까지 남은시간
	private String start_timeView; //경매진행중 보여주기위해 필요한 남은시간
	
	//lodge추가
	private String lodge_name;
	private String lodge_type;
	private String lodge_photo;
	//room추가ㅊ
	private String room_type;
	private String room_no;
	
	//기본생성자
	public AuctionDTO() 
	{
	
	}
	
	//인자생성자
	public AuctionDTO(int auction_no, int start_price, int end_price, String final_bidder, int tender_count,
			int auction_hits, int lodge_no, String auction_stime, String auction_etime, String auction_regidate,
			int member_no, int auction_unit, String auction_check_in, String auction_check_out, String lodge_name,
			int d_sleep_price, int w_sleep_price, int d_rent_price, int w_rent_price, String remain_time_sec,
			String timeView, String start_remain_time_sec, String start_timeView) {
		super();
		this.auction_no = auction_no;
		this.start_price = start_price;
		this.end_price = end_price;
		this.final_bidder = final_bidder;
		this.tender_count = tender_count;
		this.auction_hits = auction_hits;
		this.lodge_no = lodge_no;
		this.auction_stime = auction_stime;
		this.auction_etime = auction_etime;
		this.auction_regidate = auction_regidate;
		this.member_no = member_no;
		this.auction_unit = auction_unit;
		this.auction_check_in = auction_check_in;
		this.auction_check_out = auction_check_out;
		this.lodge_name = lodge_name;
		this.d_sleep_price = d_sleep_price;
		this.w_sleep_price = w_sleep_price;
		this.d_rent_price = d_rent_price;
		this.w_rent_price = w_rent_price;
		this.remain_time_sec = remain_time_sec;
		this.timeView = timeView;
		this.start_remain_time_sec = start_remain_time_sec;
		this.start_timeView = start_timeView;
	}
	
	//setter/getter
	public int getAuction_no() 
	{
		return auction_no;
	}

	public void setAuction_no(int auction_no) 
	{
		this.auction_no = auction_no;
	}

	public int getStart_price() 
	{
		return start_price;
	}

	public void setStart_price(int start_price) 
	{
		this.start_price = start_price;
	}

	public int getEnd_price() 
	{
		return end_price;
	}

	public void setEnd_price(int end_price) 
	{
		this.end_price = end_price;
	}

	public String getFinal_bidder()
	{
		return final_bidder;
	}

	public void setFinal_bidder(String final_bidder) 
	{
		this.final_bidder = final_bidder;
	}

	public int getTender_count() 
	{
		return tender_count;
	}

	public void setTender_count(int tender_count) 
	{
		this.tender_count = tender_count;
	}

	public int getAuction_hits()
	{
		return auction_hits;
	}

	public void setAuction_hits(int auction_hits) 
	{
		this.auction_hits = auction_hits;
	}

	public int getLodge_no()
	{
		return lodge_no;
	}

	public void setLodge_no(int lodge_no) 
	{
		this.lodge_no = lodge_no;
	}

	public String getAuction_stime() 
	{
		return auction_stime;
	}

	public void setAuction_stime(String auction_stime) 
	{
		this.auction_stime = auction_stime;
	}

	public String getAuction_etime() 
	{
		return auction_etime;
	}

	public void setAuction_etime(String auction_etime) 
	{
		this.auction_etime = auction_etime;
	}

	public String getAuction_regidate() 
	{
		return auction_regidate;
	}

	public void setAuction_regidate(String auction_regidate) 
	{
		this.auction_regidate = auction_regidate;
	}

	public int getMember_no() 
	{
		return member_no;
	}

	public void setMember_no(int member_no) 
	{
		this.member_no = member_no;
	}

	public int getAuction_unit() 
	{
		return auction_unit;
	}

	public void setAuction_unit(int auction_unit) 
	{
		this.auction_unit = auction_unit;
	}

	public String getAuction_check_in() 
	{
		return auction_check_in;
	}

	public void setAuction_check_in(String auction_check_in) 
	{
		this.auction_check_in = auction_check_in;
	}

	public String getAuction_check_out() 
	{
		return auction_check_out;
	}

	public void setAuction_check_out(String auction_check_out) 
	{
		this.auction_check_out = auction_check_out;
	}

	public String getLodge_name() 
	{
		return lodge_name;
	}

	public void setLodge_name(String lodge_name) 
	{
		this.lodge_name = lodge_name;
	}

	public int getD_sleep_price() 
	{
		return d_sleep_price;
	}

	public void setD_sleep_price(int d_sleep_price) 
	{
		this.d_sleep_price = d_sleep_price;
	}

	public int getW_sleep_price() 
	{
		return w_sleep_price;
	}

	public void setW_sleep_price(int w_sleep_price) 
	{
		this.w_sleep_price = w_sleep_price;
	}

	public int getD_rent_price() 
	{
		return d_rent_price;
	}

	public void setD_rent_price(int d_rent_price) 
	{
		this.d_rent_price = d_rent_price;
	}

	public int getW_rent_price() 
	{
		return w_rent_price;
	}

	public void setW_rent_price(int w_rent_price) 
	{
		this.w_rent_price = w_rent_price;
	}

	public String getRemain_time_sec() 
	{
		return remain_time_sec;
	}

	public void setRemain_time_sec(String remain_time_sec) 
	{
		this.remain_time_sec = remain_time_sec;
	}

	public String getTimeView() {
		return timeView;
	}

	public void setTimeView(String timeView) {
		this.timeView = timeView;
	}

	public String getStart_remain_time_sec() {
		return start_remain_time_sec;
	}

	public void setStart_remain_time_sec(String start_remain_time_sec) {
		this.start_remain_time_sec = start_remain_time_sec;
	}

	public String getStart_timeView() {
		return start_timeView;
	}

	public void setStart_timeView(String start_timeView) {
		this.start_timeView = start_timeView;
	}

	public String getLodge_type() {
		return lodge_type;
	}

	public void setLodge_type(String lodge_type) {
		this.lodge_type = lodge_type;
	}

	public String getLodge_photo() {
		return lodge_photo;
	}

	public void setLodge_photo(String lodge_photo) {
		this.lodge_photo = lodge_photo;
	}

	public String getRoom_type() {
		return room_type;
	}

	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}

	public String getRoom_no() {
		return room_no;
	}

	public void setRoom_no(String room_no) {
		this.room_no = room_no;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
