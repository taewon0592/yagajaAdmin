package model;

public class HotdealDTO {
	private String hotdeal_no;
	private String hotdeal_stime;
	private String hotdeal_etime;
	private String hotdeal_price;
	private String hotdeal_sell;
	private String hotdeal_date;
	private String hotdeal_sday;
	private String hotdeal_eday;
	private String lodge_no;
	
	//lodge추가
	private String lodge_name;	
	private String lodge_type;
	private String lodge_photo;
	
	//room추가
	private String room_type;
	private String room_no;
	
	//경매까지 남은시간
	private String remain_time_sec;
	private String timeView;
	
	//경매시작 후 종료까지 남은시간
	private String start_remain_time_sec; //경매종료 까지 남은시간
	private String start_timeView; //경매진행중 보여주기위해 필요한 남은시간	
	
	//기본생서자
	public HotdealDTO() {
	}
	//인자생성자
	public HotdealDTO(String hotdeal_no, String hotdeal_stime, String hotdeal_etime, String hotdeal_price,
			String hotdeal_sell, String hotdeal_date, String hotdeal_sday, String hotdeal_eday,
			String lodge_no, String lodge_name, String lodge_type, String lodge_photo, String room_type, String room_no,
			String remain_time_sec, String timeView, String start_remain_time_sec, String start_timeView) {
		super();
		this.hotdeal_no = hotdeal_no;
		this.hotdeal_stime = hotdeal_stime;
		this.hotdeal_etime = hotdeal_etime;
		this.hotdeal_price = hotdeal_price;
		this.hotdeal_sell = hotdeal_sell;
		this.hotdeal_date = hotdeal_date;
		this.hotdeal_sday = hotdeal_sday;
		this.hotdeal_eday = hotdeal_eday;
		this.lodge_no = lodge_no;
		this.lodge_name = lodge_name;
		this.lodge_type = lodge_type;
		this.lodge_photo = lodge_photo;
		this.room_type = room_type;
		this.room_no = room_no;
		this.remain_time_sec = remain_time_sec;
		this.timeView = timeView;
		this.start_remain_time_sec = start_remain_time_sec;
		this.start_timeView = start_timeView;
	}


	public String getHotdeal_no() {
		return hotdeal_no;
	}

	public void setHotdeal_no(String hotdeal_no) {
		this.hotdeal_no = hotdeal_no;
	}

	public String getHotdeal_stime() {
		return hotdeal_stime;
	}

	public void setHotdeal_stime(String hotdeal_stime) {
		this.hotdeal_stime = hotdeal_stime;
	}

	public String getHotdeal_etime() {
		return hotdeal_etime;
	}

	public void setHotdeal_etime(String hotdeal_etime) {
		
		this.hotdeal_etime = hotdeal_etime;
	}

	public String getHotdeal_price() {
		return hotdeal_price;
	}

	public void setHotdeal_price(String hotdeal_price) {
		this.hotdeal_price = hotdeal_price;
	}
	
	public String getHotdeal_sell() {
		return hotdeal_sell;
	}

	public void setHotdeal_sell(String hotdeal_sell) {
		this.hotdeal_sell = hotdeal_sell;
	}

	public String getHotdeal_date() {
		
		return hotdeal_date;
	}

	public void setHotdeal_date(String hotdeal_date) {
		this.hotdeal_date = hotdeal_date;
	}

	public String getHotdeal_sday() {
		return hotdeal_sday;
	}

	public void setHotdeal_sday(String hotdeal_sday) {
		this.hotdeal_sday = hotdeal_sday;
	}

	public String getHotdeal_eday() {
		return hotdeal_eday;
	}

	public void setHotdeal_eday(String hotdeal_eday) {
		this.hotdeal_eday = hotdeal_eday;
	}

	public String getLodge_no() {
		return lodge_no;
	}

	public void setLodge_no(String lodge_no) {
		this.lodge_no = lodge_no;
	}

	public String getLodge_name() {
		return lodge_name;
	}

	public void setLodge_name(String lodge_name) {
		this.lodge_name = lodge_name;
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

	public String getRemain_time_sec() {
		return remain_time_sec;
	}

	public void setRemain_time_sec(String remain_time_sec) {
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
	
	
}
