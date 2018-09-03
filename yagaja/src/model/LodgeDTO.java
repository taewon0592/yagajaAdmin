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
	private String addr_zipcode;
	private String addr_common;  
	private String addr_detail; 
	private String addr_lat;  
	private String addr_long; 
	
	//기본생성자
	public LodgeDTO() {}
	//인자생성자
	public LodgeDTO(String lodge_no, String lodge_type, String lodge_name, String lodge_tel, String lodge_roomcount,
			String lodge_tag, String lodge_photo, String lodge_thema, String lodge_note,
			String room_no, String room_type, String room_person, String room_photo, 
			String d_sleep_price, String w_sleep_price, String d_rent_price, String w_rent_price, String lodge_feature,
			String addr_common, String addr_detail,String addr_lat, String addr_long, String addr_zipcode) {
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
		this.addr_common = addr_common;
		this.addr_detail = addr_detail;
		this.addr_lat = addr_lat;
		this.addr_long = addr_long;
		this.addr_zipcode = addr_zipcode;
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
	public String getAddr_zipcode() {
		return addr_zipcode;
	}
	public void setAddr_zipcode(String addr_zipcode) {
		this.addr_zipcode = addr_zipcode;
	}
	public String getAddr_common() {
		return addr_common;
	}
	public void setAddr_common(String addr_common) {
		this.addr_common = addr_common;
	}
	public String getAddr_detail() {
		return addr_detail;
	}
	public void setAddr_detail(String addr_detail) {
		this.addr_detail = addr_detail;
	}
	public String getAddr_lat() {
		return addr_lat;
	}
	public void setAddr_lat(String addr_lat) {
		this.addr_lat = addr_lat;
	}
	public String getAddr_long() {
		return addr_long;
	}
	public void setAddr_long(String addr_long) {
		this.addr_long = addr_long;
	}
	
	
	

	
	
	
}
