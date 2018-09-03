package model;

public class LodgeDTO {

	private String lodge_no;
	private String lodge_type;
	private String lodge_name;
	private String lodge_tel;
	private String lodge_roomcount;
	private String lodge_tag;
	private String lodge_photo;
	private String lodge_thema;
	private String lodge_note;
	//가격 및 방정보 추가
	private String room_no;
	private String room_type;
	private String room_person;
	private String room_photo;
	private String d_sleep_price;
	private String w_sleep_price;
	private String d_rent_price;
	private String w_rent_price;
	//특징 추가
	private String lodge_feature;
	//주소 추가	
	private String ADDR_common;  
	private String ADDR_GUGUN;  
	private String ADDR_DETAIL; 
	private String ADDR_LAT;  
	private String ADDR_LONG; 
	private String ADDR_NUM;
	
	//기본생성자
	public LodgeDTO() {}
	//인자생성자
	public LodgeDTO(String lodge_no, String lodge_type, String lodge_name, String lodge_tel, String lodge_roomcount,
			String lodge_tag, String lodge_photo, String lodge_thema, String lodge_note,
			String room_no, String room_type, String room_person, String room_photo, 
			String d_sleep_price, String w_sleep_price, String d_rent_price, String w_rent_price, String lodge_feature,
			String ADDR_common, String ADDR_GUGUN ,String ADDR_DETAIL,String ADDR_LAT, String ADDR_LONG, String ADDR_NUM) {
		this.lodge_no = lodge_no;
		this.lodge_type = lodge_type;
		this.lodge_name = lodge_name;
		this.lodge_tel = lodge_tel;
		this.lodge_roomcount = lodge_roomcount;
		this.lodge_tag = lodge_tag;
		this.lodge_photo = lodge_photo;
		this.lodge_thema = lodge_thema;
		this.lodge_note = lodge_note;
		this.room_no = room_no;
		this.room_type = room_type;
		this.room_person = room_person;
		this.room_photo = room_photo;
		this.d_sleep_price = d_sleep_price;
		this.w_sleep_price = w_sleep_price;
		this.d_rent_price = d_rent_price;
		this.w_rent_price = w_rent_price;
		this.lodge_feature = lodge_feature;
		this.ADDR_NUM = ADDR_NUM;
	}
	//getter/setter
	public String getLodge_no() {
		return lodge_no;
	}
	public void setLodge_no(String lodge_no) {
		this.lodge_no = lodge_no;
	}
	public String getLodge_type() {
		return lodge_type;
	}
	public void setLodge_type(String lodge_type) {
		this.lodge_type = lodge_type;
	}
	public String getLodge_name() {
		return lodge_name;
	}
	public void setLodge_name(String lodge_name) {
		this.lodge_name = lodge_name;
	}
	public String getLodge_tel() {
		return lodge_tel;
	}
	public void setLodge_tel(String lodge_tel) {
		this.lodge_tel = lodge_tel;
	}
	public String getLodge_roomcount() {
		return lodge_roomcount;
	}
	public void setLodge_roomcount(String lodge_roomcount) {
		this.lodge_roomcount = lodge_roomcount;
	}
	public String getLodge_tag() {
		return lodge_tag;
	}
	public void setLodge_tag(String lodge_tag) {
		this.lodge_tag = lodge_tag;
	}
	public String getLodge_photo() {
		return lodge_photo;
	}
	public void setLodge_photo(String lodge_photo) {
		this.lodge_photo = lodge_photo;
	}
	public String getLodge_thema() {
		return lodge_thema;
	}
	public void setLodge_thema(String lodge_thema) {
		this.lodge_thema = lodge_thema;
	}
	public String getLodge_note() {
		return lodge_note;
	}
	public void setLodge_note(String lodge_note) {
		this.lodge_note = lodge_note;
	}
	public String getRoom_no() {
		return room_no;
	}
	public void setRoom_no(String room_no) {
		this.room_no = room_no;
	}
	public String getRoom_type() {
		return room_type;
	}
	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}
	public String getRoom_person() {
		return room_person;
	}
	public void setRoom_person(String room_person) {
		this.room_person = room_person;
	}
	public String getRoom_photo() {
		return room_photo;
	}
	public void setRoom_photo(String room_photo) {
		this.room_photo = room_photo;
	}
	public String getD_sleep_price() {
		return d_sleep_price;
	}
	public void setD_sleep_price(String d_sleep_price) {
		this.d_sleep_price = d_sleep_price;
	}
	public String getW_sleep_price() {
		return w_sleep_price;
	}
	public void setW_sleep_price(String w_sleep_price) {
		this.w_sleep_price = w_sleep_price;
	}
	public String getD_rent_price() {
		return d_rent_price;
	}
	public void setD_rent_price(String d_rent_price) {
		this.d_rent_price = d_rent_price;
	}
	public String getW_rent_price() {
		return w_rent_price;
	}
	public void setW_rent_price(String w_rent_price) {
		this.w_rent_price = w_rent_price;
	}
	public String getLodge_feature() {
		return lodge_feature;
	}
	public void setLodge_feature(String lodge_feature) {
		this.lodge_feature = lodge_feature;
	}
	public String getADDR_common() {
		return ADDR_common;
	}
	public void setADDR_common(String aDDR_common) {
		ADDR_common = aDDR_common;
	}
	public String getADDR_GUGUN() {
		return ADDR_GUGUN;
	}
	public void setADDR_GUGUN(String aDDR_GUGUN) {
		ADDR_GUGUN = aDDR_GUGUN;
	}
	public String getADDR_DETAIL() {
		return ADDR_DETAIL;
	}
	public void setADDR_DETAIL(String aDDR_DETAIL) {
		ADDR_DETAIL = aDDR_DETAIL;
	}
	public String getADDR_LAT() {
		return ADDR_LAT;
	}
	public void setADDR_LAT(String aDDR_LAT) {
		ADDR_LAT = aDDR_LAT;
	}
	public String getADDR_LONG() {
		return ADDR_LONG;
	}
	public void setADDR_LONG(String aDDR_LONG) {
		ADDR_LONG = aDDR_LONG;
	}
	public String getADDR_NUM() {
		return ADDR_NUM;
	}
	public void setADDR_NUM(String aDDR_NUM) {
		ADDR_NUM = aDDR_NUM;
	}
	
	

	
	
	
}
